#include "sys_config.h"
#include "typesdef.h"
#include "list.h"
#include "dev.h"
#include "devid.h"
#include "string.h"
#include "osal/task.h"
#include "osal/string.h"
#include "hal/auadc.h"
#include "utlist.h"
#include "audio_adc.h"
#include "osal_file.h"
#include "stream_frame.h"
#include "osal_file.h"
#include "dev/spi/hgspi_xip.h"


#define HIGHPASS_FILTER 1

#define AUDIONUM	(4)

#define ROUNDING_14(data) ( (short int)( ( ((int)( ( (int)data) + ((int)(1<<13)))) >> 14) & 0xFFFF))

#if HIGHPASS_FILTER == 1
//adc采集的前面75个sample点不能用,经过高通滤波后,才可以用
#define AUDIOLEN	(1024- 8)
#define FILTER_SAMPLE_LEN	76
#define REAL_FILTER_SAMPLE_LEN 75


#else
#define AUDIOLEN	(1024 - 8)
#define FILTER_SAMPLE_LEN	0
#endif

#define SOFT_GAIN	(8)

typedef uint32_t (*highpass_filter_100hz_asm_func)(int16_t *p_cur);

struct audio_ad_config;
//返回值是一个buf,录音的buf,priv_el则是应用层的一个结构,el_point则是一个指针地址,audio_set_buf在返回buf前同时要配置el_point的值(最后在audio_get_buf的时候会需要调用)
typedef void *(*set_buf)(void *priv_el,void *el_point);
//priv_el则是应用层的一个结构,el_point则是可以寻找到buf的一个结构体,el_point的值是audio_set_buf赋值的
typedef void (*get_buf)(void *priv_el,void *el_point);

typedef int32 (*audio_ad_read)(struct audio_ad_config *audio, void* buf, uint32 len);

struct audio_ad_config
{
	//struct hgpdm_v0*   pdm_hdl;
    struct auadc_device *adc;
	void *current_node;
	void *reg_node;

	set_buf set_buf;
	get_buf get_buf;


    int buf_size;
	//私有结构元素
	void *priv_el;

    audio_ad_read irq_func;
	
};


//static uint32_t adc_save_buf[1024/4];



void audio_adc_irq(uint32 irq, uint32 irq_data)
{
	struct audio_ad_config *audio_ad = (struct audio_ad_config *)irq_data;
    struct audio_ad_config *priv = (struct audio_ad_config*)audio_ad;
	void *buf;
	//int buf_size;
  if(irq == AUADC_IRQ_FLAG_HALF)
  {
	buf = priv->set_buf(priv->priv_el,&priv->reg_node);
	//如果reg_node为NULL,则音频录音buf还是原来的buf
	if(priv->reg_node)
	{
        priv->irq_func(audio_ad , buf, priv->buf_size);
	}
  }
  else if(irq == AUADC_IRQ_FLAG_FULL)
  {
	  //半中断有配置新的buf,则将完成的录音帧通知应用层,如果为NULL,则代表没有配置新的buf,只能使用旧的buf
	  if(priv->reg_node)
	  {
		  priv->get_buf(priv->priv_el,priv->current_node);
		  priv->current_node = priv->reg_node;
		  priv->reg_node = NULL;
	  }

  }
}



void audio_adc_register(void *audio_hdl,void *priv_el,int play_size,set_buf audio_set_buf,get_buf audio_get_buf)
{
	struct audio_ad_config *priv = (struct audio_ad_config*)audio_hdl;
    priv->buf_size = play_size;
	priv->set_buf = audio_set_buf;
	priv->get_buf = audio_get_buf;
	priv->priv_el = priv_el;
	
}



static void *audio_set_buf(void *priv_el,void *el_point)
{
    stream *s = (stream *)priv_el;
    struct data_structure  *data;

    data = get_src_data_f(s);
    struct data_structure **point = (struct data_structure**)el_point;
    void *buf = NULL;
    if(data)
    {
        buf = get_stream_real_data(data);
		#if HIGHPASS_FILTER == 1 
			//偏移75个sample点
			buf = (uint16_t*)buf+FILTER_SAMPLE_LEN;
		#endif
    }
    *point = data;
	return buf;
	
}

static void audio_get_buf(void *priv_el,void *el_point)
{
    stream *s = (stream *)priv_el;
    struct audio_adc_s *self_priv = (struct audio_adc_s*)s->priv;
    struct data_structure *data = (struct data_structure*)el_point;
    int res;
	if(!data)
	{
		_os_printf("%s:%d err\n",__FUNCTION__,__LINE__);
		return;
	}
    set_stream_data_time(data,os_jiffies());
	res = csi_kernel_msgq_put(self_priv->adc_msgq,&data,0,0);
	//正常应该保证不进这里,如果进来代表任务没有获取队列,直接配置下一个buf导致的
	if(res)
	{
		_os_printf("P");
        force_del_data(data);
	}
	return;
	
}



static void audio_deal_task(void *arg)
{
	 stream *s = (stream *)arg;
	 #if HIGHPASS_FILTER == 1
	 int16_t filter_asm_buf[75] = {0};
	 #endif
	 //int16* addr;
	 int res;
	 //int i;
	 struct data_structure  *data ;
     int16_t *p_buf;
	 //滤波buf的地址
	 int16_t *deal_p_buf;
	 uint32_t count = 0;
	 
	 
     //uint32_t p_count = 100;

     struct audio_adc_s *self_priv = (struct audio_adc_s*)s->priv;
	 while(1)
	 {
		res = csi_kernel_msgq_get(self_priv->adc_msgq,&data,-1);
		if(!res)
		{
            //发送
            
            //_os_printf("U");
            p_buf = get_stream_real_data(data);


			
			#if HIGHPASS_FILTER == 1
				extern uint32_t highpass_filter_100hz_asm(int16_t *p_cur);
				//进行高通滤波
				uint32_t filter_sample_point;
				uint32_t i,sample_len;
				highpass_filter_100hz_asm_func func;
				if(sysctrl_get_chip_dcn())
				{
					func = (highpass_filter_100hz_asm_func)get_msrom_func(MSROM_HIGHPASS_FILTER_100HZ_ASM);
				}
				else
				{
					func = highpass_filter_100hz_asm;
				}
				//实际数据的地址
				int16_t *sample_buf = p_buf+FILTER_SAMPLE_LEN ;

				//os_printf("p_buf:%X\tsample_buf:%X\n",p_buf,sample_buf);
				//处理要考虑原来buf数据长度是否对齐,因为滤波的函数需要连续的
				deal_p_buf =  p_buf + FILTER_SAMPLE_LEN - REAL_FILTER_SAMPLE_LEN;
				//一个sample点2字节
				sample_len = get_stream_real_data_len(data)/2;
				memcpy((void*)deal_p_buf,(void*)filter_asm_buf,sizeof(filter_asm_buf));
				
				for(i=0;i<sample_len;i++)
				{
					filter_sample_point = func(sample_buf);
					//filter_sample_point = highpass_filter_100hz(sample_buf);
					//这里使用p_buf是为了数据在buf的头部,deal_p_buf可能头部会有有空位,所以这里要注意
					*p_buf = ROUNDING_14(filter_sample_point)*SOFT_GAIN;
					sample_buf++;
					deal_p_buf++;
					p_buf++;
				}
				
				//保留最后75个sample点,正常p_buf已经偏移到正常地址了
				memcpy(filter_asm_buf,deal_p_buf,sizeof(filter_asm_buf));

			#endif

			data->type = SET_DATA_TYPE(SOUND,SOUND_MIC);
            send_data_to_stream(data);
            //_os_printf("@");
			if(count++%16 == 0)
			{
				_os_printf("@");
			}
		}
		else
		{
		 	_os_printf("%s:%d err @@@@@@@@@@@@\n",__FUNCTION__,__LINE__);

		}
	 }
}


static uint32_t get_sound_data_len(void *data)
{
    struct data_structure  *d = (struct data_structure  *)data;
	return (uint32_t)d->priv;
}


static uint32_t set_sound_data_len(void *data,uint32_t len)
{
	struct data_structure  *d = (struct data_structure  *)data;
	d->priv = (void*)AUDIOLEN;
	return (uint32_t)AUDIOLEN;
}

static uint32_t set_sound_data_time(void *data,uint32_t len)
{
	struct data_structure  *d = (struct data_structure  *)data;
	d->timestamp = os_jiffies();
	return (uint32_t)0;
}

static stream_ops_func stream_sound_ops = 
{
	.get_data_len = get_sound_data_len,
	.set_data_len = set_sound_data_len,
    // .set_data_time = set_sound_data_time,
};


static int opcode_func(stream *s,void *priv,int opcode)
{
    static uint8_t *adc_audio_buf = NULL;
	int res = 0;
	switch(opcode)
	{
		case STREAM_OPEN_ENTER:
		break;
		case STREAM_OPEN_EXIT:
		{
			s->priv = (void*)os_malloc(sizeof(struct audio_adc_s));
			if(s->priv)
			{
				struct audio_adc_s *self_priv = (struct audio_adc_s*)s->priv;
				self_priv->adc_msgq  = (void*)csi_kernel_msgq_new(1,sizeof(uint8_t*));
				OS_TASK_INIT("adc_audio_deal", &self_priv->thread_hdl, audio_deal_task, s, OS_TASK_PRIORITY_ABOVE_NORMAL, 1024);
			}
			//两个sample点
            adc_audio_buf = os_malloc(AUDIONUM * (AUDIOLEN + FILTER_SAMPLE_LEN*2));
            if(adc_audio_buf)
            {
			    stream_data_dis_mem(s,AUDIONUM);
            }
			//绑定到对应的流
            streamSrc_bind_streamDest(s,R_RECORD_AUDIO);
            streamSrc_bind_streamDest(s,R_RTP_AUDIO);
            streamSrc_bind_streamDest(s,R_AUDIO_TEST);
            streamSrc_bind_streamDest(s,R_SPEAKER);
			streamSrc_bind_streamDest(s,R_AT_SAVE_AUDIO);
			streamSrc_bind_streamDest(s,R_AT_AVI_AUDIO);

		}
		break;
		case STREAM_OPEN_FAIL:
		break;
		case STREAM_DATA_DIS:
		{
			struct data_structure *data = (struct data_structure *)priv;
			int data_num = (int)data->priv;
			data->type = DATA_TYPE_AUDIO_ADC;//设置声音的类型
            data->priv = (void*)AUDIOLEN;
			//注册对应函数
			data->ops = &stream_sound_ops;
			data->data = adc_audio_buf + (data_num)*(AUDIOLEN + FILTER_SAMPLE_LEN*2);
		}
		break;

		case STREAM_DATA_FREE:
		break;

        case STREAM_DATA_FREE_END:
        break;


		//数据发送完成,可以选择唤醒对应的任务
		case STREAM_SEND_DATA_FINISH:
		break;

		default:
			//默认都返回成功
		break;
	}
	return res;
}





int audio_adc_start(void *audio_hdl)
{
	int ret = 0;
	int res = 0;
	void *buf;
	struct audio_ad_config *priv = (struct audio_ad_config*)audio_hdl;
	buf = priv->set_buf(priv->priv_el,&priv->current_node);
	if(!buf)
	{
		ret = -1;
		goto audio_adc_start_err;
	}
    priv->irq_func(priv , buf, priv->buf_size);
	audio_adc_start_err:
	return res;


}

static int32 global_audio_ad_read(struct audio_ad_config *audio, void* buf, uint32 len)
{
	auadc_read(audio->adc, buf, len);
	return 0;
}

extern void audio_adc_ana_config(void);

int audio_adc_init()
{

	
	int res = 0;
    struct auadc_device *adc = (struct auadc_device *)dev_get(HG_AUADC_DEVID);

	stream *s = NULL;
	s = open_stream_available(S_ADC_AUDIO,AUDIONUM,0,opcode_func,NULL);
	if(!s)
	{
        res = -1;
		goto audio_adc_init_err;
	}


    struct audio_adc_s *audio_priv = (struct audio_adc_s*)s->priv;
	if(audio_priv)
	{
        struct audio_ad_config *ad_config = (struct audio_ad_config*)os_malloc(sizeof(struct audio_ad_config));
        memset(ad_config,0,sizeof(struct audio_ad_config));
        ad_config->adc = adc;
        ad_config->priv_el = s;
		audio_priv->audio_hardware_hdl = ad_config;
		audio_adc_register(ad_config,s,AUDIOLEN,audio_set_buf,audio_get_buf);
        ad_config->irq_func = global_audio_ad_read;
        auadc_open(adc, AUADC_SAMPLE_RATE_8K);
        auadc_request_irq(adc, AUADC_IRQ_FLAG_HALF | AUADC_IRQ_FLAG_FULL, (auadc_irq_hdl)audio_adc_irq, (uint32)ad_config);
        audio_adc_start(ad_config);
	}

	audio_adc_init_err:
	return res;
}






static int audio_opcode_func(stream *s,void *priv,int opcode)
{
	int res = 0;
	//_os_printf("%s:%d\topcode:%d\n",__FUNCTION__,__LINE__,opcode);
	switch(opcode)
	{
		case STREAM_OPEN_ENTER:
		break;
		case STREAM_OPEN_EXIT:
		{
            enable_stream(s,1);
		}
		break;
		case STREAM_OPEN_FAIL:
		break;



		default:
			//默认都返回成功
		break;
	}
	return res;
}

#define RECORD_MAX_TIME	20000
void save_audio_thread(void *d)
{
    int *status = (int*)d;
    if(!status)
    {
        return;
    }
    int count = 0;
    uint32_t start_time;
    uint32_t w_count = 0;
    uint32_t flen;
    struct data_structure *get_f = NULL;
    uint8_t *buf;
    stream* s = open_stream_available(R_AUDIO_TEST,0,8,audio_opcode_func,NULL);
    if(!s)
    {
        return;
    }
    void *fp = osal_fopen("test44.pcm","wb+");
    start_time = os_jiffies();
    while(1)
    {
        count++;
        if(count % 1000 == 0)
        {
            os_printf("%s:%d\t%d\trecord time:%d\n",__FUNCTION__,__LINE__,w_count,os_jiffies()-start_time);
        }

        if(fp && os_jiffies()-start_time > RECORD_MAX_TIME)
        {
            osal_fclose(fp);
            fp = NULL;
            os_printf("write end!!!!!!!!!!!!!!\r\n");
        }
        get_f = recv_real_data(s);
        if(get_f)
        {
            if(fp)
            {
                buf = get_stream_real_data(get_f);
                flen = get_stream_real_data_len(get_f);
                osal_fwrite(buf, flen, 1, fp);
                w_count++;
            }

            free_data(get_f);
            if(!fp)
            {
                goto save_audio_thread_end;
            }
            
        }
        else
        {
            os_sleep_ms(1);
        }
    }

    save_audio_thread_end:
    os_printf("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n");
    close_stream(s);
    //代表停止
    *status = 0;
}

