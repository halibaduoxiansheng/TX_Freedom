#ifndef __STREAM_DEFINE_H
#define __STREAM_DEFINE_H
 
//用于定义各种data的类型枚举
enum {
  DATA_TYPE_ANY,
  DATA_TYPE_AUDIO_PDM,
  DATA_TYPE_AUDIO_I2S,
  DATA_TYPE_AUDIO_ADC,
  DATA_TYPE_AUDIO_DAC,
  DATA_TYPE_JPEG_VGA,
  DATA_TYPE_JPEG_720P,
};

//定义各种流的名称,R开头代表接收的流,S开头是发送的流,SR代表既要接收又要发送的流
//名称不能相同
#define R_RECORD_AUDIO    "record-audio" //录像的音频
#define R_RECORD_JPEG    "record-jpeg" //录像的音频
#define R_PHOTO_JPEG    "photo-jpeg" //录像的音频
#define R_ALK_JPEG   "alk-jpeg"
#define R_AUDIO_TEST   "audio-test"
#define R_SPEAKER     "speaker"
#define R_JPEG_TO_LCD "JPEG-LCD"



#define R_RTP_AUDIO       "rtp-audio"     //图传的音频
#define R_RTP_JPEG       "rtp-jpeg"     //图传的视频
#define R_LVGL_JPEG       "lvgl-jpeg"     //lvgl接收回放适配



#define R_AT_SAVE_AUDIO   "AT_AUDIO"
#define R_AT_SAVE_PHOTO   "AT_PHOTO"
#define R_AT_AVI_AUDIO    "AT_AVI_AUDIO" //录像的音频
#define R_AT_AVI_JPEG     "AT_AVI_JPEG" //录像的音频




#define R_PSRAM_JPEG       "PSRM-jpeg"     //接收到psram的视频




#define S_PDM               "pdm"
#define S_ADC_AUDIO          "adc_audio"
#define S_JPEG              "jpeg"
#define S_USB_JPEG          "usb-jpeg"
#define S_USB_JPEG_PSRAM    "usb-jpeg-psram"
#define S_WEBJPEG           "web-jpeg"
#define S_PLAYBACK          "playback-jpeg"
#define S_WEBAUDIO          "web-audio"



//高16位是大类型(统一宏),低16位是细分类型
#define SET_DATA_TYPE(type1,type2) (type1<<16 | type2)
#define GET_DATA_TYPE1(type) (type>>16)
#define GET_DATA_TYPE2(type) (type&0xffff)




enum data_type1
{
  TYPE1_NONE,
  JPEG = 1,
  SOUND,
};

//0保留
enum DATA_TYPE2_RECV_ALL
{
  RESEVER_VALUE,
  RECV_ALL = RESEVER_VALUE,
};


//定义mjpeg的类型,最好自己将不同类型归类
enum JPEG_data_type2
{
  JPEG_DVP_NODE = RESEVER_VALUE + 1,  //采用特殊的节点方式
  JPEG_DVP_FULL, //采用整张图保存的方式(在空间足够下,采用正常图片形式,正常是带psram才会使用)
  JPEG_USB,
  JPEG_FILE,
};


//定义声音的类型
enum SOUND_data_type2
{
  SOUND_ALL = RECV_ALL,
  SOUND_NONE,//不接收声音,源头不要产生这个声音就好了
  SOUND_MIC ,
  SOUND_FILE,
};




//设置发送的命令,只有type1是在这里定义,type2由各个模块去定义(这个就不再有固定,因为自定义,所以在要自己在各个STREAM_SEND_CMD里面去处理识别)

#define SET_CMD_TYPE(type1,type2) (type1<<16 | type2)
#define GET_CMD_TYPE1(type) (type>>16)
#define GET_CMD_TYPE2(type) (type&0xffff)

enum cmd_type1
{
  CMD_NONE,
  CMD_AUDIO_DAC,
  CMD_JPEG_FILE,
};


#endif