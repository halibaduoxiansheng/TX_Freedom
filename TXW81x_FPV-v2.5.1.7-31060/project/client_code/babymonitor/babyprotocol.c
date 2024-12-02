/***************************************************
    该demo主要是使用AT命令拍一张照片,前提要将jpeg打开
***************************************************/
#include "sys_config.h"	
#include "tx_platform.h"
#include "osal/string.h"
#include "custom_mem/custom_mem.h"
#include "stream_frame.h"
#include "osal/task.h"
#include "osal_file.h"
#include "video_app/video_app.h"
#include "lwip/api.h"
#include "lwip/sockets.h"
#include "lwip/etharp.h"
#include "utlist.h"
#include "jpgdef.h"
#include "lib/lcd/lcd.h"
#include "lwip/err.h"
#include "lwip/sockets.h"
#include "lwip/netdb.h"
#include "lwip/sys.h"
#include "lwip/ip_addr.h"
#include "lwip/tcpip.h"
#include "netif/ethernetif.h"
#include "dhcpd_eloop/dhcpd_eloop.h"
int udp_protocol_fd   =  - 1;
int handle_protocol_fd   =  - 1;
k_task_handle_t handle_task_recv;
k_task_handle_t protocol_task_recv;
char buf_for_protocol[2048]__attribute__ ((aligned(4)));
uint8_t connect_server = 0;
uint8_t los_map[24];
uint8_t frame_id = 0;
uint8_t flash_lcd = 0;
extern volatile uint8 scale2_finish ;
struct os_semaphore     connect_sem;

uint16_t rx_speed,tx_speed;
uint8_t dispnum;



#if LCD_EN
uint8 photo_decode_net[2][100*1024] __attribute__ ((aligned(4),section(".psram.src"))); 
#endif
typedef struct
{     
	uint8_t  photo_state;   //bit7:start   bit6:end   bit[0-5]:node_num
	uint8_t  cnt;
	uint8_t  pack;
	uint8_t  res;
	uint16_t tx_speed;
	uint8_t  res1;
	uint8_t  node_map[9];  //node has send,one bit for one node
}baby_head;


static int opcode_func(stream *s,void *priv,int opcode)
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












int usr_protocol_create_server(uint16_t port)
{
	int socket_c, err;
	struct sockaddr_in addr;
	addr.sin_family = AF_INET;
	addr.sin_len = sizeof(struct sockaddr_in);
	addr.sin_port = htons(port);
	addr.sin_addr.s_addr = htons(INADDR_ANY);

	socket_c = socket(AF_INET, SOCK_DGRAM, 0);
	if (socket_c < 0)
	{
		printf("get socket err");
		return  - 1;
	} 

	err = bind(socket_c, (struct sockaddr*) &addr, sizeof(struct sockaddr_in));

	if (err ==  - 1)
	{
		close(socket_c);
		return  - 1;

	}	
	return socket_c;
}

///////client
uint32_t addrip_return();
void read_handle_thread(){	
	int retval;
	int ret;
	//uint8_t itk = 0;
	uint8_t handlebuf[24];
	struct sockaddr remote_addr;
	retval = 16;

	while(1){
		ret = recvfrom (handle_protocol_fd, handlebuf, 24, 0, &remote_addr, (socklen_t*)&retval);
		connect_server = 1;
		if(handlebuf[0] == 1){

		}else if(handlebuf[0] == 2){
			//os_printf("buf:");
			//for(itk = 1;itk < 20;itk++){
			//	printf("%02x ",handlebuf[itk]);
				//if(handlebuf[itk] != 0){
				//	break;
				//}
			//}
			//printf("\r\n");
			memcpy(los_map,handlebuf,24);
			if(los_map[1] == frame_id)
				os_sema_up(&connect_sem);
		}
	}
}
///////client
void send_photo_thread()
{
	int  len;	
	uint16_t port = 11011;
	struct sockaddr_in addrServer;// = (struct sockaddr_in *)malloc(sizeof(struct sockaddr_in));
	struct data_structure *get_f = NULL;
    stream *s = NULL;
	uint32_t flen;
	uint16_t tx_speed = 0;
	uint32_t tx_data_count = 0;
	uint32_t old_time;
	uint32_t node_len;
	uint8_t node_num;
	uint8_t jpg_num = 0;
	uint8_t count;
	uint8_t map_num,bit_num;
    struct stream_jpeg_data_s *dest_list;
    struct stream_jpeg_data_s *dest_list_tmp;
	struct stream_jpeg_data_s *el,*tmp;
	uint8_t *jpeg_buf_addr = NULL;
	baby_head *msg_head;
	int32  ret_sema        = 0;
	uint8_t lost_pack[20];
	uint8_t itk,jtk,ktk;
	uint8_t los_num;
	while(1){
		if((uint32_t)sys_network_get_ip() == 0x101a8c0){
			os_sleep_ms(50);
			_os_printf("^");
		}else{
			break;
		}
	}
	
	
    s = open_stream_available(R_RTP_JPEG,0,8,opcode_func,NULL);
	old_time = os_jiffies();
	memset(&addrServer,0,sizeof(struct sockaddr_in));
	addrServer.sin_family=AF_INET;
	addrServer.sin_addr.s_addr=inet_addr("192.168.1.1");
	addrServer.sin_port=htons(11011);
	udp_protocol_fd = usr_protocol_create_server(port);
	msg_head = (baby_head *)buf_for_protocol;
	start_jpeg();
	while(1){
		if(connect_server == 1){
			if((os_jiffies() - old_time) > 1000){
				old_time = os_jiffies();
				tx_speed = tx_data_count/1024;
				tx_data_count = 0;
			}else{
				if(os_jiffies() < old_time){  //os_jiffies 溢出处理
					old_time = os_jiffies();
				}
			}
			
			get_f = recv_real_data(s);
			if(get_f){
				
				dest_list = (struct stream_jpeg_data_s *)GET_DATA_BUF(get_f);
				dest_list_tmp = dest_list;
				flen = get_stream_real_data_len(get_f);
				node_len = GET_NODE_LEN(get_f);
				memset(msg_head,0,sizeof(baby_head));
				node_num = (flen+node_len-1)/node_len;
				jpg_num++;
				
				if(jpg_num > 63)
					jpg_num = 0;

				//os_printf("send(%d   %d)..\r\n",flen,jpg_num);
				msg_head->photo_state = BIT(7)|jpg_num;
				msg_head->tx_speed = tx_speed;
				count = 0;
				msg_head->pack        = node_num;
				LL_FOREACH_SAFE(dest_list,el,tmp){
					if(dest_list_tmp == el)
					{
						continue;
					}
					//读取完毕删除
					//图片保存起来
					frame_id = jpg_num;
					if(flen)
					{
						jpeg_buf_addr = (uint8_t *)GET_JPG_SELF_BUF(get_f,el->data);
						if(flen >= node_len)
						{
							flen -= node_len;
							
							map_num = count/8;
							bit_num = count%8;
							msg_head->node_map[8-map_num] |= BIT(bit_num);
							if(count){
								msg_head->photo_state = jpg_num;
							}
							msg_head->cnt = count;

							
							count++;
							memcpy(buf_for_protocol+16,(char*)jpeg_buf_addr,node_len);
							if(flen == 0){
								msg_head->photo_state = BIT(6)|jpg_num;
							}
							len = sendto(udp_protocol_fd, buf_for_protocol, node_len+16, MSG_DONTWAIT, (struct sockaddr *)&addrServer, sizeof(struct sockaddr));
							//printf("+");
							tx_data_count += (node_len+16);
						}
						else
						{
							map_num = count/8;
							bit_num = count%8;
							msg_head->node_map[8-map_num] |= BIT(bit_num);
							msg_head->cnt = count;
							count++;
							memcpy(buf_for_protocol+16,(char*)jpeg_buf_addr,flen);
							msg_head->photo_state = BIT(6)|jpg_num;
							len = sendto(udp_protocol_fd, buf_for_protocol, flen+16, MSG_DONTWAIT, (struct sockaddr *)&addrServer, sizeof(struct sockaddr));
							tx_data_count += (flen+16);
							flen = 0;							
							//os_printf("-");
						}
					}
				
					//DEL_JPEG_NODE(get_f,el);				
				}
				
				ret_sema = os_sema_down(&connect_sem, 20);
				//os_printf("ret_sema:%d    f:%d\r\n",ret_sema,jpg_num);
#if 1				
				if(ret_sema){
					//重发
					
					dest_list = dest_list_tmp;
					count = 0;
					jtk   = 0;
					flen = get_stream_real_data_len(get_f);
					memset(msg_head,0,sizeof(baby_head));
					msg_head->tx_speed = tx_speed;
					msg_head->pack        = node_num;
					memset(lost_pack,0,20);
					for(itk = 2;itk < 22;itk++){
						if(los_map[itk]!=0xff){
							if(los_map[itk]!=0){
								lost_pack[jtk] = los_map[itk];
								jtk++;
							}
						}else{
							los_num = node_num - los_map[itk+1];
							//printf("los_num:%d  %d %d\r\n",los_num,node_num,los_map[itk+1]);
							for(ktk = 0;ktk<los_num;ktk++){
								lost_pack[jtk] = los_map[itk+1]+ktk+1;
								jtk++;
							}
							break;
						}
					}
					//printf("losp:");
					//for(ktk = 0;ktk<20;ktk++){
					//	printf("%02x ",lost_pack[ktk]);
					//}					
					//printf("\r\n");
					ktk = 0;
					LL_FOREACH_SAFE(dest_list,el,tmp){
						if(dest_list_tmp == el)
						{
							continue;
						}
						//读取完毕删除
						//图片保存起来
						
						if(flen)
						{
							jpeg_buf_addr = (uint8_t *)GET_JPG_SELF_BUF(get_f,el->data);
							if(flen >= node_len)
							{
								flen -= node_len;
								
								map_num = count/8;
								bit_num = count%8;
								msg_head->node_map[8-map_num] |= BIT(bit_num);
								if(count){
									msg_head->photo_state = jpg_num;
								}
								msg_head->cnt = count;

								
								count++;
								memcpy(buf_for_protocol+16,(char*)jpeg_buf_addr,node_len);
								
								msg_head->photo_state = BIT(6)|BIT(7)|jpg_num;
								
								if(lost_pack[ktk] == count){
									ktk++;
									//printf("s(%d)",count);
									len = sendto(udp_protocol_fd, buf_for_protocol, node_len+16, MSG_DONTWAIT, (struct sockaddr *)&addrServer, sizeof(struct sockaddr));			
									tx_data_count += (node_len+16);
								}

							}
							else
							{
								map_num = count/8;
								bit_num = count%8;
								msg_head->node_map[8-map_num] |= BIT(bit_num);
								msg_head->cnt = count;
								count++;
								memcpy(buf_for_protocol+16,(char*)jpeg_buf_addr,flen);
								msg_head->photo_state = BIT(6)|BIT(7)|jpg_num;
								if(lost_pack[ktk] == count){
									ktk++;
									//printf("s(%d)",count);
									len = sendto(udp_protocol_fd, buf_for_protocol, flen+16, MSG_DONTWAIT, (struct sockaddr *)&addrServer, sizeof(struct sockaddr));
									tx_data_count += (flen+16);
								}

								flen = 0;							
							}
						}
					
						DEL_JPEG_NODE(get_f,el);				
					}
					
				}else{
					//超时，没数据要重发
				}
#endif				
			    free_data(get_f);
            	get_f = NULL;
			}else{
				
				
			}

		}else{
			os_sleep_ms(20);
		}

	}
}

///////server
void udp_handle_read_thread()
{
	int  len;	
//	uint8_t itk;
	char buf[12];
	int32  ret_sema        = 0;
	uint16_t port = 11012;
	struct sockaddr_in addrServer;
	memset(&addrServer,0,sizeof(struct sockaddr_in));
	addrServer.sin_family=AF_INET;
	addrServer.sin_addr.s_addr=inet_addr("192.168.1.255");
	addrServer.sin_port=htons(11012);
	handle_protocol_fd = usr_protocol_create_server(port);
	while(1){
		ret_sema = os_sema_down(&connect_sem, 1000);
		if (!ret_sema){
			buf[0] = 1;
			len = sendto(handle_protocol_fd, (char*)buf, 12, MSG_DONTWAIT, (struct sockaddr *)&addrServer, sizeof(struct sockaddr));
		}else{
			los_map[0] = 2;
			los_map[1] = frame_id;
			len = sendto(handle_protocol_fd, (char*)los_map, 24, MSG_DONTWAIT, (struct sockaddr *)&addrServer, sizeof(struct sockaddr));
			//os_printf("los:");
			//for(itk = 0;itk < 24;itk++){
			//	printf("%02x ",los_map[itk]);
			//}
			//printf("\r\n");
		}
	}
}

///////server
void read_protocol_thread(){	
	int t;
	//fd_set rfds;
	int retval;
	int ret;
	int itk = 0;
	int jtk = 0;
	uint8_t tkt = 0;
	int buf_recv = 0;
	int frame_state  = 0;    //0: no action    1:new frame   2:wait check  3:updata lcd
	uint32_t timeout;
	uint32_t old_time;
	uint32_t rx_count = 0;
	uint16_t tx_msg = 0;
	uint8_t run_lcd = 0;
	uint8_t errframe = 0;
	uint8_t dnum = 0;
	uint8_t count = 0;
//	uint8_t map_num,bit_num;
	uint8_t pingpang = 0;
	struct sockaddr remote_addr;
	uint8_t node_map_cache[20];
	uint16_t node_len = 1308;
	uint8_t f_num = 0;
//	uint8_t cnt_rom;
	uint8_t pack_num=0;
	retval = 16;
	baby_head *msg_head;
	msg_head = (baby_head *)buf_for_protocol;
	timeout = 10000;

	t = 10;         //10ms超时时间
	setsockopt(udp_protocol_fd,SOL_SOCKET,SO_RCVTIMEO,(char *)&t,sizeof(struct timeval));
	old_time = os_jiffies();
	while(1){
		ret = recvfrom (udp_protocol_fd, buf_for_protocol, 2048, 0, &remote_addr, (socklen_t*)&retval);	
		
		if((os_jiffies() - old_time) > 1000){
			old_time = os_jiffies();
			rx_speed= rx_count/1024;
			tx_speed= tx_msg;
			dispnum = run_lcd;
			run_lcd = 0;
			rx_count = 0;
			//printf("rx_speed:%d  tx_speed:%d  dispnum:%d \r\n",rx_speed,tx_speed,dispnum);
		}else{
			if(os_jiffies() < old_time){  //os_jiffies 溢出处理
				
				old_time = os_jiffies();
			}
		}
	
		if(ret != -1){
#if LCD_EN
			rx_count += ret;
			//printf("&(%d n:%d)",msg_head->photo_state&0x3f,rx_count);
			frame_id = msg_head->photo_state&0x3f;
			tx_msg   = msg_head->tx_speed;
			if((msg_head->photo_state&(BIT(7)|BIT(6))) == (BIT(7)|BIT(6))){
				//printf("map:");
				//for(itk = 0;itk < 9;itk++){
				//	printf("%02x ",msg_head->node_map[itk]);
				//}
				//printf("\r\n");
				//printf("add...(f:%d %d)\r\n",msg_head->photo_state&0x3f,msg_head->cnt);
				node_map_cache[msg_head->cnt] = msg_head->cnt+1;
			}else if(msg_head->photo_state&BIT(7)){
				//printf("H{%d}",msg_head->pack);
				pack_num = msg_head->pack; 
				buf_recv = 0;
				count = 0;
				frame_state  = 1;
				errframe = 0;
				for(itk = 0;itk < 20;itk++){
					node_map_cache[itk] = 0;
				}	
				node_map_cache[msg_head->cnt] = msg_head->cnt+1;
				node_len = ret-16;;
				f_num = msg_head->photo_state&0x3f;
				
			}else{
				if(f_num != (msg_head->photo_state&0x3f)){
					//printf("lose hand...\r\n");
					pack_num = msg_head->pack; 
					//recover
					buf_recv = 0;
					errframe = 0;
					count = 0;
					frame_state  = 1;
					for(itk = 0;itk < 20;itk++){
						node_map_cache[itk] = 0;
					}
					
					node_map_cache[msg_head->cnt] = msg_head->cnt+1;

					count = msg_head->cnt;
					f_num = msg_head->photo_state&0x3f;
				}
				
				node_map_cache[msg_head->cnt] = msg_head->cnt+1;
			}

			tkt = 0;
			for(itk = 0;itk < 9;itk++){
				if(msg_head->node_map[itk] != 0){
					for(jtk = 0;jtk < 8;jtk++){
						if((msg_head->node_map[itk]&BIT(jtk)) == 0){
							break;	
						}
						tkt++;
					}
					//printf("itk:%d  tkt:%d  itk*8+tkt-1:%d\r\n",itk,tkt,itk*8+tkt-1);
					buf_recv = ((8-itk)*8+tkt-1)*node_len;
					break;
				}
			}
			
			count++;
			
			
			if((msg_head->photo_state&0x3f) == f_num){
				if(pingpang == 0){
					//printf("B0:%d ",buf_recv);
					memcpy(photo_decode_net[0]+buf_recv,buf_for_protocol+16,ret-16);
				}
				else{			
					//printf("B1:%d ",buf_recv);
					memcpy(photo_decode_net[1]+buf_recv,buf_for_protocol+16,ret-16);
				}
			}
	
	
			
			if((msg_head->photo_state&BIT(6))&&(frame_state == 1)){
				//os_printf("E\r\n");	
				memset(los_map+2,0,20);
				itk = 0;
				for(jtk = 0;jtk<pack_num;jtk++){
					if(node_map_cache[jtk] != (jtk+1)){
						//printf("lose==>%d\r\n",jtk);
						los_map[itk+2] = jtk+1;
						itk++;
					}
				}
				//os_printf("S");				
				os_sema_up(&connect_sem);			
				frame_state = 3;				
			}
#endif		
		}else{
			//printf("O(%d P:%d)",scale2_finish,pingpang);
			if(frame_state == 3)
			{
				//printf("F");
				
				for(jtk = 0;jtk<pack_num;jtk++){
					if(node_map_cache[jtk] != (jtk+1)){
						errframe = 1;
					}
				}
#if LCD_EN
				if(errframe == 0){
#if 0					
					if(scale2_finish == 0){
						disable_irq();
						if(pingpang == 0){
							for(itk = 0;itk < 10*1024;itk++){
								printf("%02x ",photo_decode_net[1][itk]);
							}
						}else{
							for(itk = 0;itk < 10*1024;itk++){
								printf("%02x ",photo_decode_net[0][itk]);
							}
						}
						while(1);
					}
#endif					
					run_lcd++;
					if(scale2_finish){
						scale2_finish = 0;
						if(pingpang == 0){
							sys_dcache_clean_range((uint32_t *)photo_decode_net[0], buf_recv);
							jpg_decode_to_lcd((uint32)photo_decode_net[0],320,240,320,240);
							pingpang = 1;
						}else{
							sys_dcache_clean_range((uint32_t *)photo_decode_net[1], buf_recv);					
							jpg_decode_to_lcd((uint32)photo_decode_net[1],320,240,320,240);
							pingpang = 0;
						}
						dnum = 0;
					}else{
						_os_printf("ERR DISPLAY.....\r\n");
						dnum++;
						if(dnum > 8){
							scale2_finish = 1;
						}
					}
				}
#endif				
				frame_state = 0;
			}else if(frame_state == 2){

			}else{
				//printf("I");
				if(frame_state == 1){
					//丢尾包
					memset(los_map+2,0,20);
					itk = 0;
					for(jtk = 0;jtk<pack_num;jtk++){
						if(node_map_cache[jtk] != (jtk+1)){
							//printf("lose==>%d\r\n",jtk);
							los_map[itk+2] = jtk+1;
							itk++;
						}
					}
					//os_printf("S"); 			
					os_sema_up(&connect_sem);			
					frame_state = 3;					
				}else{
					frame_state = 0;
				}

			}			
		}

	}
}



void udp_protocol_net_server_init()
{
	//struct timeval t;
	uint16_t port = 11011;
	//printf("> udp_user_data_init\nudp port:%d\n", port);
	udp_protocol_fd = usr_protocol_create_server(port);	
	csi_kernel_task_new((k_task_entry_t)read_protocol_thread, "protocol_udp_pkt", 0, 15, 0, NULL, 1024, &protocol_task_recv);

}


void udp_handle_server_init()
{

	csi_kernel_task_new((k_task_entry_t)udp_handle_read_thread, "handle_udp_pkt", 0, 15, 0, NULL, 1024, &handle_task_recv);
}


void udp_protocol_net_client_init()
{
	csi_kernel_task_new((k_task_entry_t)send_photo_thread, "protocol_udp_pkt", 0, 15, 0, NULL, 2048, &protocol_task_recv);
}

void udp_handle_client_init()
{
	uint16_t port = 11012;
	handle_protocol_fd = usr_protocol_create_server(port); 

	
	csi_kernel_task_new((k_task_entry_t)read_handle_thread, "handle_udp_pkt", 0, 15, 0, NULL, 1024, &handle_task_recv);

}


void protocol_client_init(){
	os_sema_init(&connect_sem, 0);
	udp_protocol_net_client_init();
	udp_handle_client_init();
}

void protocol_server_init(){
	os_sema_init(&connect_sem, 0);
	udp_protocol_net_server_init();
	udp_handle_server_init();
}


void user_protocol()
{
    protocol_server_init();
}


