

#include "sys_config.h"
#include "typesdef.h"
#include "list.h"
#include "dev.h"
#include "devid.h"
#include "string.h"

#include "osal/task.h"
#include "osal/string.h"
#include "hal/audac.h"
#include "stream_frame.h"
#include "osal_file.h"


#define AUDIONUM	8
#define AUDIOLEN	1024


#define MUSIC_FILE_NAME     "MYPCM.PCM"

#include "stream_frame.h"
static uint32_t get_sound_data_len(void *data)
{
	return AUDIOLEN;
}
static stream_ops_func stream_sound_ops = 
{
	.get_data_len = get_sound_data_len,
};

static int opcode_func2(stream *s,void *priv,int opcode)
{
	static uint8_t *sd_audio_buf = NULL;
	int res = 0;
	switch(opcode)
	{
		case STREAM_OPEN_ENTER:
		break;
		case STREAM_OPEN_EXIT:
		{
			
			sd_audio_buf = os_malloc(AUDIONUM * AUDIOLEN);
			if(sd_audio_buf)
			{
				//stream_data_mem_dis(s,sd_audio_buf,AUDIOLEN,AUDIONUM);
				stream_data_dis_mem(s,AUDIONUM);
			}
			streamSrc_bind_streamDest(s,R_SPEAKER);
			
		}
		break;
		case STREAM_OPEN_FAIL:
		break;

		case STREAM_FILTER_DATA:
		break;


		case STREAM_DATA_DIS:
		{
			struct data_structure *data = (struct data_structure *)priv;
			int data_num = (int)data->priv;
			data->type = 0x10;//设置声音的类型,后续用宏代替
			//注册对应函数
			data->ops = &stream_sound_ops;
			data->data = sd_audio_buf + (data_num)*AUDIOLEN;
		}
		break;

		case STREAM_DATA_FREE:
			//_os_printf("%s:%d\n",__FUNCTION__,__LINE__);
		break;


		//数据发送完成,可以选择唤醒对应的任务
		case STREAM_RECV_DATA_FINISH:
		break;

		default:
			//默认都返回成功
		break;
	}
	return res;
}


static void sim_mic_thread2(void *arg)
{
	//int res;
	int readLen;
	struct data_structure  *data;
	//void *buf;
	int count = 0;
	os_printf("%s:%d\n",__FUNCTION__,__LINE__);
	void *fp = osal_fopen(MUSIC_FILE_NAME,"rb");
	if(!fp)
	{
		_os_printf("%s:%d no found file\n",__FUNCTION__,__LINE__);
	}

	stream *src = open_stream("sound",AUDIONUM,0,opcode_func2,NULL);
	while(1 && src)
	{
		data = get_src_data_f(src);


		if(data)
		{

			
            readLen = osal_fread(get_stream_real_data(data),1,AUDIOLEN,fp);
			if(readLen<=0)
			{
				if(readLen<0)
				{
					_os_printf("%s:%d err\n",__FUNCTION__,__LINE__);
					return;
				}
				osal_fseek(fp,0);

				//删除data
				force_del_data(data);
				continue;
				
			}

			if(readLen<AUDIOLEN)
			{
				osal_fseek(fp,0);
			}
			
			//配置当前中断的buf
			send_data_to_stream(data);
			_os_printf("A");
			count ++;
			if(count%10 == 0)
			{
				broadcast_cmd_to_destStream(src,0x10);
			}
			//os_sleep_ms(200);
			

		}
		else
		{

			os_sleep_ms(1);
		}
	}

}






static stream *global_audio_dac_s = NULL;
struct audio_da_config;
typedef void *(*audio_da_set_buf)(void *priv_el,void *el_point,int *buf_size);
typedef void (*audio_da_get_buf)(void *priv_el,void *el_point, int *buf_size);
typedef int32 (*audio_da_write)(struct audio_da_config *audio, void* buf, uint32 len);


//在有mic和喇叭的时候,sample_freq与sample_bit应该要一致,所以只有一个是有效值,默认是以喇叭的配置为准
typedef struct audio_da_config
{
	struct audac_device *dac;
	void 	*current_node;
	void 	*reg_node;
    audio_da_write irq_func;
	void 	*play_empty_buf;	//作为喇叭的时候,需要配置,size与buf_size一致,可以是malloc也可以是固定,如果是malloc,需要自己去free
	int 	 buf_size;	
	int 	 play_empty_times;		
	int 	 play_empty_flag;
	audio_da_set_buf set_buf;
	audio_da_get_buf get_buf;
	void *priv_el;
	
}audio_da_config;





static void *audio_play_set_buf2(void *priv_el,void *el_point,int *buf_size)
{
	stream *dest = (stream *)priv_el;
	struct data_structure  *data = recv_real_data(dest);
	void *buf = NULL;
	void **point = (void**)el_point;
	if(data)
	{
		buf = get_stream_real_data(data);
		*buf_size = get_stream_real_data_len(data);
		*point = (void*)data;
	}
	else
	{
		//_os_printf("e");
		*point = NULL;
		return NULL;
	}
	return buf;
	
}




static void audio_play_get_buf2(void *priv_el,void *el_point,int *buf_size)
{
	//stream *dest = (stream *)priv_el;
	struct data_structure *data = (struct data_structure *)el_point;
	if(!data)
	{
		return;
	}
	*buf_size = get_stream_real_data_len(data);
	free_data(data);
	//_os_printf("#:%X\n",data);
	



	return;
	
}





void audio_dac_irq(uint32 irq, uint32 irq_data)

{
	audio_da_config *audio_da = (audio_da_config *)irq_data;
    audio_da_config *priv = (audio_da_config*)audio_da;
	void *buf;
	int buf_size;
    //满
    if (irq & AUDAC_IRQ_FLAG_FULL) {
        
        //_os_printf("$");
		if(priv->reg_node)
		{
			//buf_size大部分是无效值,如果是喇叭,get_buf则基本是空函数,如果是mic,get_buf则是返回已经录音完成的buf
			priv->get_buf(priv->priv_el,priv->current_node,&buf_size);
			priv->current_node = priv->reg_node;
			priv->reg_node = NULL;
		}
		else if(priv->current_node)
		{
			priv->get_buf(priv->priv_el,priv->current_node,&buf_size);
			priv->current_node = NULL;
		}

    }


    //半
    if (irq & AUDAC_IRQ_FLAG_HALF) {
        
        //_os_printf("*");
		if(priv->play_empty_flag && priv->play_empty_times)
		{
			priv->play_empty_times--;
			if(priv->play_empty_buf)
			{

				priv->irq_func(audio_da , priv->play_empty_buf, priv->buf_size);
			}
		}
		else
		{
			buf = priv->set_buf(priv->priv_el,&priv->reg_node,&buf_size);
			if(buf)
			{

				priv->irq_func(audio_da , buf, buf_size);
				priv->play_empty_flag = 0;
				//记录当前播放的size,如果在遇到播空情况,直接播放稍微长一点的空音频,需要限制最大
				priv->play_empty_times = buf_size/priv->buf_size + 1;
				if(priv->play_empty_times > 4)
				{
					priv->play_empty_times = 4;
				}
			}
			else
			{
				if(priv->play_empty_buf)
				{

					priv->irq_func(audio_da , priv->play_empty_buf, priv->buf_size);
					priv->play_empty_flag = 1;
					if(priv->play_empty_times == 0)
					{
						priv->play_empty_times = 1;
					}
				}
			}
		}

    }
}


static int32 global_audio_da_write(struct audio_da_config *audio, void* buf, uint32 len)
{
	audac_write(audio->dac, buf, len);
	return 0;
}
audio_da_config global_audio_da;
static uint32_t empty_buf[1024/4];

extern void dsd1793_init(void);


static int opcode_func(stream *s,void *priv,int opcode)
{
	int res = 0;
	switch(opcode)
	{
		case STREAM_OPEN_ENTER:
		break;
		case STREAM_OPEN_EXIT:
		{
			enable_stream(s,1);
			s->priv = (void*)SOUND_ALL;
		}
		break;
		case STREAM_OPEN_FAIL:
		break;
		case STREAM_RECV_DATA_FINISH:
		break;
		//在发送到这个流的时候,进行数据包过滤
		case STREAM_FILTER_DATA:
			{
				struct data_structure *data = (struct data_structure *)priv;
				int filter_type  = (int)s->priv;
				if(GET_DATA_TYPE1(data->type) != SOUND)
				{
					res = 1;
					break;
				}
				//永远不过滤
				if(!filter_type || GET_DATA_TYPE2(data->type) == SOUND_ALL)
				{
				}
				else
				{
					//过滤不匹配的数据包
					if(!(filter_type && (filter_type == GET_DATA_TYPE2(data->type))))
					{
						//os_printf("filter_type:%d\tdata_type:%d\t%X\n",filter_type,GET_DATA_TYPE2(data->type),s);
						res = 1;
						break;
					}
				}

			}
		break;

		//流接收后,数据包也要检查是否需要过滤或者是不是因为逻辑条件符合需要过滤
		case STREAM_RECV_FILTER_DATA:
			{
				struct data_structure *data = (struct data_structure *)priv;
				if(GET_DATA_TYPE1(data->type) != SOUND)
				{
					res = 1;
					break;
				}

				
				int filter_type  = (int)s->priv;
				//永远不过滤
				if(!filter_type ||  GET_DATA_TYPE2(data->type) == SOUND_ALL)
				{
				}
				else
				{
					//过滤不匹配的数据包
					if(!(filter_type && (GET_DATA_TYPE2(filter_type)== GET_DATA_TYPE2(data->type))))
					{
						res = 1;
					}
				}
			}
		break;


		//接收到命令,可以尝试执行命令的接口
		case STREAM_SEND_CMD:
		{
			uint32_t cmd = (uint32_t)priv;
			//只是接受支持的命令
			if(GET_CMD_TYPE1(cmd) == CMD_AUDIO_DAC)
			{
				os_printf("!!!!!!!!!cmd:%X\n",cmd);
				s->priv = (void*)GET_CMD_TYPE2(cmd);
			}
			
		}
		break;


		default:
		break;
	}
	return res;
}
extern void audio_dac_ana_pu_config(void);
void audio_da_init()
{
	os_printf("%s:%d\n",__FUNCTION__,__LINE__);
	{
		//static struct os_task     sim_mic_task;
		//OS_TASK_INIT("sim_mic", &sim_mic_task, sim_mic_thread2, (uint32)NULL, OS_TASK_PRIORITY_ABOVE_NORMAL, 2048);
	}

	stream *dest = open_stream(R_SPEAKER,0,16,opcode_func,NULL);
    struct audac_device *test = (struct audac_device *)dev_get(HG_AUDAC_DEVID);


    memset(&global_audio_da,0,sizeof(global_audio_da));
    audio_da_config *play = &global_audio_da;
	play->dac = test;

	play->priv_el = dest;
	play->set_buf = audio_play_set_buf2;
	play->get_buf = audio_play_get_buf2;
	play->buf_size = 1024;
	play->play_empty_flag = 0;
	play->play_empty_buf = empty_buf;
    play->irq_func = global_audio_da_write;
	

    audac_open(test, AUDAC_SAMPLE_RATE_8K);
	os_printf("play:%X\n",play);
    audac_request_irq(test, AUDAC_IRQ_FLAG_HALF | AUDAC_IRQ_FLAG_FULL, (audac_irq_hdl)audio_dac_irq, (uint32_t)play);
    play->irq_func(play , play->play_empty_buf, play->buf_size);
	global_audio_dac_s = dest;

    return;
}



//写一些通用dac输出的接口
/***********************************************************
设置接收和播放声音的类型(只是将当前不匹配的音频都会过滤掉)
使用场景:比如进入音乐播放后,就不再响应按键的音频了
***********************************************************/
void audio_dac_set_filter_type(int filter_type)
{
	if(global_audio_dac_s)
	{
		os_printf("filter_type:%d\t%X\n",filter_type,global_audio_dac_s);
		global_audio_dac_s->priv = (void*)filter_type;
	}
}


void print_audio_dac_set_filter_type()
{
	if(global_audio_dac_s)
	{
		os_printf("type:%X\n",global_audio_dac_s->priv);
	}
}