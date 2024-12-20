#include "typesdef.h"
#include "sys_config.h"
#include "lib/video/dvp/cmos_sensor/csi.h"
#include "tx_platform.h"
#include "list.h"
#include "dev.h"
#include "hal/i2c.h"


#if DEV_SENSOR_SP0A83


SENSOR_INIT_SECTION static const unsigned char sp0a83InitTable[CMOS_INIT_LEN]={

#if 0	//default
0xfd, 0x00,  
/*
[7] ds_i2c
[6:5] ds_data
[4] pd_dig
*/                                                                                 
0x1d, 0x25,   
/*
Normal 0x31[2:1] 00
Mirror 0x31[2:1] 01
Flip 0x31[2:1] 10
Mirror & Flip 0x31[2:1] 11
*/                                                                         
//0x31, (0<<2)|(0<<1), //comm_ctrl_reg 
//0x31, (1<<2)|(1<<1), //comm_ctrl_reg
//0x31, (1<<2)|(0<<1), //comm_ctrl_reg	//yuan_Add
//0x31, (0<<2)|(1<<1), //comm_ctrl_reg
/*
[2] ext_sync_sel
[1:0] pvdd_sel
*/                                                                                 
0x32, 0x01,                                                                                   
0x30, 0x01, //[2:0] dclk_ctrl
                                                                                  
0xfd, 0x00,  //                                                                                  
0xf0, 0xff, //gb_suboffset                                                                             
0xf1, 0xff, //gr_suboffset                                                                                  
0xf2, 0xff, //red_suboffset                                                                                  
0xf3, 0xff, //blue_suboffset                                                                                  
0xfc, 0x50, //blc_dpc_th_p_8lsb 
                                                                          
0xfd, 0x01, 
/*
[5:4] lsc_position_set Raw order set for awb gain and lsc gain
[3:2] awb_position_set
[1:0] bayer order set for demosaic
*/                                                                                  
0x5d, 0x01,  
/*
[7] dpc_flt_en
[6] dpc_dirtm_en
[5] gamma_en2(raw gamma)
[4] domu_en
[3] sharp_mdy_en
[2] dpc_low_en
[1] gamma correction(y gamma)
[0] color correction
*/                                                                                 
0x34, 0xe3,
/*
[7] raw_mid8_en
[6] raw_low8_en
[5] add_row4_col4_en
[4] swap byte
0:u y v y
1:y u y v
[3] unpro_raw_out_en
[2] y_out_en
[0] yuv_order
0: U Y V Y
1: V Y U Y
*/                                                                                   
0x35, 0x10, 
                                                                                  
0xfd, 0x00, //; ae setting                                                                      
0x03, 0x03, //Integration time high 3 bits                                                                                  
0x04, 0x6c, //Integration time low 8 bits                                                                                
0x24, 0x10, //pga_gain_ctl                                                                                   
0xef, 0x40,                                                                                   
0x06, 0x00, //Vsync blank                                                                                  
0x09, 0x01, //hblank_4msb                                                                                  
0x0a, 0xE0, //hblank_8lsb                                                                                  
0x10, 0x0a,//;07  by wwj 0124                                                                   
0x11, 0x02,//;04  by wwj 0124
/*
[1] dac_mode
[0] FPN_33ms_timing_sel
*/                                                                   
0x16, 0x01,  
/*
[6:4] icomp1
[1:0] icomp2
*/                                                                                 
0x19, 0x22,                                                                                   
0x1e, 0x60,//;58 by wwj 0124                                                                    
0x29, 0x60,//;48 by wwj 0124  
/*
[5] cp_num
[4:3] spi_clk_delay
[2:0] vcp_sel_ctl
*/                                                                  
0x13, 0x37, 
/*
[5:4] ds_hsync
[3:2] ds_vsync
[1:0] ds_pclk
*/                                                                                  
0x14, 0x01,                                                                                   
0x25, 0x01,                                                                                   
0x2a, 0x06,                                                                                   
0x27, 0x00,//   by wwj 0218                                                                     
0x54, 0x00,                                                                                   
0x55, 0x10,                                                                                   
0x58, 0x28,//;38 by wwj 0124                                                                    
0x5d, 0x12,                                                                                   
0x63, 0x00,                                                                                   
0x64, 0x00,                                                                                   
0x66, 0x2a,//;28   by wwj 0218                                                                  
0x68, 0x28,//;2a   by wwj 0218                                                                  
0x72, 0x32,//;3a by wwj 0124                                                                    
0x73, 0x0a,                                                                                   
0x75, 0x30,//;48 by wwj 0124                                                                    
0x76, 0x0a,                                                                                   
0x1f, 0x99,//;77  by wwj 0215                                                                   
0x20, 0x09,//;/7 by wwj 0215                                                                     
0xfb, 0x16, 

//AEC                                                                                  
0xfd, 0x01,
/*
[6] lum_down_en
[5] exp_max_en
[4] exp_accr_sel
[3] outdoor_mode_en
1: enable
0: disable
[2:0] mean_mode_reg
The value must be bigger than 2
*/                                                                                   
0xf2, 0x69,                                                                                   
0xf7, 0x97, //;ABF exp base time is line number equal to 10 ms                                                                             
0x02, 0x04, //;Exp_max_indr   å®¤åæ¨¡å¼ä¸ï¼æåæ¶é´çæå¤§å?¼ï¼å¶åºè¡¨ç¤ºä¸? 10ms çå?æ°                                                                     
0x03, 0x01, //;Exp_min_indr   å®¤åæ¨¡å¼ä¸ï¼æåæ¶é´çæå°å?¼ï¼å¶åºè¡¨ç¤ºä¸? 10ms çå?æ°                                                                     
0x06, 0x8a, //;exp_max_outdr  å®¤å¤æ¨¡å¼ä¸ï¼æåæ¶é´çæå¤§å?¼ï¼å¶åºè¡¨ç¤ºä¸ºå®éçæåè¡æ°                                                                  
0x08, 0x02, //;Exp_min_outdr  å®¤å¤æ¨¡å¼ä¸ï¼æåæ¶é´çæå°å?¼ï¼å¶åºè¡¨ç¤ºä¸ºå®éçæåè¡æ° 
                                                              
0xfd, 0x02, //;ae gain &status                                                                  
0xb8, 0x50, //;Luminance Low threshold from normal mode to dummy mode                                                                 
0xb9, 0xff, //;Luminance Low threshold from dummy mode to normal mode                                                                 
0xba, 0x40, //;Luminance Low threshold from dummy mode to low light mod                                                              
0xbb, 0x45, //;Luminance high threshold from low light mode to dummy mod                                                               
0xbc, 0xc0, //;RPC low threshold from dummy mode to low light mod                                                                    
0xbd, 0x50, //;                                                                
0xbe, 0xb8, //;exp_heq_dummy 8 LSM Exp_heq_dummy: exposure time low threshold from normal mode to dummy mode                                                                 
0xbf, 0x04, //Exp_heq_dummy_5hsm                                                                                  
0xd0, 0xb8, //Exp 8lsb threshold from dummy mode to low mode                                                                
0xd1, 0x04, //Exp 3msb threshold from dummy mode to low mode 
                                                                                 
0xfd, 0x01, //;rpc                                                                              
0xc0, 0x1f, //;rpc_1base_max                                                                    
0xc1, 0x18, //;rpc_2base_max                                                                    
0xc2, 0x15, //;rpc_3base_max                                                                    
0xc3, 0x13, //;rpc_4base_max                                                                    
0xc4, 0x13, //;rpc_5base_max                                                                    
0xc5, 0x12, //;rpc_6base_max                                                                    
0xc6, 0x12, //;rpc_7base_max                                                                    
0xc7, 0x11, //;rpc_8base_max                                                                    
0xc8, 0x11, //;rpc_9base_max                                                                    
0xc9, 0x11, //;rpc_10base_max                                                                   
0xca, 0x10, //;rpc_11base_max                                                                   
0xf3, 0x10, //;rpc_12base_max                                                                   
0xf4, 0x10, //;rpc_13base_max    
                                                               
0xfd, 0x01, //;ae min gain                                                                      
0x04, 0x70, //;rpc_max_indr  å®¤åæ¨¡å¼ä¸ï¼æ¨¡æå¢ççæå¤§å??                                                                   
0x05, 0x10, //;rpc_min_indr   å®¤åæ¨¡å¼ä¸ï¼æ¨¡æå¢ççæå°å??                                                                   
0x0a, 0x30, //;rpc_max_outdr  å®¤å¤æ¨¡å¼ä¸ï¼æ¨¡æå¢ççæå¤§å??                                                                  
0x0b, 0x10, //;rpc_min_outdr  å®¤å¤æ¨¡å¼ä¸ï¼æ¨¡æå¢ççæå°å??
                                                                   
0xfd, 0x01, //;target                                                                           
0xcb, 0X28,//0x38, //;Hold threshold of dark pixel value at indoor  	ç®æ äº®åº¦æ¶åã?                                                                   
0xcc, 0x35, //;Hold threshold of bright pixel value at indoor                                                                     
0xcd, 0x03, //;Hold threshold of dark pixel value at outdoor                                                                       
0xce, 0x05, //;Hold threshold of bright pixel value at outdoor  
                                                                     
0xfd, 0x00, //;																  
/*
[5] bl_gain_en Should be set to 1'b0
[4] bl_dpc_en
	1âb1: enable dark row dpc
	1âb0: disable
[2] exp_update_en
	1âb1: blc update when exp change
	1âb0: disable
[1] rpc_update_en
	1âb1: blc update when rpc change
	1âb0: disable
[0] free_update_en
	1âb1: blc update every frame
	1âb0: disable
*/                                                                                 
0xfb, 0x16, //;                                                                                 
0x35, 0xaa, //; Glb_gain[7:0]

                                                                                
0xfd, 0x01, //;lsc                                                                              
0x1e, 0x00, //Lsc_sig_ru[6:4] Lsc_sig_lu[2:0]                                                                                  
0x20, 0x00, //Lsc_sig_rd[6:4] Lsc_sig_ld[2:0]                                                                                  
0x84, 0x25, //Lens shading parameter, left side, R channel                                                                                  
0x85, 0x25, //Lens shading parameter, right side, R channel                                                                                  
0x86, 0x1f, //Lens shading parameter, upper side, R channel                                                                                 
0x87, 0x23,                                                                                   
0x88, 0x1c,                                                                                   
0x89, 0x20,                                                                                   
0x8a, 0x1a,                                                                                   
0x8b, 0x15,                                                                                   
0x8c, 0x15,                                                                                   
0x8d, 0x1a,                                                                                   
0x8e, 0x0a,                                                                                   
0x8f, 0x13,                                                                                   
0x90, 0x13,                                                                                   
0x91, 0x00,                                                                                   
0x92, 0x0a,                                                                                   
0x93, 0x08,                                                                                   
0x94, 0x12,                                                                                   
0x95, 0x00,                                                                                   
0x96, 0x0a,                                                                                   
0x97, 0x08,                                                                                   
0x98, 0x15,                                                                                   
0x99, 0x00,                                                                                   
0x9a, 0x0a,                                                                                   
0x9b, 0x05,//Lens shading parameter, right-down side, B channel                                                                                   
0xe8, 0x20,//Ae_thr_low                                                                                   
0xe9, 0x0f,//Slope_k                                                                                   
0xea, 0x00,//Ae_gain_min_ratio                                                                                   
0xbd, 0x1e,	                                                                                 
0xbe, 0x00,   
                                                                                
//0xfd, 0x01,                                                                                   
//0xa4, 0x00, //;lum_limit                                                                        
//0x0e, 0x80, //;heq_mean  outdoor,indoor                                                         
//0x18, 0x80, //;heq_mean  dummy,lowlight                                                         
//0x0f, 0x20, //;k_max                                                                            
//0x10, 0x90, //;ku_outdoor                                                                       
//0x11, 0x80, //;ku_nr                                                                            
//0x12, 0x80, //;ku_dummy                                                                         
//0x13, 0xa0, //;ku_low                                                                           
//0x14, 0x80, //;kl_outdoor                                                                       
//0x15, 0x90, //;kl_nr                                                                            
//0x16, 0x85, //;kl_dummy                                                                         
//0x17, 0x85, //;kl_low     
//;gamma                                                                       
//0x6e, 0x00,                                                                           
//0x6f, 0x03,                                                                                   
//0x70, 0x07,                                                                                   
//0x71, 0x0d,                                                                                   
//0x72, 0x17,                                                                                   
//0x73, 0x29,                                                                                   
//0x74, 0x3d,                                                                                   
//0x75, 0x4f,                                                                                   
//0x76, 0x5f,                                                                                   
//0x77, 0x79,                                                                                   
//0x78, 0x8c,                                                                                   
//0x79, 0x9d,                                                                                   
//0x7a, 0xa9,                                                                                   
//0x7b, 0xb3,                                                                                   
//0x7c, 0xbe,                                                                                   
//0x7d, 0xc7,                                                                                   
//0x7e, 0xd0,                                                                                   
//0x7f, 0xd6,                                                                                   
//0x80, 0xde,                                                                                   
//0x81, 0xe4,                                                                                   
//0x82, 0xe9,                                                                                   
//0x83, 0xee,  

//;skin detect                                                                                   
//0xfd, 0x02,                                                                     
//0x09, 0x06,                                                                                   
//0x0d, 0x1a,                                                                                   
//0x1c, 0x09,                                                                                   
//0x1d, 0x03,                                                                                   
//0x1e, 0x10, //;awb                                                                              
//0x1f, 0x06,  

//AWB                                                                               
0xfd, 0x01,                                                                                   
0x32, 0x00,

//ä¿®æ¹ 0x66,0x67,0x68,0x69,0X6A äºä¸ªå¯å­å¨ï¼ç´è³åªæ¾ç¤ºæ­£ç¡®çç½ç¹                                                                                     
0xfd, 0x02,                                                                                   
0x26, 0xcb,                                                                                   
0x27, 0xc2,                                                                                   
0x10, 0x00, //;br offset                                                                        
0x11, 0x00, //;br offset_f                                                                      
0x18, 0x37,                                                                                   
0x19, 0x36,                                                                                   
0x2a, 0x01,                                                                                   
0x2b, 0x10,                                                                                   
0x28, 0xf8,                                                                                   
0x29, 0x08,                                                                                   
0x66, 0x5F, //;d65 10                                                                           
0x67, 0x7f,                                                                                   
0x68, 0xE0,                                                                                   
0x69, 0x10,                                                                                   
0x6a, 0xa6,                                                                                   
0x7c, 0x4A, //;indoor 11                                                                        
0x7d, 0x80,                                                                                   
0x7e, 0x00,                                                                                   
0x7f, 0x30,                                                                                   
0x80, 0xaa,                                                                                   
0x70, 0x32, //;cwf 12                                                                           
0x71, 0x60,                                                                                   
0x72, 0x30,                                                                                   
0x73, 0x5a,                                                                                   
0x74, 0xaa,                                                                                   
0x6b, 0xff, //;tl84 13                                                                          
0x6c, 0x50,                                                                                   
0x6d, 0x40,                                                                                   
0x6e, 0x60,                                                                                   
0x6f, 0x6a,                                                                                   
0x61, 0xff, //;f 14                                                                             
0x62, 0x27,                                                                                   
0x63, 0x51,                                                                                   
0x64, 0x7f,                                                                                   
0x65, 0x6a,                                                                                   
0x75, 0x80,                                                                                   
0x76, 0x09,                                                                                   
0x77, 0x02,                                                                                   
0x0e, 0x12,                                                                                   
0x3b, 0x09,                                                                                   
0x48, 0xea, //;green u center                                                                   
0x49, 0xfc, //;green v center                                                                   
0x4a, 0x05, //;green range                                                                      
0x02, 0x00, //;outdoor awb exp 5msb                                                             
0x03, 0x88, //;outdoor awb exp 8lsb                                                             
0xf5, 0xfe, //;a8 ;outdoor awb rgain top                                                        
0x22, 0xfe, //;sharp                                                                            
0x20, 0xfe,                                                                                   
0xf7, 0xfe, 
 
 
/*sharpen*/                                                                                 
0xfd, 0x02,  
/*
[3] raw sharpen enable, in outdoor
[2] raw sharpen enable, in normal
[1] raw sharpen enable, in dummy
[0] raw sharpen enable, in low light
0x0f
*/                                                                                 
0xde, 0x0f,                                                                                   
0xcf, 0x0a, //;Sharp_flat_thr0   
/*
P2:0xd7 sharp_flat_thr1 7~0 Edge threshold in analog gain is 2* 0x10
P2:0xd8 sharp_flat_thr2 7~0 Edge threshold in analog gain is 4* 0x16
P2:0xd9 sharp_flat_thr3 7~0 Edge threshold in analog gain is 8* 0x18
P2:0xda sharp_flat_thr4 7~0 Edge threshold in analog gain is 16* 0x20
*/                                                                           
0xd7, 0x0a,                                                                                   
0xd8, 0x12,                                                                                   
0xd9, 0x14,                                                                                   
0xda, 0x1a, 
                                                                                  
0xdc, 0x07, //Sharpness gain in skin area                                                                                  
0xe8, 0x60, //;æ­£å?¼èå?                                                                             
0xe9, 0x40,                                                                                   
0xea, 0x40,                                                                                   
0xeb, 0x30,                                                                                   
0xec, 0x60, //;è´å?¼èå?                                                                             
0xed, 0x50,                                                                                   
0xee, 0x40,                                                                                   
0xef, 0x30,  
                                                                                 
0xd3, 0XC0,//0x30, //Sharp_ofst_pos;æ­£è¾¹ç¼éåèå´ï¼éå¶æ­£è¾¹ç¼çéåéï¼ è¯¥å?¼è¶å¤§ï¼éåèå´è¶å¤§                                                   
0xd4, 0X28,//0xc0, //Sharp_ofst_neg;è´?                                                                                
0xd5, 0X80,//0x50, //Sharp_ofst_min_nr;éå¶éåçæå°å?¼èå?                                                                   
0xd6, 0x0b,                                                                                   
0xf0, 0x7f,

//;skin sharpen                                                                                    
//0xfd, 0x01, //                                                                    
//0xb1, 0xf0,	//Skin_sharp_delta                                                                             
//0xfd, 0x02,                                                                                   
//0xdc, 0x07, //skin_sharp_sel                                                                                  
//0x05, 0x08, //Skin_num_th2 

//;bpc                                                                                 
0xfd, 0x01,                                                                               
0x26, 0x33, //[7:4] dpc_range_ratio_outdoor[3:0] dpc_range_ratio_nr                                                                                  
0x27, 0x99, //[7:4] dpc_range_ratio_dummy [3:0] dpc_range_ratio_low                                                                                  
0x62, 0xf0, //Dpc_grad_thr_outdoor                                                                                  
0x63, 0x80, //Dpc_grad_thr_nr                                                                                  
0x64, 0x80, //Dpc_grad_thr_dummy                                                                                  
0x65, 0x20, //Dpc_grad_thr_low
 
//;dns                                                                                 
0xfd, 0x02, 
/*
[7] raw_gflt_en_outdoor
[6] raw_gflt_en_nr
[5] raw_gflt_en_dummy
[4] raw_gflt_en_low
[3] raw_denoise_en_outdoor
[2] raw_denoise_en_nr
[1] raw_denoise_en_dummy
[0] raw_denoise_en_low
*/                                                                              
0xdd, 0xff,  
                                                                              
0xfd, 0x01,
/*
P1:0xa8 raw_dif_thr_outdoor 7~0 Raw_dif_thr_outdoor 0x04
P1:0xa9 raw_dif_thr_normal 7~0 Raw_dif_thr_normal 0x04
P1:0xaa raw_dif_thr_dummy 7~0 Raw_dif_thr_dummy 0x04
P1:0xab raw_dif_thr_low_light 7~0 Raw_dif_thr_low_light 0x04
*/                                                                                   
0xa8, 0x00, //;åé?éé´å¹³æ»éå?                                                                         
0xa9, 0x09,                                                                                   
0xaa, 0x09,                                                                                   
0xab, 0x0c, 

/*
P1:0xcf raw_gflt_fac_outdoor 7~0 Raw_gflt_fac_outdoor 0x00
P1:0xd0 raw_gflt_fac_normal 7~0 Raw_gflt_fac_normal 0x00
P1:0xd1 raw_gflt_fac_dummy 7~0 Raw_gflt_fac_dummy 0x00
P1:0xd2 raw_gflt_fac_low 7~0 Raw_gflt_fac_low 0x00
P1:0xd3 raw_grgb_thr_outdoor 7~0 Raw_grgb_thr_outdoor 0x08
P1:0xd4 raw_grgb_thr_normal 7~0 Raw_grgb_thr_normal 0x08
P1:0xd5 raw_grgb_thr_dummy 7~0 Raw_grgb_thr_dummy 0x08
P1:0xd6 raw_grgb_thr_low 7~0 Raw_grgb_thr_low 0x08
P1:0xdf raw_gf_fac_outdoor 7~0 Raw_gf_fac_outdoor 0x00
P1:0xe0 raw_gf_fac_normal 7~0 Raw_gf_fac_normal 0x00
P1:0xe1 raw_gf_fac_dummy 7~0 Raw_gf_fac_dummy 0x00
P1:0xe2 raw_gf_fac_low 7~0 Raw_gf_fac_low 0x00
P1:0xe3 raw_rb_fac_outdoor 7~0 Raw_rb_fac_outdoor 0x00
P1:0xe4 raw_rb_fac_normal 7~0 Raw_rb_fac_normal 0x00
P1:0xe5 raw_rb_fac_dummy 7~0 Raw_rb_fac_dummy 0x00
P1:0xe6 raw_rb_fac_low 7~0 Raw_rb_fac_low 0x00
*/                                                                                  
0xd3, 0x00, //;GrGbå¹³æ»éå??                                                                         
0xd4, 0x09,                                                                                   
0xd5, 0x09,                                                                                   
0xd6, 0x0c,                                                                                   
0xcf, 0xff, //;Gr\Gbä¹é´å¹³æ»å¼ºåº¦                                                                      
0xd0, 0xf0,                                                                                   
0xd1, 0x80,                                                                                   
0xd2, 0x80,                                                                                   
0xdf, 0xff, //;GrãGbåé?éåå¹³æ»å¼ºåº?                                                                    
0xe0, 0xf0,                                                                                   
0xe1, 0xd0,                                                                                   
0xe2, 0x80,                                                                                   
0xe3, 0xff, //;RãBå¹³æ»å¼ºåº¦                                                                          
0xe4, 0xf0,                                                                                   
0xe5, 0xd0,                                                                                   
0xe6, 0x80, 


/*
;CCM 
P2:0xa0 c00_eff1_8lsb 7~0 C00_eff1_8lsb for color correction 0x8c
P2:0xa1 c01_eff1_8lsb 7~0 C01_eff1_8lsb for color correction 0x00
P2:0xa2 c02_eff1_8lsb 7~0 C02_eff1_8lsb for color correction 0xf4
P2:0xa3 c10_eff1_8lsb 7~0 C10_eff1_8lsb for color correction 0xfa
P2:0xa4 c11_eff1_8lsb 7~0 C11_eff1_8lsb for color correction 0xa0
P2:0xa5 c12_eff1_8lsb 7~0 C12_eff1_8lsb for color correction 0xe7
P2:0xa6 c20_eff1_8lsb 7~0 C20_eff1_8lsb for color correction 0x0c
P2:0xa7 c21_eff1_8lsb 7~0 C21_eff1_8lsb for color correction 0xcd
P2:0xa8 c22_eff1_8lsb 7~0 C22_eff1_8lsb for color correction 0xa6
P2:0xac c00_eff2_8lsb 7~0 C00_eff2_8lsb for color correction 0xa2
P2:0xad c01_eff2_8lsb 7~0 C01_eff2_8lsb for color correction 0x04
P2:0xae c02_eff2_8lsb 7~0 C02_eff2_8lsb for color correction 0xda
P2:0xaf c10_eff2_8lsb 7~0 C10_eff2_8lsb for color correction 0xcd
P2:0xb0 c11_eff2_8lsb 7~0 C11_eff2_8lsb for color correction 0xd9
P2:0xb1 c12_eff2_8lsb 7~0 C12_eff2_8lsb for color correction 0xda
P2:0xb2 c20_eff2_8lsb 7~0 C20_eff2_8lsb for color correction 0xf6
P2:0xb3 c21_eff2_8lsb 7~0 C21_eff2_8lsb for color correction 0x98
P2:0xb4 c22_eff2_8lsb 7~0 C22_eff2_8lsb for color correction 0xf3
*/                                                                                  
//0xfd, 0x02,                                                                              
//0x15, 0xe0, //;b>th For f light judge                                                                            
//0x16, 0x95, //;r<th For f light judge                                                                            
//0xa0, 0x9b, //;C00_eff1_8lsb for color correction                                                                               
//0xa1, 0xe4, //C01_eff1_8lsb for color correction                                                                                  
//0xa2, 0x01, //                                                                                  
//0xa3, 0xf2,                                                                                   
//0xa4, 0x8f,                                                                                   
//0xa5, 0xff,                                                                                   
//0xa6, 0x01,                                                                                   
//0xa7, 0xdb,                                                                                   
//0xa8, 0xa4,                                                                                   
//0xac, 0x80, //;F                                                                                
//0xad, 0x21,                                                                                   
//0xae, 0xdf,                                                                                   
//0xaf, 0xf2,                                                                                   
//0xb0, 0xa0,                                                                                   
//0xb1, 0xee,                                                                                   
//0xb2, 0xea,                                                                                   
//0xb3, 0xd9,                                                                                   
//0xb4, 0xbd,//C22_eff2_8lsb for color correction 



/*
Saturation
P1:0xb3 sat_u_s1 7~0
Saturation U at Auto Saturation Control segment 1 when in the outdoor mode
0x98
P1:0xb4 sat_u_s2 7~0
Saturation U at Auto Saturation Control segment 2 when in the normal mode
0x98
P1:0xb5 sat_u_s3 7~0
Saturation U at Auto Saturation Control segment 3 when in the dummy mode
0x88
P1:0xb6 sat_u_s4 7~0
Saturation U at Auto Saturation Control segment 4 when in the low mode
0x7f
P1:0xb7 sat_v_s1 7~0
Saturation V at Auto Saturation Control segment 1 when in the outdoor mode
0x92
P1:0xb8 sat_v_s2 7~0
Saturation V at Auto Saturation Control segment 2 when in the normal mode
0x92
P1:0xb9 sat_v_s3 7~0
Saturation V at Auto Saturation Control segment 3 when in the dummy mode
0x82
P1:0xba sat_v_s4 7~0
Saturation V at Auto Saturation Control segment 4 when in the low mode
*/                                                                                  
//0xfd, 0x01, //;sat u B                                                                          
//0xb3, 0xb0,                                                                                   
//0xb4, 0x90, //;                                                                                 
//0xb5, 0x70,                                                                                   
//0xb6, 0x55,                                                                                   
//0xb7, 0xb0, //;sat v R                                                                          
//0xb8, 0x90,                                                                                   
//0xb9, 0x70,                                                                                   
//0xba, 0x55, 
                                                                                  
//0xfd, 0x01, //;auto_sat                                                                         
//0xbf, 0xff, //;The brightness thread of the ymean                                                                        
//0x00, 0x00, //;[4] fix_state_en [2:0] fix_state_mode    
                                                                     
//0xfd, 0x01, //;low_lum_offset                                                                   
//0xa4, 0x00, //;Lum_limit                                                                       
//0xa5, 0x1f, //;lum_set                                                                          
//0xa6, 0x50, //;black vt                                                                         
//0xa7, 0x65, //;If current luminance is bigger than it, the luminance of the frame will decrease.
 
//;gw                                                                        
0xfd, 0x02,                                                                               
0x30, 0x38, //Gw_mean_th                                                               
0x31, 0x40, //Write gw offset for calculate offset, and read  out is real offset                                                                                  
0x32, 0x40, //Gw_y_bot                                                                                  
0x33, 0xd0, //Gw_y_top                                                                                  
0x34, 0x10, //Gw_uv_radius                                                                                  
0x35, 0x60, //Swap uv pix value when it is not gray pix                                                                                  
0x36, 0x28, //Gw offset max limit                                                                                
0x37, 0x07, //[6] gw_upt_fr_en [5] gw_en_sel [2:0] Gw offset adjust step                                                                                 
0x38, 0x08, //Gw_jdg_th;(read 0x31_gw_offset>0x10,is gray image)                                         
0xe6, 0x8F, //;(bit7:4 white edge 3:0 dark edg zhiyuedafanweiyueda )   
                         
//0xfd, 0x01, //;                                                                                 
//0x1b, 0x15, //Ku_offset;(baibanshiï¼ku&kljiaduoshao)                                                      
//0x1c, 0x1A, //Kl_offset;(Read 0x31*0x1cçå??/16ä¸ºæç»å çå??)                                                      
//0x1d, 0x0c, //Auto_contrast_cttl; auto contrast enable ,bit3 outdoor  bit2 indoor bit1 dummy  bit0 lowlight  



//function enable     
0xfd, 0x01,                                                                                   
0x32, 0x15,// [7] test_en [6] ft_test_en [5] fix_awb [4] awb2_en [2] auto_gain_en [0] ae_en  
/*
[7] Lens shading in outdoor enable
	0: disable
	1: enable
[6] Lens shading in normal enable
	0: disable
	1: enable
[5] Lens shading in dummy enable
	0: disable
	1: enable
[4] Lens shading in low light enable
	0: disable
	1: enable
[3] DPC in dummy enable
	0: disable
	1: enable
[2] DPC in outdoor enable
	0: disable
	1: enable
[1] DPC in normal enable
	0: disable
	1: enable
[0] DPC in low light enable
	0: disable
	1: enable
*/                                                                                
0x33, 0xef,   
/*
[6] raw window 
	0: enable raw window function
	1: disable
[5] binning_mode1
	1: col averge mode
	0: col sum mode
[4] ace_test
	1: aec_win select raw data
	0: aec_win select y data
[3] VSYNC Inversion
[2] HSYNC Inversion
[1] Disable HSYNC & VSYNC
[0] scale_en
*/                                                                                
0x36, 0x10, //;AEç»è®¡å¨GAmmaä¹åï¼?00æ¯AEå¨Gammaä¹å                                                       
0xf6, 0xb0, //y_top_ae;äº®æ?ï¼é²è¿ææºå¶ï¼å¼è¶å¤§è¿æåºæ¯å¯¹å¶ä»å½±åå°?                                                           
0xf5, 0x10, //y_bot_ae;ææ?ï¼é²æ­¢é»è²ç©ä½è¿å¥å¯¼è´è¿æï¼?


/*
AE WINDOWN
P1:0xd7 sat_ypix_thr1 7~0 Sat_ypix_thr1 0x04
P1:0xd8 sat_ypix_thr2 7~0 Sat_ypix_thr2 0x04
P1:0xd9 sat_ypix_thr3 7~0 Sat_ypix_thr3 0x10
P1:0xda sat_ypix_thr4 7~0 Sat_ypix_thr4 0x20
P1:0xdb sat_yadt_fac1 7~0 Sat_yadt_fac1 0x50
P1:0xdc sat_yadt_fac2 7~0 Sat_yadt_fac2 0x30
P1:0xdd sat_yadt_fac3 7~0 Sat_yadt_fac3 0x10
P1:0xde sat_yadt_fac4 7~0 Sat_yadt_fac4 0x09
*/                                                                 
//0xd7, 0x3a, //;tbh                                                                              
//0xd8, 0x10,                                                                                   
//0xd9, 0x20,                                                                                   
//0xda, 0x10,                                                                                   
//0xdb, 0x7a,                                                                                   
//0xdc, 0x3a,                                                                                   
//0xdd, 0x30,                                                                                   
//0xde, 0x30,                                                                                   
//0xe7, 0x3a, //Sat_bot                                                                                   
//0x9c, 0xaa, //;u_v_th_outdoor                                                                           
//0x9d, 0xaa, //u_v_th_nr                                                                                  
//0x9e, 0x55, //u_v_th_dummy                                                                                  
//0x9f, 0x55,	//u_v_th_low
                                                                                   
0xfd, 0x00,                                                                                   
0x1c, 0x00,                                                                                   

//å®å¸§20å¸?
//0xfd, 0x00, //; ae setting      
//0x09, 0x00, //hblank_4msb  ={0x01,0x80} 15å¸?   {0x00,0x80} 20å¸?                                                                               
//0x0a, 0x80, //hblank_8lsb 

//0xfd, 0x01, //; ae setting      
//0x02, 0x03, //;Exp_max_indr   å¸§çéå¶ 

#endif //default

//================================================================================

#if 0	//default no zhushi(640*480)
0xfd, 0x00,  
                                                                             
0x1d, 0x25,   
                                                                               
0x32, 0x01,                                                                                   
0x30, 0x01, 
                                                                                  
0xfd, 0x00,                                                                                
0xf0, 0xff,                                                                          
0xf1, 0xff,                                                                                 
0xf2, 0xff,                                                                                  
0xf3, 0xff,                                                                                   
0xfc, 0x50, 
                                                                          
0xfd, 0x01, 
                                                                                
0x5d, 0x01,  
                                                                                 
0x34, 0xe3,
                                                                                 
0x35, 0x10, 
                                                                                  
0xfd, 0x00,                                                                     
0x03, 0x03,                                                                                  
0x04, 0x6c,                                                                             
0x24, 0x10,                                                                                 
0xef, 0x40,                                                                                   
0x06, 0x00,                                                                                 
0x09, 0x01,                                                                                 
0x0a, 0xE0,                                                                                  
0x10, 0x0a,                                                                 
0x11, 0x02,
                                                                  
0x16, 0x01,  
                                                                                
0x19, 0x22,                                                                                   
0x1e, 0x60,                                                                 
0x29, 0x60,
                                                                
0x13, 0x37, 
                                                                                 
0x14, 0x01,                                                                                   
0x25, 0x01,                                                                                   
0x2a, 0x06,                                                                                   
0x27, 0x00,                                                                  
0x54, 0x00,                                                                                   
0x55, 0x10,                                                                                   
0x58, 0x28,                                                                
0x5d, 0x12,                                                                                   
0x63, 0x00,                                                                                   
0x64, 0x00,                                                                                   
0x66, 0x2a,                                                                
0x68, 0x28,                                                                 
0x72, 0x32,                                                                   
0x73, 0x0a,                                                                                   
0x75, 0x30,                                                                   
0x76, 0x0a,                                                                                   
0x1f, 0x99,                                                                   
0x20, 0x09,                                                                 
0xfb, 0x16, 
                                                                                
0xfd, 0x01,
                                                                                  
0xf2, 0x69,                                                                                   
0xf7, 0x97,                                                                     
0x02, 0x04,                                                                    
0x03, 0x01,                                                                    
0x06, 0x8a,                                                                
0x08, 0x02, 
                                                              
0xfd, 0x02,                                                               
0xb8, 0x50,                                                                 
0xb9, 0xff,                                                                
0xba, 0x40,                                                             
0xbb, 0x45,                                                              
0xbc, 0xc0,                                                                   
0xbd, 0x50,                                                            
0xbe, 0xb8,                                                               
0xbf, 0x04,                                                                              
0xd0, 0xb8,                                                                
0xd1, 0x04, 
                                                                                 
0xfd, 0x01,                                                                        
0xc0, 0x1f,                                                                  
0xc1, 0x18,                                                                  
0xc2, 0x15,                                                                 
0xc3, 0x13,                                                                   
0xc4, 0x13,                                                                   
0xc5, 0x12,                                                                   
0xc6, 0x12,                                                                    
0xc7, 0x11,                                                                   
0xc8, 0x11,                                                                   
0xc9, 0x11,                                                                   
0xca, 0x10,                                                                   
0xf3, 0x10,                                                                   
0xf4, 0x10,    
                                                               
0xfd, 0x01,                                                             
0x04, 0x70,                                                                   
0x05, 0x10,                                                                  
0x0a, 0x30,                                                                  
0x0b, 0x10, 
                                                                   
0xfd, 0x01,                                                                         
0xcb, 0X28,                                                                   
0xcc, 0x35,                                                                     
0xcd, 0x03,                                                                       
0xce, 0x05, 
                                                                     
0xfd, 0x00, 															  
                                                                                
0xfb, 0x16,                                                                                
0x35, 0xaa, 
                                                                   
0xfd, 0x01,                                                                             
0x1e, 0x00,                                                                                 
0x20, 0x00,                                                                               
0x84, 0x25,                                                                                
0x85, 0x25,                                                                                 
0x86, 0x1f,                                                                                 
0x87, 0x23,                                                                                   
0x88, 0x1c,                                                                                   
0x89, 0x20,                                                                                   
0x8a, 0x1a,                                                                                   
0x8b, 0x15,                                                                                   
0x8c, 0x15,                                                                                   
0x8d, 0x1a,                                                                                   
0x8e, 0x0a,                                                                                   
0x8f, 0x13,                                                                                   
0x90, 0x13,                                                                                   
0x91, 0x00,                                                                                   
0x92, 0x0a,                                                                                   
0x93, 0x08,                                                                                   
0x94, 0x12,                                                                                   
0x95, 0x00,                                                                                   
0x96, 0x0a,                                                                                   
0x97, 0x08,                                                                                   
0x98, 0x15,                                                                                   
0x99, 0x00,                                                                                   
0x9a, 0x0a,                                                                                   
0x9b, 0x05,                                                                               
0xe8, 0x20,                                                                                
0xe9, 0x0f,                                                                                
0xea, 0x00,                                                                                  
0xbd, 0x1e,	                                                                                 
0xbe, 0x00,   
                                                                                
//0xfd, 0x01,                                                                                   
//0xa4, 0x00,                                                                     
//0x0e, 0x80,                                                       
//0x18, 0x80,                                                        
//0x0f, 0x20,                                                                         
//0x10, 0x90,                                                                      
//0x11, 0x80,                                                                         
//0x12, 0x80,                                                                        
//0x13, 0xa0,                                                                         
//0x14, 0x80,                                                                       
//0x15, 0x90,                                                                            
//0x16, 0x85,                                                                        
//0x17, 0x85,    
//                                                                     
//0x6e, 0x00,                                                                           
//0x6f, 0x03,                                                                                   
//0x70, 0x07,                                                                                   
//0x71, 0x0d,                                                                                   
//0x72, 0x17,                                                                                   
//0x73, 0x29,                                                                                   
//0x74, 0x3d,                                                                                   
//0x75, 0x4f,                                                                                   
//0x76, 0x5f,                                                                                   
//0x77, 0x79,                                                                                   
//0x78, 0x8c,                                                                                   
//0x79, 0x9d,                                                                                   
//0x7a, 0xa9,                                                                                   
//0x7b, 0xb3,                                                                                   
//0x7c, 0xbe,                                                                                   
//0x7d, 0xc7,                                                                                   
//0x7e, 0xd0,                                                                                   
//0x7f, 0xd6,                                                                                   
//0x80, 0xde,                                                                                   
//0x81, 0xe4,                                                                                   
//0x82, 0xe9,                                                                                   
//0x83, 0xee,  

//                                                                                  
//0xfd, 0x02,                                                                     
//0x09, 0x06,                                                                                   
//0x0d, 0x1a,                                                                                   
//0x1c, 0x09,                                                                                   
//0x1d, 0x03,                                                                                   
//0x1e, 0x10,                                                                         
//0x1f, 0x06,  

//                                                                               
0xfd, 0x01,                                                                                   
0x32, 0x00,

//                                                                                    
0xfd, 0x02,                                                                                   
0x26, 0xcb,                                                                                   
0x27, 0xc2,                                                                                   
0x10, 0x00,                                                                       
0x11, 0x00,                                                                    
0x18, 0x37,                                                                                   
0x19, 0x36,                                                                                   
0x2a, 0x01,                                                                                   
0x2b, 0x10,                                                                                   
0x28, 0xf8,                                                                                   
0x29, 0x08,                                                                                   
0x66, 0x5F,                                                                           
0x67, 0x7f,                                                                                   
0x68, 0xE0,                                                                                   
0x69, 0x10,                                                                                   
0x6a, 0xa6,                                                                                   
0x7c, 0x4A,                                                                        
0x7d, 0x80,                                                                                   
0x7e, 0x00,                                                                                   
0x7f, 0x30,                                                                                   
0x80, 0xaa,                                                                                   
0x70, 0x32,                                                                           
0x71, 0x60,                                                                                   
0x72, 0x30,                                                                                   
0x73, 0x5a,                                                                                   
0x74, 0xaa,                                                                                   
0x6b, 0xff,                                                                         
0x6c, 0x50,                                                                                   
0x6d, 0x40,                                                                                   
0x6e, 0x60,                                                                                   
0x6f, 0x6a,                                                                                   
0x61, 0xff,                                                                            
0x62, 0x27,                                                                                   
0x63, 0x51,                                                                                   
0x64, 0x7f,                                                                                   
0x65, 0x6a,                                                                                   
0x75, 0x80,                                                                                   
0x76, 0x09,                                                                                   
0x77, 0x02,                                                                                   
0x0e, 0x12,                                                                                   
0x3b, 0x09,                                                                                   
0x48, 0xea,                                                                   
0x49, 0xfc,                                                                    
0x4a, 0x05,                                                                      
0x02, 0x00,                                                             
0x03, 0x88,                                                           
0xf5, 0xfe,                                                        
0x22, 0xfe,                                                                          
0x20, 0xfe,                                                                                   
0xf7, 0xfe, 
                                                                                
0xfd, 0x02,  
                                                                                
0xde, 0x0f,                                                                                   
0xcf, 0x0a,  
                                                                          
0xd7, 0x0a,                                                                                   
0xd8, 0x12,                                                                                   
0xd9, 0x14,                                                                                   
0xda, 0x1a, 
                                                                                  
0xdc, 0x07,                                                                                 
0xe8, 0x60,                                                                             
0xe9, 0x40,                                                                                   
0xea, 0x40,                                                                                   
0xeb, 0x30,                                                                                   
0xec, 0x60,                                                                             
0xed, 0x50,                                                                                   
0xee, 0x40,                                                                                   
0xef, 0x30,  
                                                                                 
0xd3, 0XC0,                                                   
0xd4, 0X28,                                                                             
0xd5, 0X80,                                                                
0xd6, 0x0b,                                                                                   
0xf0, 0x7f,

//                                                                                 
//0xfd, 0x01,                                                              
//0xb1, 0xf0,                                                                       
//0xfd, 0x02,                                                                                   
//0xdc, 0x07,                                                                             
//0x05, 0x08,

//                                                                               
0xfd, 0x01,                                                                               
0x26, 0x33,                                                                                  
0x27, 0x99,                                                                                  
0x62, 0xf0,                                                                                  
0x63, 0x80,                                                                                  
0x64, 0x80,                                                                                
0x65, 0x20,
 
//                                                                               
0xfd, 0x02, 
                                                                             
0xdd, 0xff,  
                                                                              
0xfd, 0x01,
                                                                                  
0xa8, 0x00,                                                                        
0xa9, 0x09,                                                                                   
0xaa, 0x09,                                                                                   
0xab, 0x0c, 
                                                                                 
0xd3, 0x00,                                                                         
0xd4, 0x09,                                                                                   
0xd5, 0x09,                                                                                   
0xd6, 0x0c,                                                                                   
0xcf, 0xff,                                                                     
0xd0, 0xf0,                                                                                   
0xd1, 0x80,                                                                                   
0xd2, 0x80,                                                                                   
0xdf, 0xff,                                                                   
0xe0, 0xf0,                                                                                   
0xe1, 0xd0,                                                                                   
0xe2, 0x80,                                                                                   
0xe3, 0xff,                                                                         
0xe4, 0xf0,                                                                                   
0xe5, 0xd0,                                                                                   
0xe6, 0x80, 
                                                                                 
//0xfd, 0x02,                                                                              
//0x15, 0xe0,                                                                        
//0x16, 0x95,                                                                           
//0xa0, 0x9b,                                                                               
//0xa1, 0xe4,                                                                              
//0xa2, 0x01,                                                                               
//0xa3, 0xf2,                                                                                   
//0xa4, 0x8f,                                                                                   
//0xa5, 0xff,                                                                                   
//0xa6, 0x01,                                                                                   
//0xa7, 0xdb,                                                                                   
//0xa8, 0xa4,                                                                                   
//0xac, 0x80,                                                                         
//0xad, 0x21,                                                                                   
//0xae, 0xdf,                                                                                   
//0xaf, 0xf2,                                                                                   
//0xb0, 0xa0,                                                                                   
//0xb1, 0xee,                                                                                   
//0xb2, 0xea,                                                                                   
//0xb3, 0xd9,                                                                                   
//0xb4, 0xbd,

                                                                                 
//0xfd, 0x01,                                                                   
//0xb3, 0xb0,                                                                                   
//0xb4, 0x90,                                                                                 
//0xb5, 0x70,                                                                                   
//0xb6, 0x55,                                                                                   
//0xb7, 0xb0,                                                                         
//0xb8, 0x90,                                                                                   
//0xb9, 0x70,                                                                                   
//0xba, 0x55, 
                                                                                  
//0xfd, 0x01,                                                                        
//0xbf, 0xff,                                                                        
//0x00, 0x00,   
                                                                     
//0xfd, 0x01,                                                                   
//0xa4, 0x00,                                                                      
//0xa5, 0x1f,                                                                         
//0xa6, 0x50,                                                                       
//0xa7, 0x65,
 
//                                                                       
0xfd, 0x02,                                                                               
0x30, 0x38,                                                              
0x31, 0x40,                                                                                  
0x32, 0x40,                                                                                
0x33, 0xd0,                                                                                
0x34, 0x10,                                                                                  
0x35, 0x60,                                                                                   
0x36, 0x28,                                                                              
0x37, 0x07,                                                                                  
0x38, 0x08,                                         
0xe6, 0x8F,   
                         
//0xfd, 0x01,                                                                          
//0x1b, 0x15,                                                      
//0x1c, 0x1A,                                                      
//0x1d, 0x0c,
   
0xfd, 0x01,                                                                                   
0x32, 0x15,
                                                                               
0x33, 0xef,   
                                                                               
0x36, 0x10,                                                  
0xf6, 0xb0,                                                          
0xf5, 0x10, 

                                                                
//0xd7, 0x3a,                                                                    
//0xd8, 0x10,                                                                                   
//0xd9, 0x20,                                                                                   
//0xda, 0x10,                                                                                   
//0xdb, 0x7a,                                                                                   
//0xdc, 0x3a,                                                                                   
//0xdd, 0x30,                                                                                   
//0xde, 0x30,                                                                                   
//0xe7, 0x3a,                                                                                
//0x9c, 0xaa,                                                                         
//0x9d, 0xaa,                                                                               
//0x9e, 0x55,                                                                                
//0x9f, 0x55,
                                                                                   
0xfd, 0x00,                                                                                   
0x1c, 0x00,                                                                                   

//
//0xfd, 0x00, 
//0x09, 0x00,                                                                         
//0x0a, 0x80, 

//0xfd, 0x01, 
//0x02, 0x03, 



#endif 

//================================================================================

#if 0	//20240926 sensor_0A83
0xfd, 0x00,  
/*
[7] ds_i2c
[6:5] ds_data
[4] pd_dig
*/                                                                                 
0x1d, 0x25,      
/*
éå/ç¿»è½¬
Normal 0x31[2:1] 00
Mirror 0x31[2:1] 01
Flip 0x31[2:1] 10
Mirror & Flip 0x31[2:1] 11
*/                                                                      
0x31, 0x06,//0x00, //comm_ctrl_reg 

/*
[2] ext_sync_sel
[1:0] pvdd_sel
*/                                                                                 
0x32, 0x01,                                                                                   
0x30, 0x01, //[2:0] dclk_ctrl
                                                                                  
0xfd, 0x00,  //                                                                                  
0xf0, 0xff, //gb_suboffset                                                                             
0xf1, 0xff, //gr_suboffset                                                                                  
0xf2, 0xff, //red_suboffset                                                                                  
0xf3, 0xff, //blue_suboffset                                                                                  
0xfc, 0x50, //blc_dpc_th_p_8lsb 
                                                                          
0xfd, 0x01, 
/*
[5:4] lsc_position_set Raw order set for awb gain and lsc gain
[3:2] awb_position_set
[1:0] bayer order set for demosaic
*/                                                                                  
0x5d, 0x01,  
/*
éåªï¼è¾¹æ²¿å¢å¼ºï¼ä¼½é©¬ï¼è²å½©ç©é?
[7] dpc_flt_en
[6] dpc_dirtm_en
[5] gamma_en2(raw gamma)
[4] domu_en
[3] sharp_mdy_en
[2] dpc_low_en
[1] gamma correction(y gamma)
[0] color correction
*/                                                                                 
0x34, 0xe2,
/*
[7] raw_mid8_en
[6] raw_low8_en
[5] add_row4_col4_en
[4] swap byte
0:u y v y
1:y u y v
[3] unpro_raw_out_en
[2] y_out_en
[0] yuv_order
0: U Y V Y
1: V Y U Y
*/                                                                                   
0x35, 0x10, 
                                                                                  
0xfd, 0x00, //; ae setting                                                                      
0x03, 0x03, //Integration time high 3 bits                                                                                  
0x04, 0x6c, //Integration time low 8 bits                                                                                
0x24, 0x10, //pga_gain_ctl                                                                                   
0xef, 0x40,                                                                                   
0x06, 0x00, //Vsync blank                                                                                  
0x09, 0x00, //hblank_4msb                                                                                  
0x0a, 0x80, //hblank_8lsb                                                                                  
0x10, 0x0a,//;07  by wwj 0124                                                                   
0x11, 0x02,//;04  by wwj 0124

/*
[1] dac_mode
[0] FPN_33ms_timing_sel
*/                                                                   
0x16, 0x01,  
/*
[6:4] icomp1
[1:0] icomp2
*/                                                                                 
0x19, 0x22,                                                                                   
0x1e, 0x60,//;58 by wwj 0124                                                                    
0x29, 0x60,//;48 by wwj 0124  
/*
[5] cp_num
[4:3] spi_clk_delay
[2:0] vcp_sel_ctl
*/                                                                  
0x13, 0x37, 
/*
[5:4] ds_hsync
[3:2] ds_vsync
[1:0] ds_pclk
*/                                                                                  
0x14, 0x01,                                                                                   
0x25, 0x01,                                                                                   
0x2a, 0x06,                                                                                   
0x27, 0x00,//   by wwj 0218                                                                     
0x54, 0x00,                                                                                   
0x55, 0x10,                                                                                   
0x58, 0x28,//;38 by wwj 0124                                                                    
0x5d, 0x12,                                                                                   
0x63, 0x00,                                                                                   
0x64, 0x00,                                                                                   
0x66, 0x2a,//;28   by wwj 0218                                                                  
0x68, 0x28,//;2a   by wwj 0218                                                                  
0x72, 0x32,//;3a by wwj 0124                                                                    
0x73, 0x0a,                                                                                   
0x75, 0x30,//;48 by wwj 0124                                                                    
0x76, 0x0a,                                                                                   
0x1f, 0x99,//;77  by wwj 0215                                                                   
0x20, 0x09,//;/7 by wwj 0215                                                                     
0xfb, 0x16, 

//AEC                                                                                  
0xfd, 0x01,
/*
[6] lum_down_en
[5] exp_max_en
[4] exp_accr_sel
[3] outdoor_mode_en
1: enable
0: disable
[2:0] mean_mode_reg
The value must be bigger than 2
*/                                                                                   
0xf2, 0x69,//0x6b,//0x69,  (shou guang su du)                                                                                 
0xf7, 0x97, //;ABF exp base time is line number equal to 10 ms                                                                             
0x02, 0x08, //;Exp_max_indr   å¸§çéå¶                                                                     
0x03, 0x01, //;Exp_min_indr                                                                        
0x06, 0x8a, //;exp_max_outdr                                                                    
0x08, 0x01, //;Exp_min_outdr  å¸§çéå¶  
                                                              
0xfd, 0x02, //;ae gain &status                                                                  
0xb8, 0x50, //;Luminance Low threshold from normal mode to dummy mode                                                                 
0xb9, 0xff, //;Luminance Low threshold from dummy mode to normal mode                                                                 
0xba, 0x40, //;Luminance Low threshold from dummy mode to low light mod                                                              
0xbb, 0x45, //;Luminance high threshold from low light mode to dummy mod                                                               
0xbc, 0xc0, //;RPC low threshold from dummy mode to low light mod                                                                    
0xbd, 0x50, //;                                                                
0xbe, 0xb8, //;exp_heq_dummy 8 LSM Exp_heq_dummy: exposure time low threshold from normal mode to dummy mode                                                                 
0xbf, 0x04, //Exp_heq_dummy_5hsm                                                                                  
0xd0, 0xb8, //Exp 8lsb threshold from dummy mode to low mode                                                                
0xd1, 0x04, //Exp 3msb threshold from dummy mode to low mode 
                                                                                 
0xfd, 0x01, //;rpc    
#if 0
0xc0, 0x1f, //;rpc_1base_max                                                                    
0xc1, 0x18, //;rpc_2base_max                                                                    
0xc2, 0x15, //;rpc_3base_max                                                                    
0xc3, 0x13, //;rpc_4base_max                                                                    
0xc4, 0x13, //;rpc_5base_max                                                                    
0xc5, 0x12, //;rpc_6base_max                                                                    
0xc6, 0x12, //;rpc_7base_max                                                                    
0xc7, 0x11, //;rpc_8base_max                                                                    
0xc8, 0x11, //;rpc_9base_max                                                                    
0xc9, 0x11, //;rpc_10base_max                                                                   
0xca, 0x10, //;rpc_11base_max                                                                   
0xf3, 0x10, //;rpc_12base_max                                                                   
0xf4, 0x10, //;rpc_13base_max    
                                                               
0xfd, 0x01, //;ae min gain                                                                      
0x04, 0xff, //;rpc_max_indr                                                                     
0x05, 0x10, //;rpc_min_indr                                                                     
0x0a, 0x30, //;rpc_max_outdr                                                                    
0x0b, 0x10, //;rpc_min_outdr 
#else
//0x10-0x1f
0xc0, 0x1f, //;rpc_1base_max                                                                    
0xc1, 0x18, //;rpc_2base_max                                                                    
0xc2, 0x15, //;rpc_3base_max                                                                    
0xc3, 0x13, //;rpc_4base_max                                                                    
0xc4, 0x13, //;rpc_5base_max                                                                    
0xc5, 0x12, //;rpc_6base_max                                                                    
0xc6, 0x12, //;rpc_7base_max                                                                    
0xc7, 0x11, //;rpc_8base_max                                                                    
0xc8, 0x11, //;rpc_9base_max                                                                    
0xc9, 0x11, //;rpc_10base_max                                                                   
0xca, 0x10, //;rpc_11base_max   
                                                               
0xfd, 0x01, //;ae min gain                                                                      
0x04, 0x20, //;rpc_max_indr                                                                     
0x05, 0x10, //;rpc_min_indr                                                                     
0x0a, 0x20, //;rpc_max_outdr                                                                    
0x0b, 0x10, //;rpc_min_outdr

#endif
0xfd, 0x01, //;target                                                                           
0xcb, 0x38, //;Hold threshold of dark pixel value at indoor                                                                     
0xcc, 0x35, //;Hold threshold of bright pixel value at indoor                                                                     
0xcd, 0x03, //;Hold threshold of dark pixel value at outdoor                                                                       
0xce, 0x05, //;Hold threshold of bright pixel value at outdoor  
                                                                     
0xfd, 0x00, //;
/*
[5] bl_gain_en Should be set to 1'b0
[4] bl_dpc_en
	1âb1: enable dark row dpc
	1âb0: disable
[2] exp_update_en
	1âb1: blc update when exp change
	1âb0: disable
[1] rpc_update_en
	1âb1: blc update when rpc change
	1âb0: disable
[0] free_update_en
	1âb1: blc update every frame
	1âb0: disable
*/                                                                                 
0xfb, 0x16, //;                                                                                 
0x35, 0xaa, //; Glb_gain[7:0]

                                                                                
0xfd, 0x01, //;lsc                                                                              
0x1e, 0x00, //Lsc_sig_ru[6:4] Lsc_sig_lu[2:0]                                                                                  
0x20, 0x00, //Lsc_sig_rd[6:4] Lsc_sig_ld[2:0]                                                                                  
0x84, 0x25, //Lens shading parameter, left side, R channel                                                                                  
0x85, 0x25, //Lens shading parameter, right side, R channel                                                                                  
0x86, 0x1f, //Lens shading parameter, upper side, R channel                                                                                 
0x87, 0x23,                                                                                   
0x88, 0x1c,                                                                                   
0x89, 0x20,                                                                                   
0x8a, 0x1a,                                                                                   
0x8b, 0x15,                                                                                   
0x8c, 0x15,                                                                                   
0x8d, 0x1a,                                                                                   
0x8e, 0x0a,                                                                                   
0x8f, 0x13,                                                                                   
0x90, 0x13,                                                                                   
0x91, 0x00,                                                                                   
0x92, 0x0a,                                                                                   
0x93, 0x08,                                                                                   
0x94, 0x12,                                                                                   
0x95, 0x00,                                                                                   
0x96, 0x0a,                                                                                   
0x97, 0x08,                                                                                   
0x98, 0x15,                                                                                   
0x99, 0x00,                                                                                   
0x9a, 0x0a,                                                                                   
0x9b, 0x05,//Lens shading parameter, right-down side, B channel                                                                                   
0xe8, 0x20,//Ae_thr_low                                                                                   
0xe9, 0x0f,//Slope_k                                                                                   
0xea, 0x00,//Ae_gain_min_ratio                                                                                   
0xbd, 0x1e,	                                                                                 
0xbe, 0x00,   
                                                                                
0xfd, 0x01,                                                                                   
0xa4, 0x00, //;lum_limit                                                                        
0x0e, 0x80, //;heq_mean  outdoor,indoor                                                         
0x18, 0x80, //;heq_mean  dummy,lowlight                                                         
0x0f, 0x20, //;k_max                                                                            
0x10, 0x90, //;ku_outdoor                                                                       
0x11, 0x80, //;ku_nr                                                                            
0x12, 0x80, //;ku_dummy                                                                         
0x13, 0xa0, //;ku_low                                                                           
0x14, 0x80, //;kl_outdoor                                                                       
0x15, 0x90, //;kl_nr                                                                            
0x16, 0x85, //;kl_dummy                                                                         
0x17, 0x85, //;kl_low 
    
//;gamma   
#if 0
0x6e, 0x00,                                                                           
0x6f, 0x03,                                                                                   
0x70, 0x07,                                                                                   
0x71, 0x0d,                                                                                   
0x72, 0x17,                                                                                   
0x73, 0x29,                                                                                   
0x74, 0x3d,                                                                                   
0x75, 0x4f,                                                                                   
0x76, 0x5f,                                                                                   
0x77, 0x79,                                                                                   
0x78, 0x8c,                                                                                   
0x79, 0x9d,                                                                                   
0x7a, 0xa9,                                                                                   
0x7b, 0xb3,                                                                                   
0x7c, 0xbe,                                                                                   
0x7d, 0xc7,                                                                                   
0x7e, 0xd0,                                                                                   
0x7f, 0xd6,                                                                                   
0x80, 0xde,
0x81, 0xe4,                                                                                   
0x82, 0xe9,                                                                                   
0x83, 0xee, 

#else
//0x6e, 0x00,                                                                           
//0x6f, 0x0f,//0x03,                                                                                   
//0x70, 0x1c,//0x07,                                                                                   
//0x71, 0x2a,//0x0d,                                                                                   
//0x72, 0x37,//0x17,                                                                                   
//0x73, 0x4b,//0x29,                                                                                   
//0x74, 0x5e,//0x3d,                                                                                   
//0x75, 0x6c,//0x4f,                                                                                   
//0x76, 0x78,//0x5f,                                                                                   
//0x77, 0x84,//0x79,                                                                                   
//0x78, 0x90,//0x8c,                                                                                   
//0x79, 0x9d,                                                                                   
//0x7a, 0xa9,                                                                                   
//0x7b, 0xb3,                                                                                   
//0x7c, 0xbe,                                                                                   
//0x7d, 0xc7,                                                                                   
//0x7e, 0xd0,                                                                                   
//0x7f, 0xd6,                                                                                   
//0x80, 0xde,
//0x81, 0xe4,                                                                                   
//0x82, 0xe9,                                                                                   
//0x83, 0xee,


//20241010
0x6e,0x00,
0x6f,0x20,
0x70,0x2d,
0x71,0x37,
0x72,0x40,
0x73,0x4e,
0x74,0x5a,
0x75,0x65,
0x76,0x6e,
0x77,0x80,
0x78,0x8f,
0x79,0x9c,
0x7a,0xa9,
0x7b,0xb5,
0x7c,0xc0,
0x7d,0xca,
0x7e,0xd4,
0x7f,0xdd,
0x80,0xe6,
0x81,0xef,
0x82,0xf7,
0x83,0xff,



#endif

                                                                                 
0xfd, 0x02, //;skin detect                                                                      
0x09, 0x06,                                                                                   
0x0d, 0x1a,                                                                                   
0x1c, 0x09,                                                                                   
0x1d, 0x03,                                                                                   
0x1e, 0x10, //;awb                                                                              
0x1f, 0x06,  
                                                                                 
0xfd, 0x01,                                                                                   
0x32, 0x00,
                                                                                   
0xfd, 0x02,   
0x26, 0xeb,//0xcb,  //awb_r gain                                                                                 
0x27, 0x80,//0xc2,  //awb_blue gain

//grenn add 0x26,0x27
0x10, 0x00, //;br offset                                                                        
0x11, 0x00, //;br offset_f                                                                      
0x18, 0x17,                                                                                   
0x19, 0x36,                                                                                   
0x2a, 0x01,                                                                                   
0x2b, 0x10,                                                                                   
0x28, 0xf8,                                                                                   
0x29, 0x08,                                                                                   
0x66, 0x5F, //;d65 10                                                                           
0x67, 0x7f,                                                                                   
0x68, 0xE0,                                                                                   
0x69, 0x10,                                                                                   
0x6a, 0xa6,    

0x7c, 0x4A, //;indoor 11                                                                        
0x7d, 0x80,                                                                                   
0x7e, 0x00,                                                                                   
0x7f, 0x30,//0x30,  

0x80, 0xaa,                                                                                   
0x70, 0x32, //;cwf 12                                                                           
0x71, 0x60,                                                                                   
0x72, 0x30,                                                                                   
0x73, 0x5a,                                                                                   
0x74, 0xaa,                                                                                   
0x6b, 0xff, //;tl84 13                                                                          
0x6c, 0x50,                                                                                   
0x6d, 0x40,                                                                                   
0x6e, 0x60,                                                                                   
0x6f, 0x6a,                                                                                   
0x61, 0xff, //;f 14                                                                             
0x62, 0x27,                                                                                   
0x63, 0x51,                                                                                   
0x64, 0x7f,                                                                                   
0x65, 0x6a,                                                                                   
0x75, 0x80,                                                                                   
0x76, 0x09,                                                                                   
0x77, 0x02,                                                                                   
0x0e, 0x12,                                                                                   
0x3b, 0x09,                                                                                   
0x48, 0xea, //;green u center                                                                   
0x49, 0xfc, //;green v center                                                                   
0x4a, 0x05, //;green range                                                                      
0x02, 0x00, //;outdoor awb exp 5msb                                                             
0x03, 0x88, //;outdoor awb exp 8lsb                                                             
0xf5, 0xfe, //;a8 ;outdoor awb rgain top                                                        
0x22, 0xfe, //;sharp                                                                            
0x20, 0xfe,                                                                                   
0xf7, 0xfe, 
 
 
/*sharpen*/                                                                                 
 
/*
0xde
[3] raw sharpen enable, in outdoor
[2] raw sharpen enable, in normal
[1] raw sharpen enable, in dummy
[0] raw sharpen enable, in low light
0x0f
*/
0xfd, 0x02,                                                                               
0xde, 0x0f,                                                                                   
0xcf, 0x0a, //;Sharp_flat_thr0   
/*
P2:0xd7 sharp_flat_thr1 7~0 Edge threshold in analog gain is 2* 0x10
P2:0xd8 sharp_flat_thr2 7~0 Edge threshold in analog gain is 4* 0x16
P2:0xd9 sharp_flat_thr3 7~0 Edge threshold in analog gain is 8* 0x18
P2:0xda sharp_flat_thr4 7~0 Edge threshold in analog gain is 16* 0x20
*/                                                                           
//0xd7, 0x0a,                                                                                   
//0xd8, 0x12,                                                                                   
//0xd9, 0x14,                                                                                   
//0xda, 0x1a, 
//                                                                                  
0xdc, 0x07, //Sharpness gain in skin area
/*
P2:0xe8 sharp_fac_pos_outdoor 7~0
Sharpness gain for increasing pixelâs Y, in outdoor0x30
P2:0xe9 sharp_fac_pos_nr 7~0 Sharpness gain for increasing pixelâs Y,in normal0x30 
P2:0xea sharp_fac_pos_dummy 7~0 Sharpness gain for increasing pixelâs Y,in dummy0x20
P2:0xeb sharp_fac_pos_low 7~0 Sharpness gain for increasing pixelâs Y,in lowlight 0x18
P2:0xec sharp_fac_neg_outdoor 7~0 Sharpness gain for decreasing pixelâs Y, in outdoor 0x30
P2:0xed sharp_fac_neg_nr 7~0Sharpness gain for decreasing pixelâs Y, in normal 0x30
P2:0xee sharp_fac_neg_dummy 7~0Sharpness gain for decreasing pixelâs Y, in dummy0x20
P2:0xef sharp_fac_neg_low 7~0Sharpness gain for decreasing pixelâs Y, in low light
*/        
#if 1
0xe8, 0x60, //;æ­£å?¼èå?(éå)                                                                             
0xe9, 0x40,                                                                                   
0xea, 0x40,                                                                                   
0xeb, 0x30,                                                                                   
0xec, 0x60, //;è´å?¼èå?                                                                             
0xed, 0x50,                                                                                   
0xee, 0x40,                                                                                   
0xef, 0x30,  
#else
0xe8, 0x80,//0x60, //;æ­£å?¼èå?(éå)                                                                             
0xe9, 0x60,//0x40,                                                                                   
0xea, 0x60,//0x40,                                                                                   
0xeb, 0x50,//0x30,                                                                                   
0xec, 0x80,//0x60, //;è´å?¼èå?                                                                             
0xed, 0x70,//0x50,                                                                                   
0xee, 0x60,//0x40,                                                                                   
0xef, 0x50,//0x30, 

#endif

0xd3, 0XC0,//0x30, //Sharp_ofst_pos;æ­£è¾¹ç¼éåèå´ï¼éå¶æ­£è¾¹ç¼çéåéï¼ è¯¥å?¼è¶å¤§ï¼éåèå´è¶å¤§                                                   
0xd4, 0X28,//0xc0, //Sharp_ofst_neg;è´?                                                                                
0xd5, 0X80,//0x50, //Sharp_ofst_min_nr;éå¶éåçæå°å?¼èå?                                                                       
0xd6, 0x0b, //[4:0] sharp_k_val                                                                                  
0xf0, 0x7f,	//Sharp_mdy_top
0xf1, 0x14,	//Sharp_mdy_bot

//;skin sharpen                                                                                    
0xfd, 0x01, //                                                                    
0xb1, 0xf0,	//Skin_sharp_delta 
                                                                            
0xfd, 0x02,                                                                                   
0xdc, 0x07, //skin_sharp_sel                                                                                  
0x05, 0x08, //Skin_num_th2 

//;bpc                                                                                 
0xfd, 0x01,                                                                               
0x26, 0x33, //[7:4] dpc_range_ratio_outdoor[3:0] dpc_range_ratio_nr                                                                                  
0x27, 0x99, //[7:4] dpc_range_ratio_dummy [3:0] dpc_range_ratio_low                                                                                  
0x62, 0xf0, //Dpc_grad_thr_outdoor                                                                                  
0x63, 0x80, //Dpc_grad_thr_nr                                                                                  
0x64, 0x80, //Dpc_grad_thr_dummy                                                                                  
0x65, 0x20, //Dpc_grad_thr_low
 
//;dns                                                                                 
/*
0xdd
[7] raw_gflt_en_outdoor
[6] raw_gflt_en_nr
[5] raw_gflt_en_dummy
[4] raw_gflt_en_low
[3] raw_denoise_en_outdoor
[2] raw_denoise_en_nr
[1] raw_denoise_en_dummy
[0] raw_denoise_en_low
*/ 
0xfd, 0x02,                                                                              
0xdd, 0xf0,//0xff,(å¹³æ»ä½¿è½ï¼?0xff)  
                                                                              

/*
P1:0xa8 raw_dif_thr_outdoor 7~0 Raw_dif_thr_outdoor 0x04
P1:0xa9 raw_dif_thr_normal 7~0 Raw_dif_thr_normal 0x04
P1:0xaa raw_dif_thr_dummy 7~0 Raw_dif_thr_dummy 0x04
P1:0xab raw_dif_thr_low_light 7~0 Raw_dif_thr_low_light 0x04
*/ 
0xfd, 0x01, 
#if 0
0xa8, 0x00, //;åé?éé´å¹³æ»éå?                                                                         
0xa9, 0x02,	//0x09,                                                                                   
0xaa, 0x02, //0x09                                                                                  
0xab, 0x05, //0x0c
#else
0xa8, 0x02, //;åé?éé´å¹³æ»éå?                                                                         
0xa9, 0x02,	//0x09,                                                                                   
0xaa, 0x02, //0x09                                                                                  
0xab, 0x02, //0x0c
#endif
/*
P1:0xcf raw_gflt_fac_outdoor 7~0 Raw_gflt_fac_outdoor 0x00
P1:0xd0 raw_gflt_fac_normal 7~0 Raw_gflt_fac_normal 0x00
P1:0xd1 raw_gflt_fac_dummy 7~0 Raw_gflt_fac_dummy 0x00
P1:0xd2 raw_gflt_fac_low 7~0 Raw_gflt_fac_low 0x00
P1:0xd3 raw_grgb_thr_outdoor 7~0 Raw_grgb_thr_outdoor 0x08
P1:0xd4 raw_grgb_thr_normal 7~0 Raw_grgb_thr_normal 0x08
P1:0xd5 raw_grgb_thr_dummy 7~0 Raw_grgb_thr_dummy 0x08
P1:0xd6 raw_grgb_thr_low 7~0 Raw_grgb_thr_low 0x08
P1:0xdf raw_gf_fac_outdoor 7~0 Raw_gf_fac_outdoor 0x00
P1:0xe0 raw_gf_fac_normal 7~0 Raw_gf_fac_normal 0x00
P1:0xe1 raw_gf_fac_dummy 7~0 Raw_gf_fac_dummy 0x00
P1:0xe2 raw_gf_fac_low 7~0 Raw_gf_fac_low 0x00
P1:0xe3 raw_rb_fac_outdoor 7~0 Raw_rb_fac_outdoor 0x00
P1:0xe4 raw_rb_fac_normal 7~0 Raw_rb_fac_normal 0x00
P1:0xe5 raw_rb_fac_dummy 7~0 Raw_rb_fac_dummy 0x00
P1:0xe6 raw_rb_fac_low 7~0 Raw_rb_fac_low 0x00
*/     
#if 0
0xd3, 0x00, //;GrGbå¹³æ»éå??                                                                         
0xd4, 0x09,                                                                                   
0xd5, 0x09,                                                                                   
0xd6, 0x0c, 
0xcf, 0xff, //;Gr\Gbä¹é´å¹³æ»å¼ºåº¦                                                                      
0xd0, 0xf0,                                                                                   
0xd1, 0x80,                                                                                   
0xd2, 0x80, 
0xdf, 0xff, //;GrãGbåé?éåå¹³æ»å¼ºåº?                                                                    
0xe0, 0xf0,                                                                                   
0xe1, 0xd0,                                                                                   
0xe2, 0x80,                                                                                   
0xe3, 0xff, //;RãBå¹³æ»å¼ºåº¦                                                                          
0xe4, 0xf0,                                                                                   
0xe5, 0xd0,                                                                                   
0xe6, 0x80, 

#else
0xd3, 0x01, //;GrGbå¹³æ»éå??                                                                         
0xd4, 0x01,                                                                                   
0xd5, 0x01,                                                                                   
0xd6, 0x01,

0xcf, 0xf0, //;Gr\Gbä¹é´å¹³æ»å¼ºåº¦                                                                      
0xd0, 0xf0,                                                                                   
0xd1, 0xf0,                                                                                   
0xd2, 0xf0,

0xdf, 0xf0, //;GrãGbåé?éåå¹³æ»å¼ºåº?                                                                    
0xe0, 0xf0,                                                                                   
0xe1, 0xf0,                                                                                   
0xe2, 0xf0,                                                                                   
0xe3, 0xf0, //;RãBå¹³æ»å¼ºåº¦                                                                          
0xe4, 0xf0,                                                                                   
0xe5, 0xf0,                                                                                   
0xe6, 0xf0, 

#endif
 
/*
;CCM 
P2:0xa0 c00_eff1_8lsb 7~0 C00_eff1_8lsb for color correction 0x8c
P2:0xa1 c01_eff1_8lsb 7~0 C01_eff1_8lsb for color correction 0x00
P2:0xa2 c02_eff1_8lsb 7~0 C02_eff1_8lsb for color correction 0xf4
P2:0xa3 c10_eff1_8lsb 7~0 C10_eff1_8lsb for color correction 0xfa
P2:0xa4 c11_eff1_8lsb 7~0 C11_eff1_8lsb for color correction 0xa0
P2:0xa5 c12_eff1_8lsb 7~0 C12_eff1_8lsb for color correction 0xe7
P2:0xa6 c20_eff1_8lsb 7~0 C20_eff1_8lsb for color correction 0x0c
P2:0xa7 c21_eff1_8lsb 7~0 C21_eff1_8lsb for color correction 0xcd
P2:0xa8 c22_eff1_8lsb 7~0 C22_eff1_8lsb for color correction 0xa6
P2:0xac c00_eff2_8lsb 7~0 C00_eff2_8lsb for color correction 0xa2
P2:0xad c01_eff2_8lsb 7~0 C01_eff2_8lsb for color correction 0x04
P2:0xae c02_eff2_8lsb 7~0 C02_eff2_8lsb for color correction 0xda
P2:0xaf c10_eff2_8lsb 7~0 C10_eff2_8lsb for color correction 0xcd
P2:0xb0 c11_eff2_8lsb 7~0 C11_eff2_8lsb for color correction 0xd9
P2:0xb1 c12_eff2_8lsb 7~0 C12_eff2_8lsb for color correction 0xda
P2:0xb2 c20_eff2_8lsb 7~0 C20_eff2_8lsb for color correction 0xf6
P2:0xb3 c21_eff2_8lsb 7~0 C21_eff2_8lsb for color correction 0x98
P2:0xb4 c22_eff2_8lsb 7~0 C22_eff2_8lsb for color correction 0xf3
*/                                                                                  
0xfd, 0x02,                                                                              
0x15, 0xe0, //;b>th For f light judge                                                                            
0x16, 0x95, //;r<th For f light judge   
#if 0
0xa0, 0x9b, //;C00_eff1_8lsb for color correction                                                                               
0xa1, 0xe4, //C01_eff1_8lsb for color correction                                                                                  
0xa2, 0x01, //                                                                                  
0xa3, 0xf2,                                                                                   
0xa4, 0x8f,                                                                                   
0xa5, 0xff,                                                                                   
0xa6, 0x01,                                                                                   
0xa7, 0xdb,                                                                                   
0xa8, 0xa4,
#else
0xa0 ,0xa5,
0xa1 ,0xe4,
0xa2 ,0xf7,
0xa3 ,0xf2,
0xa4 ,0x8f,
0xa5 ,0xff,
0xa6 ,0x01,
0xa7 ,0xdb,
0xa8 ,0xa4,

#endif
0xac, 0x80, //;F                                                                                
0xad, 0x21,                                                                                   
0xae, 0xdf,                                                                                   
0xaf, 0xf2,                                                                                   
0xb0, 0xa0,                                                                                   
0xb1, 0xee,                                                                                   
0xb2, 0xea,                                                                                   
0xb3, 0xd9,                                                                                   
0xb4, 0xbd,//C22_eff2_8lsb for color correction 



/*
Saturation
P1:0xb3 sat_u_s1 7~0
Saturation U at Auto Saturation Control segment 1 when in the outdoor mode
0x98
P1:0xb4 sat_u_s2 7~0
Saturation U at Auto Saturation Control segment 2 when in the normal mode
0x98
P1:0xb5 sat_u_s3 7~0
Saturation U at Auto Saturation Control segment 3 when in the dummy mode
0x88
P1:0xb6 sat_u_s4 7~0
Saturation U at Auto Saturation Control segment 4 when in the low mode
0x7f
P1:0xb7 sat_v_s1 7~0
Saturation V at Auto Saturation Control segment 1 when in the outdoor mode
0x92
P1:0xb8 sat_v_s2 7~0
Saturation V at Auto Saturation Control segment 2 when in the normal mode
0x92
P1:0xb9 sat_v_s3 7~0
Saturation V at Auto Saturation Control segment 3 when in the dummy mode
0x82
P1:0xba sat_v_s4 7~0
Saturation V at Auto Saturation Control segment 4 when in the low mode
*/                                                                                  
0xfd, 0x01, //;sat u B                                                                          
0xb3, 0xb0,                                                                                   
0xb4, 0xb0,//0xa0,//0x90, //(é¥±ååº?)                                                                                
0xb5, 0xb0,//0x98,//0x70,                                                                                   
0xb6, 0xb0,//0x90,//0x55, 

0xb7, 0xb0,//0xb0, //;sat v R                                                                          
0xb8, 0xb0,//0xa0,//0x90,                                                                                   
0xb9, 0xb0,//0x92,//0x70,                                                                                   
0xba, 0xb0,//0x8e,//0x55, 
                                                                                  
0xfd, 0x01, //;auto_sat                                                                         
0xbf, 0xff, //;The brightness thread of the ymean                                                                        
0x00, 0x00, //;[4] fix_state_en [2:0] fix_state_mode    
                                                                     
0xfd, 0x01, //;low_lum_offset                                                                   
0xa4, 0x00, //;Lum_limit  (liang du)                                                                     
0xa5, 0x1f, //;lum_set                                                                          
0xa6, 0x50, //;black vt                                                                         
0xa7, 0x65, //;If current luminance is bigger than it, the luminance of the frame will decrease.
 
//;gw                                                                        
0xfd, 0x02,                                                                               
0x30, 0x38, //Gw_mean_th                                                               
0x31, 0x40, //Write gw offset for calculate offset, and read  out is real offset                                                                                  
0x32, 0x40, //Gw_y_bot                                                                                  
0x33, 0xd0, //Gw_y_top                                                                                  
0x34, 0x10, //Gw_uv_radius                                                                                  
0x35, 0x60, //Swap uv pix value when it is not gray pix                                                                                  
0x36, 0x28, //Gw offset max limit                                                                                
0x37, 0x07, //[6] gw_upt_fr_en [5] gw_en_sel [2:0] Gw offset adjust step                                                                                 
0x38, 0x08, //Gw_jdg_th;(read 0x31_gw_offset>0x10,is gray image)                                         
0xe6, 0x8F, //;(bit7:4 white edge 3:0 dark edg zhiyuedafanweiyueda )   
                         
0xfd, 0x01, //;                                                                                 
0x1b, 0x0a,//0x15, //Ku_offset;(baibanshiï¼ku&kljiaduoshao)                                                      
0x1c, 0x0d,//0x1A, //Kl_offset;(Read 0x31*0x1cçå??/16ä¸ºæç»å çå??)                                                      
0x1d, 0x0c, //Auto_contrast_cttl; auto contrast enable ,bit3 outdoor  bit2 indoor bit1 dummy  bit0 lowlight  



//function enable     
0xfd, 0x01,                                                                                   
0x32, 0x05,//0x15,// [7] test_en [6] ft_test_en [5] fix_awb [4] awb2_en [2] auto_gain_en [0] ae_en  
/*
[7] Lens shading in outdoor enable
	0: disable
	1: enable
[6] Lens shading in normal enable
	0: disable
	1: enable
[5] Lens shading in dummy enable
	0: disable
	1: enable
[4] Lens shading in low light enable
	0: disable
	1: enable
[3] DPC in dummy enable
	0: disable
	1: enable
[2] DPC in outdoor enable
	0: disable
	1: enable
[1] DPC in normal enable
	0: disable
	1: enable
[0] DPC in low light enable
	0: disable
	1: enable
*/                                                                                
0x33, 0xef,   
/*
[6] raw window 
	0: enable raw window function
	1: disable
[5] binning_mode1
	1: col averge mode
	0: col sum mode
[4] ace_test
	1: aec_win select raw data
	0: aec_win select y data
[3] VSYNC Inversion
[2] HSYNC Inversion
[1] Disable HSYNC & VSYNC
[0] scale_en
*/                                                                                
0x36, 0x10, //;AEç»è®¡å¨GAmmaä¹åï¼?00æ¯AEå¨Gammaä¹å                                                       
0xf6, 0x70, //y_top_ae;äº®æ?ï¼é²è¿ææºå¶ï¼å¼è¶å¤§è¿æåºæ¯å¯¹å¶ä»å½±åå°?                                                           
0xf5, 0x08, //y_bot_ae;ææ?ï¼é²æ­¢é»è²ç©ä½è¿å¥å¯¼è´è¿æï¼?


/*
AE WINDOWN
P1:0xd7 sat_ypix_thr1 7~0 Sat_ypix_thr1 0x04
P1:0xd8 sat_ypix_thr2 7~0 Sat_ypix_thr2 0x04
P1:0xd9 sat_ypix_thr3 7~0 Sat_ypix_thr3 0x10
P1:0xda sat_ypix_thr4 7~0 Sat_ypix_thr4 0x20
P1:0xdb sat_yadt_fac1 7~0 Sat_yadt_fac1 0x50
P1:0xdc sat_yadt_fac2 7~0 Sat_yadt_fac2 0x30
P1:0xdd sat_yadt_fac3 7~0 Sat_yadt_fac3 0x10
P1:0xde sat_yadt_fac4 7~0 Sat_yadt_fac4 0x09
*/                                                                 
0xd7, 0x3a, //;tbh                                                                              
0xd8, 0x10,                                                                                   
0xd9, 0x20,                                                                                   
0xda, 0x10,                                                                                   
0xdb, 0x7a,                                                                                   
0xdc, 0x3a,                                                                                   
0xdd, 0x30,                                                                                   
0xde, 0x30,                                                                                   
0xe7, 0x3a, //Sat_bot         
//cai zao
0x9c, 0xaa, //;u_v_th_outdoor                                                                           
0x9d, 0xaa, //u_v_th_nr                                                                                  
0x9e, 0x33,//0x55, //u_v_th_dummy                                                                                  
0x9f, 0x33,//0x55,	//u_v_th_low
                                                                                   
0xfd, 0x00,                                                                                   
0x1c, 0x00,                           

//0xfd, 0x02, 
//0x75, 0x11,


0xfd, 0x01, 

0x28, 0x00,
0x29, 0x01,
0x2a, 0xe0,
0x2b, 0xa0,
0x2c, 0x01,
0x2d, 0xe0,

//20241010
#if 0
//fps_set(15-25)
0xfd, 0x00,
0x03, 0x02,
0x04, 0xd0,
0x05, 0x00,
0x06, 0x00,
0x09, 0x01,
0x0a, 0x68,
0xfd, 0x01,
0xf7 ,0x78,
0x02 , 0x06,
0x03 , 0x01,
0x06 , 0x78,
0x07 , 0x00,
0x08 , 0x01,
0x09 , 0x00,
0xfd , 0x02,
0xbe , 0xd0,
0xbf , 0x02,
0xd0 , 0xd0,
0xd1 , 0x02,
#else
//fps20-25
0xfd,0x00,
0x03,0x02,
0x04,0xd0,
0x05,0x00,
0x06,0x00,
0x09,0x01,
0x0a,0x68,
0xfd,0x01,
0xf7,0x78,
0x02,0x05,
0x03,0x01,
0x06,0x78,
0x07,0x00,
0x08,0x01,
0x09,0x00,
0xfd,0x02,
0xbe,0x58,
0xbf,0x02,
0xd0,0x58,
0xd1,0x02,

#endif
//
0xfd,0x01,
0xdb,0x00,	//buf_heq_offset ï¼å¨AEä¹ååäºä¸ªå¢å äº®åº¦çå¯å­å?
0x0f,0x20,	//k_maxï¼ä¸è¬ä¸ä¿®æ¹
0x10,0x98,//0x88,	//ku_outdoor
0x11,0x98,//0x88,	//ku_nr
0x12,0xa0,//0x90,	//ku_dummy
0x13,0xa0,//0x90,	//kl_low
0x14,0xaa,//0x9a,	//kl_outdorr
0x15,0xaa,//0x9a,	//kl_nr
0x16,0x9b,//0x8b,	//kl_dummy
0x17,0x98,//0x88,	//klä½?



#endif //20240926 sensor_0A83

//================================================================================


#if 0	//20240926 sensor_0A83
0xfd, 0x00,  
/*
[7] ds_i2c
[6:5] ds_data
[4] pd_dig
*/                                                                                 
0x1d, 0x25,      
/*
¾µÏñ/·­×ª
Normal 0x31[2:1] 00
Mirror 0x31[2:1] 01
Flip 0x31[2:1] 10
Mirror & Flip 0x31[2:1] 11
*/                                                                      
0x31, 0x06,//0x00, //comm_ctrl_reg 

/*
[2] ext_sync_sel
[1:0] pvdd_sel
*/                                                                                 
0x32, 0x01,                                                                                   
0x30, 0x01, //[2:0] dclk_ctrl
                                                                                  
0xfd, 0x00,  //                                                                                  
0xf0, 0xff, //gb_suboffset                                                                             
0xf1, 0xff, //gr_suboffset                                                                                  
0xf2, 0xff, //red_suboffset                                                                                  
0xf3, 0xff, //blue_suboffset                                                                                  
0xfc, 0x50, //blc_dpc_th_p_8lsb 
                                                                          
0xfd, 0x01, 
/*
[5:4] lsc_position_set Raw order set for awb gain and lsc gain
[3:2] awb_position_set
[1:0] bayer order set for demosaic
*/                                                                                  
0x5d, 0x01,  
/*
½µÔë£¬±ßÑØÔöÇ¿£¬Ù¤Âí£¬É«²Ê¾ØÕó
[7] dpc_flt_en
[6] dpc_dirtm_en
[5] gamma_en2(raw gamma)
[4] domu_en
[3] sharp_mdy_en
[2] dpc_low_en
[1] gamma correction(y gamma)
[0] color correction
*/                                                                                 
0x34, 0xe2,
/*
[7] raw_mid8_en
[6] raw_low8_en
[5] add_row4_col4_en
[4] swap byte
0:u y v y
1:y u y v
[3] unpro_raw_out_en
[2] y_out_en
[0] yuv_order
0: U Y V Y
1: V Y U Y
*/                                                                                   
0x35, 0x10, 
                                                                                  
0xfd, 0x00, //; ae setting                                                                      
0x03, 0x03, //Integration time high 3 bits                                                                                  
0x04, 0x6c, //Integration time low 8 bits                                                                                
0x24, 0x10, //pga_gain_ctl                                                                                   
0xef, 0x40,                                                                                   
0x06, 0x00, //Vsync blank                                                                                  
0x09, 0x00, //hblank_4msb                                                                                  
0x0a, 0x80, //hblank_8lsb                                                                                  
0x10, 0x0a,//;07  by wwj 0124                                                                   
0x11, 0x02,//;04  by wwj 0124

/*
[1] dac_mode
[0] FPN_33ms_timing_sel
*/                                                                   
0x16, 0x01,  
/*
[6:4] icomp1
[1:0] icomp2
*/                                                                                 
0x19, 0x22,                                                                                   
0x1e, 0x60,//;58 by wwj 0124                                                                    
0x29, 0x60,//;48 by wwj 0124  
/*
[5] cp_num
[4:3] spi_clk_delay
[2:0] vcp_sel_ctl
*/                                                                  
0x13, 0x37, 
/*
[5:4] ds_hsync
[3:2] ds_vsync
[1:0] ds_pclk
*/                                                                                  
0x14, 0x01,                                                                                   
0x25, 0x01,                                                                                   
0x2a, 0x06,                                                                                   
0x27, 0x00,//   by wwj 0218                                                                     
0x54, 0x00,                                                                                   
0x55, 0x10,                                                                                   
0x58, 0x28,//;38 by wwj 0124                                                                    
0x5d, 0x12,                                                                                   
0x63, 0x00,                                                                                   
0x64, 0x00,                                                                                   
0x66, 0x2a,//;28   by wwj 0218                                                                  
0x68, 0x28,//;2a   by wwj 0218                                                                  
0x72, 0x32,//;3a by wwj 0124                                                                    
0x73, 0x0a,                                                                                   
0x75, 0x30,//;48 by wwj 0124                                                                    
0x76, 0x0a,                                                                                   
0x1f, 0x99,//;77  by wwj 0215                                                                   
0x20, 0x09,//;/7 by wwj 0215                                                                     
0xfb, 0x16, 

//AEC                                                                                  
0xfd, 0x01,
/*
[6] lum_down_en
[5] exp_max_en
[4] exp_accr_sel
[3] outdoor_mode_en
1: enable
0: disable
[2:0] mean_mode_reg
The value must be bigger than 2
*/                                                                                   
0xf2, 0x69,//0x6b,//0x69,  (shou guang su du)                                                                                 
0xf7, 0x97, //;ABF exp base time is line number equal to 10 ms                                                                             
0x02, 0x08, //;Exp_max_indr   Ö¡ÂÊÏÞÖÆ                                                                     
0x03, 0x01, //;Exp_min_indr                                                                        
0x06, 0x8a, //;exp_max_outdr                                                                    
0x08, 0x01, //;Exp_min_outdr  Ö¡ÂÊÏÞÖÆ  
                                                              
0xfd, 0x02, //;ae gain &status                                                                  
0xb8, 0x50, //;Luminance Low threshold from normal mode to dummy mode                                                                 
0xb9, 0xff, //;Luminance Low threshold from dummy mode to normal mode                                                                 
0xba, 0x40, //;Luminance Low threshold from dummy mode to low light mod                                                              
0xbb, 0x45, //;Luminance high threshold from low light mode to dummy mod                                                               
0xbc, 0xc0, //;RPC low threshold from dummy mode to low light mod                                                                    
0xbd, 0x50, //;                                                                
0xbe, 0xb8, //;exp_heq_dummy 8 LSM Exp_heq_dummy: exposure time low threshold from normal mode to dummy mode                                                                 
0xbf, 0x04, //Exp_heq_dummy_5hsm                                                                                  
0xd0, 0xb8, //Exp 8lsb threshold from dummy mode to low mode                                                                
0xd1, 0x04, //Exp 3msb threshold from dummy mode to low mode 
                                                                                 
0xfd, 0x01, //;rpc    
#if 0
0xc0, 0x1f, //;rpc_1base_max                                                                    
0xc1, 0x18, //;rpc_2base_max                                                                    
0xc2, 0x15, //;rpc_3base_max                                                                    
0xc3, 0x13, //;rpc_4base_max                                                                    
0xc4, 0x13, //;rpc_5base_max                                                                    
0xc5, 0x12, //;rpc_6base_max                                                                    
0xc6, 0x12, //;rpc_7base_max                                                                    
0xc7, 0x11, //;rpc_8base_max                                                                    
0xc8, 0x11, //;rpc_9base_max                                                                    
0xc9, 0x11, //;rpc_10base_max                                                                   
0xca, 0x10, //;rpc_11base_max                                                                   
0xf3, 0x10, //;rpc_12base_max                                                                   
0xf4, 0x10, //;rpc_13base_max    
                                                               
0xfd, 0x01, //;ae min gain                                                                      
0x04, 0xff, //;rpc_max_indr                                                                     
0x05, 0x10, //;rpc_min_indr                                                                     
0x0a, 0x30, //;rpc_max_outdr                                                                    
0x0b, 0x10, //;rpc_min_outdr 
#else
//0x10-0x1f
0xc0, 0x1f, //;rpc_1base_max                                                                    
0xc1, 0x18, //;rpc_2base_max                                                                    
0xc2, 0x15, //;rpc_3base_max                                                                    
0xc3, 0x13, //;rpc_4base_max                                                                    
0xc4, 0x13, //;rpc_5base_max                                                                    
0xc5, 0x12, //;rpc_6base_max                                                                    
0xc6, 0x12, //;rpc_7base_max                                                                    
0xc7, 0x11, //;rpc_8base_max                                                                    
0xc8, 0x11, //;rpc_9base_max                                                                    
0xc9, 0x11, //;rpc_10base_max                                                                   
0xca, 0x10, //;rpc_11base_max   
                                                               
0xfd, 0x01, //;ae min gain                                                                      
0x04, 0x20, //;rpc_max_indr                                                                     
0x05, 0x10, //;rpc_min_indr                                                                     
0x0a, 0x20, //;rpc_max_outdr                                                                    
0x0b, 0x10, //;rpc_min_outdr

#endif
0xfd, 0x01, //;target                                                                           
0xcb, 0x40,//0x48, //;Hold threshold of dark pixel value at indoor                                                                     
0xcc, 0x40,//0x45, //;Hold threshold of bright pixel value at indoor                                                                     
0xcd, 0x03, //;Hold threshold of dark pixel value at outdoor                                                                       
0xce, 0x05, //;Hold threshold of bright pixel value at outdoor  
                                                                     
0xfd, 0x00, //;
/*
[5] bl_gain_en Should be set to 1'b0
[4] bl_dpc_en
	1¡¯b1: enable dark row dpc
	1¡¯b0: disable
[2] exp_update_en
	1¡¯b1: blc update when exp change
	1¡¯b0: disable
[1] rpc_update_en
	1¡¯b1: blc update when rpc change
	1¡¯b0: disable
[0] free_update_en
	1¡¯b1: blc update every frame
	1¡¯b0: disable
*/                                                                                 
0xfb, 0x16, //;                                                                                 
0x35, 0xaa, //; Glb_gain[7:0]

                                                                                
0xfd, 0x01, //;lsc                                                                              
0x1e, 0x00, //Lsc_sig_ru[6:4] Lsc_sig_lu[2:0]                                                                                  
0x20, 0x00, //Lsc_sig_rd[6:4] Lsc_sig_ld[2:0]                                                                                  
0x84, 0x25, //Lens shading parameter, left side, R channel                                                                                  
0x85, 0x25, //Lens shading parameter, right side, R channel                                                                                  
0x86, 0x1f, //Lens shading parameter, upper side, R channel                                                                                 
0x87, 0x23,                                                                                   
0x88, 0x1c,                                                                                   
0x89, 0x20,                                                                                   
0x8a, 0x1a,                                                                                   
0x8b, 0x15,                                                                                   
0x8c, 0x15,                                                                                   
0x8d, 0x1a,                                                                                   
0x8e, 0x0a,                                                                                   
0x8f, 0x13,                                                                                   
0x90, 0x13,                                                                                   
0x91, 0x00,                                                                                   
0x92, 0x0a,                                                                                   
0x93, 0x08,                                                                                   
0x94, 0x12,                                                                                   
0x95, 0x00,                                                                                   
0x96, 0x0a,                                                                                   
0x97, 0x08,                                                                                   
0x98, 0x15,                                                                                   
0x99, 0x00,                                                                                   
0x9a, 0x0a,                                                                                   
0x9b, 0x05,//Lens shading parameter, right-down side, B channel                                                                                   
0xe8, 0x20,//Ae_thr_low                                                                                   
0xe9, 0x0f,//Slope_k                                                                                   
0xea, 0x00,//Ae_gain_min_ratio                                                                                   
0xbd, 0x1e,	                                                                                 
0xbe, 0x00,   
                                                                                
0xfd, 0x01,                                                                                   
0xa4, 0x00, //;lum_limit                                                                        
0x0e, 0x80, //;heq_mean  outdoor,indoor                                                         
0x18, 0x80, //;heq_mean  dummy,lowlight                                                         
0x0f, 0x20, //;k_max                                                                            
0x10, 0x90, //;ku_outdoor                                                                       
0x11, 0x80, //;ku_nr                                                                            
0x12, 0x80, //;ku_dummy                                                                         
0x13, 0xa0, //;ku_low                                                                           
0x14, 0x80, //;kl_outdoor                                                                       
0x15, 0x90, //;kl_nr                                                                            
0x16, 0x85, //;kl_dummy                                                                         
0x17, 0x85, //;kl_low 
    
//;gamma   
#if 0
0x6e, 0x00,                                                                           
0x6f, 0x03,                                                                                   
0x70, 0x07,                                                                                   
0x71, 0x0d,                                                                                   
0x72, 0x17,                                                                                   
0x73, 0x29,                                                                                   
0x74, 0x3d,                                                                                   
0x75, 0x4f,                                                                                   
0x76, 0x5f,                                                                                   
0x77, 0x79,                                                                                   
0x78, 0x8c,                                                                                   
0x79, 0x9d,                                                                                   
0x7a, 0xa9,                                                                                   
0x7b, 0xb3,                                                                                   
0x7c, 0xbe,                                                                                   
0x7d, 0xc7,                                                                                   
0x7e, 0xd0,                                                                                   
0x7f, 0xd6,                                                                                   
0x80, 0xde,
0x81, 0xe4,                                                                                   
0x82, 0xe9,                                                                                   
0x83, 0xee, 

#else
//0x6e, 0x00,                                                                           
//0x6f, 0x0f,//0x03,                                                                                   
//0x70, 0x1c,//0x07,                                                                                   
//0x71, 0x2a,//0x0d,                                                                                   
//0x72, 0x37,//0x17,                                                                                   
//0x73, 0x4b,//0x29,                                                                                   
//0x74, 0x5e,//0x3d,                                                                                   
//0x75, 0x6c,//0x4f,                                                                                   
//0x76, 0x78,//0x5f,                                                                                   
//0x77, 0x84,//0x79,                                                                                   
//0x78, 0x90,//0x8c,                                                                                   
//0x79, 0x9d,                                                                                   
//0x7a, 0xa9,                                                                                   
//0x7b, 0xb3,                                                                                   
//0x7c, 0xbe,                                                                                   
//0x7d, 0xc7,                                                                                   
//0x7e, 0xd0,                                                                                   
//0x7f, 0xd6,                                                                                   
//0x80, 0xde,
//0x81, 0xe4,                                                                                   
//0x82, 0xe9,                                                                                   
//0x83, 0xee,


//20241010
0x6e,0x00,
0x6f,0x20,
0x70,0x2d,
0x71,0x37,
0x72,0x40,
0x73,0x4e,
0x74,0x5a,
0x75,0x65,
0x76,0x6e,
0x77,0x80,
0x78,0x8f,
0x79,0x9c,
0x7a,0xa9,
0x7b,0xb5,
0x7c,0xc0,
0x7d,0xca,
0x7e,0xd4,
0x7f,0xdd,
0x80,0xe6,
0x81,0xef,
0x82,0xf7,
0x83,0xff,



#endif

                                                                                 
0xfd, 0x02, //;skin detect                                                                      
0x09, 0x06,                                                                                   
0x0d, 0x1a,                                                                                   
0x1c, 0x09,                                                                                   
0x1d, 0x03,                                                                                   
0x1e, 0x10, //;awb                                                                              
0x1f, 0x06,  
                                                                                 
0xfd, 0x01,                                                                                   
0x32, 0x00,
                                                                                   
0xfd, 0x02,   
0x26, 0xef,//0xeb,//0xcb,  //awb_r gain                                                                                 
0x27, 0x78,//0x78,//0xc2,  //awb_blue gain

//grenn add 0x26,0x27
0x10, 0x00, //;br offset                                                                        
0x11, 0x00, //;br offset_f                                                                      
0x18, 0x17,                                                                                   
0x19, 0x36,                                                                                   
0x2a, 0x01,                                                                                   
0x2b, 0x10,                                                                                   
0x28, 0xf8,                                                                                   
0x29, 0x08,                                                                                   
0x66, 0x5F, //;d65 10                                                                           
0x67, 0x7f,                                                                                   
0x68, 0xE0,                                                                                   
0x69, 0x10,                                                                                   
0x6a, 0xa6,    

0x7c, 0x4A, //;indoor 11                                                                        
0x7d, 0x80,                                                                                   
0x7e, 0x00,                                                                                   
0x7f, 0x30,//0x30,  

0x80, 0xaa,                                                                                   
0x70, 0x32, //;cwf 12                                                                           
0x71, 0x60,                                                                                   
0x72, 0x30,                                                                                   
0x73, 0x5a,                                                                                   
0x74, 0xaa,                                                                                   
0x6b, 0xff, //;tl84 13                                                                          
0x6c, 0x50,                                                                                   
0x6d, 0x40,                                                                                   
0x6e, 0x60,                                                                                   
0x6f, 0x6a,                                                                                   
0x61, 0xff, //;f 14                                                                             
0x62, 0x27,                                                                                   
0x63, 0x51,                                                                                   
0x64, 0x7f,                                                                                   
0x65, 0x6a,                                                                                   
0x75, 0x80,                                                                                   
0x76, 0x09,                                                                                   
0x77, 0x02,                                                                                   
0x0e, 0x12,                                                                                   
0x3b, 0x09,                                                                                   
0x48, 0xea, //;green u center                                                                   
0x49, 0xfc, //;green v center                                                                   
0x4a, 0x05, //;green range                                                                      
0x02, 0x00, //;outdoor awb exp 5msb                                                             
0x03, 0x88, //;outdoor awb exp 8lsb                                                             
0xf5, 0xfe, //;a8 ;outdoor awb rgain top                                                        
0x22, 0xfe, //;sharp                                                                            
0x20, 0xfe,                                                                                   
0xf7, 0xfe, 
 
 
/*sharpen*/                                                                                 
 
/*
0xde
[3] raw sharpen enable, in outdoor
[2] raw sharpen enable, in normal
[1] raw sharpen enable, in dummy
[0] raw sharpen enable, in low light
0x0f
*/
0xfd, 0x02,                                                                               
0xde, 0x0f,                                                                                   
0xcf, 0x0a, //;Sharp_flat_thr0   
/*
P2:0xd7 sharp_flat_thr1 7~0 Edge threshold in analog gain is 2* 0x10
P2:0xd8 sharp_flat_thr2 7~0 Edge threshold in analog gain is 4* 0x16
P2:0xd9 sharp_flat_thr3 7~0 Edge threshold in analog gain is 8* 0x18
P2:0xda sharp_flat_thr4 7~0 Edge threshold in analog gain is 16* 0x20
*/                                                                           
//0xd7, 0x0a,                                                                                   
//0xd8, 0x12,                                                                                   
//0xd9, 0x14,                                                                                   
//0xda, 0x1a, 
//                                                                                  
0xdc, 0x07, //Sharpness gain in skin area
/*
P2:0xe8 sharp_fac_pos_outdoor 7~0
Sharpness gain for increasing pixel¡¯s Y, in outdoor0x30
P2:0xe9 sharp_fac_pos_nr 7~0 Sharpness gain for increasing pixel¡¯s Y,in normal0x30 
P2:0xea sharp_fac_pos_dummy 7~0 Sharpness gain for increasing pixel¡¯s Y,in dummy0x20
P2:0xeb sharp_fac_pos_low 7~0 Sharpness gain for increasing pixel¡¯s Y,in lowlight 0x18
P2:0xec sharp_fac_neg_outdoor 7~0 Sharpness gain for decreasing pixel¡¯s Y, in outdoor 0x30
P2:0xed sharp_fac_neg_nr 7~0Sharpness gain for decreasing pixel¡¯s Y, in normal 0x30
P2:0xee sharp_fac_neg_dummy 7~0Sharpness gain for decreasing pixel¡¯s Y, in dummy0x20
P2:0xef sharp_fac_neg_low 7~0Sharpness gain for decreasing pixel¡¯s Y, in low light
*/        
//whl
#if 0
0xe8, 0x60, //;ÕýÖµ·¶Î§(Èñ»¯)                                                                             
0xe9, 0x40,                                                                                   
0xea, 0x40,                                                                                   
0xeb, 0x30,                                                                                   
0xec, 0x60, //;¸ºÖµ·¶Î§                                                                             
0xed, 0x50,                                                                                   
0xee, 0x40,                                                                                   
0xef, 0x30,  
#else
0xe8, 0x88,//0x60, //;ÕýÖµ·¶Î§(Èñ»¯)                                                                             
0xe9, 0x88,//0x40,                                                                                   
0xea, 0x78,//0x40,                                                                                   
0xeb, 0x50,//0x30,                                                                                   
0xec, 0x80,//0x60, //;¸ºÖµ·¶Î§                                                                             
0xed, 0x80,//0x50,                                                                                   
0xee, 0x70,//0x40,                                                                                   
0xef, 0x50,//0x30, 

#endif

0xd3, 0XC0,//0x30, //Sharp_ofst_pos;Õý±ßÔµÈñ»¯·¶Î§£¬ÏÞÖÆÕý±ßÔµµÄÈñ»¯Á¿£» ¸ÃÖµÔ½´ó£¬Èñ»¯·¶Î§Ô½´ó                                                   
0xd4, 0X28,//0xc0, //Sharp_ofst_neg;¸º                                                                                
0xd5, 0X80,//0x50, //Sharp_ofst_min_nr;ÏÞÖÆÈñ»¯µÄ×îÐ¡Öµ·¶Î§                                                                       
0xd6, 0x0b, //[4:0] sharp_k_val                                                                                  
0xf0, 0x7f,	//Sharp_mdy_top
0xf1, 0x14,	//Sharp_mdy_bot

//;skin sharpen                                                                                    
0xfd, 0x01, //                                                                    
0xb1, 0xf0,	//Skin_sharp_delta 
                                                                            
0xfd, 0x02,                                                                                   
0xdc, 0x07, //skin_sharp_sel                                                                                  
0x05, 0x08, //Skin_num_th2 

//;bpc                                                                                 
0xfd, 0x01,                                                                               
0x26, 0x33, //[7:4] dpc_range_ratio_outdoor[3:0] dpc_range_ratio_nr                                                                                  
0x27, 0x99, //[7:4] dpc_range_ratio_dummy [3:0] dpc_range_ratio_low                                                                                  
0x62, 0xf0, //Dpc_grad_thr_outdoor                                                                                  
0x63, 0x80, //Dpc_grad_thr_nr                                                                                  
0x64, 0x80, //Dpc_grad_thr_dummy                                                                                  
0x65, 0x20, //Dpc_grad_thr_low
 
//;dns                                                                                 
/*
0xdd
[7] raw_gflt_en_outdoor
[6] raw_gflt_en_nr
[5] raw_gflt_en_dummy
[4] raw_gflt_en_low
[3] raw_denoise_en_outdoor
[2] raw_denoise_en_nr
[1] raw_denoise_en_dummy
[0] raw_denoise_en_low
*/ 
0xfd, 0x02,                                                                              
0xdd, 0xff,//0xff,(Æ½»¬Ê¹ÄÜ£º0xff)    //whl
                                                                              

/*
P1:0xa8 raw_dif_thr_outdoor 7~0 Raw_dif_thr_outdoor 0x04
P1:0xa9 raw_dif_thr_normal 7~0 Raw_dif_thr_normal 0x04
P1:0xaa raw_dif_thr_dummy 7~0 Raw_dif_thr_dummy 0x04
P1:0xab raw_dif_thr_low_light 7~0 Raw_dif_thr_low_light 0x04
*/ 
//whl
0xfd,0x01	,       
0xa8,0x00,	//;µ¥Í¨µÀ¼äÆ½»¬ãÐÖµ   
0xa9,0x09,
0xaa,0x09,  
0xab,0x0c ,     
0xd3,0x00,	//;GrGbÆ½»¬ãÐÖµ
0xd4,0x09,
0xd5,0x09,
0xd6,0x0c, 
           
0xcf,0xc0,//Gr\GbÖ®¼äÆ½»¬Ç¿¶È     
0xd0,0xc0,	   
0xd1,0x80,	 
0xd2,0x80,
	     
0xdf,0xc0,//	;Gr¡¢Gbµ¥Í¨µÀÄÚÆ½»¬Ç¿¶È 
0xe0,0xc0 , 
0xe1,0x80 , 
0xe2,0x80,    
  
0xe3,0xc0,//	;R¡¢BÆ½»¬Ç¿¶È  
0xe4,0x80	, 
0xe5,0x80,	  
0xe6,0x80,	   

/*
;CCM 
P2:0xa0 c00_eff1_8lsb 7~0 C00_eff1_8lsb for color correction 0x8c
P2:0xa1 c01_eff1_8lsb 7~0 C01_eff1_8lsb for color correction 0x00
P2:0xa2 c02_eff1_8lsb 7~0 C02_eff1_8lsb for color correction 0xf4
P2:0xa3 c10_eff1_8lsb 7~0 C10_eff1_8lsb for color correction 0xfa
P2:0xa4 c11_eff1_8lsb 7~0 C11_eff1_8lsb for color correction 0xa0
P2:0xa5 c12_eff1_8lsb 7~0 C12_eff1_8lsb for color correction 0xe7
P2:0xa6 c20_eff1_8lsb 7~0 C20_eff1_8lsb for color correction 0x0c
P2:0xa7 c21_eff1_8lsb 7~0 C21_eff1_8lsb for color correction 0xcd
P2:0xa8 c22_eff1_8lsb 7~0 C22_eff1_8lsb for color correction 0xa6
P2:0xac c00_eff2_8lsb 7~0 C00_eff2_8lsb for color correction 0xa2
P2:0xad c01_eff2_8lsb 7~0 C01_eff2_8lsb for color correction 0x04
P2:0xae c02_eff2_8lsb 7~0 C02_eff2_8lsb for color correction 0xda
P2:0xaf c10_eff2_8lsb 7~0 C10_eff2_8lsb for color correction 0xcd
P2:0xb0 c11_eff2_8lsb 7~0 C11_eff2_8lsb for color correction 0xd9
P2:0xb1 c12_eff2_8lsb 7~0 C12_eff2_8lsb for color correction 0xda
P2:0xb2 c20_eff2_8lsb 7~0 C20_eff2_8lsb for color correction 0xf6
P2:0xb3 c21_eff2_8lsb 7~0 C21_eff2_8lsb for color correction 0x98
P2:0xb4 c22_eff2_8lsb 7~0 C22_eff2_8lsb for color correction 0xf3
*/                                                                                  
0xfd, 0x02,                                                                              
0x15, 0xe0, //;b>th For f light judge                                                                            
0x16, 0x95, //;r<th For f light judge   
#if 0
0xa0, 0x9b, //;C00_eff1_8lsb for color correction                                                                               
0xa1, 0xe4, //C01_eff1_8lsb for color correction                                                                                  
0xa2, 0x01, //                                                                                  
0xa3, 0xf2,                                                                                   
0xa4, 0x8f,                                                                                   
0xa5, 0xff,                                                                                   
0xa6, 0x01,                                                                                   
0xa7, 0xdb,                                                                                   
0xa8, 0xa4,
#else
0xa0 ,0xa5,
0xa1 ,0xe4,
0xa2 ,0xf7,
0xa3 ,0xf2,
0xa4 ,0x8f,
0xa5 ,0xff,
0xa6 ,0x01,
0xa7 ,0xdb,
0xa8 ,0xa4,

#endif
0xac, 0x80, //;F                                                                                
0xad, 0x21,                                                                                   
0xae, 0xdf,                                                                                   
0xaf, 0xf2,                                                                                   
0xb0, 0xa0,                                                                                   
0xb1, 0xee,                                                                                   
0xb2, 0xea,                                                                                   
0xb3, 0xd9,                                                                                   
0xb4, 0xbd,//C22_eff2_8lsb for color correction 



/*
Saturation
P1:0xb3 sat_u_s1 7~0
Saturation U at Auto Saturation Control segment 1 when in the outdoor mode
0x98
P1:0xb4 sat_u_s2 7~0
Saturation U at Auto Saturation Control segment 2 when in the normal mode
0x98
P1:0xb5 sat_u_s3 7~0
Saturation U at Auto Saturation Control segment 3 when in the dummy mode
0x88
P1:0xb6 sat_u_s4 7~0
Saturation U at Auto Saturation Control segment 4 when in the low mode
0x7f
P1:0xb7 sat_v_s1 7~0
Saturation V at Auto Saturation Control segment 1 when in the outdoor mode
0x92
P1:0xb8 sat_v_s2 7~0
Saturation V at Auto Saturation Control segment 2 when in the normal mode
0x92
P1:0xb9 sat_v_s3 7~0
Saturation V at Auto Saturation Control segment 3 when in the dummy mode
0x82
P1:0xba sat_v_s4 7~0
Saturation V at Auto Saturation Control segment 4 when in the low mode
*/                                                                                  
0xfd, 0x01, //;sat u B                                                                          
0xb3, 0xb0,                                                                                   
0xb4, 0xb0,//0xa0,//0x90, //(±¥ºÍ¶È)                                                                                
0xb5, 0xb0,//0x98,//0x70,                                                                                   
0xb6, 0xb0,//0x90,//0x55, 

0xb7, 0xb0,//0xb0, //;sat v R                                                                          
0xb8, 0xb0,//0xa0,//0x90,                                                                                   
0xb9, 0xb0,//0x92,//0x70,                                                                                   
0xba, 0xb0,//0x8e,//0x55, 
                                                                                  
0xfd, 0x01, //;auto_sat                                                                         
0xbf, 0xff, //;The brightness thread of the ymean                                                                        
0x00, 0x00, //;[4] fix_state_en [2:0] fix_state_mode    
                                                                     
0xfd, 0x01, //;low_lum_offset                                                                   
0xa4, 0x00, //;Lum_limit  (liang du)                                                                     
0xa5, 0x1f, //;lum_set                                                                          
0xa6, 0x50, //;black vt                                                                         
0xa7, 0x65, //;If current luminance is bigger than it, the luminance of the frame will decrease.
 
//;gw                                                                        
0xfd, 0x02,                                                                               
0x30, 0x38, //Gw_mean_th                                                               
0x31, 0x40, //Write gw offset for calculate offset, and read  out is real offset                                                                                  
0x32, 0x40, //Gw_y_bot                                                                                  
0x33, 0xd0, //Gw_y_top                                                                                  
0x34, 0x10, //Gw_uv_radius                                                                                  
0x35, 0x60, //Swap uv pix value when it is not gray pix                                                                                  
0x36, 0x28, //Gw offset max limit                                                                                
0x37, 0x07, //[6] gw_upt_fr_en [5] gw_en_sel [2:0] Gw offset adjust step                                                                                 
0x38, 0x08, //Gw_jdg_th;(read 0x31_gw_offset>0x10,is gray image)                                         
0xe6, 0x8F, //;(bit7:4 white edge 3:0 dark edg zhiyuedafanweiyueda )   
                         
0xfd, 0x01, //;                                                                                 
0x1b, 0x0a,//0x15, //Ku_offset;(baibanshi£ºku&kljiaduoshao)                                                      
0x1c, 0x0d,//0x1A, //Kl_offset;(Read 0x31*0x1cµÄÖµ/16Îª×îÖÕ¼ÓµÄÖµ)                                                      
0x1d, 0x0c, //Auto_contrast_cttl; auto contrast enable ,bit3 outdoor  bit2 indoor bit1 dummy  bit0 lowlight  



//function enable     
0xfd, 0x01,                                                                                   
0x32, 0x05,//0x15,// [7] test_en [6] ft_test_en [5] fix_awb [4] awb2_en [2] auto_gain_en [0] ae_en  
/*
[7] Lens shading in outdoor enable
	0: disable
	1: enable
[6] Lens shading in normal enable
	0: disable
	1: enable
[5] Lens shading in dummy enable
	0: disable
	1: enable
[4] Lens shading in low light enable
	0: disable
	1: enable
[3] DPC in dummy enable
	0: disable
	1: enable
[2] DPC in outdoor enable
	0: disable
	1: enable
[1] DPC in normal enable
	0: disable
	1: enable
[0] DPC in low light enable
	0: disable
	1: enable
*/                                                                                
0x33, 0xef,   
/*
[6] raw window 
	0: enable raw window function
	1: disable
[5] binning_mode1
	1: col averge mode
	0: col sum mode
[4] ace_test
	1: aec_win select raw data
	0: aec_win select y data
[3] VSYNC Inversion
[2] HSYNC Inversion
[1] Disable HSYNC & VSYNC
[0] scale_en
*/                                                                                
0x36, 0x10, //;AEÍ³¼ÆÔÚGAmmaÖ®Ç°£¬00ÊÇAEÔÚGammaÖ®ºó                                                       
0xf6, 0x70, //y_top_ae;ÁÁÌ¬£¬·À¹ý°µ»úÖÆ£¬ÖµÔ½´ó¹ýÆØ³¡¾°¶ÔÆäËûÓ°ÏìÐ¡                                                           
0xf5, 0x08, //y_bot_ae;°µÌ¬£¬·ÀÖ¹ºÚÉ«ÎïÌå½øÈëµ¼ÖÂ¹ýÆØ£¬


/*
AE WINDOWN
P1:0xd7 sat_ypix_thr1 7~0 Sat_ypix_thr1 0x04
P1:0xd8 sat_ypix_thr2 7~0 Sat_ypix_thr2 0x04
P1:0xd9 sat_ypix_thr3 7~0 Sat_ypix_thr3 0x10
P1:0xda sat_ypix_thr4 7~0 Sat_ypix_thr4 0x20
P1:0xdb sat_yadt_fac1 7~0 Sat_yadt_fac1 0x50
P1:0xdc sat_yadt_fac2 7~0 Sat_yadt_fac2 0x30
P1:0xdd sat_yadt_fac3 7~0 Sat_yadt_fac3 0x10
P1:0xde sat_yadt_fac4 7~0 Sat_yadt_fac4 0x09
*/                                                                 
0xd7, 0x3a, //;tbh                                                                              
0xd8, 0x10,                                                                                   
0xd9, 0x20,                                                                                   
0xda, 0x10,                                                                                   
0xdb, 0x7a,                                                                                   
0xdc, 0x3a,                                                                                   
0xdd, 0x30,                                                                                   
0xde, 0x30,                                                                                   
0xe7, 0x3a, //Sat_bot         
//cai zao
0x9c, 0xaa, //;u_v_th_outdoor                                                                           
0x9d, 0xaa, //u_v_th_nr                                                                                  
0x9e, 0x33,//0x55, //u_v_th_dummy                                                                                  
0x9f, 0x33,//0x55,	//u_v_th_low
                                                                                   
0xfd, 0x00,                                                                                   
0x1c, 0x00,                           

//0xfd, 0x02, 
//0x75, 0x11,


0xfd, 0x01, 

0x28, 0x00,
0x29, 0x01,
0x2a, 0xe0,
0x2b, 0xa0,
0x2c, 0x01,
0x2d, 0xe0,

//20241010
#if 0
//fps_set(15-25)
0xfd, 0x00,
0x03, 0x02,
0x04, 0xd0,
0x05, 0x00,
0x06, 0x00,
0x09, 0x01,
0x0a, 0x68,
0xfd, 0x01,
0xf7 ,0x78,
0x02 , 0x06,
0x03 , 0x01,
0x06 , 0x78,
0x07 , 0x00,
0x08 , 0x01,
0x09 , 0x00,
0xfd , 0x02,
0xbe , 0xd0,
0xbf , 0x02,
0xd0 , 0xd0,
0xd1 , 0x02,
#else
//fps20-25
0xfd,0x00,
0x03,0x02,
0x04,0xd0,
0x05,0x00,
0x06,0x00,
0x09,0x01,
0x0a,0x68,
0xfd,0x01,
0xf7,0x78,
0x02,0x05,
0x03,0x01,
0x06,0x78,
0x07,0x00,
0x08,0x01,
0x09,0x00,
0xfd,0x02,
0xbe,0x58,
0xbf,0x02,
0xd0,0x58,
0xd1,0x02,

#endif
//
0xfd,0x01,
0xdb,0x00,	//buf_heq_offset £¬ÔÚAEÖ®ºó×öÁË¸öÔö¼ÓÁÁ¶ÈµÄ¼Ä´æÆ÷
0x0f,0x20,	//k_max£¬Ò»°ã²»ÐÞ¸Ä
0x10,0x98,//0x88,	//ku_outdoor
0x11,0x98,//0x88,	//ku_nr
0x12,0xa0,//0x90,	//ku_dummy
0x13,0xa0,//0x90,	//kl_low
0x14,0xaa,//0x9a,	//kl_outdorr
0x15,0xaa,//0x9a,	//kl_nr
0x16,0x9b,//0x8b,	//kl_dummy
0x17,0x98,//0x88,	//klµÍ



#endif 

//================================================================================

#if 1	//20241015(wang_finally) sensor_0A83(18-22)
0xfd, 0x00,  
/*
[7] ds_i2c
[6:5] ds_data
[4] pd_dig
*/                                                                                 
0x1d, 0x25,      
/*
¾µÏñ/·­×ª
Normal 0x31[2:1] 00
Mirror 0x31[2:1] 01
Flip 0x31[2:1] 10
Mirror & Flip 0x31[2:1] 11
*/                                                                      
0x31, 0x06,//0x00, //comm_ctrl_reg 

/*
[2] ext_sync_sel
[1:0] pvdd_sel
*/                                                                                 
0x32, 0x01,                                                                                   
0x30, 0x01, //[2:0] dclk_ctrl
                                                                                  
0xfd, 0x00,  //                                                                                  
0xf0, 0xff, //gb_suboffset                                                                             
0xf1, 0xff, //gr_suboffset                                                                                  
0xf2, 0xff, //red_suboffset                                                                                  
0xf3, 0xff, //blue_suboffset                                                                                  
0xfc, 0x50, //blc_dpc_th_p_8lsb 
                                                                          
0xfd, 0x01, 
/*
[5:4] lsc_position_set Raw order set for awb gain and lsc gain
[3:2] awb_position_set
[1:0] bayer order set for demosaic
*/                                                                                  
0x5d, 0x01,  
/*
½µÔë£¬±ßÑØÔöÇ¿£¬Ù¤Âí£¬É«²Ê¾ØÕó
[7] dpc_flt_en
[6] dpc_dirtm_en
[5] gamma_en2(raw gamma)
[4] domu_en
[3] sharp_mdy_en
[2] dpc_low_en
[1] gamma correction(y gamma)
[0] color correction
*/                                                                                 
0x34, 0xe2,
/*
[7] raw_mid8_en
[6] raw_low8_en
[5] add_row4_col4_en
[4] swap byte
0:u y v y
1:y u y v
[3] unpro_raw_out_en
[2] y_out_en
[0] yuv_order
0: U Y V Y
1: V Y U Y
*/                                                                                   
0x35, 0x10, 
                                                                                  
0xfd, 0x00, //; ae setting                                                                      
0x03, 0x03, //Integration time high 3 bits                                                                                  
0x04, 0x6c, //Integration time low 8 bits                                                                                
0x24, 0x10, //pga_gain_ctl                                                                                   
0xef, 0x40,                                                                                   
0x06, 0x00, //Vsync blank                                                                                  
0x09, 0x00, //hblank_4msb                                                                                  
0x0a, 0x80, //hblank_8lsb                                                                                  
0x10, 0x0a,//;07  by wwj 0124                                                                   
0x11, 0x02,//;04  by wwj 0124

/*
[1] dac_mode
[0] FPN_33ms_timing_sel
*/                                                                   
0x16, 0x01,  
/*
[6:4] icomp1
[1:0] icomp2
*/                                                                                 
0x19, 0x22,                                                                                   
0x1e, 0x60,//;58 by wwj 0124                                                                    
0x29, 0x60,//;48 by wwj 0124  
/*
[5] cp_num
[4:3] spi_clk_delay
[2:0] vcp_sel_ctl
*/                                                                  
0x13, 0x37, 
/*
[5:4] ds_hsync
[3:2] ds_vsync
[1:0] ds_pclk
*/                                                                                  
0x14, 0x01,                                                                                   
0x25, 0x01,                                                                                   
0x2a, 0x06,                                                                                   
0x27, 0x00,//   by wwj 0218                                                                     
0x54, 0x00,                                                                                   
0x55, 0x10,                                                                                   
0x58, 0x28,//;38 by wwj 0124                                                                    
0x5d, 0x12,                                                                                   
0x63, 0x00,                                                                                   
0x64, 0x00,                                                                                   
0x66, 0x2a,//;28   by wwj 0218                                                                  
0x68, 0x28,//;2a   by wwj 0218                                                                  
0x72, 0x32,//;3a by wwj 0124                                                                    
0x73, 0x0a,                                                                                   
0x75, 0x30,//;48 by wwj 0124                                                                    
0x76, 0x0a,                                                                                   
0x1f, 0x99,//;77  by wwj 0215                                                                   
0x20, 0x09,//;/7 by wwj 0215                                                                     
0xfb, 0x16, 

//AEC                                                                                  
0xfd, 0x01,
/*
[6] lum_down_en
[5] exp_max_en
[4] exp_accr_sel
[3] outdoor_mode_en
1: enable
0: disable
[2:0] mean_mode_reg
The value must be bigger than 2
*/                                                                                   
0xf2, 0x69,//0x6b,//0x69,  (shou guang su du)                                                                                 
0xf7, 0x97, //;ABF exp base time is line number equal to 10 ms                                                                             
0x02, 0x08, //;Exp_max_indr   Ö¡ÂÊÏÞÖÆ                                                                     
0x03, 0x01, //;Exp_min_indr                                                                        
0x06, 0x8a, //;exp_max_outdr                                                                    
0x08, 0x01, //;Exp_min_outdr  Ö¡ÂÊÏÞÖÆ  
                                                              
0xfd, 0x02, //;ae gain &status                                                                  
0xb8, 0x50, //;Luminance Low threshold from normal mode to dummy mode                                                                 
0xb9, 0xff, //;Luminance Low threshold from dummy mode to normal mode                                                                 
0xba, 0x40, //;Luminance Low threshold from dummy mode to low light mod                                                              
0xbb, 0x45, //;Luminance high threshold from low light mode to dummy mod                                                               
0xbc, 0xc0, //;RPC low threshold from dummy mode to low light mod                                                                    
0xbd, 0x50, //;                                                                
0xbe, 0xb8, //;exp_heq_dummy 8 LSM Exp_heq_dummy: exposure time low threshold from normal mode to dummy mode                                                                 
0xbf, 0x04, //Exp_heq_dummy_5hsm                                                                                  
0xd0, 0xb8, //Exp 8lsb threshold from dummy mode to low mode                                                                
0xd1, 0x04, //Exp 3msb threshold from dummy mode to low mode 
                                                                                 
0xfd, 0x01, //;rpc    
#if 0
0xc0, 0x1f, //;rpc_1base_max                                                                    
0xc1, 0x18, //;rpc_2base_max                                                                    
0xc2, 0x15, //;rpc_3base_max                                                                    
0xc3, 0x13, //;rpc_4base_max                                                                    
0xc4, 0x13, //;rpc_5base_max                                                                    
0xc5, 0x12, //;rpc_6base_max                                                                    
0xc6, 0x12, //;rpc_7base_max                                                                    
0xc7, 0x11, //;rpc_8base_max                                                                    
0xc8, 0x11, //;rpc_9base_max                                                                    
0xc9, 0x11, //;rpc_10base_max                                                                   
0xca, 0x10, //;rpc_11base_max                                                                   
0xf3, 0x10, //;rpc_12base_max                                                                   
0xf4, 0x10, //;rpc_13base_max    
                                                               
0xfd, 0x01, //;ae min gain                                                                      
0x04, 0xff, //;rpc_max_indr                                                                     
0x05, 0x10, //;rpc_min_indr                                                                     
0x0a, 0x30, //;rpc_max_outdr                                                                    
0x0b, 0x10, //;rpc_min_outdr 
#else
//0x10-0x1f
0xc0, 0x1f, //;rpc_1base_max                                                                    
0xc1, 0x18, //;rpc_2base_max                                                                    
0xc2, 0x15, //;rpc_3base_max                                                                    
0xc3, 0x13, //;rpc_4base_max                                                                    
0xc4, 0x13, //;rpc_5base_max                                                                    
0xc5, 0x12, //;rpc_6base_max                                                                    
0xc6, 0x12, //;rpc_7base_max                                                                    
0xc7, 0x11, //;rpc_8base_max                                                                    
0xc8, 0x11, //;rpc_9base_max                                                                    
0xc9, 0x11, //;rpc_10base_max                                                                   
0xca, 0x10, //;rpc_11base_max   
                                                               
0xfd, 0x01, //;ae min gain                                                                      
0x04, 0x20, //;rpc_max_indr   ()                                                                  
0x05, 0x10, //;rpc_min_indr                                                                     
0x0a, 0x20, //;rpc_max_outdr                                                                    
0x0b, 0x10, //;rpc_min_outdr

#endif
0xfd, 0x01, //;target                                                                           
0xcb, 0x38, //;Hold threshold of dark pixel value at indoor                                                                     
0xcc, 0x35, //;Hold threshold of bright pixel value at indoor                                                                     
0xcd, 0x03, //;Hold threshold of dark pixel value at outdoor                                                                       
0xce, 0x05, //;Hold threshold of bright pixel value at outdoor  
                                                                     
0xfd, 0x00, //;
/*
[5] bl_gain_en Should be set to 1'b0
[4] bl_dpc_en
	1¡¯b1: enable dark row dpc
	1¡¯b0: disable
[2] exp_update_en
	1¡¯b1: blc update when exp change
	1¡¯b0: disable
[1] rpc_update_en
	1¡¯b1: blc update when rpc change
	1¡¯b0: disable
[0] free_update_en
	1¡¯b1: blc update every frame
	1¡¯b0: disable
*/                                                                                 
0xfb, 0x16, //;                                                                                 
0x35, 0xaa, //; Glb_gain[7:0]

                                                                                
0xfd, 0x01, //;lsc                                                                              
0x1e, 0x00, //Lsc_sig_ru[6:4] Lsc_sig_lu[2:0]                                                                                  
0x20, 0x00, //Lsc_sig_rd[6:4] Lsc_sig_ld[2:0]                                                                                  
0x84, 0x25, //Lens shading parameter, left side, R channel                                                                                  
0x85, 0x25, //Lens shading parameter, right side, R channel                                                                                  
0x86, 0x1f, //Lens shading parameter, upper side, R channel                                                                                 
0x87, 0x23,                                                                                   
0x88, 0x1c,                                                                                   
0x89, 0x20,                                                                                   
0x8a, 0x1a,                                                                                   
0x8b, 0x15,                                                                                   
0x8c, 0x15,                                                                                   
0x8d, 0x1a,                                                                                   
0x8e, 0x0a,                                                                                   
0x8f, 0x13,                                                                                   
0x90, 0x13,                                                                                   
0x91, 0x00,                                                                                   
0x92, 0x0a,                                                                                   
0x93, 0x08,                                                                                   
0x94, 0x12,                                                                                   
0x95, 0x00,                                                                                   
0x96, 0x0a,                                                                                   
0x97, 0x08,                                                                                   
0x98, 0x15,                                                                                   
0x99, 0x00,                                                                                   
0x9a, 0x0a,                                                                                   
0x9b, 0x05,//Lens shading parameter, right-down side, B channel                                                                                   
0xe8, 0x20,//Ae_thr_low                                                                                   
0xe9, 0x0f,//Slope_k                                                                                   
0xea, 0x00,//Ae_gain_min_ratio                                                                                   
0xbd, 0x1e,	                                                                                 
0xbe, 0x00,   
                                                                                
0xfd, 0x01,                                                                                   
0xa4, 0x00, //;lum_limit                                                                        
0x0e, 0x80, //;heq_mean  outdoor,indoor                                                         
0x18, 0x80, //;heq_mean  dummy,lowlight                                                         
0x0f, 0x20, //;k_max                                                                            
0x10, 0x90, //;ku_outdoor                                                                       
0x11, 0x80, //;ku_nr                                                                            
0x12, 0x80, //;ku_dummy                                                                         
0x13, 0xa0, //;ku_low                                                                           
0x14, 0x80, //;kl_outdoor                                                                       
0x15, 0x90, //;kl_nr                                                                            
0x16, 0x85, //;kl_dummy                                                                         
0x17, 0x85, //;kl_low 
    
//;gamma   
#if 0
0x6e, 0x00,                                                                           
0x6f, 0x03,                                                                                   
0x70, 0x07,                                                                                   
0x71, 0x0d,                                                                                   
0x72, 0x17,                                                                                   
0x73, 0x29,                                                                                   
0x74, 0x3d,                                                                                   
0x75, 0x4f,                                                                                   
0x76, 0x5f,                                                                                   
0x77, 0x79,                                                                                   
0x78, 0x8c,                                                                                   
0x79, 0x9d,                                                                                   
0x7a, 0xa9,                                                                                   
0x7b, 0xb3,                                                                                   
0x7c, 0xbe,                                                                                   
0x7d, 0xc7,                                                                                   
0x7e, 0xd0,                                                                                   
0x7f, 0xd6,                                                                                   
0x80, 0xde,
0x81, 0xe4,                                                                                   
0x82, 0xe9,                                                                                   
0x83, 0xee, 

#else
//0x6e, 0x00,                                                                           
//0x6f, 0x0f,//0x03,                                                                                   
//0x70, 0x1c,//0x07,                                                                                   
//0x71, 0x2a,//0x0d,                                                                                   
//0x72, 0x37,//0x17,                                                                                   
//0x73, 0x4b,//0x29,                                                                                   
//0x74, 0x5e,//0x3d,                                                                                   
//0x75, 0x6c,//0x4f,                                                                                   
//0x76, 0x78,//0x5f,                                                                                   
//0x77, 0x84,//0x79,                                                                                   
//0x78, 0x90,//0x8c,                                                                                   
//0x79, 0x9d,                                                                                   
//0x7a, 0xa9,                                                                                   
//0x7b, 0xb3,                                                                                   
//0x7c, 0xbe,                                                                                   
//0x7d, 0xc7,                                                                                   
//0x7e, 0xd0,                                                                                   
//0x7f, 0xd6,                                                                                   
//0x80, 0xde,
//0x81, 0xe4,                                                                                   
//0x82, 0xe9,                                                                                   
//0x83, 0xee,


//20241010
0x6e,0x00,
0x6f,0x20,
0x70,0x2d,
0x71,0x37,
0x72,0x40,
0x73,0x4e,
0x74,0x5a,
0x75,0x65,
0x76,0x6e,
0x77,0x80,
0x78,0x8f,
0x79,0x9c,
0x7a,0xa9,
0x7b,0xb5,
0x7c,0xc0,
0x7d,0xca,
0x7e,0xd4,
0x7f,0xdd,
0x80,0xe6,
0x81,0xef,
0x82,0xf7,
0x83,0xff,



#endif

                                                                                 
0xfd, 0x02, //;skin detect                                                                      
0x09, 0x06,                                                                                   
0x0d, 0x1a,                                                                                   
0x1c, 0x09,                                                                                   
0x1d, 0x03,                                                                                   
0x1e, 0x10, //;awb                                                                              
0x1f, 0x06,  
                                                                                 
0xfd, 0x01,                                                                                   
0x32, 0x00,
                                                                                   
0xfd, 0x02,   
0x26, 0xd0,//0xf5,//0xef,//0xcb,  //awb_r gain                                                                                 
0x27, 0x80,//0x80,//0xc2,  //awb_blue gain

//grenn add 0x26,0x27
0x10, 0x00, //;br offset                                                                        
0x11, 0x00, //;br offset_f                                                                      
0x18, 0x17,                                                                                   
0x19, 0x36,                                                                                   
0x2a, 0x01,                                                                                   
0x2b, 0x10,                                                                                   
0x28, 0xf8,                                                                                   
0x29, 0x08,                                                                                   
0x66, 0x5F, //;d65 10                                                                           
0x67, 0x7f,                                                                                   
0x68, 0xE0,                                                                                   
0x69, 0x10,                                                                                   
0x6a, 0xa6,    

0x7c, 0x4A, //;indoor 11                                                                        
0x7d, 0x80,                                                                                   
0x7e, 0x00,                                                                                   
0x7f, 0x30,//0x30,  

0x80, 0xaa,                                                                                   
0x70, 0x32, //;cwf 12                                                                           
0x71, 0x60,                                                                                   
0x72, 0x30,                                                                                   
0x73, 0x5a,                                                                                   
0x74, 0xaa,                                                                                   
0x6b, 0xff, //;tl84 13                                                                          
0x6c, 0x50,                                                                                   
0x6d, 0x40,                                                                                   
0x6e, 0x60,                                                                                   
0x6f, 0x6a,                                                                                   
0x61, 0xff, //;f 14                                                                             
0x62, 0x27,                                                                                   
0x63, 0x51,                                                                                   
0x64, 0x7f,                                                                                   
0x65, 0x6a,                                                                                   
0x75, 0x80,                                                                                   
0x76, 0x09,                                                                                   
0x77, 0x02,                                                                                   
0x0e, 0x12,                                                                                   
0x3b, 0x09,                                                                                   
0x48, 0xea, //;green u center                                                                   
0x49, 0xfc, //;green v center                                                                   
0x4a, 0x05, //;green range                                                                      
0x02, 0x00, //;outdoor awb exp 5msb                                                             
0x03, 0x88, //;outdoor awb exp 8lsb                                                             
0xf5, 0xfe, //;a8 ;outdoor awb rgain top                                                        
0x22, 0xfe, //;sharp                                                                            
0x20, 0xfe,                                                                                   
0xf7, 0xfe, 
 
 
/*sharpen*/                                                                                 
 
/*
0xde
[3] raw sharpen enable, in outdoor
[2] raw sharpen enable, in normal
[1] raw sharpen enable, in dummy
[0] raw sharpen enable, in low light
0x0f
*/
0xfd, 0x02,                                                                               
0xde, 0x0f,                                                                                   
0xcf, 0x0a, //;Sharp_flat_thr0   
/*
P2:0xd7 sharp_flat_thr1 7~0 Edge threshold in analog gain is 2* 0x10
P2:0xd8 sharp_flat_thr2 7~0 Edge threshold in analog gain is 4* 0x16
P2:0xd9 sharp_flat_thr3 7~0 Edge threshold in analog gain is 8* 0x18
P2:0xda sharp_flat_thr4 7~0 Edge threshold in analog gain is 16* 0x20
*/                                                                           
//0xd7, 0x0a,                                                                                   
//0xd8, 0x12,                                                                                   
//0xd9, 0x14,                                                                                   
//0xda, 0x1a, 
//                                                                                  
0xdc, 0x07, //Sharpness gain in skin area
/*
P2:0xe8 sharp_fac_pos_outdoor 7~0
Sharpness gain for increasing pixel¡¯s Y, in outdoor0x30
P2:0xe9 sharp_fac_pos_nr 7~0 Sharpness gain for increasing pixel¡¯s Y,in normal0x30 
P2:0xea sharp_fac_pos_dummy 7~0 Sharpness gain for increasing pixel¡¯s Y,in dummy0x20
P2:0xeb sharp_fac_pos_low 7~0 Sharpness gain for increasing pixel¡¯s Y,in lowlight 0x18
P2:0xec sharp_fac_neg_outdoor 7~0 Sharpness gain for decreasing pixel¡¯s Y, in outdoor 0x30
P2:0xed sharp_fac_neg_nr 7~0Sharpness gain for decreasing pixel¡¯s Y, in normal 0x30
P2:0xee sharp_fac_neg_dummy 7~0Sharpness gain for decreasing pixel¡¯s Y, in dummy0x20
P2:0xef sharp_fac_neg_low 7~0Sharpness gain for decreasing pixel¡¯s Y, in low light
*/        
#if 1
0xe8, 0x60, //;ÕýÖµ·¶Î§(Èñ»¯)                                                                             
0xe9, 0x40, //���޸���ȣ����ػ��ף��Ĵ�������ӣ���С����ȼ�С��                                                                                 
0xea, 0x40,                                                                                   
0xeb, 0x30,                                                                                   
0xec, 0x60, //;¸ºÖµ·¶Î§                                                                             
0xed, 0x50,                                                                                   
0xee, 0x40,                                                                                   
0xef, 0x30,  
#else
0xe8, 0x80,//0x60, //;ÕýÖµ·¶Î§(Èñ»¯)                                                                             
0xe9, 0x60,//0x40,                                                                                   
0xea, 0x60,//0x40,                                                                                   
0xeb, 0x50,//0x30,                                                                                   
0xec, 0x80,//0x60, //;¸ºÖµ·¶Î§                                                                             
0xed, 0x70,//0x50,                                                                                   
0xee, 0x60,//0x40,                                                                                   
0xef, 0x50,//0x30, 

#endif

0xd3, 0XC0,//0x30, //Sharp_ofst_pos;Õý±ßÔµÈñ»¯·¶Î§£¬ÏÞÖÆÕý±ßÔµµÄÈñ»¯Á¿£» ¸ÃÖµÔ½´ó£¬Èñ»¯·¶Î§Ô½´ó                                                   
0xd4, 0X28,//0xc0, //Sharp_ofst_neg;¸º                                                                                
0xd5, 0X80,//0x50, //Sharp_ofst_min_nr;ÏÞÖÆÈñ»¯µÄ×îÐ¡Öµ·¶Î§                                                                       
0xd6, 0x0b, //[4:0] sharp_k_val                                                                                  
0xf0, 0x7f,	//Sharp_mdy_top
0xf1, 0x14,	//Sharp_mdy_bot

//;skin sharpen                                                                                    
0xfd, 0x01, //                                                                    
0xb1, 0xf0,	//Skin_sharp_delta 
                                                                            
0xfd, 0x02,                                                                                   
0xdc, 0x07, //skin_sharp_sel                                                                                  
0x05, 0x08, //Skin_num_th2 

//;bpc                                                                                 
0xfd, 0x01,                                                                               
0x26, 0x33, //[7:4] dpc_range_ratio_outdoor[3:0] dpc_range_ratio_nr                                                                                  
0x27, 0x99, //[7:4] dpc_range_ratio_dummy [3:0] dpc_range_ratio_low                                                                                  
0x62, 0xf0, //Dpc_grad_thr_outdoor                                                                                  
0x63, 0x80, //Dpc_grad_thr_nr                                                                                  
0x64, 0x80, //Dpc_grad_thr_dummy                                                                                  
0x65, 0x20, //Dpc_grad_thr_low
 
//;dns                                                                                 
/*
0xdd
[7] raw_gflt_en_outdoor
[6] raw_gflt_en_nr
[5] raw_gflt_en_dummy
[4] raw_gflt_en_low
[3] raw_denoise_en_outdoor
[2] raw_denoise_en_nr
[1] raw_denoise_en_dummy
[0] raw_denoise_en_low
*/ 
0xfd, 0x02,                                                                              
0xdd, 0xf0,//0xff,(Æ½»¬Ê¹ÄÜ£º0xff)  
                                                                              

/*
P1:0xa8 raw_dif_thr_outdoor 7~0 Raw_dif_thr_outdoor 0x04
P1:0xa9 raw_dif_thr_normal 7~0 Raw_dif_thr_normal 0x04
P1:0xaa raw_dif_thr_dummy 7~0 Raw_dif_thr_dummy 0x04
P1:0xab raw_dif_thr_low_light 7~0 Raw_dif_thr_low_light 0x04
*/ 
0xfd, 0x01, 
#if 0
0xa8, 0x00, //;µ¥Í¨µÀ¼äÆ½»¬ãÐÖµ                                                                         
0xa9, 0x02,	//0x09,                                                                                   
0xaa, 0x02, //0x09                                                                                  
0xab, 0x05, //0x0c
#else
0xa8, 0x02, //;µ¥Í¨µÀ¼äÆ½»¬ãÐÖµ                                                                         
0xa9, 0x02,	//0x09,                                                                                   
0xaa, 0x02, //0x09                                                                                  
0xab, 0x02, //0x0c
#endif
/*
P1:0xcf raw_gflt_fac_outdoor 7~0 Raw_gflt_fac_outdoor 0x00
P1:0xd0 raw_gflt_fac_normal 7~0 Raw_gflt_fac_normal 0x00
P1:0xd1 raw_gflt_fac_dummy 7~0 Raw_gflt_fac_dummy 0x00
P1:0xd2 raw_gflt_fac_low 7~0 Raw_gflt_fac_low 0x00
P1:0xd3 raw_grgb_thr_outdoor 7~0 Raw_grgb_thr_outdoor 0x08
P1:0xd4 raw_grgb_thr_normal 7~0 Raw_grgb_thr_normal 0x08
P1:0xd5 raw_grgb_thr_dummy 7~0 Raw_grgb_thr_dummy 0x08
P1:0xd6 raw_grgb_thr_low 7~0 Raw_grgb_thr_low 0x08
P1:0xdf raw_gf_fac_outdoor 7~0 Raw_gf_fac_outdoor 0x00
P1:0xe0 raw_gf_fac_normal 7~0 Raw_gf_fac_normal 0x00
P1:0xe1 raw_gf_fac_dummy 7~0 Raw_gf_fac_dummy 0x00
P1:0xe2 raw_gf_fac_low 7~0 Raw_gf_fac_low 0x00
P1:0xe3 raw_rb_fac_outdoor 7~0 Raw_rb_fac_outdoor 0x00
P1:0xe4 raw_rb_fac_normal 7~0 Raw_rb_fac_normal 0x00
P1:0xe5 raw_rb_fac_dummy 7~0 Raw_rb_fac_dummy 0x00
P1:0xe6 raw_rb_fac_low 7~0 Raw_rb_fac_low 0x00
*/     
#if 0
0xd3, 0x00, //;GrGbÆ½»¬ãÐÖµ                                                                         
0xd4, 0x09,                                                                                   
0xd5, 0x09,                                                                                   
0xd6, 0x0c, 
0xcf, 0xff, //;Gr\GbÖ®¼äÆ½»¬Ç¿¶È                                                                      
0xd0, 0xf0,                                                                                   
0xd1, 0x80,                                                                                   
0xd2, 0x80, 
0xdf, 0xff, //;Gr¡¢Gbµ¥Í¨µÀÄÚÆ½»¬Ç¿¶È                                                                    
0xe0, 0xf0,                                                                                   
0xe1, 0xd0,                                                                                   
0xe2, 0x80,                                                                                   
0xe3, 0xff, //;R¡¢BÆ½»¬Ç¿¶È                                                                          
0xe4, 0xf0,                                                                                   
0xe5, 0xd0,                                                                                   
0xe6, 0x80, 

#else
0xd3, 0x01, //;GrGbÆ½»¬ãÐÖµ                                                                         
0xd4, 0x01,                                                                                   
0xd5, 0x01,                                                                                   
0xd6, 0x01,

0xcf, 0xf0, //;Gr\GbÖ®¼äÆ½»¬Ç¿¶È                                                                      
0xd0, 0xf0,                                                                                   
0xd1, 0xf0,                                                                                   
0xd2, 0xf0,

0xdf, 0xf0, //;Gr¡¢Gbµ¥Í¨µÀÄÚÆ½»¬Ç¿¶È                                                                    
0xe0, 0xf0,                                                                                   
0xe1, 0xf0,                                                                                   
0xe2, 0xf0,                                                                                   
0xe3, 0xf0, //;R¡¢BÆ½»¬Ç¿¶È                                                                          
0xe4, 0xf0,                                                                                   
0xe5, 0xf0,                                                                                   
0xe6, 0xf0, 

#endif
 
/*
;CCM 
P2:0xa0 c00_eff1_8lsb 7~0 C00_eff1_8lsb for color correction 0x8c
P2:0xa1 c01_eff1_8lsb 7~0 C01_eff1_8lsb for color correction 0x00
P2:0xa2 c02_eff1_8lsb 7~0 C02_eff1_8lsb for color correction 0xf4
P2:0xa3 c10_eff1_8lsb 7~0 C10_eff1_8lsb for color correction 0xfa
P2:0xa4 c11_eff1_8lsb 7~0 C11_eff1_8lsb for color correction 0xa0
P2:0xa5 c12_eff1_8lsb 7~0 C12_eff1_8lsb for color correction 0xe7
P2:0xa6 c20_eff1_8lsb 7~0 C20_eff1_8lsb for color correction 0x0c
P2:0xa7 c21_eff1_8lsb 7~0 C21_eff1_8lsb for color correction 0xcd
P2:0xa8 c22_eff1_8lsb 7~0 C22_eff1_8lsb for color correction 0xa6
P2:0xac c00_eff2_8lsb 7~0 C00_eff2_8lsb for color correction 0xa2
P2:0xad c01_eff2_8lsb 7~0 C01_eff2_8lsb for color correction 0x04
P2:0xae c02_eff2_8lsb 7~0 C02_eff2_8lsb for color correction 0xda
P2:0xaf c10_eff2_8lsb 7~0 C10_eff2_8lsb for color correction 0xcd
P2:0xb0 c11_eff2_8lsb 7~0 C11_eff2_8lsb for color correction 0xd9
P2:0xb1 c12_eff2_8lsb 7~0 C12_eff2_8lsb for color correction 0xda
P2:0xb2 c20_eff2_8lsb 7~0 C20_eff2_8lsb for color correction 0xf6
P2:0xb3 c21_eff2_8lsb 7~0 C21_eff2_8lsb for color correction 0x98
P2:0xb4 c22_eff2_8lsb 7~0 C22_eff2_8lsb for color correction 0xf3
*/                                                                                  
0xfd, 0x02,                                                                              
0x15, 0xe0, //;b>th For f light judge                                                                            
0x16, 0x95, //;r<th For f light judge   
#if 0
0xa0, 0x9b, //;C00_eff1_8lsb for color correction                                                                               
0xa1, 0xe4, //C01_eff1_8lsb for color correction                                                                                  
0xa2, 0x01, //                                                                                  
0xa3, 0xf2,                                                                                   
0xa4, 0x8f,                                                                                   
0xa5, 0xff,                                                                                   
0xa6, 0x01,                                                                                   
0xa7, 0xdb,                                                                                   
0xa8, 0xa4,
#else
0xa0 ,0xa5,
0xa1 ,0xe4,
0xa2 ,0xf7,
0xa3 ,0xf2,
0xa4 ,0x8f,
0xa5 ,0xff,
0xa6 ,0x01,
0xa7 ,0xdb,
0xa8 ,0xa4,

#endif
0xac, 0x80, //;F                                                                                
0xad, 0x21,                                                                                   
0xae, 0xdf,                                                                                   
0xaf, 0xf2,                                                                                   
0xb0, 0xa0,                                                                                   
0xb1, 0xee,                                                                                   
0xb2, 0xea,                                                                                   
0xb3, 0xd9,                                                                                   
0xb4, 0xbd,//C22_eff2_8lsb for color correction 



/*
Saturation
P1:0xb3 sat_u_s1 7~0
Saturation U at Auto Saturation Control segment 1 when in the outdoor mode
0x98
P1:0xb4 sat_u_s2 7~0
Saturation U at Auto Saturation Control segment 2 when in the normal mode
0x98
P1:0xb5 sat_u_s3 7~0
Saturation U at Auto Saturation Control segment 3 when in the dummy mode
0x88
P1:0xb6 sat_u_s4 7~0
Saturation U at Auto Saturation Control segment 4 when in the low mode
0x7f
P1:0xb7 sat_v_s1 7~0
Saturation V at Auto Saturation Control segment 1 when in the outdoor mode
0x92
P1:0xb8 sat_v_s2 7~0
Saturation V at Auto Saturation Control segment 2 when in the normal mode
0x92
P1:0xb9 sat_v_s3 7~0
Saturation V at Auto Saturation Control segment 3 when in the dummy mode
0x82
P1:0xba sat_v_s4 7~0
Saturation V at Auto Saturation Control segment 4 when in the low mode
*/                                                                                  
0xfd, 0x01, //;sat u B                                                                          
0xb3, 0xb0,                                                                                   
0xb4, 0xb0,//0xa0,//0x90, //(±¥ºÍ¶È)                                                                                
0xb5, 0xb0,//0x98,//0x70,                                                                                   
0xb6, 0xb0,//0x90,//0x55, 

0xb7, 0xd0,//0xb0, //;sat v R                                                                          
0xb8, 0xd0,//0xa0,//0x90,                                                                                   
0xb9, 0xd0,//0x92,//0x70,                                                                                   
0xba, 0xd0,//0x8e,//0x55, 
                                                                                  
0xfd, 0x01, //;auto_sat                                                                         
0xbf, 0xff, //;The brightness thread of the ymean                                                                        
0x00, 0x00, //;[4] fix_state_en [2:0] fix_state_mode    
                                                                     
0xfd, 0x01, //;low_lum_offset                                                                   
0xa4, 0x00, //;Lum_limit  (liang du)                                                                     
0xa5, 0x1f, //;lum_set                                                                          
0xa6, 0x50, //;black vt                                                                         
0xa7, 0x65, //;If current luminance is bigger than it, the luminance of the frame will decrease.
 
//;gw                                                                        
0xfd, 0x02,                                                                               
0x30, 0x38, //Gw_mean_th                                                               
0x31, 0x40, //Write gw offset for calculate offset, and read  out is real offset                                                                                  
0x32, 0x40, //Gw_y_bot                                                                                  
0x33, 0xd0, //Gw_y_top                                                                                  
0x34, 0x10, //Gw_uv_radius                                                                                  
0x35, 0x60, //Swap uv pix value when it is not gray pix                                                                                  
0x36, 0x28, //Gw offset max limit                                                                                
0x37, 0x07, //[6] gw_upt_fr_en [5] gw_en_sel [2:0] Gw offset adjust step                                                                                 
0x38, 0x08, //Gw_jdg_th;(read 0x31_gw_offset>0x10,is gray image)                                         
0xe6, 0x8F, //;(bit7:4 white edge 3:0 dark edg zhiyuedafanweiyueda )   
                         
0xfd, 0x01, //;                                                                                 
0x1b, 0x0a,//0x15, //Ku_offset;(baibanshi£ºku&kljiaduoshao)                                                      
0x1c, 0x0d,//0x1A, //Kl_offset;(Read 0x31*0x1cµÄÖµ/16Îª×îÖÕ¼ÓµÄÖµ)                                                      
0x1d, 0x0c, //Auto_contrast_cttl; auto contrast enable ,bit3 outdoor  bit2 indoor bit1 dummy  bit0 lowlight  



//function enable     
0xfd, 0x01,                                                                                   
0x32, 0x05,//0x15,// [7] test_en [6] ft_test_en [5] fix_awb [4] awb2_en [2] auto_gain_en [0] ae_en  
/*
[7] Lens shading in outdoor enable
	0: disable
	1: enable
[6] Lens shading in normal enable
	0: disable
	1: enable
[5] Lens shading in dummy enable
	0: disable
	1: enable
[4] Lens shading in low light enable
	0: disable
	1: enable
[3] DPC in dummy enable
	0: disable
	1: enable
[2] DPC in outdoor enable
	0: disable
	1: enable
[1] DPC in normal enable
	0: disable
	1: enable
[0] DPC in low light enable
	0: disable
	1: enable
*/                                                                                
0x33, 0xef,   
/*
[6] raw window 
	0: enable raw window function
	1: disable
[5] binning_mode1
	1: col averge mode
	0: col sum mode
[4] ace_test
	1: aec_win select raw data
	0: aec_win select y data
[3] VSYNC Inversion
[2] HSYNC Inversion
[1] Disable HSYNC & VSYNC
[0] scale_en
*/                                                                                
0x36, 0x10, //;AEÍ³¼ÆÔÚGAmmaÖ®Ç°£¬00ÊÇAEÔÚGammaÖ®ºó                                                       
0xf6, 0x70, //y_top_ae;�޸Ķ����ع�ֵ��ֵԽС������Խ��                                                           
0xf5, 0x08, //y_bot_ae;�޸Ķ����ع�ֵ��ֵԽ������Խ��


/*
AE WINDOWN
P1:0xd7 sat_ypix_thr1 7~0 Sat_ypix_thr1 0x04
P1:0xd8 sat_ypix_thr2 7~0 Sat_ypix_thr2 0x04
P1:0xd9 sat_ypix_thr3 7~0 Sat_ypix_thr3 0x10
P1:0xda sat_ypix_thr4 7~0 Sat_ypix_thr4 0x20
P1:0xdb sat_yadt_fac1 7~0 Sat_yadt_fac1 0x50
P1:0xdc sat_yadt_fac2 7~0 Sat_yadt_fac2 0x30
P1:0xdd sat_yadt_fac3 7~0 Sat_yadt_fac3 0x10
P1:0xde sat_yadt_fac4 7~0 Sat_yadt_fac4 0x09
*/                                                                 
0xd7, 0x3a, //;tbh                                                                              
0xd8, 0x10,                                                                                   
0xd9, 0x20,                                                                                   
0xda, 0x10,                                                                                   
0xdb, 0x7a,                                                                                   
0xdc, 0x3a,                                                                                   
0xdd, 0x30,                                                                                   
0xde, 0x30,                                                                                   
0xe7, 0x3a, //Sat_bot         
//cai zao
0x9c, 0xaa, //;u_v_th_outdoor                                                                           
0x9d, 0xaa, //u_v_th_nr                                                                                  
0x9e, 0x33,//0x55, //u_v_th_dummy                                                                                  
0x9f, 0x33,//0x55,	//u_v_th_low
                                                                                   
0xfd, 0x00,                                                                                   
0x1c, 0x00,                           

//0xfd, 0x02, 
//0x75, 0x11,


0xfd, 0x01, 

0x28, 0x00,
0x29, 0x01,
0x2a, 0xe0,
0x2b, 0xa0,
0x2c, 0x01,
0x2d, 0xe0,

//20241010
#if 0
//fps_set(15-25)
0xfd, 0x00,
0x03, 0x02,
0x04, 0xd0,
0x05, 0x00,
0x06, 0x00,
0x09, 0x01,
0x0a, 0x68,
0xfd, 0x01,
0xf7 ,0x78,
0x02 , 0x06,
0x03 , 0x01,
0x06 , 0x78,
0x07 , 0x00,
0x08 , 0x01,
0x09 , 0x00,
0xfd , 0x02,
0xbe , 0xd0,
0xbf , 0x02,
0xd0 , 0xd0,
0xd1 , 0x02,
#else
//fps20-25
0xfd,0x00,
0x03,0x02,
0x04,0xd0,
0x05,0x40,//0x00,//15-20 HIGH
0x06,0x00,
0x09,0x01,//0x02,LOW
0x0a,0xa0,//0x68,
0xfd,0x01,
0xf7,0x78,
0x02,0x05,
0x03,0x01,
0x06,0x78,
0x07,0x00,
0x08,0x01,
0x09,0x00,
0xfd,0x02,
0xbe,0x58,
0xbf,0x02,
0xd0,0x58,
0xd1,0x02,

#endif
//
0xfd,0x01,
0xdb,0x00,	//buf_heq_offset £¬ÔÚAEÖ®ºó×öÁË¸öÔö¼ÓÁÁ¶ÈµÄ¼Ä´æÆ÷
0x0f,0x20,	//k_max£¬Ò»°ã²»ÐÞ¸Ä
0x10,0x98,//0xc8,	//ku_outdoor �Աȶ��޸�ֵ
0x11,0x98,//0xc8,	//ku_nr �Աȶ��޸�ֵ��ֵԽ�󣬶Աȶ�Խǿ
0x12,0xa0,//0xd0,	//ku_dummy
0x13,0xa0,//0xd0,	//kl_low
0x14,0xaa,//0xda,	//kl_outdorr �Աȶ��޸�ֵ
0x15,0xaa,//0xda,	//kl_nr �Աȶ��޸�ֵ
0x16,0x9b,//0xcb,	//kl_dummy
0x17,0x98,//0xc8,	//klµÍ



#endif 

//================================================================================

	
-1,-1,

};



SENSOR_OP_SECTION const _Sensor_Adpt_ sp0a83_cmd= 
{
	.typ = 1, //YUV
	.pixelw = 480,
	.pixelh= 480,
	.hsyn = 1,
	.vsyn = 1,
	.rduline = 0,//
	.rawwide = 1,//10bit
	.colrarray = 0,//2	//0:_RGRG_ 1:_GRGR_,2:_BGBG_,3:_GBGB_
	.init = (uint8 *)sp0a83InitTable,
	.rotate_adapt = {0},
	//.hvb_adapt = {0x6a,0x12,0x6a,0x12},
	. mclk = 24000000,
	.p_fun_adapt = {NULL,NULL,NULL},
	.p_xc7016_adapt = NULL,	
};

const _Sensor_Ident_ sp0a83_init=
{
	//0x0a,0x42,0x43,0x01,0x01,0x02
	0x01,0x42,0x43,0x01,0x01,0x02
};



#endif











