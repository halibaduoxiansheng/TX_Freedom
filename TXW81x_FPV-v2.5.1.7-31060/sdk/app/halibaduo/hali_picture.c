#include "hali_picture.h"
#include "hali_wifi.h"
#include "hali_energy.h"



#define VIDEO_SEND_MAX_LEN 		(850)
#define VIDEO_HEADER_SIZE		(16) //(sizeof(struct hVideoUDP)) if you change header size,please change its size
#define SEND_MAX_TRY			(30)
#define SEND_DATA_BUFFER_SIZE	(VIDEO_SEND_MAX_LEN + VIDEO_HEADER_SIZE + 1)

enum{
	VIDEO_TYPE_V1 = 1,
	VIDEO_TYPE_V2 = 2,
	AUDIO_TYPE = 5,
};

typedef struct tvideo_hdr_param{
   uint8_t* ptk_ptr;
    uint32_t ptklen;	
    uint8_t frame_id;
    uint32_t is_eof;
    uint32_t frame_cnt;
}TV_HDR_PARAM_ST, *TV_HDR_PARAM_PTR;


struct hVideoUDP { //header video udp
	uint8_t type;		//video header type
	uint8_t seq;		//sequence for disorder
	uint8_t frameId;	//frame id
	uint8_t isEof;		//eof flag
	uint8_t frameCnt;	//frame count
	uint8_t gsensorSupport :1; 	//bit0:gsensor support;  
	uint8_t focusData:2;		//bit1-bit2: focus function;
	uint8_t gsensorDataType:1;		//bit3: 0:gsensor data   1:temperature&humidity data
	uint8_t reservedData:4; 	//bit4-bit7:reserverd
	uint32_t gsensorData; 	//gsensor data
	uint8_t mac[2];
	int16_t wide;
	int16_t high; 
}__attribute__((__packed__));


struct TX_PIC_Thd {
    void *thread;
    uint16_t stack_size;
    char stack_name[15];
    uint8_t priority;
    uint16_t interval;
    void *args;

    void (*trd_func)(void);
};
struct TX_PIC_Thd pic_thd;


static uint8_t frame_mem_id = 0;

#define WIFI_RUN_STATUS (g_wifi.is_connected)
#define WIFI_IS_RUNNING (1)
#define WIFI_IS_STOP    (0)

struct G_TX_PIC pic_client[MAX_CLIENT_NUM] = {0};



static void hali_picture_init(void)
{
    tx_pic = (struct G_TX_PIC*)malloc(sizeof(struct G_TX_PIC));
    memset(tx_pic, 0, sizeof(struct G_TX_PIC));

	tx_pic->open_flag = 0;
	tx_pic->s = NULL;
	tx_pic->client_num = 0;
}

static void _get_mac_from_cache(char *mac)
{
	memcpy(mac, sys_cfgs.mac, sizeof(sys_cfgs.mac));
}

void video_add_pkt_header(TV_HDR_PARAM_PTR param)
{
	struct hVideoUDP* elem_tvhdr = (struct hVideoUDP*)(param->ptk_ptr);
	uint8_t tmac[6] = {0};
	static uint8_t tseq = 0;

	elem_tvhdr->type = VIDEO_TYPE_V1;
	elem_tvhdr->frameId= param->frame_id;
	elem_tvhdr->isEof = param->is_eof;
	elem_tvhdr->frameCnt = param->frame_cnt;
	elem_tvhdr->seq = tseq++;

	elem_tvhdr->gsensorSupport = 0;
	elem_tvhdr->gsensorData = 0;
	
	elem_tvhdr->focusData = 0;
	elem_tvhdr->reservedData = 0;	

	elem_tvhdr->wide = 640;
	elem_tvhdr->high = 480;
	
	_get_mac_from_cache(tmac);
	elem_tvhdr->mac[0] = tmac[4];
	elem_tvhdr->mac[1] = tmac[5];
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

void hali_video_close(void)
{
	close_stream(tx_pic->s);
}

void hali_video_open(void)
{
	//创建接收流
	tx_pic->s = open_stream(R_RTP_JPEG,0,8,audio_opcode_func,NULL);//_available
	start_jpeg();
}

TV_HDR_PARAM_ST jpg_header;

TV_HDR_PARAM_ST jpg_header;
/** 设置 video_init 给到 4096 */
static void send_udp_data_limit_bytes(int sockfd, uint8_t* data, uint32_t data_len, struct sockaddr_in addr, uint32_t jpg_len, uint32_t max_bytes, int fail_trys, uint8_t is_end)
{
	static total_size = 0;
	// printf("this image of jpg_len is %d\r\n", jpg_len);
	uint8_t *send_data_pos = NULL;
	uint8_t send_data[SEND_DATA_BUFFER_SIZE] = {0};
	static uint8_t calc_flag = 0;
	int send_bytes = -1;
	uint32_t send_size = 0;
	uint32_t offset = 0; // already send bytes
	uint32_t last_send_size = 0;

	if (data == NULL) {
		printf("please check args, data is NULL\r\n");
		return;
	}
	if (data_len > VIDEO_SEND_MAX_LEN) {
		last_send_size = data_len % VIDEO_SEND_MAX_LEN;
	} else {
		last_send_size = data_len;
	}

	
	while(last_send_size == 0 || offset != data_len) {
		memset(send_data, 0, SEND_DATA_BUFFER_SIZE);
		send_data_pos = send_data;
		if (offset != data_len) { // if already sended bytes not equal to all stay bytes
			if ((data_len - offset) >= VIDEO_SEND_MAX_LEN) { // remain bytes >= VIDEO_SEND_MAX_LEN
				memcpy(send_data_pos + VIDEO_HEADER_SIZE, data + offset, VIDEO_SEND_MAX_LEN);
				send_size = VIDEO_SEND_MAX_LEN + VIDEO_HEADER_SIZE;
				offset += VIDEO_SEND_MAX_LEN;
			} else { // remain bytes < VIDEO_SEND_MAX_LEN
				send_size = last_send_size + VIDEO_HEADER_SIZE;
				memcpy(send_data_pos + VIDEO_HEADER_SIZE, data + offset, last_send_size);
				offset += last_send_size;
			}
		}

		// jpg_header = (struct tvideo_hdr_param*)send_data_pos;
		

		if (calc_flag == 0) { // calc the picture frame count
			// printf("jpg_len is %u, data_len = %d",jpg_len, data_len);
			uint32_t count0 = jpg_len / data_len;
			// printf("count0 is %u\r\n", count0);
			
			jpg_header.frame_cnt = (count0 * ((data_len / max_bytes) + ((data_len % max_bytes) ? 1 : 0)));
			// printf("jpg_header.frame_cnt is %u\r\n", jpg_header.frame_cnt);
			uint32_t count1 = jpg_len % data_len;
			// printf("count1 is %u\r\n", count1);
			jpg_header.frame_cnt += ((count1 / max_bytes) + ((count1 % max_bytes) ? 1 : 0));
			// printf("jpg_header->frame_cnt is %u\r\n", jpg_header.frame_cnt);
			calc_flag = 1;
		}

		
		if (is_end == 1 && offset == data_len) {
			jpg_header.is_eof = 1;
			// printf("jpg_header->is_eof is %d\r\n", jpg_header.is_eof);
			last_send_size = 1; // 跳出循环 （ != 0 就可以）
			jpg_header.frame_id = --frame_mem_id;
			printf("send a picture\r\n");
			calc_flag = 0;
		} else {
			jpg_header.is_eof = 0;
		}

		jpg_header.ptk_ptr = send_data_pos;
		jpg_header.ptklen = send_size;
		video_add_pkt_header(&jpg_header);

		do { // send data
			printf("jpg_header.frame_id is %d, jpg_header.is_eof is %d, jpg_header.frame_cnt is %d\r\n", jpg_header.frame_id, jpg_header.is_eof, jpg_header.frame_cnt);
			send_bytes = sendto(sockfd, send_data_pos, send_size, MSG_DONTWAIT, (struct sockaddr *)&addr, sizeof(struct sockaddr_in));
			if (send_bytes <= 0) {
				/* err */
				printf("udp send err:%d\r\n", send_bytes); // 暂未发现连续失败两次的情况，其余均为丢包，发送是发送成功
				os_sleep_ms(3);
			} else {
				// printf("send success\r\n");
				// os_sleep_ms(1);
			} 
		} while(send_bytes <= 0 && fail_trys--);
		// if (offset == data_len) {
		// 	total_size += data_len;
		// 	printf("total_size is %d\r\n", total_size);
		// }
		// printf("last_send_size is %d, offset is %d, data_len is %d, send_bytes is %d\r\n", last_send_size, offset, data_len, send_bytes);
		if (jpg_header.is_eof == 1) {
			total_size  = 0;
		}
		if (is_end == 1 && offset == data_len) {
			frame_mem_id++;
		}
	}
}

static void hali_picture_thread(void *arg)
{
	// printf("%s:%d\r\n", __FUNCTION__, __LINE__);
	static uint8_t have_start_jpeg = 0;
	uint8_t is_end = 0;
	uint32_t send_len = 0;
	struct data_structure *get_f = NULL;
	
	int timeouts = 0;
	int head_size = sizeof(struct hVideoUDP);
	uint8_t *jpeg_buf_addr = NULL;
	uint32_t total_len = 0;
	uint32_t uint_len = 0;
	uint32_t jpg_len = 0;
	struct stream_jpeg_data_s *el,*tmp;
	struct stream_jpeg_data_s *dest_list;
	struct stream_jpeg_data_s *dest_list_tmp;
	int send_byte = 0;

	//启动jpeg(内部就是创建一个发送流,会绑定R AT_SAVE_PHOTO)
	
	while(1) {
		if (tx_power.is_powerOn && have_start_jpeg == 0) {
			start_jpeg();
			have_start_jpeg = 1;
		}
		if (WIFI_RUN_STATUS == WIFI_IS_RUNNING) { // TODO open video connected
			os_mutex_lock(&tx_pic->mutex, OS_MUTEX_WAIT_FOREVER);
			if(!tx_pic->hava_client) { 
				os_sleep_ms(20);
				os_mutex_unlock(&tx_pic->mutex);
				continue;
			}
			if(tx_pic->s)
			{
				enable_stream(tx_pic->s, 1);
			}
			//获取图片
			get_f = recv_real_data(tx_pic->s);

			if(get_f)
			{
				//获职图片数据的节点
				dest_list = (struct stream_jpeg_data_s *)get_stream_real_data(get_f);
				dest_list_tmp = dest_list;
				//获取图片长度
				total_len = get_stream_real_data_len(get_f);
				
				//获取图片数据一个节点的长度
				uint_len = (uint32_t)stream_data_custom_cmd_func(get_f,CUSTOM_GET_NODE_LEN,NULL);
				jpg_len = total_len;
				
				//遍历图片的节点
				//LL_FOREACH_SAFE(dest_list,el,tmp)
				for((el) = (dest_list); (el) && ((tmp) = (el)->next, 1); (el) = (tmp))
				{
					if(dest_list_tmp == el)
					{
						continue;
					}
					if(total_len)
					{
						//获取节点的buf起始地址
						jpeg_buf_addr = (uint8_t *)stream_data_custom_cmd_func(get_f,CUSTOM_GET_NODE_BUF,el->data);
						if(total_len >= uint_len)
						{
							total_len -= uint_len;
							send_len = uint_len;
							is_end = 0;
							
						}
						else
						{
							send_len = total_len;
							is_end = 1;
							total_len = 0 ;
						}
						// private protocol
						send_udp_data_limit_bytes(g_wifi.connect_sock, jpeg_buf_addr, send_len, pic_client[tx_pic->client_index].addr,
									jpg_len, VIDEO_SEND_MAX_LEN, SEND_MAX_TRY, is_end);
					}
					//使用完一个节点,就要删除改节点,快速释放空间
					stream_data_custom_cmd_func(get_f,CUSTOM_DEL_NODE,el);
				}
				//写卡完毕后,释放get_f的节点
				free_data(get_f);//关闭文件系统句柄
				get_f = 0;
				os_sleep_ms(1);
				os_mutex_unlock(&tx_pic->mutex);
			}
		} else {
			os_sleep_ms(500);
			// printf("%s:%d\r\n", __FUNCTION__, __LINE__);
		}
	}
	printf("videoCtx Task Quit\r\n");
}


void hali_picture_register(void)
{
    hali_picture_init();

    memset(&pic_thd, 0, sizeof(struct TX_PIC_Thd));
    pic_thd = (struct TX_PIC_Thd){
        .stack_size = 4096,
        .stack_name = "hali_pic",
        .priority = 10,
        .interval = 1,
        .args = tx_pic,
        .trd_func = hali_picture_thread,
    };
}


void hali_pic_thread_start(void) 
{
	void *thread;
	printf("picture task ready to run\r\n");
    os_mutex_init(&(tx_pic->mutex));
    csi_kernel_task_new((k_task_entry_t)pic_thd.trd_func, pic_thd.stack_name, pic_thd.args, pic_thd.priority, 0, NULL, pic_thd.stack_size, &thread);
}

