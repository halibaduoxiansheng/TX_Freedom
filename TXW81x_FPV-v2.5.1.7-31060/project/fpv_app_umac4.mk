##
## Auto Generated makefile by CDK
## Do not modify this file, and any manual changes will be erased!!!   
##
## FLASH
ProjectName            :=fpv_app_umac4
ConfigurationName      :=FLASH
WorkspacePath          :=./
ProjectPath            :=./
IntermediateDirectory  :=Obj
OutDir                 :=$(IntermediateDirectory)
User                   :=Lenovo
Date                   :=03/12/2024
CDKPath                :=C:/software/CSAY/
LinkerName             :=csky-elfabiv2-gcc
LinkerNameoption       :=
SIZE                   :=csky-elfabiv2-size
READELF                :=csky-elfabiv2-readelf
CHECKSUM               :=crc32
SharedObjectLinkerName :=
ObjectSuffix           :=.o
DependSuffix           :=.d
PreprocessSuffix       :=.i
DisassemSuffix         :=.asm
IHexSuffix             :=.ihex
BinSuffix              :=.bin
ExeSuffix              :=.elf
LibSuffix              :=.a
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
ElfInfoSwitch          :=-hlS
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
UnPreprocessorSwitch   :=-U
SourceSwitch           :=-c 
ObjdumpSwitch          :=-S
ObjcopySwitch          :=-O ihex
ObjcopyBinSwitch       :=-O binary
OutputFile             :=$(ProjectName)
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :=fpv_app_umac4.txt
MakeDirCommand         :=mkdir
LinkOptions            := -mcpu=ck803s  -nostartfiles -Wl,--gc-sections -T"$(ProjectPath)/utilities/gcc_csky.ld"
LinkOtherFlagsOption   :=-Wl,-zmax-page-size=1024  -Wl,-Map=project.map
IncludePackagePath     :=
IncludeCPath           := $(IncludeSwitch). $(IncludeSwitch).. $(IncludeSwitch)../csky/configs $(IncludeSwitch)../csky/csi_core/include $(IncludeSwitch)../csky/csi_driver/include $(IncludeSwitch)../csky/csi_kernel/include $(IncludeSwitch)../csky/csi_kernel/rhino/arch/include $(IncludeSwitch)../csky/csi_kernel/rhino/common $(IncludeSwitch)../csky/csi_kernel/rhino/core/include $(IncludeSwitch)../csky/csi_kernel/rhino/driver $(IncludeSwitch)../csky/csi_kernel/rhino/pwrmgmt $(IncludeSwitch)../csky/libs/include $(IncludeSwitch)../git-svn/txw80x/hgSDK/trunk/sdk/app/test_demo $(IncludeSwitch)../sample $(IncludeSwitch)../sample/pdmSample $(IncludeSwitch)../sdk/app $(IncludeSwitch)../sdk/app/algorithm/frame_memt $(IncludeSwitch)../sdk/app/algorithm/pdmFilter $(IncludeSwitch)../sdk/app/algorithm/stream_frame $(IncludeSwitch)../sdk/app/audio_app $(IncludeSwitch)../sdk/app/avi $(IncludeSwitch)../sdk/app/ble_net $(IncludeSwitch)../sdk/app/client_code/alk_net $(IncludeSwitch)../sdk/app/client_code/canhong $(IncludeSwitch)../sdk/app/client_code/care_skin $(IncludeSwitch)../sdk/app/client_code/ear_mode $(IncludeSwitch)../sdk/app/client_code/ganyue $(IncludeSwitch)../sdk/app/client_code/guqiao $(IncludeSwitch)../sdk/app/client_code/guqiao/user_net_interface $(IncludeSwitch)../sdk/app/client_code/guqiao2 $(IncludeSwitch)../sdk/app/client_code/guqiao2/user_net_interface $(IncludeSwitch)../sdk/app/client_code/guqiao3 $(IncludeSwitch)../sdk/app/client_code/guqiao3/user_net_interface $(IncludeSwitch)../sdk/app/client_code/guqiao4 $(IncludeSwitch)../sdk/app/client_code/guqiao4/user_net_interface $(IncludeSwitch)../sdk/app/client_code/guqiao5 $(IncludeSwitch)../sdk/app/client_code/guqiao_hty $(IncludeSwitch)../sdk/app/client_code/guqiao_hty/user_net_interface $(IncludeSwitch)../sdk/app/client_code/huchong $(IncludeSwitch)../sdk/app/client_code/kailuke $(IncludeSwitch)../sdk/app/client_code/kuying $(IncludeSwitch)../sdk/app/client_code/kuying/user_net_interface $(IncludeSwitch)../sdk/app/client_code/kuying_ear $(IncludeSwitch)../sdk/app/client_code/kuying_ear/user_net_interface $(IncludeSwitch)../sdk/app/client_code/kuying_spi $(IncludeSwitch)../sdk/app/client_code/kuying_spi/user_net_interface $(IncludeSwitch)../sdk/app/client_code/tianzhiheng $(IncludeSwitch)../sdk/app/client_code/xinruihe $(IncludeSwitch)../sdk/app/client_code/yameishida $(IncludeSwitch)../sdk/app/client_code/yuanheng_720p $(IncludeSwitch)../sdk/app/custom_mem $(IncludeSwitch)../sdk/app/dhcpd_eloop $(IncludeSwitch)../sdk/app/dns_eloop $(IncludeSwitch)../sdk/app/flash $(IncludeSwitch)../sdk/app/ftp $(IncludeSwitch)../sdk/app/gsensor $(IncludeSwitch)../sdk/app/halibaduo $(IncludeSwitch)../sdk/app/halibaduo/hali_mcu_prj/project_1 $(IncludeSwitch)../sdk/app/http $(IncludeSwitch)../sdk/app/http/http_client_demo $(IncludeSwitch)../sdk/app/http/http_server_demo $(IncludeSwitch)../sdk/app/http/httpfile_client_demo $(IncludeSwitch)../sdk/app/http/httpfile_server_demo $(IncludeSwitch)../sdk/app/iot_link $(IncludeSwitch)../sdk/app/iot_link/cJSON $(IncludeSwitch)../sdk/app/iot_link/crc $(IncludeSwitch)../sdk/app/iot_link/inc $(IncludeSwitch)../sdk/app/iot_link/link_misc $(IncludeSwitch)../sdk/app/iot_link/link_ota $(IncludeSwitch)../sdk/app/iot_link/link_ota/download/https $(IncludeSwitch)../sdk/app/iot_link/network/coap/coap_al $(IncludeSwitch)../sdk/app/iot_link/network/dtls/mbedtls/mbedtls-2.16.2/include/mbedtls $(IncludeSwitch)../sdk/app/iot_link/network/dtls/mbedtls/mbedtls_port $(IncludeSwitch)../sdk/app/iot_link/network/mqtt/paho_mqtt/paho/MQTTClient-C/src $(IncludeSwitch)../sdk/app/iot_link/network/mqtt/paho_mqtt/paho/MQTTClient-C/src/FreeRTOS $(IncludeSwitch)../sdk/app/iot_link/network/mqtt/paho_mqtt/paho/MQTTClient-C/src/cc3200 $(IncludeSwitch)../sdk/app/iot_link/network/mqtt/paho_mqtt/paho/MQTTClient-C/src/linux $(IncludeSwitch)../sdk/app/iot_link/network/mqtt/paho_mqtt/paho/MQTTClient-C/src/rtthread $(IncludeSwitch)../sdk/app/iot_link/network/mqtt/paho_mqtt/paho/MQTTPacket/src $(IncludeSwitch)../sdk/app/iot_link/network/mqtt/paho_mqtt/port $(IncludeSwitch)../sdk/app/iot_link/oc/oc_coap/atiny_coap $(IncludeSwitch)../sdk/app/iot_link/oc/oc_coap/oc_coap_al $(IncludeSwitch)../sdk/app/iot_link/oc/oc_mqtt/oc_mqtt_al $(IncludeSwitch)../sdk/app/iot_link/oc/oc_mqtt/oc_mqtt_profile_v5 $(IncludeSwitch)../sdk/app/iot_link/oc/oc_mqtt/oc_mqtt_tiny_v5 $(IncludeSwitch)../sdk/app/iot_link/os/osal $(IncludeSwitch)../sdk/app/iot_link/queue $(IncludeSwitch)../sdk/app/media $(IncludeSwitch)../sdk/app/mqtt/mqtt_client_demo $(IncludeSwitch)../sdk/app/netspeedTest $(IncludeSwitch)../sdk/app/newaudio $(IncludeSwitch)../sdk/app/playback $(IncludeSwitch)../sdk/app/record $(IncludeSwitch)../sdk/app/remoteControl $(IncludeSwitch)../sdk/app/socketModule $(IncludeSwitch)../sdk/app/speedTest $(IncludeSwitch)../sdk/app/spook $(IncludeSwitch)../sdk/app/sta_interface $(IncludeSwitch)../sdk/app/test_demo $(IncludeSwitch)../sdk/app/touchkey $(IncludeSwitch)../sdk/app/update $(IncludeSwitch)../sdk/app/uthash $(IncludeSwitch)../sdk/app/video_app $(IncludeSwitch)../sdk/driver/ $(IncludeSwitch)../sdk/driver/audio $(IncludeSwitch)../sdk/driver/audio/analog $(IncludeSwitch)../sdk/driver/emac $(IncludeSwitch)../sdk/driver/tk $(IncludeSwitch)../sdk/driver/xspi $(IncludeSwitch)../sdk/include $(IncludeSwitch)../sdk/include/chip $(IncludeSwitch)../sdk/include/lib/net $(IncludeSwitch)../sdk/include/lib/net/lwip/ $(IncludeSwitch)../sdk/include/lib/net/lwip/include $(IncludeSwitch)../sdk/include/lib/net/lwip/include/posix $(IncludeSwitch)../sdk/include/lib/sdhost $(IncludeSwitch)../sdk/lib/ $(IncludeSwitch)../sdk/lib/audio $(IncludeSwitch)../sdk/lib/avformat/avi $(IncludeSwitch)../sdk/lib/bus/macbus $(IncludeSwitch)../sdk/lib/common $(IncludeSwitch)../sdk/lib/crypto/mbedtls/include $(IncludeSwitch)../sdk/lib/crypto/mbedtls/include/mbedtls $(IncludeSwitch)../sdk/lib/crypto/mbedtls/include/psa $(IncludeSwitch)../sdk/lib/crypto/mbedtls/library $(IncludeSwitch)../sdk/lib/fs $(IncludeSwitch)../sdk/lib/fs/fatfs $(IncludeSwitch)../sdk/lib/gba/src $(IncludeSwitch)../sdk/lib/gui/resorce $(IncludeSwitch)../sdk/lib/key $(IncludeSwitch)../sdk/lib/lmac/venus/module $(IncludeSwitch)../sdk/lib/lmac/venus/rf $(IncludeSwitch)../sdk/lib/lmac/venus_v2 $(IncludeSwitch)../sdk/lib/lmac/venus_v2/module $(IncludeSwitch)../sdk/lib/lmac/venus_v2/rate_control $(IncludeSwitch)../sdk/lib/lmac/venus_v2/rf $(IncludeSwitch)../sdk/lib/lvgl $(IncludeSwitch)../sdk/lib/lvgl/demos $(IncludeSwitch)../sdk/lib/lvgl/demos/benchmark $(IncludeSwitch)../sdk/lib/lvgl/demos/keypad_encoder $(IncludeSwitch)../sdk/lib/lvgl/demos/music $(IncludeSwitch)../sdk/lib/lvgl/demos/music/assets $(IncludeSwitch)../sdk/lib/lvgl/demos/stress $(IncludeSwitch)../sdk/lib/lvgl/demos/widgets $(IncludeSwitch)../sdk/lib/lvgl/examples $(IncludeSwitch)../sdk/lib/lvgl/examples/anim $(IncludeSwitch)../sdk/lib/lvgl/examples/event $(IncludeSwitch)../sdk/lib/lvgl/examples/get_started $(IncludeSwitch)../sdk/lib/lvgl/examples/layouts $(IncludeSwitch)../sdk/lib/lvgl/examples/layouts/flex $(IncludeSwitch)../sdk/lib/lvgl/examples/layouts/grid $(IncludeSwitch)../sdk/lib/lvgl/examples/libs $(IncludeSwitch)../sdk/lib/lvgl/examples/libs/bmp $(IncludeSwitch)../sdk/lib/lvgl/examples/libs/ffmpeg $(IncludeSwitch)../sdk/lib/lvgl/examples/libs/freetype $(IncludeSwitch)../sdk/lib/lvgl/examples/libs/gif $(IncludeSwitch)../sdk/lib/lvgl/examples/libs/png $(IncludeSwitch)../sdk/lib/lvgl/examples/libs/qrcode $(IncludeSwitch)../sdk/lib/lvgl/examples/libs/rlottie $(IncludeSwitch)../sdk/lib/lvgl/examples/libs/sjpg $(IncludeSwitch)../sdk/lib/lvgl/examples/libs/tiny_ttf $(IncludeSwitch)../sdk/lib/lvgl/examples/others $(IncludeSwitch)../sdk/lib/lvgl/examples/others/file_explorer $(IncludeSwitch)../sdk/lib/lvgl/examples/others/fragment $(IncludeSwitch)../sdk/lib/lvgl/examples/others/gridnav $(IncludeSwitch)../sdk/lib/lvgl/examples/others/ime $(IncludeSwitch)../sdk/lib/lvgl/examples/others/imgfont $(IncludeSwitch)../sdk/lib/lvgl/examples/others/monkey $(IncludeSwitch)../sdk/lib/lvgl/examples/others/msg $(IncludeSwitch)../sdk/lib/lvgl/examples/others/snapshot $(IncludeSwitch)../sdk/lib/lvgl/examples/porting $(IncludeSwitch)../sdk/lib/lvgl/examples/scroll $(IncludeSwitch)../sdk/lib/lvgl/examples/styles $(IncludeSwitch)../sdk/lib/lvgl/examples/widgets $(IncludeSwitch)../sdk/lib/lvgl/resorce $(IncludeSwitch)../sdk/lib/lvgl/src $(IncludeSwitch)../sdk/lib/lvgl/src/core $(IncludeSwitch)../sdk/lib/lvgl/src/draw $(IncludeSwitch)../sdk/lib/lvgl/src/draw/arm2d $(IncludeSwitch)../sdk/lib/lvgl/src/draw/gd32_ipa $(IncludeSwitch)../sdk/lib/lvgl/src/draw/nxp $(IncludeSwitch)../sdk/lib/lvgl/src/draw/nxp/pxp $(IncludeSwitch)../sdk/lib/lvgl/src/draw/nxp/vglite $(IncludeSwitch)../sdk/lib/lvgl/src/draw/sdl $(IncludeSwitch)../sdk/lib/lvgl/src/draw/stm32_dma2d $(IncludeSwitch)../sdk/lib/lvgl/src/draw/sw $(IncludeSwitch)../sdk/lib/lvgl/src/draw/swm341_dma2d $(IncludeSwitch)../sdk/lib/lvgl/src/font $(IncludeSwitch)../sdk/lib/lvgl/src/hal $(IncludeSwitch)../sdk/lib/lvgl/src/layouts/flex $(IncludeSwitch)../sdk/lib/lvgl/src/layouts/grid $(IncludeSwitch)../sdk/lib/lvgl/src/libs/bmp $(IncludeSwitch)../sdk/lib/lvgl/src/libs/ffmpeg $(IncludeSwitch)../sdk/lib/lvgl/src/libs/freetype $(IncludeSwitch)../sdk/lib/lvgl/src/libs/fsdrv $(IncludeSwitch)../sdk/lib/lvgl/src/libs/gif $(IncludeSwitch)../sdk/lib/lvgl/src/libs/png $(IncludeSwitch)../sdk/lib/lvgl/src/libs/qrcode $(IncludeSwitch)../sdk/lib/lvgl/src/libs/rlottie $(IncludeSwitch)../sdk/lib/lvgl/src/libs/sjpg $(IncludeSwitch)../sdk/lib/lvgl/src/libs/tiny_ttf $(IncludeSwitch)../sdk/lib/lvgl/src/misc $(IncludeSwitch)../sdk/lib/lvgl/src/others/file_explorer $(IncludeSwitch)../sdk/lib/lvgl/src/others/fragment $(IncludeSwitch)../sdk/lib/lvgl/src/others/gridnav $(IncludeSwitch)../sdk/lib/lvgl/src/others/ime $(IncludeSwitch)../sdk/lib/lvgl/src/others/imgfont $(IncludeSwitch)../sdk/lib/lvgl/src/others/monkey $(IncludeSwitch)../sdk/lib/lvgl/src/others/msg $(IncludeSwitch)../sdk/lib/lvgl/src/others/snapshot $(IncludeSwitch)../sdk/lib/lvgl/src/themes $(IncludeSwitch)../sdk/lib/lvgl/src/themes/basic $(IncludeSwitch)../sdk/lib/lvgl/src/themes/default $(IncludeSwitch)../sdk/lib/lvgl/src/themes/mono $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/animimg $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/arc $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/bar $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/btn $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/btnmatrix $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/calendar $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/canvas $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/chart $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/checkbox $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/colorwheel $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/dropdown $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/img $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/imgbtn $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/keyboard $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/label $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/led $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/line $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/list $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/menu $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/meter $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/msgbox $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/objx_templ $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/roller $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/slider $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/span $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/spinbox $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/spinner $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/switch $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/table $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/tabview $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/textarea $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/tileview $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/win $(IncludeSwitch)../sdk/lib/nes $(IncludeSwitch)../sdk/lib/net/eloop $(IncludeSwitch)../sdk/lib/net/ethphy $(IncludeSwitch)../sdk/lib/net/libcurl $(IncludeSwitch)../sdk/lib/net/libcurl/include $(IncludeSwitch)../sdk/lib/net/osal_socket $(IncludeSwitch)../sdk/lib/umac/umac4 $(IncludeSwitch)../sdk/lib/video/de_avi $(IncludeSwitch)../sdk/lib/video/en_avi $(IncludeSwitch)../sdk/lib/video/frame_memt $(IncludeSwitch)../sdk/lib/video/opendml $(IncludeSwitch)client_code/babymonitor  
IncludeAPath           := $(IncludeSwitch). $(IncludeSwitch)../csky/configs $(IncludeSwitch)../csky/csi_core/include $(IncludeSwitch)../csky/csi_driver/include $(IncludeSwitch)../csky/csi_kernel/include $(IncludeSwitch)../csky/csi_kernel/rhino/arch/include $(IncludeSwitch)../csky/csi_kernel/rhino/common $(IncludeSwitch)../csky/csi_kernel/rhino/core/include $(IncludeSwitch)../csky/csi_kernel/rhino/driver $(IncludeSwitch)../csky/csi_kernel/rhino/pwrmgmt $(IncludeSwitch)../csky/libs/include $(IncludeSwitch)../git-svn/txw80x/hgSDK/trunk/sdk/app/test_demo $(IncludeSwitch)../iot/txw80x/app/touchkey $(IncludeSwitch)../sample/pdmSample $(IncludeSwitch)../sdk/app $(IncludeSwitch)../sdk/app/algorithm/frame_memt $(IncludeSwitch)../sdk/app/algorithm/pdmFilter $(IncludeSwitch)../sdk/app/algorithm/stream_frame $(IncludeSwitch)../sdk/app/audio $(IncludeSwitch)../sdk/app/avi $(IncludeSwitch)../sdk/app/ble_net $(IncludeSwitch)../sdk/app/client_code/alk_net $(IncludeSwitch)../sdk/app/client_code/canhong $(IncludeSwitch)../sdk/app/client_code/care_skin $(IncludeSwitch)../sdk/app/client_code/ear_mode $(IncludeSwitch)../sdk/app/client_code/ganyue $(IncludeSwitch)../sdk/app/client_code/guqiao $(IncludeSwitch)../sdk/app/client_code/guqiao/user_net_interface $(IncludeSwitch)../sdk/app/client_code/guqiao2 $(IncludeSwitch)../sdk/app/client_code/guqiao2/user_net_interface $(IncludeSwitch)../sdk/app/client_code/guqiao3 $(IncludeSwitch)../sdk/app/client_code/guqiao3/user_net_interface $(IncludeSwitch)../sdk/app/client_code/guqiao4 $(IncludeSwitch)../sdk/app/client_code/guqiao4/user_net_interface $(IncludeSwitch)../sdk/app/client_code/guqiao5 $(IncludeSwitch)../sdk/app/client_code/guqiao_hty $(IncludeSwitch)../sdk/app/client_code/guqiao_hty/user_net_interface $(IncludeSwitch)../sdk/app/client_code/huchong $(IncludeSwitch)../sdk/app/client_code/kailuke $(IncludeSwitch)../sdk/app/client_code/kuying $(IncludeSwitch)../sdk/app/client_code/kuying/user_net_interface $(IncludeSwitch)../sdk/app/client_code/kuying_ear $(IncludeSwitch)../sdk/app/client_code/kuying_ear/user_net_interface $(IncludeSwitch)../sdk/app/client_code/kuying_spi $(IncludeSwitch)../sdk/app/client_code/kuying_spi/user_net_interface $(IncludeSwitch)../sdk/app/client_code/tianzhiheng $(IncludeSwitch)../sdk/app/client_code/xinruihe $(IncludeSwitch)../sdk/app/client_code/yameishida $(IncludeSwitch)../sdk/app/client_code/yuanheng_720p $(IncludeSwitch)../sdk/app/custom_mem $(IncludeSwitch)../sdk/app/dhcpd_eloop $(IncludeSwitch)../sdk/app/dns_eloop $(IncludeSwitch)../sdk/app/flash $(IncludeSwitch)../sdk/app/ftp $(IncludeSwitch)../sdk/app/gsensor $(IncludeSwitch)../sdk/app/halibaduo $(IncludeSwitch)../sdk/app/halibaduo/hali_mcu_prj/project_1 $(IncludeSwitch)../sdk/app/http $(IncludeSwitch)../sdk/app/http/http_client_demo $(IncludeSwitch)../sdk/app/http/http_server_demo $(IncludeSwitch)../sdk/app/http/httpfile_client_demo $(IncludeSwitch)../sdk/app/http/httpfile_server_demo $(IncludeSwitch)../sdk/app/iot_link $(IncludeSwitch)../sdk/app/iot_link/cJSON $(IncludeSwitch)../sdk/app/iot_link/crc $(IncludeSwitch)../sdk/app/iot_link/inc $(IncludeSwitch)../sdk/app/iot_link/link_misc $(IncludeSwitch)../sdk/app/iot_link/link_ota $(IncludeSwitch)../sdk/app/iot_link/link_ota/download/https $(IncludeSwitch)../sdk/app/iot_link/network/coap/coap_al $(IncludeSwitch)../sdk/app/iot_link/network/dtls/mbedtls/mbedtls-2.16.2/include/mbedtls $(IncludeSwitch)../sdk/app/iot_link/network/dtls/mbedtls/mbedtls_port $(IncludeSwitch)../sdk/app/iot_link/network/mqtt/paho_mqtt/paho/MQTTClient-C/src $(IncludeSwitch)../sdk/app/iot_link/network/mqtt/paho_mqtt/paho/MQTTClient-C/src/FreeRTOS $(IncludeSwitch)../sdk/app/iot_link/network/mqtt/paho_mqtt/paho/MQTTClient-C/src/cc3200 $(IncludeSwitch)../sdk/app/iot_link/network/mqtt/paho_mqtt/paho/MQTTClient-C/src/linux $(IncludeSwitch)../sdk/app/iot_link/network/mqtt/paho_mqtt/paho/MQTTClient-C/src/rtthread $(IncludeSwitch)../sdk/app/iot_link/network/mqtt/paho_mqtt/paho/MQTTPacket/src $(IncludeSwitch)../sdk/app/iot_link/network/mqtt/paho_mqtt/port $(IncludeSwitch)../sdk/app/iot_link/oc/oc_coap/atiny_coap $(IncludeSwitch)../sdk/app/iot_link/oc/oc_coap/oc_coap_al $(IncludeSwitch)../sdk/app/iot_link/oc/oc_mqtt/oc_mqtt_al $(IncludeSwitch)../sdk/app/iot_link/oc/oc_mqtt/oc_mqtt_profile_v5 $(IncludeSwitch)../sdk/app/iot_link/oc/oc_mqtt/oc_mqtt_tiny_v5 $(IncludeSwitch)../sdk/app/iot_link/os/osal $(IncludeSwitch)../sdk/app/iot_link/queue $(IncludeSwitch)../sdk/app/media $(IncludeSwitch)../sdk/app/mqtt/mqtt_client_demo $(IncludeSwitch)../sdk/app/netspeedTest $(IncludeSwitch)../sdk/app/playback $(IncludeSwitch)../sdk/app/record $(IncludeSwitch)../sdk/app/remoteControl $(IncludeSwitch)../sdk/app/socketModule $(IncludeSwitch)../sdk/app/speedTest $(IncludeSwitch)../sdk/app/spook $(IncludeSwitch)../sdk/app/sta_interface $(IncludeSwitch)../sdk/app/test_demo $(IncludeSwitch)../sdk/app/touchkey $(IncludeSwitch)../sdk/app/update $(IncludeSwitch)../sdk/app/uthash $(IncludeSwitch)../sdk/app/video_app $(IncludeSwitch)../sdk/driver/audio $(IncludeSwitch)../sdk/driver/audio/analog $(IncludeSwitch)../sdk/driver/emac $(IncludeSwitch)../sdk/driver/tk $(IncludeSwitch)../sdk/driver/xspi $(IncludeSwitch)../sdk/include $(IncludeSwitch)../sdk/include/chip $(IncludeSwitch)../sdk/include/lib/lwip/include $(IncludeSwitch)../sdk/lib/avformat/avi $(IncludeSwitch)../sdk/lib/bus/macbus $(IncludeSwitch)../sdk/lib/crypto/mbedtls/include/mbedtls $(IncludeSwitch)../sdk/lib/crypto/mbedtls/include/psa $(IncludeSwitch)../sdk/lib/crypto/mbedtls/library $(IncludeSwitch)../sdk/lib/crypto/openssl/crypto $(IncludeSwitch)../sdk/lib/crypto/openssl/crypto/aes $(IncludeSwitch)../sdk/lib/crypto/openssl/crypto/asn1 $(IncludeSwitch)../sdk/lib/crypto/openssl/crypto/bn $(IncludeSwitch)../sdk/lib/crypto/openssl/crypto/buffer $(IncludeSwitch)../sdk/lib/crypto/openssl/crypto/ec $(IncludeSwitch)../sdk/lib/crypto/openssl/crypto/engine $(IncludeSwitch)../sdk/lib/crypto/openssl/crypto/err $(IncludeSwitch)../sdk/lib/crypto/openssl/crypto/evp $(IncludeSwitch)../sdk/lib/crypto/openssl/crypto/hmac $(IncludeSwitch)../sdk/lib/crypto/openssl/crypto/lhash $(IncludeSwitch)../sdk/lib/crypto/openssl/crypto/md5 $(IncludeSwitch)../sdk/lib/crypto/openssl/crypto/modes $(IncludeSwitch)../sdk/lib/crypto/openssl/crypto/objects $(IncludeSwitch)../sdk/lib/crypto/openssl/crypto/rand $(IncludeSwitch)../sdk/lib/crypto/openssl/crypto/rc4 $(IncludeSwitch)../sdk/lib/crypto/openssl/crypto/rsa $(IncludeSwitch)../sdk/lib/crypto/openssl/crypto/sha $(IncludeSwitch)../sdk/lib/crypto/openssl/crypto/stack $(IncludeSwitch)../sdk/lib/crypto/openssl/include $(IncludeSwitch)../sdk/lib/crypto/openssl/include/openssl $(IncludeSwitch)../sdk/lib/gba/src $(IncludeSwitch)../sdk/lib/gui/resorce $(IncludeSwitch)../sdk/lib/key $(IncludeSwitch)../sdk/lib/lmac/venus/module $(IncludeSwitch)../sdk/lib/lmac/venus/rf $(IncludeSwitch)../sdk/lib/lmac/venus_v2 $(IncludeSwitch)../sdk/lib/lmac/venus_v2/module $(IncludeSwitch)../sdk/lib/lmac/venus_v2/rate_control $(IncludeSwitch)../sdk/lib/lmac/venus_v2/rf $(IncludeSwitch)../sdk/lib/lvgl $(IncludeSwitch)../sdk/lib/lvgl/demos $(IncludeSwitch)../sdk/lib/lvgl/demos/benchmark $(IncludeSwitch)../sdk/lib/lvgl/demos/keypad_encoder $(IncludeSwitch)../sdk/lib/lvgl/demos/music $(IncludeSwitch)../sdk/lib/lvgl/demos/music/assets $(IncludeSwitch)../sdk/lib/lvgl/demos/stress $(IncludeSwitch)../sdk/lib/lvgl/demos/widgets $(IncludeSwitch)../sdk/lib/lvgl/examples $(IncludeSwitch)../sdk/lib/lvgl/examples/anim $(IncludeSwitch)../sdk/lib/lvgl/examples/event $(IncludeSwitch)../sdk/lib/lvgl/examples/get_started $(IncludeSwitch)../sdk/lib/lvgl/examples/layouts $(IncludeSwitch)../sdk/lib/lvgl/examples/layouts/flex $(IncludeSwitch)../sdk/lib/lvgl/examples/layouts/grid $(IncludeSwitch)../sdk/lib/lvgl/examples/libs $(IncludeSwitch)../sdk/lib/lvgl/examples/libs/bmp $(IncludeSwitch)../sdk/lib/lvgl/examples/libs/ffmpeg $(IncludeSwitch)../sdk/lib/lvgl/examples/libs/freetype $(IncludeSwitch)../sdk/lib/lvgl/examples/libs/gif $(IncludeSwitch)../sdk/lib/lvgl/examples/libs/png $(IncludeSwitch)../sdk/lib/lvgl/examples/libs/qrcode $(IncludeSwitch)../sdk/lib/lvgl/examples/libs/rlottie $(IncludeSwitch)../sdk/lib/lvgl/examples/libs/sjpg $(IncludeSwitch)../sdk/lib/lvgl/examples/libs/tiny_ttf $(IncludeSwitch)../sdk/lib/lvgl/examples/others $(IncludeSwitch)../sdk/lib/lvgl/examples/others/file_explorer $(IncludeSwitch)../sdk/lib/lvgl/examples/others/fragment $(IncludeSwitch)../sdk/lib/lvgl/examples/others/gridnav $(IncludeSwitch)../sdk/lib/lvgl/examples/others/ime $(IncludeSwitch)../sdk/lib/lvgl/examples/others/imgfont $(IncludeSwitch)../sdk/lib/lvgl/examples/others/monkey $(IncludeSwitch)../sdk/lib/lvgl/examples/others/msg $(IncludeSwitch)../sdk/lib/lvgl/examples/others/snapshot $(IncludeSwitch)../sdk/lib/lvgl/examples/porting $(IncludeSwitch)../sdk/lib/lvgl/examples/scroll $(IncludeSwitch)../sdk/lib/lvgl/examples/styles $(IncludeSwitch)../sdk/lib/lvgl/examples/widgets $(IncludeSwitch)../sdk/lib/lvgl/resorce $(IncludeSwitch)../sdk/lib/lvgl/src $(IncludeSwitch)../sdk/lib/lvgl/src/core $(IncludeSwitch)../sdk/lib/lvgl/src/draw $(IncludeSwitch)../sdk/lib/lvgl/src/draw/arm2d $(IncludeSwitch)../sdk/lib/lvgl/src/draw/gd32_ipa $(IncludeSwitch)../sdk/lib/lvgl/src/draw/nxp $(IncludeSwitch)../sdk/lib/lvgl/src/draw/nxp/pxp $(IncludeSwitch)../sdk/lib/lvgl/src/draw/nxp/vglite $(IncludeSwitch)../sdk/lib/lvgl/src/draw/sdl $(IncludeSwitch)../sdk/lib/lvgl/src/draw/stm32_dma2d $(IncludeSwitch)../sdk/lib/lvgl/src/draw/sw $(IncludeSwitch)../sdk/lib/lvgl/src/draw/swm341_dma2d $(IncludeSwitch)../sdk/lib/lvgl/src/font $(IncludeSwitch)../sdk/lib/lvgl/src/hal $(IncludeSwitch)../sdk/lib/lvgl/src/layouts/flex $(IncludeSwitch)../sdk/lib/lvgl/src/layouts/grid $(IncludeSwitch)../sdk/lib/lvgl/src/libs/bmp $(IncludeSwitch)../sdk/lib/lvgl/src/libs/ffmpeg $(IncludeSwitch)../sdk/lib/lvgl/src/libs/freetype $(IncludeSwitch)../sdk/lib/lvgl/src/libs/fsdrv $(IncludeSwitch)../sdk/lib/lvgl/src/libs/gif $(IncludeSwitch)../sdk/lib/lvgl/src/libs/png $(IncludeSwitch)../sdk/lib/lvgl/src/libs/qrcode $(IncludeSwitch)../sdk/lib/lvgl/src/libs/rlottie $(IncludeSwitch)../sdk/lib/lvgl/src/libs/sjpg $(IncludeSwitch)../sdk/lib/lvgl/src/libs/tiny_ttf $(IncludeSwitch)../sdk/lib/lvgl/src/misc $(IncludeSwitch)../sdk/lib/lvgl/src/others/file_explorer $(IncludeSwitch)../sdk/lib/lvgl/src/others/fragment $(IncludeSwitch)../sdk/lib/lvgl/src/others/gridnav $(IncludeSwitch)../sdk/lib/lvgl/src/others/ime $(IncludeSwitch)../sdk/lib/lvgl/src/others/imgfont $(IncludeSwitch)../sdk/lib/lvgl/src/others/monkey $(IncludeSwitch)../sdk/lib/lvgl/src/others/msg $(IncludeSwitch)../sdk/lib/lvgl/src/others/snapshot $(IncludeSwitch)../sdk/lib/lvgl/src/themes $(IncludeSwitch)../sdk/lib/lvgl/src/themes/basic $(IncludeSwitch)../sdk/lib/lvgl/src/themes/default $(IncludeSwitch)../sdk/lib/lvgl/src/themes/mono $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/animimg $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/arc $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/bar $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/btn $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/btnmatrix $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/calendar $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/canvas $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/chart $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/checkbox $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/colorwheel $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/dropdown $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/img $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/imgbtn $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/keyboard $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/label $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/led $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/line $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/list $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/menu $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/meter $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/msgbox $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/objx_templ $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/roller $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/slider $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/span $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/spinbox $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/spinner $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/switch $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/table $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/tabview $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/textarea $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/tileview $(IncludeSwitch)../sdk/lib/lvgl/src/widgets/win $(IncludeSwitch)../sdk/lib/nes $(IncludeSwitch)../sdk/lib/net/eloop $(IncludeSwitch)../sdk/lib/net/ethphy $(IncludeSwitch)../sdk/lib/net/libcurl $(IncludeSwitch)../sdk/lib/net/libcurl/include/curl $(IncludeSwitch)../sdk/lib/net/libcurl/vauth $(IncludeSwitch)../sdk/lib/net/libcurl/vquic $(IncludeSwitch)../sdk/lib/net/libcurl/vssh $(IncludeSwitch)../sdk/lib/net/libcurl/vtls $(IncludeSwitch)../sdk/lib/umac/umac4/include $(IncludeSwitch)../sdk/lib/umac/umac4/lib $(IncludeSwitch)../sdk/lib/umac/umac4/wpa $(IncludeSwitch)../sdk/lib/umac/umac4/wpa_auth $(IncludeSwitch)../sdk/lib/video/de_avi $(IncludeSwitch)../sdk/lib/video/en_avi $(IncludeSwitch)../test $(IncludeSwitch)app $(IncludeSwitch)app/algorithm/frame_memt $(IncludeSwitch)app/algorithm/pdmFilter $(IncludeSwitch)app/algorithm/stream_frame $(IncludeSwitch)app/audio $(IncludeSwitch)app/avi $(IncludeSwitch)app/ble_net $(IncludeSwitch)app/boot_lib $(IncludeSwitch)app/cmd_input $(IncludeSwitch)app/custom_mem $(IncludeSwitch)app/dhcpd_eloop $(IncludeSwitch)app/eventos $(IncludeSwitch)app/media $(IncludeSwitch)app/newaduio $(IncludeSwitch)app/newaudio $(IncludeSwitch)app/record $(IncludeSwitch)app/remoteControl $(IncludeSwitch)app/socketModule $(IncludeSwitch)app/speedTest $(IncludeSwitch)app/spook $(IncludeSwitch)app/touchkey $(IncludeSwitch)app/update $(IncludeSwitch)app/video_app $(IncludeSwitch)client_code/babymonitor $(IncludeSwitch)svn/txw80x/hgSDK/trunk/project/demo/fpv/app/flash $(IncludeSwitch)svn/txw80x/hgSDK/trunk/project/demo/fpv/app/update $(IncludeSwitch)svn/txw80x/hgSDK/trunk/sdk/lib/app/net/alk_net  
Libs                   := -Wl,--whole-archive  -Wl,--no-whole-archive $(LibrarySwitch)m $(LibrarySwitch)core $(LibrarySwitch)FLASH $(LibrarySwitch)audio $(LibrarySwitch)ble $(LibrarySwitch)netutils $(LibrarySwitch)common $(LibrarySwitch)osal $(LibrarySwitch)atcmd $(LibrarySwitch)lmac $(LibrarySwitch)wifi  
ArLibs                 := "m" "core" "FLASH" "audio" "ble" "netutils" "common" "osal" "atcmd" "lmac" "wifi" 
PackagesLibPath        :=
LibPath                :=$(LibraryPathSwitch)utilities $(LibraryPathSwitch)../libs  $(PackagesLibPath) 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       :=csky-elfabiv2-ar rcu
CXX      :=csky-elfabiv2-g++
CC       :=csky-elfabiv2-gcc
AS       :=csky-elfabiv2-gcc
OBJDUMP  :=csky-elfabiv2-objdump
OBJCOPY  :=csky-elfabiv2-objcopy
CXXFLAGS := -mcpu=ck803s   $(PreprocessorSwitch)__NO_BOARD_INIT  $(PreprocessorSwitch)TXW81X  $(PreprocessorSwitch)SKB_POOL_ENABLE  $(PreprocessorSwitch)MPOOL_ALLOC  $(PreprocessorSwitch)CONFIG_UMAC4   -Os  -g  -Wall  -ffunction-sections -ffunction-sections -fdata-sections -Wno-comment -Wno-unused-function -Wno-unused-but-set-variable -I. 
CFLAGS   := -mcpu=ck803s   $(PreprocessorSwitch)__NO_BOARD_INIT  $(PreprocessorSwitch)TXW81X  $(PreprocessorSwitch)SKB_POOL_ENABLE  $(PreprocessorSwitch)MPOOL_ALLOC  $(PreprocessorSwitch)CONFIG_UMAC4   -Os  -g  -Wall  -ffunction-sections -ffunction-sections -fdata-sections -Wno-comment -Wno-unused-function -Wno-unused-but-set-variable -I. 
ASFLAGS  := -mcpu=ck803s   $(PreprocessorSwitch)__NO_BOARD_INIT  $(PreprocessorSwitch)TXW81X   -Wa,--gdwarf2  -I.  


Objects0=$(IntermediateDirectory)/main$(ObjectSuffix) $(IntermediateDirectory)/device$(ObjectSuffix) $(IntermediateDirectory)/syscfg$(ObjectSuffix) $(IntermediateDirectory)/hgic_usart$(ObjectSuffix) $(IntermediateDirectory)/hgic_malloc$(ObjectSuffix) $(IntermediateDirectory)/hgic_assert$(ObjectSuffix) $(IntermediateDirectory)/hal_dev$(ObjectSuffix) $(IntermediateDirectory)/hal_gpio$(ObjectSuffix) $(IntermediateDirectory)/hal_i2c$(ObjectSuffix) $(IntermediateDirectory)/hal_sdio_slave$(ObjectSuffix) \
	$(IntermediateDirectory)/hal_timer$(ObjectSuffix) $(IntermediateDirectory)/hal_usb_device$(ObjectSuffix) $(IntermediateDirectory)/hal_spi$(ObjectSuffix) $(IntermediateDirectory)/hal_spi_nor$(ObjectSuffix) $(IntermediateDirectory)/hal_sysaes$(ObjectSuffix) $(IntermediateDirectory)/hal_uart$(ObjectSuffix) $(IntermediateDirectory)/hal_i2s$(ObjectSuffix) $(IntermediateDirectory)/hal_pdm$(ObjectSuffix) $(IntermediateDirectory)/hal_led$(ObjectSuffix) $(IntermediateDirectory)/hal_pwm$(ObjectSuffix) \
	$(IntermediateDirectory)/hal_capture$(ObjectSuffix) $(IntermediateDirectory)/hal_adc$(ObjectSuffix) $(IntermediateDirectory)/hal_netdev$(ObjectSuffix) $(IntermediateDirectory)/hal_dvp$(ObjectSuffix) $(IntermediateDirectory)/hal_dma$(ObjectSuffix) $(IntermediateDirectory)/hal_jpeg$(ObjectSuffix) $(IntermediateDirectory)/hal_tk$(ObjectSuffix) $(IntermediateDirectory)/hal_lcdc$(ObjectSuffix) $(IntermediateDirectory)/hal_prc$(ObjectSuffix) $(IntermediateDirectory)/hal_scale$(ObjectSuffix) \
	$(IntermediateDirectory)/hal_vpp$(ObjectSuffix) $(IntermediateDirectory)/hal_audac$(ObjectSuffix) $(IntermediateDirectory)/hal_auadc$(ObjectSuffix) $(IntermediateDirectory)/hal_of$(ObjectSuffix) $(IntermediateDirectory)/libc_malloc$(ObjectSuffix) $(IntermediateDirectory)/libc_minilibc_port$(ObjectSuffix) $(IntermediateDirectory)/txw81x_isr$(ObjectSuffix) $(IntermediateDirectory)/txw81x_pin_function$(ObjectSuffix) $(IntermediateDirectory)/txw81x_system$(ObjectSuffix) $(IntermediateDirectory)/txw81x_ticker_api$(ObjectSuffix) \
	$(IntermediateDirectory)/txw81x_trap_c$(ObjectSuffix) $(IntermediateDirectory)/txw81x_vectors$(ObjectSuffix) $(IntermediateDirectory)/dma_dw_dmac$(ObjectSuffix) $(IntermediateDirectory)/dma_hg_m2m_dma$(ObjectSuffix) $(IntermediateDirectory)/gpio_hggpio_v4$(ObjectSuffix) $(IntermediateDirectory)/i2c_hgi2c_v1$(ObjectSuffix) $(IntermediateDirectory)/i2s_hgi2s_v0$(ObjectSuffix) $(IntermediateDirectory)/spi_hgspi_v3$(ObjectSuffix) $(IntermediateDirectory)/timer_hgtimer_v6$(ObjectSuffix) $(IntermediateDirectory)/timer_hgtimer_v4$(ObjectSuffix) \
	$(IntermediateDirectory)/timer_hgtimer_v5$(ObjectSuffix) $(IntermediateDirectory)/timer_hgtimer_v7$(ObjectSuffix) $(IntermediateDirectory)/uart_hguart_v4$(ObjectSuffix) $(IntermediateDirectory)/uart_hguart_v2$(ObjectSuffix) $(IntermediateDirectory)/crc_hg_crc$(ObjectSuffix) $(IntermediateDirectory)/sdhost_hgsdh_dev$(ObjectSuffix) $(IntermediateDirectory)/sysaes_hg_sysaes_v3$(ObjectSuffix) $(IntermediateDirectory)/pdm_hgpdm_v0$(ObjectSuffix) $(IntermediateDirectory)/led_hgled_v0$(ObjectSuffix) $(IntermediateDirectory)/pwm_hgpwm_v0$(ObjectSuffix) \
	$(IntermediateDirectory)/capture_hgcapture_v0$(ObjectSuffix) $(IntermediateDirectory)/csi_hgdvp_v2$(ObjectSuffix) $(IntermediateDirectory)/adc_hgadc_v0$(ObjectSuffix) $(IntermediateDirectory)/lcdc_hglcdc$(ObjectSuffix) $(IntermediateDirectory)/prc_hgprc$(ObjectSuffix) $(IntermediateDirectory)/scale_hgscale$(ObjectSuffix) $(IntermediateDirectory)/vpp_hgvpp$(ObjectSuffix) $(IntermediateDirectory)/of_hgof$(ObjectSuffix) $(IntermediateDirectory)/heap_alloc$(ObjectSuffix) $(IntermediateDirectory)/common_common$(ObjectSuffix) \
	$(IntermediateDirectory)/common_string$(ObjectSuffix) 

Objects1=$(IntermediateDirectory)/common_us_ticker$(ObjectSuffix) $(IntermediateDirectory)/common_dsleepdata$(ObjectSuffix) $(IntermediateDirectory)/common_atcmd$(ObjectSuffix) $(IntermediateDirectory)/sdhost_sdhost$(ObjectSuffix) $(IntermediateDirectory)/usb_app_usb_device_wifi$(ObjectSuffix) $(IntermediateDirectory)/usb_app_usb_host_uvc$(ObjectSuffix) $(IntermediateDirectory)/ble_ble_demo$(ObjectSuffix) $(IntermediateDirectory)/ble_ble_adv$(ObjectSuffix) $(IntermediateDirectory)/posix_mqueue$(ObjectSuffix) \
	$(IntermediateDirectory)/posix_posix_test$(ObjectSuffix) $(IntermediateDirectory)/posix_pthread$(ObjectSuffix) $(IntermediateDirectory)/posix_pthread_attr$(ObjectSuffix) $(IntermediateDirectory)/posix_pthread_barrier$(ObjectSuffix) $(IntermediateDirectory)/posix_pthread_cond$(ObjectSuffix) $(IntermediateDirectory)/posix_pthread_mutex$(ObjectSuffix) $(IntermediateDirectory)/posix_pthread_rwlock$(ObjectSuffix) $(IntermediateDirectory)/posix_sched$(ObjectSuffix) $(IntermediateDirectory)/posix_semaphore$(ObjectSuffix) $(IntermediateDirectory)/posix_timer$(ObjectSuffix) \
	$(IntermediateDirectory)/posix_pthread_tls$(ObjectSuffix) $(IntermediateDirectory)/posix_sockets$(ObjectSuffix) $(IntermediateDirectory)/posix_stdio$(ObjectSuffix) $(IntermediateDirectory)/gui_user_demo$(ObjectSuffix) $(IntermediateDirectory)/lcd_lcd$(ObjectSuffix) $(IntermediateDirectory)/key_adkey$(ObjectSuffix) $(IntermediateDirectory)/key_keyScan$(ObjectSuffix) $(IntermediateDirectory)/key_keyWork$(ObjectSuffix) $(IntermediateDirectory)/key_power_checkkey$(ObjectSuffix) $(IntermediateDirectory)/key_adkey2$(ObjectSuffix) \
	$(IntermediateDirectory)/avi_play_avi$(ObjectSuffix) $(IntermediateDirectory)/custom_mem_custom_mem$(ObjectSuffix) $(IntermediateDirectory)/dhcpd_eloop_dhcpd_eloop$(ObjectSuffix) $(IntermediateDirectory)/dns_eloop_dns_eloop$(ObjectSuffix) $(IntermediateDirectory)/gsensor_g_sensor$(ObjectSuffix) $(IntermediateDirectory)/media_media$(ObjectSuffix) $(IntermediateDirectory)/newaudio_newaudio$(ObjectSuffix) $(IntermediateDirectory)/record_sd_save$(ObjectSuffix) $(IntermediateDirectory)/remoteControl_remote_control$(ObjectSuffix) $(IntermediateDirectory)/socketModule_socket_module$(ObjectSuffix) \
	$(IntermediateDirectory)/speedTest_speedTest$(ObjectSuffix) $(IntermediateDirectory)/spook_access_log$(ObjectSuffix) $(IntermediateDirectory)/spook_encoder-audio$(ObjectSuffix) $(IntermediateDirectory)/spook_encoder-jpeg$(ObjectSuffix) $(IntermediateDirectory)/spook_ephoto$(ObjectSuffix) $(IntermediateDirectory)/spook_frame$(ObjectSuffix) $(IntermediateDirectory)/spook_live$(ObjectSuffix) $(IntermediateDirectory)/spook_log$(ObjectSuffix) $(IntermediateDirectory)/spook_pmsg$(ObjectSuffix) $(IntermediateDirectory)/spook_rtp-audio$(ObjectSuffix) \
	$(IntermediateDirectory)/spook_rtp-jpeg$(ObjectSuffix) $(IntermediateDirectory)/spook_rtp$(ObjectSuffix) $(IntermediateDirectory)/spook_rtsp$(ObjectSuffix) $(IntermediateDirectory)/spook_rtsp_common$(ObjectSuffix) $(IntermediateDirectory)/spook_session$(ObjectSuffix) $(IntermediateDirectory)/spook_spook$(ObjectSuffix) $(IntermediateDirectory)/spook_stream$(ObjectSuffix) $(IntermediateDirectory)/spook_tcp$(ObjectSuffix) $(IntermediateDirectory)/spook_webfile$(ObjectSuffix) $(IntermediateDirectory)/sta_interface_sta_interface$(ObjectSuffix) \
	$(IntermediateDirectory)/update_ota$(ObjectSuffix) $(IntermediateDirectory)/video_app_video_app$(ObjectSuffix) $(IntermediateDirectory)/video_app_video_app_usb$(ObjectSuffix) $(IntermediateDirectory)/video_app_video_app_usb_psram$(ObjectSuffix) $(IntermediateDirectory)/video_app_video_app_usb_to_lcd$(ObjectSuffix) 

Objects2=$(IntermediateDirectory)/playback_playback$(ObjectSuffix) $(IntermediateDirectory)/interface_management_interface_mgnt$(ObjectSuffix) $(IntermediateDirectory)/audio_app_audio_ad$(ObjectSuffix) $(IntermediateDirectory)/audio_app_audio_da$(ObjectSuffix) $(IntermediateDirectory)/audio_app_hal_i2s_audio$(ObjectSuffix) \
	$(IntermediateDirectory)/audio_app_pdm_audio$(ObjectSuffix) $(IntermediateDirectory)/test_demo_AT_save_audio$(ObjectSuffix) $(IntermediateDirectory)/test_demo_AT_save_avi$(ObjectSuffix) $(IntermediateDirectory)/test_demo_AT_save_photo$(ObjectSuffix) $(IntermediateDirectory)/flash_flash_read_demo$(ObjectSuffix) $(IntermediateDirectory)/halibaduo_halibaduo$(ObjectSuffix) $(IntermediateDirectory)/halibaduo_hali_list_node$(ObjectSuffix) $(IntermediateDirectory)/halibaduo_hali_button$(ObjectSuffix) $(IntermediateDirectory)/halibaduo_hali_led$(ObjectSuffix) $(IntermediateDirectory)/halibaduo_hali_energy$(ObjectSuffix) \
	$(IntermediateDirectory)/halibaduo_hali_network$(ObjectSuffix) $(IntermediateDirectory)/halibaduo_hali_ota$(ObjectSuffix) $(IntermediateDirectory)/halibaduo_hali_wifi$(ObjectSuffix) $(IntermediateDirectory)/halibaduo_hali_picture$(ObjectSuffix) $(IntermediateDirectory)/adapter_csi_rhino$(ObjectSuffix) $(IntermediateDirectory)/common_k_atomic$(ObjectSuffix) $(IntermediateDirectory)/common_k_ffs$(ObjectSuffix) $(IntermediateDirectory)/common_k_fifo$(ObjectSuffix) $(IntermediateDirectory)/common_k_trace$(ObjectSuffix) $(IntermediateDirectory)/core_k_buf_queue$(ObjectSuffix) \
	$(IntermediateDirectory)/core_k_dyn_mem_proc$(ObjectSuffix) $(IntermediateDirectory)/core_k_err$(ObjectSuffix) $(IntermediateDirectory)/core_k_event$(ObjectSuffix) $(IntermediateDirectory)/core_k_idle$(ObjectSuffix) $(IntermediateDirectory)/core_k_mm$(ObjectSuffix) $(IntermediateDirectory)/core_k_mm_blk$(ObjectSuffix) $(IntermediateDirectory)/core_k_mm_debug$(ObjectSuffix) $(IntermediateDirectory)/core_k_mutex$(ObjectSuffix) $(IntermediateDirectory)/core_k_obj$(ObjectSuffix) $(IntermediateDirectory)/core_k_pend$(ObjectSuffix) \
	$(IntermediateDirectory)/core_k_queue$(ObjectSuffix) $(IntermediateDirectory)/core_k_ringbuf$(ObjectSuffix) $(IntermediateDirectory)/core_k_sched$(ObjectSuffix) $(IntermediateDirectory)/core_k_sem$(ObjectSuffix) $(IntermediateDirectory)/core_k_stats$(ObjectSuffix) $(IntermediateDirectory)/core_k_sys$(ObjectSuffix) $(IntermediateDirectory)/core_k_task$(ObjectSuffix) $(IntermediateDirectory)/core_k_task_sem$(ObjectSuffix) $(IntermediateDirectory)/core_k_tick$(ObjectSuffix) $(IntermediateDirectory)/core_k_time$(ObjectSuffix) \
	$(IntermediateDirectory)/core_k_timer$(ObjectSuffix) $(IntermediateDirectory)/core_k_workqueue$(ObjectSuffix) $(IntermediateDirectory)/driver_hook_impl$(ObjectSuffix) $(IntermediateDirectory)/driver_systick$(ObjectSuffix) $(IntermediateDirectory)/driver_yoc_impl$(ObjectSuffix) $(IntermediateDirectory)/driver_hook_weak$(ObjectSuffix) $(IntermediateDirectory)/eloop_eloop$(ObjectSuffix) $(IntermediateDirectory)/ethphy_eth_mdio_bus$(ObjectSuffix) $(IntermediateDirectory)/ethphy_eth_phy$(ObjectSuffix) $(IntermediateDirectory)/ethphy_eth_phy_device$(ObjectSuffix) \
	$(IntermediateDirectory)/skmonitor_skmonitor$(ObjectSuffix) $(IntermediateDirectory)/libcurl_altsvc$(ObjectSuffix) $(IntermediateDirectory)/libcurl_amigaos$(ObjectSuffix) $(IntermediateDirectory)/libcurl_asyn-ares$(ObjectSuffix) $(IntermediateDirectory)/libcurl_asyn-thread$(ObjectSuffix) $(IntermediateDirectory)/libcurl_base64$(ObjectSuffix) $(IntermediateDirectory)/libcurl_bufref$(ObjectSuffix) 

Objects3=$(IntermediateDirectory)/libcurl_c-hyper$(ObjectSuffix) $(IntermediateDirectory)/libcurl_cf-https-connect$(ObjectSuffix) $(IntermediateDirectory)/libcurl_cf-socket$(ObjectSuffix) \
	$(IntermediateDirectory)/libcurl_cfilters$(ObjectSuffix) $(IntermediateDirectory)/libcurl_conncache$(ObjectSuffix) $(IntermediateDirectory)/libcurl_connect$(ObjectSuffix) $(IntermediateDirectory)/libcurl_content_encoding$(ObjectSuffix) $(IntermediateDirectory)/libcurl_cookie$(ObjectSuffix) $(IntermediateDirectory)/libcurl_curl_addrinfo$(ObjectSuffix) $(IntermediateDirectory)/libcurl_curl_des$(ObjectSuffix) $(IntermediateDirectory)/libcurl_curl_endian$(ObjectSuffix) $(IntermediateDirectory)/libcurl_curl_fnmatch$(ObjectSuffix) $(IntermediateDirectory)/libcurl_curl_gethostname$(ObjectSuffix) \
	$(IntermediateDirectory)/libcurl_curl_get_line$(ObjectSuffix) $(IntermediateDirectory)/libcurl_curl_gssapi$(ObjectSuffix) $(IntermediateDirectory)/libcurl_curl_log$(ObjectSuffix) $(IntermediateDirectory)/libcurl_curl_memrchr$(ObjectSuffix) $(IntermediateDirectory)/libcurl_curl_multibyte$(ObjectSuffix) $(IntermediateDirectory)/libcurl_curl_ntlm_core$(ObjectSuffix) $(IntermediateDirectory)/libcurl_curl_ntlm_wb$(ObjectSuffix) $(IntermediateDirectory)/libcurl_curl_path$(ObjectSuffix) $(IntermediateDirectory)/libcurl_curl_range$(ObjectSuffix) $(IntermediateDirectory)/libcurl_curl_rtmp$(ObjectSuffix) \
	$(IntermediateDirectory)/libcurl_curl_sasl$(ObjectSuffix) $(IntermediateDirectory)/libcurl_curl_sspi$(ObjectSuffix) $(IntermediateDirectory)/libcurl_curl_threads$(ObjectSuffix) $(IntermediateDirectory)/libcurl_dict$(ObjectSuffix) $(IntermediateDirectory)/libcurl_doh$(ObjectSuffix) $(IntermediateDirectory)/libcurl_dynbuf$(ObjectSuffix) $(IntermediateDirectory)/libcurl_easy$(ObjectSuffix) $(IntermediateDirectory)/libcurl_easygetopt$(ObjectSuffix) $(IntermediateDirectory)/libcurl_easyoptions$(ObjectSuffix) $(IntermediateDirectory)/libcurl_escape$(ObjectSuffix) \
	$(IntermediateDirectory)/libcurl_file$(ObjectSuffix) $(IntermediateDirectory)/libcurl_fileinfo$(ObjectSuffix) $(IntermediateDirectory)/libcurl_fopen$(ObjectSuffix) $(IntermediateDirectory)/libcurl_formdata$(ObjectSuffix) $(IntermediateDirectory)/libcurl_ftp$(ObjectSuffix) $(IntermediateDirectory)/libcurl_ftplistparser$(ObjectSuffix) 

Objects4=$(IntermediateDirectory)/libcurl_getenv$(ObjectSuffix) $(IntermediateDirectory)/libcurl_getinfo$(ObjectSuffix) $(IntermediateDirectory)/libcurl_gopher$(ObjectSuffix) $(IntermediateDirectory)/libcurl_h2h3$(ObjectSuffix) \
	$(IntermediateDirectory)/libcurl_hash$(ObjectSuffix) $(IntermediateDirectory)/libcurl_headers$(ObjectSuffix) $(IntermediateDirectory)/libcurl_hmac$(ObjectSuffix) $(IntermediateDirectory)/libcurl_hostasyn$(ObjectSuffix) $(IntermediateDirectory)/libcurl_hostip$(ObjectSuffix) $(IntermediateDirectory)/libcurl_hostip4$(ObjectSuffix) $(IntermediateDirectory)/libcurl_hostip6$(ObjectSuffix) $(IntermediateDirectory)/libcurl_hostsyn$(ObjectSuffix) $(IntermediateDirectory)/libcurl_hsts$(ObjectSuffix) $(IntermediateDirectory)/libcurl_http$(ObjectSuffix) \
	$(IntermediateDirectory)/libcurl_http2$(ObjectSuffix) $(IntermediateDirectory)/libcurl_http_aws_sigv4$(ObjectSuffix) $(IntermediateDirectory)/libcurl_http_chunks$(ObjectSuffix) $(IntermediateDirectory)/libcurl_http_digest$(ObjectSuffix) $(IntermediateDirectory)/libcurl_http_negotiate$(ObjectSuffix) $(IntermediateDirectory)/libcurl_http_ntlm$(ObjectSuffix) $(IntermediateDirectory)/libcurl_http_proxy$(ObjectSuffix) $(IntermediateDirectory)/libcurl_idn$(ObjectSuffix) $(IntermediateDirectory)/libcurl_if2ip$(ObjectSuffix) $(IntermediateDirectory)/libcurl_imap$(ObjectSuffix) \
	$(IntermediateDirectory)/libcurl_inet_ntop$(ObjectSuffix) $(IntermediateDirectory)/libcurl_inet_pton$(ObjectSuffix) $(IntermediateDirectory)/libcurl_krb5$(ObjectSuffix) $(IntermediateDirectory)/libcurl_ldap$(ObjectSuffix) $(IntermediateDirectory)/libcurl_llist$(ObjectSuffix) $(IntermediateDirectory)/libcurl_md4$(ObjectSuffix) $(IntermediateDirectory)/libcurl_md5$(ObjectSuffix) $(IntermediateDirectory)/libcurl_memdebug$(ObjectSuffix) $(IntermediateDirectory)/libcurl_mime$(ObjectSuffix) $(IntermediateDirectory)/libcurl_mprintf$(ObjectSuffix) \
	$(IntermediateDirectory)/libcurl_mqtt$(ObjectSuffix) $(IntermediateDirectory)/libcurl_multi$(ObjectSuffix) $(IntermediateDirectory)/libcurl_netrc$(ObjectSuffix) $(IntermediateDirectory)/libcurl_nonblock$(ObjectSuffix) $(IntermediateDirectory)/libcurl_noproxy$(ObjectSuffix) $(IntermediateDirectory)/libcurl_openldap$(ObjectSuffix) $(IntermediateDirectory)/libcurl_parsedate$(ObjectSuffix) $(IntermediateDirectory)/libcurl_pingpong$(ObjectSuffix) $(IntermediateDirectory)/libcurl_pop3$(ObjectSuffix) $(IntermediateDirectory)/libcurl_progress$(ObjectSuffix) \
	$(IntermediateDirectory)/libcurl_psl$(ObjectSuffix) $(IntermediateDirectory)/libcurl_rand$(ObjectSuffix) $(IntermediateDirectory)/libcurl_rename$(ObjectSuffix) $(IntermediateDirectory)/libcurl_rtsp$(ObjectSuffix) $(IntermediateDirectory)/libcurl_select$(ObjectSuffix) $(IntermediateDirectory)/libcurl_sendf$(ObjectSuffix) $(IntermediateDirectory)/libcurl_setopt$(ObjectSuffix) $(IntermediateDirectory)/libcurl_sha256$(ObjectSuffix) $(IntermediateDirectory)/libcurl_share$(ObjectSuffix) $(IntermediateDirectory)/libcurl_slist$(ObjectSuffix) \
	

Objects5=$(IntermediateDirectory)/libcurl_smb$(ObjectSuffix) $(IntermediateDirectory)/libcurl_smtp$(ObjectSuffix) $(IntermediateDirectory)/libcurl_socketpair$(ObjectSuffix) $(IntermediateDirectory)/libcurl_socks$(ObjectSuffix) $(IntermediateDirectory)/libcurl_socks_gssapi$(ObjectSuffix) $(IntermediateDirectory)/libcurl_socks_sspi$(ObjectSuffix) $(IntermediateDirectory)/libcurl_speedcheck$(ObjectSuffix) $(IntermediateDirectory)/libcurl_splay$(ObjectSuffix) $(IntermediateDirectory)/libcurl_strcase$(ObjectSuffix) $(IntermediateDirectory)/libcurl_strdup$(ObjectSuffix) \
	$(IntermediateDirectory)/libcurl_strerror$(ObjectSuffix) $(IntermediateDirectory)/libcurl_strtok$(ObjectSuffix) $(IntermediateDirectory)/libcurl_strtoofft$(ObjectSuffix) $(IntermediateDirectory)/libcurl_system_win32$(ObjectSuffix) $(IntermediateDirectory)/libcurl_telnet$(ObjectSuffix) $(IntermediateDirectory)/libcurl_tftp$(ObjectSuffix) $(IntermediateDirectory)/libcurl_timediff$(ObjectSuffix) $(IntermediateDirectory)/libcurl_timeval$(ObjectSuffix) $(IntermediateDirectory)/libcurl_transfer$(ObjectSuffix) $(IntermediateDirectory)/libcurl_url$(ObjectSuffix) \
	$(IntermediateDirectory)/libcurl_urlapi$(ObjectSuffix) $(IntermediateDirectory)/libcurl_version$(ObjectSuffix) $(IntermediateDirectory)/libcurl_version_win32$(ObjectSuffix) $(IntermediateDirectory)/libcurl_warnless$(ObjectSuffix) $(IntermediateDirectory)/libcurl_ws$(ObjectSuffix) $(IntermediateDirectory)/fatfs_diskio$(ObjectSuffix) $(IntermediateDirectory)/fatfs_fatfs_test$(ObjectSuffix) $(IntermediateDirectory)/fatfs_ff$(ObjectSuffix) $(IntermediateDirectory)/fatfs_ffunicode$(ObjectSuffix) $(IntermediateDirectory)/fatfs_syscall$(ObjectSuffix) \
	$(IntermediateDirectory)/fatfs_osal_file$(ObjectSuffix) $(IntermediateDirectory)/uvc_hg_usb_device$(ObjectSuffix) $(IntermediateDirectory)/uvc_uvc_host$(ObjectSuffix) $(IntermediateDirectory)/de_avi_avidemux$(ObjectSuffix) $(IntermediateDirectory)/en_avi_openDML$(ObjectSuffix) $(IntermediateDirectory)/spi_sensor_spi_sensor$(ObjectSuffix) $(IntermediateDirectory)/resorce_bat$(ObjectSuffix) $(IntermediateDirectory)/resorce_btn0$(ObjectSuffix) $(IntermediateDirectory)/resorce_btn0_1$(ObjectSuffix) $(IntermediateDirectory)/resorce_dv_r$(ObjectSuffix) \
	$(IntermediateDirectory)/resorce_dv_w$(ObjectSuffix) $(IntermediateDirectory)/resorce_language$(ObjectSuffix) $(IntermediateDirectory)/resorce_main_photo$(ObjectSuffix) $(IntermediateDirectory)/resorce_menu1_0$(ObjectSuffix) $(IntermediateDirectory)/resorce_menu1_1$(ObjectSuffix) $(IntermediateDirectory)/resorce_menu1_2$(ObjectSuffix) $(IntermediateDirectory)/resorce_menu2_0$(ObjectSuffix) $(IntermediateDirectory)/resorce_menu2_1$(ObjectSuffix) $(IntermediateDirectory)/resorce_menu2_2$(ObjectSuffix) $(IntermediateDirectory)/resorce_menu3_0$(ObjectSuffix) \
	$(IntermediateDirectory)/resorce_menu3_1$(ObjectSuffix) $(IntermediateDirectory)/resorce_menu3_2$(ObjectSuffix) $(IntermediateDirectory)/resorce_menu4_0$(ObjectSuffix) $(IntermediateDirectory)/resorce_menu4_1$(ObjectSuffix) $(IntermediateDirectory)/resorce_menu4_2$(ObjectSuffix) $(IntermediateDirectory)/resorce_menu5_0$(ObjectSuffix) $(IntermediateDirectory)/resorce_menu5_1$(ObjectSuffix) $(IntermediateDirectory)/resorce_menu5_2$(ObjectSuffix) $(IntermediateDirectory)/resorce_menu6_0$(ObjectSuffix) $(IntermediateDirectory)/resorce_menu6_1$(ObjectSuffix) \
	$(IntermediateDirectory)/resorce_menu6_2$(ObjectSuffix) $(IntermediateDirectory)/resorce_menu_null$(ObjectSuffix) $(IntermediateDirectory)/resorce_menu_test$(ObjectSuffix) $(IntermediateDirectory)/resorce_myfont$(ObjectSuffix) $(IntermediateDirectory)/resorce_photo$(ObjectSuffix) $(IntermediateDirectory)/resorce_rec$(ObjectSuffix) 

Objects6=$(IntermediateDirectory)/resorce_menu_spi$(ObjectSuffix) $(IntermediateDirectory)/porting_lv_port_disp$(ObjectSuffix) $(IntermediateDirectory)/porting_lv_port_fs$(ObjectSuffix) $(IntermediateDirectory)/porting_lv_port_indev$(ObjectSuffix) \
	$(IntermediateDirectory)/pdmFilter_pdmFilter$(ObjectSuffix) $(IntermediateDirectory)/stream_frame_stream_frame$(ObjectSuffix) $(IntermediateDirectory)/csky_cpu_impl$(ObjectSuffix) $(IntermediateDirectory)/csky_csky_sched$(ObjectSuffix) $(IntermediateDirectory)/ck803_port_c$(ObjectSuffix) $(IntermediateDirectory)/ck803_port_s$(ObjectSuffix) $(IntermediateDirectory)/arch_sys_arch$(ObjectSuffix) $(IntermediateDirectory)/phy_auto_phy$(ObjectSuffix) $(IntermediateDirectory)/phy_ip101g$(ObjectSuffix) $(IntermediateDirectory)/phy_rtl8201f$(ObjectSuffix) \
	$(IntermediateDirectory)/phy_sz18201$(ObjectSuffix) $(IntermediateDirectory)/vauth_cleartext$(ObjectSuffix) $(IntermediateDirectory)/vauth_cram$(ObjectSuffix) $(IntermediateDirectory)/vauth_digest$(ObjectSuffix) $(IntermediateDirectory)/vauth_digest_sspi$(ObjectSuffix) $(IntermediateDirectory)/vauth_gsasl$(ObjectSuffix) $(IntermediateDirectory)/vauth_krb5_gssapi$(ObjectSuffix) $(IntermediateDirectory)/vauth_krb5_sspi$(ObjectSuffix) $(IntermediateDirectory)/vauth_ntlm$(ObjectSuffix) $(IntermediateDirectory)/vauth_ntlm_sspi$(ObjectSuffix) \
	$(IntermediateDirectory)/vauth_oauth2$(ObjectSuffix) $(IntermediateDirectory)/vauth_spnego_gssapi$(ObjectSuffix) $(IntermediateDirectory)/vauth_spnego_sspi$(ObjectSuffix) $(IntermediateDirectory)/vauth_vauth$(ObjectSuffix) $(IntermediateDirectory)/vquic_curl_msh3$(ObjectSuffix) $(IntermediateDirectory)/vquic_curl_ngtcp2$(ObjectSuffix) $(IntermediateDirectory)/vquic_curl_quiche$(ObjectSuffix) $(IntermediateDirectory)/vquic_vquic$(ObjectSuffix) $(IntermediateDirectory)/vssh_libssh$(ObjectSuffix) $(IntermediateDirectory)/vssh_libssh2$(ObjectSuffix) \
	$(IntermediateDirectory)/vssh_wolfssh$(ObjectSuffix) $(IntermediateDirectory)/vtls_bearssl$(ObjectSuffix) $(IntermediateDirectory)/vtls_gskit$(ObjectSuffix) $(IntermediateDirectory)/vtls_gtls$(ObjectSuffix) $(IntermediateDirectory)/vtls_hostcheck$(ObjectSuffix) $(IntermediateDirectory)/vtls_keylog$(ObjectSuffix) $(IntermediateDirectory)/vtls_mbedtls$(ObjectSuffix) 

Objects7=$(IntermediateDirectory)/vtls_mbedtls_threadlock$(ObjectSuffix) $(IntermediateDirectory)/vtls_nss$(ObjectSuffix) $(IntermediateDirectory)/vtls_openssl$(ObjectSuffix) \
	$(IntermediateDirectory)/vtls_rustls$(ObjectSuffix) $(IntermediateDirectory)/vtls_schannel$(ObjectSuffix) $(IntermediateDirectory)/vtls_schannel_verify$(ObjectSuffix) $(IntermediateDirectory)/vtls_sectransp$(ObjectSuffix) $(IntermediateDirectory)/vtls_vtls$(ObjectSuffix) $(IntermediateDirectory)/vtls_wolfssl$(ObjectSuffix) $(IntermediateDirectory)/vtls_x509asn1$(ObjectSuffix) $(IntermediateDirectory)/spi_nor_spi_nor_bus$(ObjectSuffix) $(IntermediateDirectory)/lcd_st7701s$(ObjectSuffix) $(IntermediateDirectory)/lcd_st7789v$(ObjectSuffix) \
	$(IntermediateDirectory)/lcd_st7789v_mcu$(ObjectSuffix) $(IntermediateDirectory)/lcd_hx8282$(ObjectSuffix) $(IntermediateDirectory)/sensor_sensor_bf2013$(ObjectSuffix) $(IntermediateDirectory)/sensor_sensor_bf3703$(ObjectSuffix) $(IntermediateDirectory)/sensor_sensor_bf3a03$(ObjectSuffix) $(IntermediateDirectory)/sensor_sensor_gc0308$(ObjectSuffix) $(IntermediateDirectory)/sensor_sensor_gc0309$(ObjectSuffix) $(IntermediateDirectory)/sensor_sensor_gc0328$(ObjectSuffix) $(IntermediateDirectory)/sensor_sensor_ov2640$(ObjectSuffix) $(IntermediateDirectory)/sensor_sensor_ov7670$(ObjectSuffix) \
	$(IntermediateDirectory)/sensor_sensor_ov7725$(ObjectSuffix) $(IntermediateDirectory)/sensor_sensor_xc7016_h63$(ObjectSuffix) $(IntermediateDirectory)/sensor_sensor_xcg532$(ObjectSuffix) $(IntermediateDirectory)/sensor_sensor_xc7011_gc1054$(ObjectSuffix) $(IntermediateDirectory)/sensor_sensor_xc7011_h63$(ObjectSuffix) $(IntermediateDirectory)/sensor_sensor_gc0311$(ObjectSuffix) $(IntermediateDirectory)/sensor_sensor_gc0329$(ObjectSuffix) $(IntermediateDirectory)/sensor_sensor_gc0312$(ObjectSuffix) $(IntermediateDirectory)/sensor_sensor_bf3720$(ObjectSuffix) $(IntermediateDirectory)/sensor_sensor_sp0a19$(ObjectSuffix) \
	$(IntermediateDirectory)/sensor_sensor_sp0718$(ObjectSuffix) $(IntermediateDirectory)/sensor_sensor_bf30a2$(ObjectSuffix) $(IntermediateDirectory)/gsensor_da280$(ObjectSuffix) $(IntermediateDirectory)/gsensor_qma7981$(ObjectSuffix) $(IntermediateDirectory)/gsensor_sc7a20$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_csi_v2$(ObjectSuffix) $(IntermediateDirectory)/jpeg_jpg_table$(ObjectSuffix) $(IntermediateDirectory)/jpeg_jpg_v2$(ObjectSuffix) $(IntermediateDirectory)/library_aes$(ObjectSuffix) $(IntermediateDirectory)/library_aesce$(ObjectSuffix) \
	$(IntermediateDirectory)/library_aesni$(ObjectSuffix) $(IntermediateDirectory)/library_aria$(ObjectSuffix) $(IntermediateDirectory)/library_asn1parse$(ObjectSuffix) $(IntermediateDirectory)/library_asn1write$(ObjectSuffix) $(IntermediateDirectory)/library_base64$(ObjectSuffix) $(IntermediateDirectory)/library_bignum$(ObjectSuffix) $(IntermediateDirectory)/library_bignum_core$(ObjectSuffix) $(IntermediateDirectory)/library_bignum_mod$(ObjectSuffix) $(IntermediateDirectory)/library_bignum_mod_raw$(ObjectSuffix) $(IntermediateDirectory)/library_camellia$(ObjectSuffix) \
	$(IntermediateDirectory)/library_ccm$(ObjectSuffix) $(IntermediateDirectory)/library_chacha20$(ObjectSuffix) $(IntermediateDirectory)/library_chachapoly$(ObjectSuffix) $(IntermediateDirectory)/library_cipher$(ObjectSuffix) $(IntermediateDirectory)/library_cipher_wrap$(ObjectSuffix) $(IntermediateDirectory)/library_cmac$(ObjectSuffix) $(IntermediateDirectory)/library_constant_time$(ObjectSuffix) $(IntermediateDirectory)/library_ctr_drbg$(ObjectSuffix) $(IntermediateDirectory)/library_debug$(ObjectSuffix) $(IntermediateDirectory)/library_des$(ObjectSuffix) \
	$(IntermediateDirectory)/library_dhm$(ObjectSuffix) $(IntermediateDirectory)/library_ecdh$(ObjectSuffix) $(IntermediateDirectory)/library_ecdsa$(ObjectSuffix) $(IntermediateDirectory)/library_ecjpake$(ObjectSuffix) $(IntermediateDirectory)/library_ecp$(ObjectSuffix) $(IntermediateDirectory)/library_ecp_curves$(ObjectSuffix) $(IntermediateDirectory)/library_entropy$(ObjectSuffix) $(IntermediateDirectory)/library_entropy_hwpoll$(ObjectSuffix) $(IntermediateDirectory)/library_entropy_poll$(ObjectSuffix) $(IntermediateDirectory)/library_error$(ObjectSuffix) \
	

Objects8=$(IntermediateDirectory)/library_gcm$(ObjectSuffix) $(IntermediateDirectory)/library_hash_info$(ObjectSuffix) $(IntermediateDirectory)/library_hkdf$(ObjectSuffix) $(IntermediateDirectory)/library_hmac_drbg$(ObjectSuffix) $(IntermediateDirectory)/library_lmots$(ObjectSuffix) $(IntermediateDirectory)/library_lms$(ObjectSuffix) $(IntermediateDirectory)/library_md$(ObjectSuffix) $(IntermediateDirectory)/library_md5$(ObjectSuffix) $(IntermediateDirectory)/library_memory_buffer_alloc$(ObjectSuffix) $(IntermediateDirectory)/library_mps_reader$(ObjectSuffix) \
	$(IntermediateDirectory)/library_mps_trace$(ObjectSuffix) $(IntermediateDirectory)/library_net_sockets$(ObjectSuffix) $(IntermediateDirectory)/library_nist_kw$(ObjectSuffix) $(IntermediateDirectory)/library_oid$(ObjectSuffix) $(IntermediateDirectory)/library_padlock$(ObjectSuffix) $(IntermediateDirectory)/library_pem$(ObjectSuffix) $(IntermediateDirectory)/library_pk$(ObjectSuffix) $(IntermediateDirectory)/library_pkcs12$(ObjectSuffix) $(IntermediateDirectory)/library_pkcs5$(ObjectSuffix) $(IntermediateDirectory)/library_pkcs7$(ObjectSuffix) \
	$(IntermediateDirectory)/library_pkparse$(ObjectSuffix) $(IntermediateDirectory)/library_pkwrite$(ObjectSuffix) $(IntermediateDirectory)/library_pk_wrap$(ObjectSuffix) $(IntermediateDirectory)/library_platform$(ObjectSuffix) $(IntermediateDirectory)/library_platform_util$(ObjectSuffix) $(IntermediateDirectory)/library_poly1305$(ObjectSuffix) $(IntermediateDirectory)/library_psa_crypto$(ObjectSuffix) $(IntermediateDirectory)/library_psa_crypto_aead$(ObjectSuffix) $(IntermediateDirectory)/library_psa_crypto_cipher$(ObjectSuffix) $(IntermediateDirectory)/library_psa_crypto_client$(ObjectSuffix) \
	$(IntermediateDirectory)/library_psa_crypto_driver_wrappers$(ObjectSuffix) $(IntermediateDirectory)/library_psa_crypto_ecp$(ObjectSuffix) $(IntermediateDirectory)/library_psa_crypto_hash$(ObjectSuffix) $(IntermediateDirectory)/library_psa_crypto_mac$(ObjectSuffix) $(IntermediateDirectory)/library_psa_crypto_pake$(ObjectSuffix) $(IntermediateDirectory)/library_psa_crypto_rsa$(ObjectSuffix) $(IntermediateDirectory)/library_psa_crypto_se$(ObjectSuffix) $(IntermediateDirectory)/library_psa_crypto_slot_management$(ObjectSuffix) $(IntermediateDirectory)/library_psa_crypto_storage$(ObjectSuffix) $(IntermediateDirectory)/library_psa_its_file$(ObjectSuffix) \
	$(IntermediateDirectory)/library_psa_util$(ObjectSuffix) $(IntermediateDirectory)/library_ripemd160$(ObjectSuffix) $(IntermediateDirectory)/library_rsa$(ObjectSuffix) $(IntermediateDirectory)/library_rsa_alt_helpers$(ObjectSuffix) $(IntermediateDirectory)/library_sha1$(ObjectSuffix) $(IntermediateDirectory)/library_sha256$(ObjectSuffix) $(IntermediateDirectory)/library_sha512$(ObjectSuffix) $(IntermediateDirectory)/library_ssl_cache$(ObjectSuffix) $(IntermediateDirectory)/library_ssl_ciphersuites$(ObjectSuffix) $(IntermediateDirectory)/library_ssl_client$(ObjectSuffix) \
	$(IntermediateDirectory)/library_ssl_cookie$(ObjectSuffix) $(IntermediateDirectory)/library_ssl_debug_helpers_generated$(ObjectSuffix) $(IntermediateDirectory)/library_ssl_msg$(ObjectSuffix) $(IntermediateDirectory)/library_ssl_ticket$(ObjectSuffix) $(IntermediateDirectory)/library_ssl_tls$(ObjectSuffix) $(IntermediateDirectory)/library_ssl_tls12_client$(ObjectSuffix) $(IntermediateDirectory)/library_ssl_tls12_server$(ObjectSuffix) $(IntermediateDirectory)/library_ssl_tls13_client$(ObjectSuffix) $(IntermediateDirectory)/library_ssl_tls13_generic$(ObjectSuffix) $(IntermediateDirectory)/library_ssl_tls13_keys$(ObjectSuffix) \
	$(IntermediateDirectory)/library_ssl_tls13_server$(ObjectSuffix) $(IntermediateDirectory)/library_threading$(ObjectSuffix) $(IntermediateDirectory)/library_timing$(ObjectSuffix) $(IntermediateDirectory)/library_version$(ObjectSuffix) $(IntermediateDirectory)/library_version_features$(ObjectSuffix) $(IntermediateDirectory)/library_x509$(ObjectSuffix) $(IntermediateDirectory)/library_x509write_crt$(ObjectSuffix) $(IntermediateDirectory)/library_x509write_csr$(ObjectSuffix) $(IntermediateDirectory)/library_x509_create$(ObjectSuffix) 

Objects9=$(IntermediateDirectory)/library_x509_crl$(ObjectSuffix) \
	$(IntermediateDirectory)/library_x509_crt$(ObjectSuffix) $(IntermediateDirectory)/library_x509_csr$(ObjectSuffix) $(IntermediateDirectory)/benchmark_lv_demo_benchmark$(ObjectSuffix) $(IntermediateDirectory)/keypad_encoder_lv_demo_keypad_encoder$(ObjectSuffix) $(IntermediateDirectory)/music_lv_demo_music$(ObjectSuffix) $(IntermediateDirectory)/music_lv_demo_music_list$(ObjectSuffix) $(IntermediateDirectory)/music_lv_demo_music_main$(ObjectSuffix) $(IntermediateDirectory)/stress_lv_demo_stress$(ObjectSuffix) $(IntermediateDirectory)/core_lv_disp$(ObjectSuffix) $(IntermediateDirectory)/core_lv_event$(ObjectSuffix) \
	$(IntermediateDirectory)/core_lv_group$(ObjectSuffix) $(IntermediateDirectory)/core_lv_indev$(ObjectSuffix) $(IntermediateDirectory)/core_lv_indev_scroll$(ObjectSuffix) $(IntermediateDirectory)/core_lv_obj$(ObjectSuffix) $(IntermediateDirectory)/core_lv_obj_class$(ObjectSuffix) $(IntermediateDirectory)/core_lv_obj_draw$(ObjectSuffix) $(IntermediateDirectory)/core_lv_obj_pos$(ObjectSuffix) $(IntermediateDirectory)/core_lv_obj_scroll$(ObjectSuffix) $(IntermediateDirectory)/core_lv_obj_style$(ObjectSuffix) $(IntermediateDirectory)/core_lv_obj_style_gen$(ObjectSuffix) \
	$(IntermediateDirectory)/core_lv_obj_tree$(ObjectSuffix) $(IntermediateDirectory)/core_lv_refr$(ObjectSuffix) $(IntermediateDirectory)/core_lv_theme$(ObjectSuffix) $(IntermediateDirectory)/draw_lv_draw$(ObjectSuffix) $(IntermediateDirectory)/draw_lv_draw_arc$(ObjectSuffix) $(IntermediateDirectory)/draw_lv_draw_img$(ObjectSuffix) $(IntermediateDirectory)/draw_lv_draw_label$(ObjectSuffix) $(IntermediateDirectory)/draw_lv_draw_layer$(ObjectSuffix) $(IntermediateDirectory)/draw_lv_draw_line$(ObjectSuffix) $(IntermediateDirectory)/draw_lv_draw_mask$(ObjectSuffix) \
	$(IntermediateDirectory)/draw_lv_draw_rect$(ObjectSuffix) $(IntermediateDirectory)/draw_lv_draw_transform$(ObjectSuffix) $(IntermediateDirectory)/draw_lv_draw_triangle$(ObjectSuffix) $(IntermediateDirectory)/draw_lv_img_buf$(ObjectSuffix) $(IntermediateDirectory)/draw_lv_img_cache$(ObjectSuffix) $(IntermediateDirectory)/draw_lv_img_cache_builtin$(ObjectSuffix) $(IntermediateDirectory)/draw_lv_img_decoder$(ObjectSuffix) $(IntermediateDirectory)/font_lv_font$(ObjectSuffix) $(IntermediateDirectory)/font_lv_font_dejavu_16_persian_hebrew$(ObjectSuffix) $(IntermediateDirectory)/font_lv_font_fmt_txt$(ObjectSuffix) \
	$(IntermediateDirectory)/font_lv_font_loader$(ObjectSuffix) $(IntermediateDirectory)/font_lv_font_montserrat_10$(ObjectSuffix) $(IntermediateDirectory)/font_lv_font_montserrat_12$(ObjectSuffix) $(IntermediateDirectory)/font_lv_font_montserrat_12_subpx$(ObjectSuffix) $(IntermediateDirectory)/font_lv_font_montserrat_14$(ObjectSuffix) $(IntermediateDirectory)/font_lv_font_montserrat_16$(ObjectSuffix) $(IntermediateDirectory)/font_lv_font_montserrat_18$(ObjectSuffix) $(IntermediateDirectory)/font_lv_font_montserrat_20$(ObjectSuffix) $(IntermediateDirectory)/font_lv_font_montserrat_22$(ObjectSuffix) $(IntermediateDirectory)/font_lv_font_montserrat_24$(ObjectSuffix) \
	$(IntermediateDirectory)/font_lv_font_montserrat_26$(ObjectSuffix) $(IntermediateDirectory)/font_lv_font_montserrat_28$(ObjectSuffix) $(IntermediateDirectory)/font_lv_font_montserrat_28_compressed$(ObjectSuffix) $(IntermediateDirectory)/font_lv_font_montserrat_30$(ObjectSuffix) $(IntermediateDirectory)/font_lv_font_montserrat_32$(ObjectSuffix) $(IntermediateDirectory)/font_lv_font_montserrat_34$(ObjectSuffix) $(IntermediateDirectory)/font_lv_font_montserrat_36$(ObjectSuffix) $(IntermediateDirectory)/font_lv_font_montserrat_38$(ObjectSuffix) $(IntermediateDirectory)/font_lv_font_montserrat_40$(ObjectSuffix) $(IntermediateDirectory)/font_lv_font_montserrat_42$(ObjectSuffix) \
	

Objects10=$(IntermediateDirectory)/font_lv_font_montserrat_44$(ObjectSuffix) $(IntermediateDirectory)/font_lv_font_montserrat_46$(ObjectSuffix) $(IntermediateDirectory)/font_lv_font_montserrat_48$(ObjectSuffix) $(IntermediateDirectory)/font_lv_font_montserrat_8$(ObjectSuffix) $(IntermediateDirectory)/font_lv_font_simsun_16_cjk$(ObjectSuffix) $(IntermediateDirectory)/font_lv_font_unscii_16$(ObjectSuffix) $(IntermediateDirectory)/font_lv_font_unscii_8$(ObjectSuffix) $(IntermediateDirectory)/hal_lv_hal_disp$(ObjectSuffix) $(IntermediateDirectory)/hal_lv_hal_indev$(ObjectSuffix) $(IntermediateDirectory)/hal_lv_hal_tick$(ObjectSuffix) \
	$(IntermediateDirectory)/misc_lv_anim$(ObjectSuffix) $(IntermediateDirectory)/misc_lv_anim_timeline$(ObjectSuffix) $(IntermediateDirectory)/misc_lv_area$(ObjectSuffix) $(IntermediateDirectory)/misc_lv_async$(ObjectSuffix) $(IntermediateDirectory)/misc_lv_bidi$(ObjectSuffix) $(IntermediateDirectory)/misc_lv_color$(ObjectSuffix) $(IntermediateDirectory)/misc_lv_fs$(ObjectSuffix) $(IntermediateDirectory)/misc_lv_gc$(ObjectSuffix) $(IntermediateDirectory)/misc_lv_ll$(ObjectSuffix) $(IntermediateDirectory)/misc_lv_log$(ObjectSuffix) \
	$(IntermediateDirectory)/misc_lv_lru$(ObjectSuffix) $(IntermediateDirectory)/misc_lv_malloc_builtin$(ObjectSuffix) $(IntermediateDirectory)/misc_lv_math$(ObjectSuffix) $(IntermediateDirectory)/misc_lv_mem$(ObjectSuffix) $(IntermediateDirectory)/misc_lv_memcpy_builtin$(ObjectSuffix) $(IntermediateDirectory)/misc_lv_printf$(ObjectSuffix) $(IntermediateDirectory)/misc_lv_style$(ObjectSuffix) $(IntermediateDirectory)/misc_lv_style_gen$(ObjectSuffix) $(IntermediateDirectory)/misc_lv_templ$(ObjectSuffix) $(IntermediateDirectory)/misc_lv_timer$(ObjectSuffix) \
	$(IntermediateDirectory)/misc_lv_tlsf$(ObjectSuffix) $(IntermediateDirectory)/misc_lv_txt$(ObjectSuffix) $(IntermediateDirectory)/misc_lv_txt_ap$(ObjectSuffix) $(IntermediateDirectory)/misc_lv_utils$(ObjectSuffix) $(IntermediateDirectory)/project_1_project_1$(ObjectSuffix) $(IntermediateDirectory)/api_api_lib$(ObjectSuffix) $(IntermediateDirectory)/api_api_msg$(ObjectSuffix) $(IntermediateDirectory)/api_err$(ObjectSuffix) $(IntermediateDirectory)/api_if_api$(ObjectSuffix) $(IntermediateDirectory)/api_netbuf$(ObjectSuffix) \
	$(IntermediateDirectory)/api_netdb$(ObjectSuffix) $(IntermediateDirectory)/api_netifapi$(ObjectSuffix) $(IntermediateDirectory)/api_sockets$(ObjectSuffix) $(IntermediateDirectory)/api_tcpip$(ObjectSuffix) $(IntermediateDirectory)/api_ping$(ObjectSuffix) $(IntermediateDirectory)/core_altcp$(ObjectSuffix) $(IntermediateDirectory)/core_altcp_alloc$(ObjectSuffix) $(IntermediateDirectory)/core_altcp_tcp$(ObjectSuffix) $(IntermediateDirectory)/core_def$(ObjectSuffix) $(IntermediateDirectory)/core_dns$(ObjectSuffix) \
	$(IntermediateDirectory)/core_inet_chksum$(ObjectSuffix) $(IntermediateDirectory)/core_init$(ObjectSuffix) $(IntermediateDirectory)/core_ip$(ObjectSuffix) $(IntermediateDirectory)/core_mem$(ObjectSuffix) $(IntermediateDirectory)/core_memp$(ObjectSuffix) $(IntermediateDirectory)/core_netif$(ObjectSuffix) $(IntermediateDirectory)/core_pbuf$(ObjectSuffix) $(IntermediateDirectory)/core_raw$(ObjectSuffix) $(IntermediateDirectory)/core_stats$(ObjectSuffix) $(IntermediateDirectory)/core_sys$(ObjectSuffix) \
	$(IntermediateDirectory)/core_tcp$(ObjectSuffix) $(IntermediateDirectory)/core_tcp_in$(ObjectSuffix) $(IntermediateDirectory)/core_tcp_out$(ObjectSuffix) $(IntermediateDirectory)/core_timeouts$(ObjectSuffix) $(IntermediateDirectory)/core_udp$(ObjectSuffix) $(IntermediateDirectory)/netif_bridgeif$(ObjectSuffix) $(IntermediateDirectory)/netif_bridgeif_fdb$(ObjectSuffix) 

Objects11=$(IntermediateDirectory)/netif_ethernet$(ObjectSuffix) $(IntermediateDirectory)/netif_ethernetif$(ObjectSuffix) $(IntermediateDirectory)/netif_lowpan6$(ObjectSuffix) \
	$(IntermediateDirectory)/netif_lowpan6_ble$(ObjectSuffix) $(IntermediateDirectory)/netif_lowpan6_common$(ObjectSuffix) $(IntermediateDirectory)/netif_slipif$(ObjectSuffix) $(IntermediateDirectory)/netif_zepif$(ObjectSuffix) 

Objects12=$(IntermediateDirectory)/assets_img_benchmark_cogwheel_alpha16$(ObjectSuffix) $(IntermediateDirectory)/assets_img_benchmark_cogwheel_argb$(ObjectSuffix) $(IntermediateDirectory)/assets_img_benchmark_cogwheel_chroma_keyed$(ObjectSuffix) $(IntermediateDirectory)/assets_img_benchmark_cogwheel_indexed16$(ObjectSuffix) $(IntermediateDirectory)/assets_img_benchmark_cogwheel_rgb$(ObjectSuffix) $(IntermediateDirectory)/assets_img_benchmark_cogwheel_rgb565a8$(ObjectSuffix) \
	$(IntermediateDirectory)/assets_lv_font_bechmark_montserrat_12_compr_az.c$(ObjectSuffix) $(IntermediateDirectory)/assets_lv_font_bechmark_montserrat_16_compr_az.c$(ObjectSuffix) $(IntermediateDirectory)/assets_lv_font_bechmark_montserrat_28_compr_az.c$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_btn_corner_large$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_btn_list_pause$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_btn_list_pause_large$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_btn_list_play$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_btn_list_play_large$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_btn_loop$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_btn_loop_large$(ObjectSuffix) \
	$(IntermediateDirectory)/assets_img_lv_demo_music_btn_next$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_btn_next_large$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_btn_pause$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_btn_pause_large$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_btn_play$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_btn_play_large$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_btn_prev$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_btn_prev_large$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_btn_rnd$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_btn_rnd_large$(ObjectSuffix) \
	$(IntermediateDirectory)/assets_img_lv_demo_music_corner_left$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_corner_left_large$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_corner_right$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_corner_right_large$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_cover_1$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_cover_1_large$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_cover_2$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_cover_2_large$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_cover_3$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_cover_3_large$(ObjectSuffix) \
	$(IntermediateDirectory)/assets_img_lv_demo_music_icon_1$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_icon_1_large$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_icon_2$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_icon_2_large$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_icon_3$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_icon_3_large$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_icon_4$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_icon_4_large$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_list_border$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_list_border_large$(ObjectSuffix) \
	$(IntermediateDirectory)/assets_img_lv_demo_music_logo$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_slider_knob$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_slider_knob_large$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_wave_bottom$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_wave_bottom_large$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_wave_top$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lv_demo_music_wave_top_large$(ObjectSuffix) $(IntermediateDirectory)/assets_img_clothes$(ObjectSuffix) $(IntermediateDirectory)/assets_img_demo_widgets_avatar$(ObjectSuffix) $(IntermediateDirectory)/assets_img_lvgl_logo$(ObjectSuffix) \
	$(IntermediateDirectory)/arm2d_lv_gpu_arm2d$(ObjectSuffix) $(IntermediateDirectory)/gd32_ipa_lv_gpu_gd32_ipa$(ObjectSuffix) $(IntermediateDirectory)/nxp_lv_gpu_nxp$(ObjectSuffix) $(IntermediateDirectory)/sdl_lv_draw_sdl$(ObjectSuffix) $(IntermediateDirectory)/sdl_lv_draw_sdl_arc$(ObjectSuffix) $(IntermediateDirectory)/sdl_lv_draw_sdl_bg$(ObjectSuffix) $(IntermediateDirectory)/sdl_lv_draw_sdl_composite$(ObjectSuffix) $(IntermediateDirectory)/sdl_lv_draw_sdl_img$(ObjectSuffix) $(IntermediateDirectory)/sdl_lv_draw_sdl_label$(ObjectSuffix) $(IntermediateDirectory)/sdl_lv_draw_sdl_layer$(ObjectSuffix) \
	$(IntermediateDirectory)/sdl_lv_draw_sdl_line$(ObjectSuffix) $(IntermediateDirectory)/sdl_lv_draw_sdl_mask$(ObjectSuffix) $(IntermediateDirectory)/sdl_lv_draw_sdl_polygon$(ObjectSuffix) $(IntermediateDirectory)/sdl_lv_draw_sdl_rect$(ObjectSuffix) $(IntermediateDirectory)/sdl_lv_draw_sdl_stack_blur$(ObjectSuffix) $(IntermediateDirectory)/sdl_lv_draw_sdl_texture_cache$(ObjectSuffix) $(IntermediateDirectory)/sdl_lv_draw_sdl_utils$(ObjectSuffix) $(IntermediateDirectory)/stm32_dma2d_lv_gpu_stm32_dma2d$(ObjectSuffix) $(IntermediateDirectory)/sw_lv_draw_sw$(ObjectSuffix) $(IntermediateDirectory)/sw_lv_draw_sw_arc$(ObjectSuffix) \
	$(IntermediateDirectory)/sw_lv_draw_sw_blend$(ObjectSuffix) $(IntermediateDirectory)/sw_lv_draw_sw_dither$(ObjectSuffix) 

Objects13=$(IntermediateDirectory)/sw_lv_draw_sw_gradient$(ObjectSuffix) $(IntermediateDirectory)/sw_lv_draw_sw_img$(ObjectSuffix) $(IntermediateDirectory)/sw_lv_draw_sw_layer$(ObjectSuffix) $(IntermediateDirectory)/sw_lv_draw_sw_letter$(ObjectSuffix) $(IntermediateDirectory)/sw_lv_draw_sw_line$(ObjectSuffix) $(IntermediateDirectory)/sw_lv_draw_sw_polygon$(ObjectSuffix) $(IntermediateDirectory)/sw_lv_draw_sw_rect$(ObjectSuffix) $(IntermediateDirectory)/sw_lv_draw_sw_transform$(ObjectSuffix) \
	$(IntermediateDirectory)/swm341_dma2d_lv_gpu_swm341_dma2d$(ObjectSuffix) $(IntermediateDirectory)/flex_lv_flex$(ObjectSuffix) $(IntermediateDirectory)/grid_lv_grid$(ObjectSuffix) $(IntermediateDirectory)/bmp_lv_bmp$(ObjectSuffix) $(IntermediateDirectory)/ffmpeg_lv_ffmpeg$(ObjectSuffix) $(IntermediateDirectory)/freetype_lv_freetype$(ObjectSuffix) $(IntermediateDirectory)/freetype_lv_ftsystem$(ObjectSuffix) $(IntermediateDirectory)/fsdrv_lv_fs_cbfs$(ObjectSuffix) $(IntermediateDirectory)/fsdrv_lv_fs_fatfs$(ObjectSuffix) $(IntermediateDirectory)/fsdrv_lv_fs_posix$(ObjectSuffix) \
	$(IntermediateDirectory)/fsdrv_lv_fs_stdio$(ObjectSuffix) $(IntermediateDirectory)/fsdrv_lv_fs_win32$(ObjectSuffix) $(IntermediateDirectory)/gif_gifdec$(ObjectSuffix) $(IntermediateDirectory)/gif_lv_gif$(ObjectSuffix) $(IntermediateDirectory)/png_lodepng$(ObjectSuffix) $(IntermediateDirectory)/png_lv_png$(ObjectSuffix) $(IntermediateDirectory)/qrcode_lv_qrcode$(ObjectSuffix) $(IntermediateDirectory)/qrcode_qrcodegen$(ObjectSuffix) $(IntermediateDirectory)/rlottie_lv_rlottie$(ObjectSuffix) $(IntermediateDirectory)/sjpg_lv_sjpg$(ObjectSuffix) \
	$(IntermediateDirectory)/sjpg_tjpgd$(ObjectSuffix) $(IntermediateDirectory)/tiny_ttf_lv_tiny_ttf$(ObjectSuffix) $(IntermediateDirectory)/file_explorer_lv_file_explorer$(ObjectSuffix) $(IntermediateDirectory)/fragment_lv_fragment$(ObjectSuffix) $(IntermediateDirectory)/fragment_lv_fragment_manager$(ObjectSuffix) $(IntermediateDirectory)/gridnav_lv_gridnav$(ObjectSuffix) $(IntermediateDirectory)/ime_lv_ime_pinyin$(ObjectSuffix) $(IntermediateDirectory)/imgfont_lv_imgfont$(ObjectSuffix) $(IntermediateDirectory)/monkey_lv_monkey$(ObjectSuffix) $(IntermediateDirectory)/msg_lv_msg$(ObjectSuffix) \
	$(IntermediateDirectory)/snapshot_lv_snapshot$(ObjectSuffix) $(IntermediateDirectory)/basic_lv_theme_basic$(ObjectSuffix) $(IntermediateDirectory)/default_lv_theme_default$(ObjectSuffix) $(IntermediateDirectory)/mono_lv_theme_mono$(ObjectSuffix) $(IntermediateDirectory)/animimg_lv_animimg$(ObjectSuffix) $(IntermediateDirectory)/arc_lv_arc$(ObjectSuffix) $(IntermediateDirectory)/bar_lv_bar$(ObjectSuffix) $(IntermediateDirectory)/btn_lv_btn$(ObjectSuffix) $(IntermediateDirectory)/btnmatrix_lv_btnmatrix$(ObjectSuffix) $(IntermediateDirectory)/calendar_lv_calendar$(ObjectSuffix) \
	$(IntermediateDirectory)/calendar_lv_calendar_header_arrow$(ObjectSuffix) $(IntermediateDirectory)/calendar_lv_calendar_header_dropdown$(ObjectSuffix) $(IntermediateDirectory)/canvas_lv_canvas$(ObjectSuffix) $(IntermediateDirectory)/chart_lv_chart$(ObjectSuffix) $(IntermediateDirectory)/checkbox_lv_checkbox$(ObjectSuffix) $(IntermediateDirectory)/colorwheel_lv_colorwheel$(ObjectSuffix) 

Objects14=$(IntermediateDirectory)/dropdown_lv_dropdown$(ObjectSuffix) $(IntermediateDirectory)/img_lv_img$(ObjectSuffix) $(IntermediateDirectory)/imgbtn_lv_imgbtn$(ObjectSuffix) $(IntermediateDirectory)/keyboard_lv_keyboard$(ObjectSuffix) \
	$(IntermediateDirectory)/label_lv_label$(ObjectSuffix) $(IntermediateDirectory)/led_lv_led$(ObjectSuffix) $(IntermediateDirectory)/line_lv_line$(ObjectSuffix) $(IntermediateDirectory)/list_lv_list$(ObjectSuffix) $(IntermediateDirectory)/menu_lv_menu$(ObjectSuffix) $(IntermediateDirectory)/meter_lv_meter$(ObjectSuffix) $(IntermediateDirectory)/msgbox_lv_msgbox$(ObjectSuffix) $(IntermediateDirectory)/objx_templ_lv_objx_templ$(ObjectSuffix) $(IntermediateDirectory)/roller_lv_roller$(ObjectSuffix) $(IntermediateDirectory)/slider_lv_slider$(ObjectSuffix) \
	$(IntermediateDirectory)/span_lv_span$(ObjectSuffix) $(IntermediateDirectory)/spinbox_lv_spinbox$(ObjectSuffix) $(IntermediateDirectory)/spinner_lv_spinner$(ObjectSuffix) $(IntermediateDirectory)/switch_lv_switch$(ObjectSuffix) $(IntermediateDirectory)/table_lv_table$(ObjectSuffix) $(IntermediateDirectory)/tabview_lv_tabview$(ObjectSuffix) $(IntermediateDirectory)/textarea_lv_textarea$(ObjectSuffix) $(IntermediateDirectory)/tileview_lv_tileview$(ObjectSuffix) $(IntermediateDirectory)/win_lv_win$(ObjectSuffix) $(IntermediateDirectory)/ipv4_autoip$(ObjectSuffix) \
	$(IntermediateDirectory)/ipv4_dhcp$(ObjectSuffix) $(IntermediateDirectory)/ipv4_etharp$(ObjectSuffix) $(IntermediateDirectory)/ipv4_icmp$(ObjectSuffix) $(IntermediateDirectory)/ipv4_igmp$(ObjectSuffix) $(IntermediateDirectory)/ipv4_ip4$(ObjectSuffix) $(IntermediateDirectory)/ipv4_ip4_addr$(ObjectSuffix) $(IntermediateDirectory)/ipv4_ip4_frag$(ObjectSuffix) $(IntermediateDirectory)/ipv6_dhcp6$(ObjectSuffix) $(IntermediateDirectory)/ipv6_ethip6$(ObjectSuffix) $(IntermediateDirectory)/ipv6_icmp6$(ObjectSuffix) \
	$(IntermediateDirectory)/ipv6_inet6$(ObjectSuffix) $(IntermediateDirectory)/ipv6_ip6$(ObjectSuffix) $(IntermediateDirectory)/ipv6_ip6_addr$(ObjectSuffix) $(IntermediateDirectory)/ipv6_ip6_frag$(ObjectSuffix) $(IntermediateDirectory)/ipv6_mld6$(ObjectSuffix) $(IntermediateDirectory)/ipv6_nd6$(ObjectSuffix) $(IntermediateDirectory)/ppp_auth$(ObjectSuffix) $(IntermediateDirectory)/ppp_ccp$(ObjectSuffix) $(IntermediateDirectory)/ppp_chap-md5$(ObjectSuffix) $(IntermediateDirectory)/ppp_chap-new$(ObjectSuffix) \
	$(IntermediateDirectory)/ppp_chap_ms$(ObjectSuffix) $(IntermediateDirectory)/ppp_demand$(ObjectSuffix) $(IntermediateDirectory)/ppp_eap$(ObjectSuffix) $(IntermediateDirectory)/ppp_ecp$(ObjectSuffix) $(IntermediateDirectory)/ppp_eui64$(ObjectSuffix) $(IntermediateDirectory)/ppp_fsm$(ObjectSuffix) $(IntermediateDirectory)/ppp_ipcp$(ObjectSuffix) $(IntermediateDirectory)/ppp_ipv6cp$(ObjectSuffix) $(IntermediateDirectory)/ppp_lcp$(ObjectSuffix) $(IntermediateDirectory)/ppp_magic$(ObjectSuffix) \
	$(IntermediateDirectory)/ppp_mppe$(ObjectSuffix) $(IntermediateDirectory)/ppp_multilink$(ObjectSuffix) $(IntermediateDirectory)/ppp_ppp$(ObjectSuffix) $(IntermediateDirectory)/ppp_pppapi$(ObjectSuffix) $(IntermediateDirectory)/ppp_pppcrypt$(ObjectSuffix) $(IntermediateDirectory)/ppp_pppoe$(ObjectSuffix) $(IntermediateDirectory)/ppp_pppol2tp$(ObjectSuffix) $(IntermediateDirectory)/ppp_pppos$(ObjectSuffix) $(IntermediateDirectory)/ppp_upap$(ObjectSuffix) $(IntermediateDirectory)/ppp_utils$(ObjectSuffix) \
	$(IntermediateDirectory)/ppp_vj$(ObjectSuffix) $(IntermediateDirectory)/pxp_lv_draw_pxp_blend$(ObjectSuffix) $(IntermediateDirectory)/pxp_lv_gpu_nxp_pxp$(ObjectSuffix) $(IntermediateDirectory)/pxp_lv_gpu_nxp_pxp_osa$(ObjectSuffix) $(IntermediateDirectory)/vglite_lv_draw_vglite_arc$(ObjectSuffix) $(IntermediateDirectory)/vglite_lv_draw_vglite_blend$(ObjectSuffix) $(IntermediateDirectory)/vglite_lv_draw_vglite_rect$(ObjectSuffix) 

Objects15=$(IntermediateDirectory)/vglite_lv_gpu_nxp_vglite$(ObjectSuffix) $(IntermediateDirectory)/polarssl_arc4$(ObjectSuffix) $(IntermediateDirectory)/polarssl_des$(ObjectSuffix) \
	$(IntermediateDirectory)/polarssl_md4$(ObjectSuffix) $(IntermediateDirectory)/polarssl_md5$(ObjectSuffix) $(IntermediateDirectory)/polarssl_sha1$(ObjectSuffix) $(IntermediateDirectory)/__rt_entry$(ObjectSuffix) 



Objects=$(Objects0) $(Objects1) $(Objects2) $(Objects3) $(Objects4) $(Objects5) $(Objects6) $(Objects7) $(Objects8) $(Objects9) $(Objects10) $(Objects11) $(Objects12) $(Objects13) $(Objects14) $(Objects15) 

##
## Main Build Targets 
##
.PHONY: all
all: $(IntermediateDirectory)/$(OutputFile)

$(IntermediateDirectory)/$(OutputFile):  $(Objects) Always_Link 
	$(LinkerName) $(OutputSwitch) $(IntermediateDirectory)/$(OutputFile)$(ExeSuffix) $(LinkerNameoption) $(LinkOtherFlagsOption)  -Wl,--ckmap=$(ProjectPath)/Lst/$(OutputFile).map  @$(ObjectsFileList)  $(LinkOptions) $(LibPath) $(Libs)
	@mv $(ProjectPath)/Lst/$(OutputFile).map $(ProjectPath)/Lst/$(OutputFile).temp && $(READELF) $(ElfInfoSwitch) $(ProjectPath)/Obj/$(OutputFile)$(ExeSuffix) > $(ProjectPath)/Lst/$(OutputFile).map && echo ====================================================================== >> $(ProjectPath)/Lst/$(OutputFile).map && cat $(ProjectPath)/Lst/$(OutputFile).temp >> $(ProjectPath)/Lst/$(OutputFile).map && rm -rf $(ProjectPath)/Lst/$(OutputFile).temp
	$(OBJCOPY) $(ObjcopySwitch) $(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)  $(ProjectPath)/Obj/$(OutputFile)$(IHexSuffix) 
		$(OBJDUMP) $(ObjdumpSwitch) $(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)  > $(ProjectPath)/Lst/$(OutputFile)$(DisassemSuffix) 
	@echo size of target:
	@$(SIZE) $(ProjectPath)$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix) 
	@echo -n checksum value of target:  
	@$(CHECKSUM) $(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix) 
	@$(ProjectName).modify.bat $(IntermediateDirectory) $(OutputFile)$(ExeSuffix) 

Always_Link:


##
## Objects
##
$(IntermediateDirectory)/main$(ObjectSuffix): main.c  
	$(CC) $(SourceSwitch) main.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/main$(ObjectSuffix) -MF$(IntermediateDirectory)/main$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/main$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/main$(PreprocessSuffix): main.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/main$(PreprocessSuffix) main.c

$(IntermediateDirectory)/device$(ObjectSuffix): device.c  
	$(CC) $(SourceSwitch) device.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/device$(ObjectSuffix) -MF$(IntermediateDirectory)/device$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/device$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/device$(PreprocessSuffix): device.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/device$(PreprocessSuffix) device.c

$(IntermediateDirectory)/syscfg$(ObjectSuffix): syscfg.c  
	$(CC) $(SourceSwitch) syscfg.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/syscfg$(ObjectSuffix) -MF$(IntermediateDirectory)/syscfg$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/syscfg$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/syscfg$(PreprocessSuffix): syscfg.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/syscfg$(PreprocessSuffix) syscfg.c

$(IntermediateDirectory)/hgic_usart$(ObjectSuffix): ../csky/hgic/usart.c  
	$(CC) $(SourceSwitch) ../csky/hgic/usart.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hgic_usart$(ObjectSuffix) -MF$(IntermediateDirectory)/hgic_usart$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hgic_usart$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hgic_usart$(PreprocessSuffix): ../csky/hgic/usart.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hgic_usart$(PreprocessSuffix) ../csky/hgic/usart.c

$(IntermediateDirectory)/hgic_malloc$(ObjectSuffix): ../csky/hgic/malloc.c  
	$(CC) $(SourceSwitch) ../csky/hgic/malloc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hgic_malloc$(ObjectSuffix) -MF$(IntermediateDirectory)/hgic_malloc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hgic_malloc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hgic_malloc$(PreprocessSuffix): ../csky/hgic/malloc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hgic_malloc$(PreprocessSuffix) ../csky/hgic/malloc.c

$(IntermediateDirectory)/hgic_assert$(ObjectSuffix): ../csky/hgic/assert.c  
	$(CC) $(SourceSwitch) ../csky/hgic/assert.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hgic_assert$(ObjectSuffix) -MF$(IntermediateDirectory)/hgic_assert$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hgic_assert$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hgic_assert$(PreprocessSuffix): ../csky/hgic/assert.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hgic_assert$(PreprocessSuffix) ../csky/hgic/assert.c

$(IntermediateDirectory)/hal_dev$(ObjectSuffix): ../sdk/hal/dev.c  
	$(CC) $(SourceSwitch) ../sdk/hal/dev.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hal_dev$(ObjectSuffix) -MF$(IntermediateDirectory)/hal_dev$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hal_dev$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hal_dev$(PreprocessSuffix): ../sdk/hal/dev.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hal_dev$(PreprocessSuffix) ../sdk/hal/dev.c

$(IntermediateDirectory)/hal_gpio$(ObjectSuffix): ../sdk/hal/gpio.c  
	$(CC) $(SourceSwitch) ../sdk/hal/gpio.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hal_gpio$(ObjectSuffix) -MF$(IntermediateDirectory)/hal_gpio$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hal_gpio$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hal_gpio$(PreprocessSuffix): ../sdk/hal/gpio.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hal_gpio$(PreprocessSuffix) ../sdk/hal/gpio.c

$(IntermediateDirectory)/hal_i2c$(ObjectSuffix): ../sdk/hal/i2c.c  
	$(CC) $(SourceSwitch) ../sdk/hal/i2c.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hal_i2c$(ObjectSuffix) -MF$(IntermediateDirectory)/hal_i2c$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hal_i2c$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hal_i2c$(PreprocessSuffix): ../sdk/hal/i2c.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hal_i2c$(PreprocessSuffix) ../sdk/hal/i2c.c

$(IntermediateDirectory)/hal_sdio_slave$(ObjectSuffix): ../sdk/hal/sdio_slave.c  
	$(CC) $(SourceSwitch) ../sdk/hal/sdio_slave.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hal_sdio_slave$(ObjectSuffix) -MF$(IntermediateDirectory)/hal_sdio_slave$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hal_sdio_slave$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hal_sdio_slave$(PreprocessSuffix): ../sdk/hal/sdio_slave.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hal_sdio_slave$(PreprocessSuffix) ../sdk/hal/sdio_slave.c

$(IntermediateDirectory)/hal_timer$(ObjectSuffix): ../sdk/hal/timer.c  
	$(CC) $(SourceSwitch) ../sdk/hal/timer.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hal_timer$(ObjectSuffix) -MF$(IntermediateDirectory)/hal_timer$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hal_timer$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hal_timer$(PreprocessSuffix): ../sdk/hal/timer.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hal_timer$(PreprocessSuffix) ../sdk/hal/timer.c

$(IntermediateDirectory)/hal_usb_device$(ObjectSuffix): ../sdk/hal/usb_device.c  
	$(CC) $(SourceSwitch) ../sdk/hal/usb_device.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hal_usb_device$(ObjectSuffix) -MF$(IntermediateDirectory)/hal_usb_device$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hal_usb_device$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hal_usb_device$(PreprocessSuffix): ../sdk/hal/usb_device.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hal_usb_device$(PreprocessSuffix) ../sdk/hal/usb_device.c

$(IntermediateDirectory)/hal_spi$(ObjectSuffix): ../sdk/hal/spi.c  
	$(CC) $(SourceSwitch) ../sdk/hal/spi.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hal_spi$(ObjectSuffix) -MF$(IntermediateDirectory)/hal_spi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hal_spi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hal_spi$(PreprocessSuffix): ../sdk/hal/spi.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hal_spi$(PreprocessSuffix) ../sdk/hal/spi.c

$(IntermediateDirectory)/hal_spi_nor$(ObjectSuffix): ../sdk/hal/spi_nor.c  
	$(CC) $(SourceSwitch) ../sdk/hal/spi_nor.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hal_spi_nor$(ObjectSuffix) -MF$(IntermediateDirectory)/hal_spi_nor$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hal_spi_nor$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hal_spi_nor$(PreprocessSuffix): ../sdk/hal/spi_nor.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hal_spi_nor$(PreprocessSuffix) ../sdk/hal/spi_nor.c

$(IntermediateDirectory)/hal_sysaes$(ObjectSuffix): ../sdk/hal/sysaes.c  
	$(CC) $(SourceSwitch) ../sdk/hal/sysaes.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hal_sysaes$(ObjectSuffix) -MF$(IntermediateDirectory)/hal_sysaes$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hal_sysaes$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hal_sysaes$(PreprocessSuffix): ../sdk/hal/sysaes.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hal_sysaes$(PreprocessSuffix) ../sdk/hal/sysaes.c

$(IntermediateDirectory)/hal_uart$(ObjectSuffix): ../sdk/hal/uart.c  
	$(CC) $(SourceSwitch) ../sdk/hal/uart.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hal_uart$(ObjectSuffix) -MF$(IntermediateDirectory)/hal_uart$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hal_uart$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hal_uart$(PreprocessSuffix): ../sdk/hal/uart.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hal_uart$(PreprocessSuffix) ../sdk/hal/uart.c

$(IntermediateDirectory)/hal_i2s$(ObjectSuffix): ../sdk/hal/i2s.c  
	$(CC) $(SourceSwitch) ../sdk/hal/i2s.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hal_i2s$(ObjectSuffix) -MF$(IntermediateDirectory)/hal_i2s$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hal_i2s$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hal_i2s$(PreprocessSuffix): ../sdk/hal/i2s.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hal_i2s$(PreprocessSuffix) ../sdk/hal/i2s.c

$(IntermediateDirectory)/hal_pdm$(ObjectSuffix): ../sdk/hal/pdm.c  
	$(CC) $(SourceSwitch) ../sdk/hal/pdm.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hal_pdm$(ObjectSuffix) -MF$(IntermediateDirectory)/hal_pdm$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hal_pdm$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hal_pdm$(PreprocessSuffix): ../sdk/hal/pdm.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hal_pdm$(PreprocessSuffix) ../sdk/hal/pdm.c

$(IntermediateDirectory)/hal_led$(ObjectSuffix): ../sdk/hal/led.c  
	$(CC) $(SourceSwitch) ../sdk/hal/led.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hal_led$(ObjectSuffix) -MF$(IntermediateDirectory)/hal_led$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hal_led$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hal_led$(PreprocessSuffix): ../sdk/hal/led.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hal_led$(PreprocessSuffix) ../sdk/hal/led.c

$(IntermediateDirectory)/hal_pwm$(ObjectSuffix): ../sdk/hal/pwm.c  
	$(CC) $(SourceSwitch) ../sdk/hal/pwm.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hal_pwm$(ObjectSuffix) -MF$(IntermediateDirectory)/hal_pwm$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hal_pwm$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hal_pwm$(PreprocessSuffix): ../sdk/hal/pwm.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hal_pwm$(PreprocessSuffix) ../sdk/hal/pwm.c

$(IntermediateDirectory)/hal_capture$(ObjectSuffix): ../sdk/hal/capture.c  
	$(CC) $(SourceSwitch) ../sdk/hal/capture.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hal_capture$(ObjectSuffix) -MF$(IntermediateDirectory)/hal_capture$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hal_capture$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hal_capture$(PreprocessSuffix): ../sdk/hal/capture.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hal_capture$(PreprocessSuffix) ../sdk/hal/capture.c

$(IntermediateDirectory)/hal_adc$(ObjectSuffix): ../sdk/hal/adc.c  
	$(CC) $(SourceSwitch) ../sdk/hal/adc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hal_adc$(ObjectSuffix) -MF$(IntermediateDirectory)/hal_adc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hal_adc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hal_adc$(PreprocessSuffix): ../sdk/hal/adc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hal_adc$(PreprocessSuffix) ../sdk/hal/adc.c

$(IntermediateDirectory)/hal_netdev$(ObjectSuffix): ../sdk/hal/netdev.c  
	$(CC) $(SourceSwitch) ../sdk/hal/netdev.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hal_netdev$(ObjectSuffix) -MF$(IntermediateDirectory)/hal_netdev$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hal_netdev$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hal_netdev$(PreprocessSuffix): ../sdk/hal/netdev.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hal_netdev$(PreprocessSuffix) ../sdk/hal/netdev.c

$(IntermediateDirectory)/hal_dvp$(ObjectSuffix): ../sdk/hal/dvp.c  
	$(CC) $(SourceSwitch) ../sdk/hal/dvp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hal_dvp$(ObjectSuffix) -MF$(IntermediateDirectory)/hal_dvp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hal_dvp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hal_dvp$(PreprocessSuffix): ../sdk/hal/dvp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hal_dvp$(PreprocessSuffix) ../sdk/hal/dvp.c

$(IntermediateDirectory)/hal_dma$(ObjectSuffix): ../sdk/hal/dma.c  
	$(CC) $(SourceSwitch) ../sdk/hal/dma.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hal_dma$(ObjectSuffix) -MF$(IntermediateDirectory)/hal_dma$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hal_dma$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hal_dma$(PreprocessSuffix): ../sdk/hal/dma.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hal_dma$(PreprocessSuffix) ../sdk/hal/dma.c

$(IntermediateDirectory)/hal_jpeg$(ObjectSuffix): ../sdk/hal/jpeg.c  
	$(CC) $(SourceSwitch) ../sdk/hal/jpeg.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hal_jpeg$(ObjectSuffix) -MF$(IntermediateDirectory)/hal_jpeg$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hal_jpeg$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hal_jpeg$(PreprocessSuffix): ../sdk/hal/jpeg.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hal_jpeg$(PreprocessSuffix) ../sdk/hal/jpeg.c

$(IntermediateDirectory)/hal_tk$(ObjectSuffix): ../sdk/hal/tk.c  
	$(CC) $(SourceSwitch) ../sdk/hal/tk.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hal_tk$(ObjectSuffix) -MF$(IntermediateDirectory)/hal_tk$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hal_tk$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hal_tk$(PreprocessSuffix): ../sdk/hal/tk.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hal_tk$(PreprocessSuffix) ../sdk/hal/tk.c

$(IntermediateDirectory)/hal_lcdc$(ObjectSuffix): ../sdk/hal/lcdc.c  
	$(CC) $(SourceSwitch) ../sdk/hal/lcdc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hal_lcdc$(ObjectSuffix) -MF$(IntermediateDirectory)/hal_lcdc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hal_lcdc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hal_lcdc$(PreprocessSuffix): ../sdk/hal/lcdc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hal_lcdc$(PreprocessSuffix) ../sdk/hal/lcdc.c

$(IntermediateDirectory)/hal_prc$(ObjectSuffix): ../sdk/hal/prc.c  
	$(CC) $(SourceSwitch) ../sdk/hal/prc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hal_prc$(ObjectSuffix) -MF$(IntermediateDirectory)/hal_prc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hal_prc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hal_prc$(PreprocessSuffix): ../sdk/hal/prc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hal_prc$(PreprocessSuffix) ../sdk/hal/prc.c

$(IntermediateDirectory)/hal_scale$(ObjectSuffix): ../sdk/hal/scale.c  
	$(CC) $(SourceSwitch) ../sdk/hal/scale.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hal_scale$(ObjectSuffix) -MF$(IntermediateDirectory)/hal_scale$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hal_scale$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hal_scale$(PreprocessSuffix): ../sdk/hal/scale.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hal_scale$(PreprocessSuffix) ../sdk/hal/scale.c

$(IntermediateDirectory)/hal_vpp$(ObjectSuffix): ../sdk/hal/vpp.c  
	$(CC) $(SourceSwitch) ../sdk/hal/vpp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hal_vpp$(ObjectSuffix) -MF$(IntermediateDirectory)/hal_vpp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hal_vpp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hal_vpp$(PreprocessSuffix): ../sdk/hal/vpp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hal_vpp$(PreprocessSuffix) ../sdk/hal/vpp.c

$(IntermediateDirectory)/hal_audac$(ObjectSuffix): ../sdk/hal/audac.c  
	$(CC) $(SourceSwitch) ../sdk/hal/audac.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hal_audac$(ObjectSuffix) -MF$(IntermediateDirectory)/hal_audac$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hal_audac$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hal_audac$(PreprocessSuffix): ../sdk/hal/audac.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hal_audac$(PreprocessSuffix) ../sdk/hal/audac.c

$(IntermediateDirectory)/hal_auadc$(ObjectSuffix): ../sdk/hal/auadc.c  
	$(CC) $(SourceSwitch) ../sdk/hal/auadc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hal_auadc$(ObjectSuffix) -MF$(IntermediateDirectory)/hal_auadc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hal_auadc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hal_auadc$(PreprocessSuffix): ../sdk/hal/auadc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hal_auadc$(PreprocessSuffix) ../sdk/hal/auadc.c

$(IntermediateDirectory)/hal_of$(ObjectSuffix): ../sdk/hal/of.c  
	$(CC) $(SourceSwitch) ../sdk/hal/of.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hal_of$(ObjectSuffix) -MF$(IntermediateDirectory)/hal_of$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hal_of$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hal_of$(PreprocessSuffix): ../sdk/hal/of.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hal_of$(PreprocessSuffix) ../sdk/hal/of.c

$(IntermediateDirectory)/libc_malloc$(ObjectSuffix): ../csky/libs/libc/malloc.c  
	$(CC) $(SourceSwitch) ../csky/libs/libc/malloc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libc_malloc$(ObjectSuffix) -MF$(IntermediateDirectory)/libc_malloc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libc_malloc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libc_malloc$(PreprocessSuffix): ../csky/libs/libc/malloc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libc_malloc$(PreprocessSuffix) ../csky/libs/libc/malloc.c

$(IntermediateDirectory)/libc_minilibc_port$(ObjectSuffix): ../csky/libs/libc/minilibc_port.c  
	$(CC) $(SourceSwitch) ../csky/libs/libc/minilibc_port.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libc_minilibc_port$(ObjectSuffix) -MF$(IntermediateDirectory)/libc_minilibc_port$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libc_minilibc_port$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libc_minilibc_port$(PreprocessSuffix): ../csky/libs/libc/minilibc_port.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libc_minilibc_port$(PreprocessSuffix) ../csky/libs/libc/minilibc_port.c

$(IntermediateDirectory)/txw81x_isr$(ObjectSuffix): ../sdk/chip/txw81x/isr.c  
	$(CC) $(SourceSwitch) ../sdk/chip/txw81x/isr.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/txw81x_isr$(ObjectSuffix) -MF$(IntermediateDirectory)/txw81x_isr$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/txw81x_isr$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/txw81x_isr$(PreprocessSuffix): ../sdk/chip/txw81x/isr.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/txw81x_isr$(PreprocessSuffix) ../sdk/chip/txw81x/isr.c

$(IntermediateDirectory)/txw81x_pin_function$(ObjectSuffix): ../sdk/chip/txw81x/pin_function.c  
	$(CC) $(SourceSwitch) ../sdk/chip/txw81x/pin_function.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/txw81x_pin_function$(ObjectSuffix) -MF$(IntermediateDirectory)/txw81x_pin_function$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/txw81x_pin_function$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/txw81x_pin_function$(PreprocessSuffix): ../sdk/chip/txw81x/pin_function.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/txw81x_pin_function$(PreprocessSuffix) ../sdk/chip/txw81x/pin_function.c

$(IntermediateDirectory)/txw81x_system$(ObjectSuffix): ../sdk/chip/txw81x/system.c  
	$(CC) $(SourceSwitch) ../sdk/chip/txw81x/system.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/txw81x_system$(ObjectSuffix) -MF$(IntermediateDirectory)/txw81x_system$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/txw81x_system$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/txw81x_system$(PreprocessSuffix): ../sdk/chip/txw81x/system.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/txw81x_system$(PreprocessSuffix) ../sdk/chip/txw81x/system.c

$(IntermediateDirectory)/txw81x_ticker_api$(ObjectSuffix): ../sdk/chip/txw81x/ticker_api.c  
	$(CC) $(SourceSwitch) ../sdk/chip/txw81x/ticker_api.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/txw81x_ticker_api$(ObjectSuffix) -MF$(IntermediateDirectory)/txw81x_ticker_api$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/txw81x_ticker_api$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/txw81x_ticker_api$(PreprocessSuffix): ../sdk/chip/txw81x/ticker_api.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/txw81x_ticker_api$(PreprocessSuffix) ../sdk/chip/txw81x/ticker_api.c

$(IntermediateDirectory)/txw81x_trap_c$(ObjectSuffix): ../sdk/chip/txw81x/trap_c.c  
	$(CC) $(SourceSwitch) ../sdk/chip/txw81x/trap_c.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/txw81x_trap_c$(ObjectSuffix) -MF$(IntermediateDirectory)/txw81x_trap_c$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/txw81x_trap_c$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/txw81x_trap_c$(PreprocessSuffix): ../sdk/chip/txw81x/trap_c.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/txw81x_trap_c$(PreprocessSuffix) ../sdk/chip/txw81x/trap_c.c

$(IntermediateDirectory)/txw81x_vectors$(ObjectSuffix): ../sdk/chip/txw81x/vectors.S  
	$(AS) $(SourceSwitch) ../sdk/chip/txw81x/vectors.S $(ASFLAGS) -MMD -MP -MT$(IntermediateDirectory)/txw81x_vectors$(ObjectSuffix) -MF$(IntermediateDirectory)/txw81x_vectors$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/txw81x_vectors$(ObjectSuffix) $(IncludeAPath) $(IncludePackagePath)
Lst/txw81x_vectors$(PreprocessSuffix): ../sdk/chip/txw81x/vectors.S
	$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/txw81x_vectors$(PreprocessSuffix) ../sdk/chip/txw81x/vectors.S

$(IntermediateDirectory)/dma_dw_dmac$(ObjectSuffix): ../sdk/driver/dma/dw_dmac.c  
	$(CC) $(SourceSwitch) ../sdk/driver/dma/dw_dmac.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/dma_dw_dmac$(ObjectSuffix) -MF$(IntermediateDirectory)/dma_dw_dmac$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/dma_dw_dmac$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/dma_dw_dmac$(PreprocessSuffix): ../sdk/driver/dma/dw_dmac.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/dma_dw_dmac$(PreprocessSuffix) ../sdk/driver/dma/dw_dmac.c

$(IntermediateDirectory)/dma_hg_m2m_dma$(ObjectSuffix): ../sdk/driver/dma/hg_m2m_dma.c  
	$(CC) $(SourceSwitch) ../sdk/driver/dma/hg_m2m_dma.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/dma_hg_m2m_dma$(ObjectSuffix) -MF$(IntermediateDirectory)/dma_hg_m2m_dma$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/dma_hg_m2m_dma$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/dma_hg_m2m_dma$(PreprocessSuffix): ../sdk/driver/dma/hg_m2m_dma.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/dma_hg_m2m_dma$(PreprocessSuffix) ../sdk/driver/dma/hg_m2m_dma.c

$(IntermediateDirectory)/gpio_hggpio_v4$(ObjectSuffix): ../sdk/driver/gpio/hggpio_v4.c  
	$(CC) $(SourceSwitch) ../sdk/driver/gpio/hggpio_v4.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/gpio_hggpio_v4$(ObjectSuffix) -MF$(IntermediateDirectory)/gpio_hggpio_v4$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/gpio_hggpio_v4$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/gpio_hggpio_v4$(PreprocessSuffix): ../sdk/driver/gpio/hggpio_v4.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/gpio_hggpio_v4$(PreprocessSuffix) ../sdk/driver/gpio/hggpio_v4.c

$(IntermediateDirectory)/i2c_hgi2c_v1$(ObjectSuffix): ../sdk/driver/i2c/hgi2c_v1.c  
	$(CC) $(SourceSwitch) ../sdk/driver/i2c/hgi2c_v1.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/i2c_hgi2c_v1$(ObjectSuffix) -MF$(IntermediateDirectory)/i2c_hgi2c_v1$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/i2c_hgi2c_v1$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/i2c_hgi2c_v1$(PreprocessSuffix): ../sdk/driver/i2c/hgi2c_v1.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/i2c_hgi2c_v1$(PreprocessSuffix) ../sdk/driver/i2c/hgi2c_v1.c

$(IntermediateDirectory)/i2s_hgi2s_v0$(ObjectSuffix): ../sdk/driver/i2s/hgi2s_v0.c  
	$(CC) $(SourceSwitch) ../sdk/driver/i2s/hgi2s_v0.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/i2s_hgi2s_v0$(ObjectSuffix) -MF$(IntermediateDirectory)/i2s_hgi2s_v0$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/i2s_hgi2s_v0$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/i2s_hgi2s_v0$(PreprocessSuffix): ../sdk/driver/i2s/hgi2s_v0.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/i2s_hgi2s_v0$(PreprocessSuffix) ../sdk/driver/i2s/hgi2s_v0.c

$(IntermediateDirectory)/spi_hgspi_v3$(ObjectSuffix): ../sdk/driver/spi/hgspi_v3.c  
	$(CC) $(SourceSwitch) ../sdk/driver/spi/hgspi_v3.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/spi_hgspi_v3$(ObjectSuffix) -MF$(IntermediateDirectory)/spi_hgspi_v3$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/spi_hgspi_v3$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/spi_hgspi_v3$(PreprocessSuffix): ../sdk/driver/spi/hgspi_v3.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/spi_hgspi_v3$(PreprocessSuffix) ../sdk/driver/spi/hgspi_v3.c

$(IntermediateDirectory)/timer_hgtimer_v6$(ObjectSuffix): ../sdk/driver/timer/hgtimer_v6.c  
	$(CC) $(SourceSwitch) ../sdk/driver/timer/hgtimer_v6.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/timer_hgtimer_v6$(ObjectSuffix) -MF$(IntermediateDirectory)/timer_hgtimer_v6$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/timer_hgtimer_v6$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/timer_hgtimer_v6$(PreprocessSuffix): ../sdk/driver/timer/hgtimer_v6.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/timer_hgtimer_v6$(PreprocessSuffix) ../sdk/driver/timer/hgtimer_v6.c

$(IntermediateDirectory)/timer_hgtimer_v4$(ObjectSuffix): ../sdk/driver/timer/hgtimer_v4.c  
	$(CC) $(SourceSwitch) ../sdk/driver/timer/hgtimer_v4.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/timer_hgtimer_v4$(ObjectSuffix) -MF$(IntermediateDirectory)/timer_hgtimer_v4$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/timer_hgtimer_v4$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/timer_hgtimer_v4$(PreprocessSuffix): ../sdk/driver/timer/hgtimer_v4.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/timer_hgtimer_v4$(PreprocessSuffix) ../sdk/driver/timer/hgtimer_v4.c

$(IntermediateDirectory)/timer_hgtimer_v5$(ObjectSuffix): ../sdk/driver/timer/hgtimer_v5.c  
	$(CC) $(SourceSwitch) ../sdk/driver/timer/hgtimer_v5.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/timer_hgtimer_v5$(ObjectSuffix) -MF$(IntermediateDirectory)/timer_hgtimer_v5$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/timer_hgtimer_v5$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/timer_hgtimer_v5$(PreprocessSuffix): ../sdk/driver/timer/hgtimer_v5.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/timer_hgtimer_v5$(PreprocessSuffix) ../sdk/driver/timer/hgtimer_v5.c

$(IntermediateDirectory)/timer_hgtimer_v7$(ObjectSuffix): ../sdk/driver/timer/hgtimer_v7.c  
	$(CC) $(SourceSwitch) ../sdk/driver/timer/hgtimer_v7.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/timer_hgtimer_v7$(ObjectSuffix) -MF$(IntermediateDirectory)/timer_hgtimer_v7$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/timer_hgtimer_v7$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/timer_hgtimer_v7$(PreprocessSuffix): ../sdk/driver/timer/hgtimer_v7.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/timer_hgtimer_v7$(PreprocessSuffix) ../sdk/driver/timer/hgtimer_v7.c

$(IntermediateDirectory)/uart_hguart_v4$(ObjectSuffix): ../sdk/driver/uart/hguart_v4.c  
	$(CC) $(SourceSwitch) ../sdk/driver/uart/hguart_v4.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/uart_hguart_v4$(ObjectSuffix) -MF$(IntermediateDirectory)/uart_hguart_v4$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/uart_hguart_v4$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/uart_hguart_v4$(PreprocessSuffix): ../sdk/driver/uart/hguart_v4.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/uart_hguart_v4$(PreprocessSuffix) ../sdk/driver/uart/hguart_v4.c

$(IntermediateDirectory)/uart_hguart_v2$(ObjectSuffix): ../sdk/driver/uart/hguart_v2.c  
	$(CC) $(SourceSwitch) ../sdk/driver/uart/hguart_v2.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/uart_hguart_v2$(ObjectSuffix) -MF$(IntermediateDirectory)/uart_hguart_v2$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/uart_hguart_v2$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/uart_hguart_v2$(PreprocessSuffix): ../sdk/driver/uart/hguart_v2.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/uart_hguart_v2$(PreprocessSuffix) ../sdk/driver/uart/hguart_v2.c

$(IntermediateDirectory)/crc_hg_crc$(ObjectSuffix): ../sdk/driver/crc/hg_crc.c  
	$(CC) $(SourceSwitch) ../sdk/driver/crc/hg_crc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/crc_hg_crc$(ObjectSuffix) -MF$(IntermediateDirectory)/crc_hg_crc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/crc_hg_crc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/crc_hg_crc$(PreprocessSuffix): ../sdk/driver/crc/hg_crc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/crc_hg_crc$(PreprocessSuffix) ../sdk/driver/crc/hg_crc.c

$(IntermediateDirectory)/sdhost_hgsdh_dev$(ObjectSuffix): ../sdk/driver/sdhost/hgsdh_dev.c  
	$(CC) $(SourceSwitch) ../sdk/driver/sdhost/hgsdh_dev.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sdhost_hgsdh_dev$(ObjectSuffix) -MF$(IntermediateDirectory)/sdhost_hgsdh_dev$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sdhost_hgsdh_dev$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sdhost_hgsdh_dev$(PreprocessSuffix): ../sdk/driver/sdhost/hgsdh_dev.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sdhost_hgsdh_dev$(PreprocessSuffix) ../sdk/driver/sdhost/hgsdh_dev.c

$(IntermediateDirectory)/sysaes_hg_sysaes_v3$(ObjectSuffix): ../sdk/driver/sysaes/hg_sysaes_v3.c  
	$(CC) $(SourceSwitch) ../sdk/driver/sysaes/hg_sysaes_v3.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sysaes_hg_sysaes_v3$(ObjectSuffix) -MF$(IntermediateDirectory)/sysaes_hg_sysaes_v3$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sysaes_hg_sysaes_v3$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sysaes_hg_sysaes_v3$(PreprocessSuffix): ../sdk/driver/sysaes/hg_sysaes_v3.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sysaes_hg_sysaes_v3$(PreprocessSuffix) ../sdk/driver/sysaes/hg_sysaes_v3.c

$(IntermediateDirectory)/pdm_hgpdm_v0$(ObjectSuffix): ../sdk/driver/pdm/hgpdm_v0.c  
	$(CC) $(SourceSwitch) ../sdk/driver/pdm/hgpdm_v0.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/pdm_hgpdm_v0$(ObjectSuffix) -MF$(IntermediateDirectory)/pdm_hgpdm_v0$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/pdm_hgpdm_v0$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/pdm_hgpdm_v0$(PreprocessSuffix): ../sdk/driver/pdm/hgpdm_v0.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/pdm_hgpdm_v0$(PreprocessSuffix) ../sdk/driver/pdm/hgpdm_v0.c

$(IntermediateDirectory)/led_hgled_v0$(ObjectSuffix): ../sdk/driver/led/hgled_v0.c  
	$(CC) $(SourceSwitch) ../sdk/driver/led/hgled_v0.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/led_hgled_v0$(ObjectSuffix) -MF$(IntermediateDirectory)/led_hgled_v0$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/led_hgled_v0$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/led_hgled_v0$(PreprocessSuffix): ../sdk/driver/led/hgled_v0.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/led_hgled_v0$(PreprocessSuffix) ../sdk/driver/led/hgled_v0.c

$(IntermediateDirectory)/pwm_hgpwm_v0$(ObjectSuffix): ../sdk/driver/pwm/hgpwm_v0.c  
	$(CC) $(SourceSwitch) ../sdk/driver/pwm/hgpwm_v0.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/pwm_hgpwm_v0$(ObjectSuffix) -MF$(IntermediateDirectory)/pwm_hgpwm_v0$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/pwm_hgpwm_v0$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/pwm_hgpwm_v0$(PreprocessSuffix): ../sdk/driver/pwm/hgpwm_v0.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/pwm_hgpwm_v0$(PreprocessSuffix) ../sdk/driver/pwm/hgpwm_v0.c

$(IntermediateDirectory)/capture_hgcapture_v0$(ObjectSuffix): ../sdk/driver/capture/hgcapture_v0.c  
	$(CC) $(SourceSwitch) ../sdk/driver/capture/hgcapture_v0.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/capture_hgcapture_v0$(ObjectSuffix) -MF$(IntermediateDirectory)/capture_hgcapture_v0$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/capture_hgcapture_v0$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/capture_hgcapture_v0$(PreprocessSuffix): ../sdk/driver/capture/hgcapture_v0.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/capture_hgcapture_v0$(PreprocessSuffix) ../sdk/driver/capture/hgcapture_v0.c

$(IntermediateDirectory)/csi_hgdvp_v2$(ObjectSuffix): ../sdk/driver/csi/hgdvp_v2.c  
	$(CC) $(SourceSwitch) ../sdk/driver/csi/hgdvp_v2.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/csi_hgdvp_v2$(ObjectSuffix) -MF$(IntermediateDirectory)/csi_hgdvp_v2$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/csi_hgdvp_v2$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/csi_hgdvp_v2$(PreprocessSuffix): ../sdk/driver/csi/hgdvp_v2.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/csi_hgdvp_v2$(PreprocessSuffix) ../sdk/driver/csi/hgdvp_v2.c

$(IntermediateDirectory)/adc_hgadc_v0$(ObjectSuffix): ../sdk/driver/adc/hgadc_v0.c  
	$(CC) $(SourceSwitch) ../sdk/driver/adc/hgadc_v0.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/adc_hgadc_v0$(ObjectSuffix) -MF$(IntermediateDirectory)/adc_hgadc_v0$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/adc_hgadc_v0$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/adc_hgadc_v0$(PreprocessSuffix): ../sdk/driver/adc/hgadc_v0.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/adc_hgadc_v0$(PreprocessSuffix) ../sdk/driver/adc/hgadc_v0.c

$(IntermediateDirectory)/lcdc_hglcdc$(ObjectSuffix): ../sdk/driver/lcdc/hglcdc.c  
	$(CC) $(SourceSwitch) ../sdk/driver/lcdc/hglcdc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/lcdc_hglcdc$(ObjectSuffix) -MF$(IntermediateDirectory)/lcdc_hglcdc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/lcdc_hglcdc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/lcdc_hglcdc$(PreprocessSuffix): ../sdk/driver/lcdc/hglcdc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/lcdc_hglcdc$(PreprocessSuffix) ../sdk/driver/lcdc/hglcdc.c

$(IntermediateDirectory)/prc_hgprc$(ObjectSuffix): ../sdk/driver/prc/hgprc.c  
	$(CC) $(SourceSwitch) ../sdk/driver/prc/hgprc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/prc_hgprc$(ObjectSuffix) -MF$(IntermediateDirectory)/prc_hgprc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/prc_hgprc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/prc_hgprc$(PreprocessSuffix): ../sdk/driver/prc/hgprc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/prc_hgprc$(PreprocessSuffix) ../sdk/driver/prc/hgprc.c

$(IntermediateDirectory)/scale_hgscale$(ObjectSuffix): ../sdk/driver/scale/hgscale.c  
	$(CC) $(SourceSwitch) ../sdk/driver/scale/hgscale.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/scale_hgscale$(ObjectSuffix) -MF$(IntermediateDirectory)/scale_hgscale$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/scale_hgscale$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/scale_hgscale$(PreprocessSuffix): ../sdk/driver/scale/hgscale.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/scale_hgscale$(PreprocessSuffix) ../sdk/driver/scale/hgscale.c

$(IntermediateDirectory)/vpp_hgvpp$(ObjectSuffix): ../sdk/driver/vpp/hgvpp.c  
	$(CC) $(SourceSwitch) ../sdk/driver/vpp/hgvpp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vpp_hgvpp$(ObjectSuffix) -MF$(IntermediateDirectory)/vpp_hgvpp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vpp_hgvpp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vpp_hgvpp$(PreprocessSuffix): ../sdk/driver/vpp/hgvpp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vpp_hgvpp$(PreprocessSuffix) ../sdk/driver/vpp/hgvpp.c

$(IntermediateDirectory)/of_hgof$(ObjectSuffix): ../sdk/driver/of/hgof.c  
	$(CC) $(SourceSwitch) ../sdk/driver/of/hgof.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/of_hgof$(ObjectSuffix) -MF$(IntermediateDirectory)/of_hgof$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/of_hgof$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/of_hgof$(PreprocessSuffix): ../sdk/driver/of/hgof.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/of_hgof$(PreprocessSuffix) ../sdk/driver/of/hgof.c

$(IntermediateDirectory)/heap_alloc$(ObjectSuffix): ../sdk/lib/heap/alloc.c  
	$(CC) $(SourceSwitch) ../sdk/lib/heap/alloc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/heap_alloc$(ObjectSuffix) -MF$(IntermediateDirectory)/heap_alloc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/heap_alloc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/heap_alloc$(PreprocessSuffix): ../sdk/lib/heap/alloc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/heap_alloc$(PreprocessSuffix) ../sdk/lib/heap/alloc.c

$(IntermediateDirectory)/common_common$(ObjectSuffix): ../sdk/lib/common/common.c  
	$(CC) $(SourceSwitch) ../sdk/lib/common/common.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/common_common$(ObjectSuffix) -MF$(IntermediateDirectory)/common_common$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/common_common$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/common_common$(PreprocessSuffix): ../sdk/lib/common/common.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/common_common$(PreprocessSuffix) ../sdk/lib/common/common.c

$(IntermediateDirectory)/common_string$(ObjectSuffix): ../sdk/lib/common/string.c  
	$(CC) $(SourceSwitch) ../sdk/lib/common/string.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/common_string$(ObjectSuffix) -MF$(IntermediateDirectory)/common_string$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/common_string$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/common_string$(PreprocessSuffix): ../sdk/lib/common/string.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/common_string$(PreprocessSuffix) ../sdk/lib/common/string.c

$(IntermediateDirectory)/common_us_ticker$(ObjectSuffix): ../sdk/lib/common/us_ticker.c  
	$(CC) $(SourceSwitch) ../sdk/lib/common/us_ticker.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/common_us_ticker$(ObjectSuffix) -MF$(IntermediateDirectory)/common_us_ticker$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/common_us_ticker$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/common_us_ticker$(PreprocessSuffix): ../sdk/lib/common/us_ticker.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/common_us_ticker$(PreprocessSuffix) ../sdk/lib/common/us_ticker.c

$(IntermediateDirectory)/common_dsleepdata$(ObjectSuffix): ../sdk/lib/common/dsleepdata.c  
	$(CC) $(SourceSwitch) ../sdk/lib/common/dsleepdata.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/common_dsleepdata$(ObjectSuffix) -MF$(IntermediateDirectory)/common_dsleepdata$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/common_dsleepdata$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/common_dsleepdata$(PreprocessSuffix): ../sdk/lib/common/dsleepdata.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/common_dsleepdata$(PreprocessSuffix) ../sdk/lib/common/dsleepdata.c

$(IntermediateDirectory)/common_atcmd$(ObjectSuffix): ../sdk/lib/common/atcmd.c  
	$(CC) $(SourceSwitch) ../sdk/lib/common/atcmd.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/common_atcmd$(ObjectSuffix) -MF$(IntermediateDirectory)/common_atcmd$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/common_atcmd$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/common_atcmd$(PreprocessSuffix): ../sdk/lib/common/atcmd.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/common_atcmd$(PreprocessSuffix) ../sdk/lib/common/atcmd.c

$(IntermediateDirectory)/sdhost_sdhost$(ObjectSuffix): ../sdk/lib/sdhost/sdhost.c  
	$(CC) $(SourceSwitch) ../sdk/lib/sdhost/sdhost.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sdhost_sdhost$(ObjectSuffix) -MF$(IntermediateDirectory)/sdhost_sdhost$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sdhost_sdhost$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sdhost_sdhost$(PreprocessSuffix): ../sdk/lib/sdhost/sdhost.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sdhost_sdhost$(PreprocessSuffix) ../sdk/lib/sdhost/sdhost.c

$(IntermediateDirectory)/usb_app_usb_device_wifi$(ObjectSuffix): ../sdk/lib/usb_app/usb_device_wifi.c  
	$(CC) $(SourceSwitch) ../sdk/lib/usb_app/usb_device_wifi.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/usb_app_usb_device_wifi$(ObjectSuffix) -MF$(IntermediateDirectory)/usb_app_usb_device_wifi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/usb_app_usb_device_wifi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/usb_app_usb_device_wifi$(PreprocessSuffix): ../sdk/lib/usb_app/usb_device_wifi.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/usb_app_usb_device_wifi$(PreprocessSuffix) ../sdk/lib/usb_app/usb_device_wifi.c

$(IntermediateDirectory)/usb_app_usb_host_uvc$(ObjectSuffix): ../sdk/lib/usb_app/usb_host_uvc.c  
	$(CC) $(SourceSwitch) ../sdk/lib/usb_app/usb_host_uvc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/usb_app_usb_host_uvc$(ObjectSuffix) -MF$(IntermediateDirectory)/usb_app_usb_host_uvc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/usb_app_usb_host_uvc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/usb_app_usb_host_uvc$(PreprocessSuffix): ../sdk/lib/usb_app/usb_host_uvc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/usb_app_usb_host_uvc$(PreprocessSuffix) ../sdk/lib/usb_app/usb_host_uvc.c

$(IntermediateDirectory)/ble_ble_demo$(ObjectSuffix): ../sdk/lib/ble/ble_demo.c  
	$(CC) $(SourceSwitch) ../sdk/lib/ble/ble_demo.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ble_ble_demo$(ObjectSuffix) -MF$(IntermediateDirectory)/ble_ble_demo$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ble_ble_demo$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ble_ble_demo$(PreprocessSuffix): ../sdk/lib/ble/ble_demo.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ble_ble_demo$(PreprocessSuffix) ../sdk/lib/ble/ble_demo.c

$(IntermediateDirectory)/ble_ble_adv$(ObjectSuffix): ../sdk/lib/ble/ble_adv.c  
	$(CC) $(SourceSwitch) ../sdk/lib/ble/ble_adv.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ble_ble_adv$(ObjectSuffix) -MF$(IntermediateDirectory)/ble_ble_adv$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ble_ble_adv$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ble_ble_adv$(PreprocessSuffix): ../sdk/lib/ble/ble_adv.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ble_ble_adv$(PreprocessSuffix) ../sdk/lib/ble/ble_adv.c

$(IntermediateDirectory)/posix_mqueue$(ObjectSuffix): ../sdk/lib/posix/mqueue.c  
	$(CC) $(SourceSwitch) ../sdk/lib/posix/mqueue.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/posix_mqueue$(ObjectSuffix) -MF$(IntermediateDirectory)/posix_mqueue$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/posix_mqueue$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/posix_mqueue$(PreprocessSuffix): ../sdk/lib/posix/mqueue.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/posix_mqueue$(PreprocessSuffix) ../sdk/lib/posix/mqueue.c

$(IntermediateDirectory)/posix_posix_test$(ObjectSuffix): ../sdk/lib/posix/posix_test.c  
	$(CC) $(SourceSwitch) ../sdk/lib/posix/posix_test.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/posix_posix_test$(ObjectSuffix) -MF$(IntermediateDirectory)/posix_posix_test$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/posix_posix_test$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/posix_posix_test$(PreprocessSuffix): ../sdk/lib/posix/posix_test.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/posix_posix_test$(PreprocessSuffix) ../sdk/lib/posix/posix_test.c

$(IntermediateDirectory)/posix_pthread$(ObjectSuffix): ../sdk/lib/posix/pthread.c  
	$(CC) $(SourceSwitch) ../sdk/lib/posix/pthread.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/posix_pthread$(ObjectSuffix) -MF$(IntermediateDirectory)/posix_pthread$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/posix_pthread$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/posix_pthread$(PreprocessSuffix): ../sdk/lib/posix/pthread.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/posix_pthread$(PreprocessSuffix) ../sdk/lib/posix/pthread.c

$(IntermediateDirectory)/posix_pthread_attr$(ObjectSuffix): ../sdk/lib/posix/pthread_attr.c  
	$(CC) $(SourceSwitch) ../sdk/lib/posix/pthread_attr.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/posix_pthread_attr$(ObjectSuffix) -MF$(IntermediateDirectory)/posix_pthread_attr$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/posix_pthread_attr$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/posix_pthread_attr$(PreprocessSuffix): ../sdk/lib/posix/pthread_attr.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/posix_pthread_attr$(PreprocessSuffix) ../sdk/lib/posix/pthread_attr.c

$(IntermediateDirectory)/posix_pthread_barrier$(ObjectSuffix): ../sdk/lib/posix/pthread_barrier.c  
	$(CC) $(SourceSwitch) ../sdk/lib/posix/pthread_barrier.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/posix_pthread_barrier$(ObjectSuffix) -MF$(IntermediateDirectory)/posix_pthread_barrier$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/posix_pthread_barrier$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/posix_pthread_barrier$(PreprocessSuffix): ../sdk/lib/posix/pthread_barrier.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/posix_pthread_barrier$(PreprocessSuffix) ../sdk/lib/posix/pthread_barrier.c

$(IntermediateDirectory)/posix_pthread_cond$(ObjectSuffix): ../sdk/lib/posix/pthread_cond.c  
	$(CC) $(SourceSwitch) ../sdk/lib/posix/pthread_cond.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/posix_pthread_cond$(ObjectSuffix) -MF$(IntermediateDirectory)/posix_pthread_cond$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/posix_pthread_cond$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/posix_pthread_cond$(PreprocessSuffix): ../sdk/lib/posix/pthread_cond.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/posix_pthread_cond$(PreprocessSuffix) ../sdk/lib/posix/pthread_cond.c

$(IntermediateDirectory)/posix_pthread_mutex$(ObjectSuffix): ../sdk/lib/posix/pthread_mutex.c  
	$(CC) $(SourceSwitch) ../sdk/lib/posix/pthread_mutex.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/posix_pthread_mutex$(ObjectSuffix) -MF$(IntermediateDirectory)/posix_pthread_mutex$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/posix_pthread_mutex$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/posix_pthread_mutex$(PreprocessSuffix): ../sdk/lib/posix/pthread_mutex.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/posix_pthread_mutex$(PreprocessSuffix) ../sdk/lib/posix/pthread_mutex.c

$(IntermediateDirectory)/posix_pthread_rwlock$(ObjectSuffix): ../sdk/lib/posix/pthread_rwlock.c  
	$(CC) $(SourceSwitch) ../sdk/lib/posix/pthread_rwlock.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/posix_pthread_rwlock$(ObjectSuffix) -MF$(IntermediateDirectory)/posix_pthread_rwlock$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/posix_pthread_rwlock$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/posix_pthread_rwlock$(PreprocessSuffix): ../sdk/lib/posix/pthread_rwlock.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/posix_pthread_rwlock$(PreprocessSuffix) ../sdk/lib/posix/pthread_rwlock.c

$(IntermediateDirectory)/posix_sched$(ObjectSuffix): ../sdk/lib/posix/sched.c  
	$(CC) $(SourceSwitch) ../sdk/lib/posix/sched.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/posix_sched$(ObjectSuffix) -MF$(IntermediateDirectory)/posix_sched$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/posix_sched$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/posix_sched$(PreprocessSuffix): ../sdk/lib/posix/sched.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/posix_sched$(PreprocessSuffix) ../sdk/lib/posix/sched.c

$(IntermediateDirectory)/posix_semaphore$(ObjectSuffix): ../sdk/lib/posix/semaphore.c  
	$(CC) $(SourceSwitch) ../sdk/lib/posix/semaphore.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/posix_semaphore$(ObjectSuffix) -MF$(IntermediateDirectory)/posix_semaphore$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/posix_semaphore$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/posix_semaphore$(PreprocessSuffix): ../sdk/lib/posix/semaphore.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/posix_semaphore$(PreprocessSuffix) ../sdk/lib/posix/semaphore.c

$(IntermediateDirectory)/posix_timer$(ObjectSuffix): ../sdk/lib/posix/timer.c  
	$(CC) $(SourceSwitch) ../sdk/lib/posix/timer.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/posix_timer$(ObjectSuffix) -MF$(IntermediateDirectory)/posix_timer$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/posix_timer$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/posix_timer$(PreprocessSuffix): ../sdk/lib/posix/timer.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/posix_timer$(PreprocessSuffix) ../sdk/lib/posix/timer.c

$(IntermediateDirectory)/posix_pthread_tls$(ObjectSuffix): ../sdk/lib/posix/pthread_tls.c  
	$(CC) $(SourceSwitch) ../sdk/lib/posix/pthread_tls.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/posix_pthread_tls$(ObjectSuffix) -MF$(IntermediateDirectory)/posix_pthread_tls$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/posix_pthread_tls$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/posix_pthread_tls$(PreprocessSuffix): ../sdk/lib/posix/pthread_tls.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/posix_pthread_tls$(PreprocessSuffix) ../sdk/lib/posix/pthread_tls.c

$(IntermediateDirectory)/posix_sockets$(ObjectSuffix): ../sdk/lib/posix/sockets.c  
	$(CC) $(SourceSwitch) ../sdk/lib/posix/sockets.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/posix_sockets$(ObjectSuffix) -MF$(IntermediateDirectory)/posix_sockets$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/posix_sockets$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/posix_sockets$(PreprocessSuffix): ../sdk/lib/posix/sockets.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/posix_sockets$(PreprocessSuffix) ../sdk/lib/posix/sockets.c

$(IntermediateDirectory)/posix_stdio$(ObjectSuffix): ../sdk/lib/posix/stdio.c  
	$(CC) $(SourceSwitch) ../sdk/lib/posix/stdio.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/posix_stdio$(ObjectSuffix) -MF$(IntermediateDirectory)/posix_stdio$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/posix_stdio$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/posix_stdio$(PreprocessSuffix): ../sdk/lib/posix/stdio.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/posix_stdio$(PreprocessSuffix) ../sdk/lib/posix/stdio.c

$(IntermediateDirectory)/gui_user_demo$(ObjectSuffix): ../sdk/lib/gui/user_demo.c  
	$(CC) $(SourceSwitch) ../sdk/lib/gui/user_demo.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/gui_user_demo$(ObjectSuffix) -MF$(IntermediateDirectory)/gui_user_demo$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/gui_user_demo$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/gui_user_demo$(PreprocessSuffix): ../sdk/lib/gui/user_demo.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/gui_user_demo$(PreprocessSuffix) ../sdk/lib/gui/user_demo.c

$(IntermediateDirectory)/lcd_lcd$(ObjectSuffix): ../sdk/lib/lcd/lcd.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lcd/lcd.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/lcd_lcd$(ObjectSuffix) -MF$(IntermediateDirectory)/lcd_lcd$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/lcd_lcd$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/lcd_lcd$(PreprocessSuffix): ../sdk/lib/lcd/lcd.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/lcd_lcd$(PreprocessSuffix) ../sdk/lib/lcd/lcd.c

$(IntermediateDirectory)/key_adkey$(ObjectSuffix): ../sdk/lib/key/adkey.c  
	$(CC) $(SourceSwitch) ../sdk/lib/key/adkey.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/key_adkey$(ObjectSuffix) -MF$(IntermediateDirectory)/key_adkey$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/key_adkey$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/key_adkey$(PreprocessSuffix): ../sdk/lib/key/adkey.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/key_adkey$(PreprocessSuffix) ../sdk/lib/key/adkey.c

$(IntermediateDirectory)/key_keyScan$(ObjectSuffix): ../sdk/lib/key/keyScan.c  
	$(CC) $(SourceSwitch) ../sdk/lib/key/keyScan.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/key_keyScan$(ObjectSuffix) -MF$(IntermediateDirectory)/key_keyScan$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/key_keyScan$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/key_keyScan$(PreprocessSuffix): ../sdk/lib/key/keyScan.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/key_keyScan$(PreprocessSuffix) ../sdk/lib/key/keyScan.c

$(IntermediateDirectory)/key_keyWork$(ObjectSuffix): ../sdk/lib/key/keyWork.c  
	$(CC) $(SourceSwitch) ../sdk/lib/key/keyWork.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/key_keyWork$(ObjectSuffix) -MF$(IntermediateDirectory)/key_keyWork$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/key_keyWork$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/key_keyWork$(PreprocessSuffix): ../sdk/lib/key/keyWork.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/key_keyWork$(PreprocessSuffix) ../sdk/lib/key/keyWork.c

$(IntermediateDirectory)/key_power_checkkey$(ObjectSuffix): ../sdk/lib/key/power_checkkey.c  
	$(CC) $(SourceSwitch) ../sdk/lib/key/power_checkkey.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/key_power_checkkey$(ObjectSuffix) -MF$(IntermediateDirectory)/key_power_checkkey$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/key_power_checkkey$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/key_power_checkkey$(PreprocessSuffix): ../sdk/lib/key/power_checkkey.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/key_power_checkkey$(PreprocessSuffix) ../sdk/lib/key/power_checkkey.c

$(IntermediateDirectory)/key_adkey2$(ObjectSuffix): ../sdk/lib/key/adkey2.c  
	$(CC) $(SourceSwitch) ../sdk/lib/key/adkey2.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/key_adkey2$(ObjectSuffix) -MF$(IntermediateDirectory)/key_adkey2$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/key_adkey2$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/key_adkey2$(PreprocessSuffix): ../sdk/lib/key/adkey2.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/key_adkey2$(PreprocessSuffix) ../sdk/lib/key/adkey2.c

$(IntermediateDirectory)/avi_play_avi$(ObjectSuffix): ../sdk/app/avi/play_avi.c  
	$(CC) $(SourceSwitch) ../sdk/app/avi/play_avi.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/avi_play_avi$(ObjectSuffix) -MF$(IntermediateDirectory)/avi_play_avi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/avi_play_avi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/avi_play_avi$(PreprocessSuffix): ../sdk/app/avi/play_avi.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/avi_play_avi$(PreprocessSuffix) ../sdk/app/avi/play_avi.c

$(IntermediateDirectory)/custom_mem_custom_mem$(ObjectSuffix): ../sdk/app/custom_mem/custom_mem.c  
	$(CC) $(SourceSwitch) ../sdk/app/custom_mem/custom_mem.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/custom_mem_custom_mem$(ObjectSuffix) -MF$(IntermediateDirectory)/custom_mem_custom_mem$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/custom_mem_custom_mem$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/custom_mem_custom_mem$(PreprocessSuffix): ../sdk/app/custom_mem/custom_mem.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/custom_mem_custom_mem$(PreprocessSuffix) ../sdk/app/custom_mem/custom_mem.c

$(IntermediateDirectory)/dhcpd_eloop_dhcpd_eloop$(ObjectSuffix): ../sdk/app/dhcpd_eloop/dhcpd_eloop.c  
	$(CC) $(SourceSwitch) ../sdk/app/dhcpd_eloop/dhcpd_eloop.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/dhcpd_eloop_dhcpd_eloop$(ObjectSuffix) -MF$(IntermediateDirectory)/dhcpd_eloop_dhcpd_eloop$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/dhcpd_eloop_dhcpd_eloop$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/dhcpd_eloop_dhcpd_eloop$(PreprocessSuffix): ../sdk/app/dhcpd_eloop/dhcpd_eloop.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/dhcpd_eloop_dhcpd_eloop$(PreprocessSuffix) ../sdk/app/dhcpd_eloop/dhcpd_eloop.c

$(IntermediateDirectory)/dns_eloop_dns_eloop$(ObjectSuffix): ../sdk/app/dns_eloop/dns_eloop.c  
	$(CC) $(SourceSwitch) ../sdk/app/dns_eloop/dns_eloop.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/dns_eloop_dns_eloop$(ObjectSuffix) -MF$(IntermediateDirectory)/dns_eloop_dns_eloop$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/dns_eloop_dns_eloop$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/dns_eloop_dns_eloop$(PreprocessSuffix): ../sdk/app/dns_eloop/dns_eloop.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/dns_eloop_dns_eloop$(PreprocessSuffix) ../sdk/app/dns_eloop/dns_eloop.c

$(IntermediateDirectory)/gsensor_g_sensor$(ObjectSuffix): ../sdk/app/gsensor/g_sensor.c  
	$(CC) $(SourceSwitch) ../sdk/app/gsensor/g_sensor.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/gsensor_g_sensor$(ObjectSuffix) -MF$(IntermediateDirectory)/gsensor_g_sensor$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/gsensor_g_sensor$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/gsensor_g_sensor$(PreprocessSuffix): ../sdk/app/gsensor/g_sensor.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/gsensor_g_sensor$(PreprocessSuffix) ../sdk/app/gsensor/g_sensor.c

$(IntermediateDirectory)/media_media$(ObjectSuffix): ../sdk/app/media/media.c  
	$(CC) $(SourceSwitch) ../sdk/app/media/media.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/media_media$(ObjectSuffix) -MF$(IntermediateDirectory)/media_media$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/media_media$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/media_media$(PreprocessSuffix): ../sdk/app/media/media.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/media_media$(PreprocessSuffix) ../sdk/app/media/media.c

$(IntermediateDirectory)/newaudio_newaudio$(ObjectSuffix): ../sdk/app/newaudio/newaudio.c  
	$(CC) $(SourceSwitch) ../sdk/app/newaudio/newaudio.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/newaudio_newaudio$(ObjectSuffix) -MF$(IntermediateDirectory)/newaudio_newaudio$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/newaudio_newaudio$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/newaudio_newaudio$(PreprocessSuffix): ../sdk/app/newaudio/newaudio.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/newaudio_newaudio$(PreprocessSuffix) ../sdk/app/newaudio/newaudio.c

$(IntermediateDirectory)/record_sd_save$(ObjectSuffix): ../sdk/app/record/sd_save.c  
	$(CC) $(SourceSwitch) ../sdk/app/record/sd_save.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/record_sd_save$(ObjectSuffix) -MF$(IntermediateDirectory)/record_sd_save$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/record_sd_save$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/record_sd_save$(PreprocessSuffix): ../sdk/app/record/sd_save.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/record_sd_save$(PreprocessSuffix) ../sdk/app/record/sd_save.c

$(IntermediateDirectory)/remoteControl_remote_control$(ObjectSuffix): ../sdk/app/remoteControl/remote_control.c  
	$(CC) $(SourceSwitch) ../sdk/app/remoteControl/remote_control.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/remoteControl_remote_control$(ObjectSuffix) -MF$(IntermediateDirectory)/remoteControl_remote_control$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/remoteControl_remote_control$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/remoteControl_remote_control$(PreprocessSuffix): ../sdk/app/remoteControl/remote_control.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/remoteControl_remote_control$(PreprocessSuffix) ../sdk/app/remoteControl/remote_control.c

$(IntermediateDirectory)/socketModule_socket_module$(ObjectSuffix): ../sdk/app/socketModule/socket_module.c  
	$(CC) $(SourceSwitch) ../sdk/app/socketModule/socket_module.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/socketModule_socket_module$(ObjectSuffix) -MF$(IntermediateDirectory)/socketModule_socket_module$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/socketModule_socket_module$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/socketModule_socket_module$(PreprocessSuffix): ../sdk/app/socketModule/socket_module.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/socketModule_socket_module$(PreprocessSuffix) ../sdk/app/socketModule/socket_module.c

$(IntermediateDirectory)/speedTest_speedTest$(ObjectSuffix): ../sdk/app/speedTest/speedTest.c  
	$(CC) $(SourceSwitch) ../sdk/app/speedTest/speedTest.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/speedTest_speedTest$(ObjectSuffix) -MF$(IntermediateDirectory)/speedTest_speedTest$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/speedTest_speedTest$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/speedTest_speedTest$(PreprocessSuffix): ../sdk/app/speedTest/speedTest.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/speedTest_speedTest$(PreprocessSuffix) ../sdk/app/speedTest/speedTest.c

$(IntermediateDirectory)/spook_access_log$(ObjectSuffix): ../sdk/app/spook/access_log.c  
	$(CC) $(SourceSwitch) ../sdk/app/spook/access_log.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/spook_access_log$(ObjectSuffix) -MF$(IntermediateDirectory)/spook_access_log$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/spook_access_log$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/spook_access_log$(PreprocessSuffix): ../sdk/app/spook/access_log.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/spook_access_log$(PreprocessSuffix) ../sdk/app/spook/access_log.c

$(IntermediateDirectory)/spook_encoder-audio$(ObjectSuffix): ../sdk/app/spook/encoder-audio.c  
	$(CC) $(SourceSwitch) ../sdk/app/spook/encoder-audio.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/spook_encoder-audio$(ObjectSuffix) -MF$(IntermediateDirectory)/spook_encoder-audio$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/spook_encoder-audio$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/spook_encoder-audio$(PreprocessSuffix): ../sdk/app/spook/encoder-audio.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/spook_encoder-audio$(PreprocessSuffix) ../sdk/app/spook/encoder-audio.c

$(IntermediateDirectory)/spook_encoder-jpeg$(ObjectSuffix): ../sdk/app/spook/encoder-jpeg.c  
	$(CC) $(SourceSwitch) ../sdk/app/spook/encoder-jpeg.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/spook_encoder-jpeg$(ObjectSuffix) -MF$(IntermediateDirectory)/spook_encoder-jpeg$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/spook_encoder-jpeg$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/spook_encoder-jpeg$(PreprocessSuffix): ../sdk/app/spook/encoder-jpeg.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/spook_encoder-jpeg$(PreprocessSuffix) ../sdk/app/spook/encoder-jpeg.c

$(IntermediateDirectory)/spook_ephoto$(ObjectSuffix): ../sdk/app/spook/ephoto.c  
	$(CC) $(SourceSwitch) ../sdk/app/spook/ephoto.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/spook_ephoto$(ObjectSuffix) -MF$(IntermediateDirectory)/spook_ephoto$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/spook_ephoto$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/spook_ephoto$(PreprocessSuffix): ../sdk/app/spook/ephoto.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/spook_ephoto$(PreprocessSuffix) ../sdk/app/spook/ephoto.c

$(IntermediateDirectory)/spook_frame$(ObjectSuffix): ../sdk/app/spook/frame.c  
	$(CC) $(SourceSwitch) ../sdk/app/spook/frame.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/spook_frame$(ObjectSuffix) -MF$(IntermediateDirectory)/spook_frame$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/spook_frame$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/spook_frame$(PreprocessSuffix): ../sdk/app/spook/frame.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/spook_frame$(PreprocessSuffix) ../sdk/app/spook/frame.c

$(IntermediateDirectory)/spook_live$(ObjectSuffix): ../sdk/app/spook/live.c  
	$(CC) $(SourceSwitch) ../sdk/app/spook/live.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/spook_live$(ObjectSuffix) -MF$(IntermediateDirectory)/spook_live$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/spook_live$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/spook_live$(PreprocessSuffix): ../sdk/app/spook/live.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/spook_live$(PreprocessSuffix) ../sdk/app/spook/live.c

$(IntermediateDirectory)/spook_log$(ObjectSuffix): ../sdk/app/spook/log.c  
	$(CC) $(SourceSwitch) ../sdk/app/spook/log.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/spook_log$(ObjectSuffix) -MF$(IntermediateDirectory)/spook_log$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/spook_log$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/spook_log$(PreprocessSuffix): ../sdk/app/spook/log.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/spook_log$(PreprocessSuffix) ../sdk/app/spook/log.c

$(IntermediateDirectory)/spook_pmsg$(ObjectSuffix): ../sdk/app/spook/pmsg.c  
	$(CC) $(SourceSwitch) ../sdk/app/spook/pmsg.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/spook_pmsg$(ObjectSuffix) -MF$(IntermediateDirectory)/spook_pmsg$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/spook_pmsg$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/spook_pmsg$(PreprocessSuffix): ../sdk/app/spook/pmsg.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/spook_pmsg$(PreprocessSuffix) ../sdk/app/spook/pmsg.c

$(IntermediateDirectory)/spook_rtp-audio$(ObjectSuffix): ../sdk/app/spook/rtp-audio.c  
	$(CC) $(SourceSwitch) ../sdk/app/spook/rtp-audio.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/spook_rtp-audio$(ObjectSuffix) -MF$(IntermediateDirectory)/spook_rtp-audio$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/spook_rtp-audio$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/spook_rtp-audio$(PreprocessSuffix): ../sdk/app/spook/rtp-audio.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/spook_rtp-audio$(PreprocessSuffix) ../sdk/app/spook/rtp-audio.c

$(IntermediateDirectory)/spook_rtp-jpeg$(ObjectSuffix): ../sdk/app/spook/rtp-jpeg.c  
	$(CC) $(SourceSwitch) ../sdk/app/spook/rtp-jpeg.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/spook_rtp-jpeg$(ObjectSuffix) -MF$(IntermediateDirectory)/spook_rtp-jpeg$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/spook_rtp-jpeg$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/spook_rtp-jpeg$(PreprocessSuffix): ../sdk/app/spook/rtp-jpeg.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/spook_rtp-jpeg$(PreprocessSuffix) ../sdk/app/spook/rtp-jpeg.c

$(IntermediateDirectory)/spook_rtp$(ObjectSuffix): ../sdk/app/spook/rtp.c  
	$(CC) $(SourceSwitch) ../sdk/app/spook/rtp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/spook_rtp$(ObjectSuffix) -MF$(IntermediateDirectory)/spook_rtp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/spook_rtp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/spook_rtp$(PreprocessSuffix): ../sdk/app/spook/rtp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/spook_rtp$(PreprocessSuffix) ../sdk/app/spook/rtp.c

$(IntermediateDirectory)/spook_rtsp$(ObjectSuffix): ../sdk/app/spook/rtsp.c  
	$(CC) $(SourceSwitch) ../sdk/app/spook/rtsp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/spook_rtsp$(ObjectSuffix) -MF$(IntermediateDirectory)/spook_rtsp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/spook_rtsp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/spook_rtsp$(PreprocessSuffix): ../sdk/app/spook/rtsp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/spook_rtsp$(PreprocessSuffix) ../sdk/app/spook/rtsp.c

$(IntermediateDirectory)/spook_rtsp_common$(ObjectSuffix): ../sdk/app/spook/rtsp_common.c  
	$(CC) $(SourceSwitch) ../sdk/app/spook/rtsp_common.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/spook_rtsp_common$(ObjectSuffix) -MF$(IntermediateDirectory)/spook_rtsp_common$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/spook_rtsp_common$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/spook_rtsp_common$(PreprocessSuffix): ../sdk/app/spook/rtsp_common.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/spook_rtsp_common$(PreprocessSuffix) ../sdk/app/spook/rtsp_common.c

$(IntermediateDirectory)/spook_session$(ObjectSuffix): ../sdk/app/spook/session.c  
	$(CC) $(SourceSwitch) ../sdk/app/spook/session.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/spook_session$(ObjectSuffix) -MF$(IntermediateDirectory)/spook_session$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/spook_session$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/spook_session$(PreprocessSuffix): ../sdk/app/spook/session.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/spook_session$(PreprocessSuffix) ../sdk/app/spook/session.c

$(IntermediateDirectory)/spook_spook$(ObjectSuffix): ../sdk/app/spook/spook.c  
	$(CC) $(SourceSwitch) ../sdk/app/spook/spook.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/spook_spook$(ObjectSuffix) -MF$(IntermediateDirectory)/spook_spook$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/spook_spook$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/spook_spook$(PreprocessSuffix): ../sdk/app/spook/spook.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/spook_spook$(PreprocessSuffix) ../sdk/app/spook/spook.c

$(IntermediateDirectory)/spook_stream$(ObjectSuffix): ../sdk/app/spook/stream.c  
	$(CC) $(SourceSwitch) ../sdk/app/spook/stream.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/spook_stream$(ObjectSuffix) -MF$(IntermediateDirectory)/spook_stream$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/spook_stream$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/spook_stream$(PreprocessSuffix): ../sdk/app/spook/stream.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/spook_stream$(PreprocessSuffix) ../sdk/app/spook/stream.c

$(IntermediateDirectory)/spook_tcp$(ObjectSuffix): ../sdk/app/spook/tcp.c  
	$(CC) $(SourceSwitch) ../sdk/app/spook/tcp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/spook_tcp$(ObjectSuffix) -MF$(IntermediateDirectory)/spook_tcp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/spook_tcp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/spook_tcp$(PreprocessSuffix): ../sdk/app/spook/tcp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/spook_tcp$(PreprocessSuffix) ../sdk/app/spook/tcp.c

$(IntermediateDirectory)/spook_webfile$(ObjectSuffix): ../sdk/app/spook/webfile.c  
	$(CC) $(SourceSwitch) ../sdk/app/spook/webfile.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/spook_webfile$(ObjectSuffix) -MF$(IntermediateDirectory)/spook_webfile$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/spook_webfile$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/spook_webfile$(PreprocessSuffix): ../sdk/app/spook/webfile.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/spook_webfile$(PreprocessSuffix) ../sdk/app/spook/webfile.c

$(IntermediateDirectory)/sta_interface_sta_interface$(ObjectSuffix): ../sdk/app/sta_interface/sta_interface.c  
	$(CC) $(SourceSwitch) ../sdk/app/sta_interface/sta_interface.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sta_interface_sta_interface$(ObjectSuffix) -MF$(IntermediateDirectory)/sta_interface_sta_interface$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sta_interface_sta_interface$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sta_interface_sta_interface$(PreprocessSuffix): ../sdk/app/sta_interface/sta_interface.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sta_interface_sta_interface$(PreprocessSuffix) ../sdk/app/sta_interface/sta_interface.c

$(IntermediateDirectory)/update_ota$(ObjectSuffix): ../sdk/app/update/ota.c  
	$(CC) $(SourceSwitch) ../sdk/app/update/ota.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/update_ota$(ObjectSuffix) -MF$(IntermediateDirectory)/update_ota$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/update_ota$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/update_ota$(PreprocessSuffix): ../sdk/app/update/ota.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/update_ota$(PreprocessSuffix) ../sdk/app/update/ota.c

$(IntermediateDirectory)/video_app_video_app$(ObjectSuffix): ../sdk/app/video_app/video_app.c  
	$(CC) $(SourceSwitch) ../sdk/app/video_app/video_app.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/video_app_video_app$(ObjectSuffix) -MF$(IntermediateDirectory)/video_app_video_app$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/video_app_video_app$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/video_app_video_app$(PreprocessSuffix): ../sdk/app/video_app/video_app.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/video_app_video_app$(PreprocessSuffix) ../sdk/app/video_app/video_app.c

$(IntermediateDirectory)/video_app_video_app_usb$(ObjectSuffix): ../sdk/app/video_app/video_app_usb.c  
	$(CC) $(SourceSwitch) ../sdk/app/video_app/video_app_usb.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/video_app_video_app_usb$(ObjectSuffix) -MF$(IntermediateDirectory)/video_app_video_app_usb$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/video_app_video_app_usb$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/video_app_video_app_usb$(PreprocessSuffix): ../sdk/app/video_app/video_app_usb.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/video_app_video_app_usb$(PreprocessSuffix) ../sdk/app/video_app/video_app_usb.c

$(IntermediateDirectory)/video_app_video_app_usb_psram$(ObjectSuffix): ../sdk/app/video_app/video_app_usb_psram.c  
	$(CC) $(SourceSwitch) ../sdk/app/video_app/video_app_usb_psram.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/video_app_video_app_usb_psram$(ObjectSuffix) -MF$(IntermediateDirectory)/video_app_video_app_usb_psram$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/video_app_video_app_usb_psram$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/video_app_video_app_usb_psram$(PreprocessSuffix): ../sdk/app/video_app/video_app_usb_psram.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/video_app_video_app_usb_psram$(PreprocessSuffix) ../sdk/app/video_app/video_app_usb_psram.c

$(IntermediateDirectory)/video_app_video_app_usb_to_lcd$(ObjectSuffix): ../sdk/app/video_app/video_app_usb_to_lcd.c  
	$(CC) $(SourceSwitch) ../sdk/app/video_app/video_app_usb_to_lcd.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/video_app_video_app_usb_to_lcd$(ObjectSuffix) -MF$(IntermediateDirectory)/video_app_video_app_usb_to_lcd$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/video_app_video_app_usb_to_lcd$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/video_app_video_app_usb_to_lcd$(PreprocessSuffix): ../sdk/app/video_app/video_app_usb_to_lcd.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/video_app_video_app_usb_to_lcd$(PreprocessSuffix) ../sdk/app/video_app/video_app_usb_to_lcd.c

$(IntermediateDirectory)/playback_playback$(ObjectSuffix): ../sdk/app/playback/playback.c  
	$(CC) $(SourceSwitch) ../sdk/app/playback/playback.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/playback_playback$(ObjectSuffix) -MF$(IntermediateDirectory)/playback_playback$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/playback_playback$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/playback_playback$(PreprocessSuffix): ../sdk/app/playback/playback.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/playback_playback$(PreprocessSuffix) ../sdk/app/playback/playback.c

$(IntermediateDirectory)/interface_management_interface_mgnt$(ObjectSuffix): ../sdk/app/interface_management/interface_mgnt.c  
	$(CC) $(SourceSwitch) ../sdk/app/interface_management/interface_mgnt.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/interface_management_interface_mgnt$(ObjectSuffix) -MF$(IntermediateDirectory)/interface_management_interface_mgnt$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/interface_management_interface_mgnt$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/interface_management_interface_mgnt$(PreprocessSuffix): ../sdk/app/interface_management/interface_mgnt.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/interface_management_interface_mgnt$(PreprocessSuffix) ../sdk/app/interface_management/interface_mgnt.c

$(IntermediateDirectory)/audio_app_audio_ad$(ObjectSuffix): ../sdk/app/audio_app/audio_ad.c  
	$(CC) $(SourceSwitch) ../sdk/app/audio_app/audio_ad.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/audio_app_audio_ad$(ObjectSuffix) -MF$(IntermediateDirectory)/audio_app_audio_ad$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/audio_app_audio_ad$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/audio_app_audio_ad$(PreprocessSuffix): ../sdk/app/audio_app/audio_ad.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/audio_app_audio_ad$(PreprocessSuffix) ../sdk/app/audio_app/audio_ad.c

$(IntermediateDirectory)/audio_app_audio_da$(ObjectSuffix): ../sdk/app/audio_app/audio_da.c  
	$(CC) $(SourceSwitch) ../sdk/app/audio_app/audio_da.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/audio_app_audio_da$(ObjectSuffix) -MF$(IntermediateDirectory)/audio_app_audio_da$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/audio_app_audio_da$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/audio_app_audio_da$(PreprocessSuffix): ../sdk/app/audio_app/audio_da.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/audio_app_audio_da$(PreprocessSuffix) ../sdk/app/audio_app/audio_da.c

$(IntermediateDirectory)/audio_app_hal_i2s_audio$(ObjectSuffix): ../sdk/app/audio_app/hal_i2s_audio.c  
	$(CC) $(SourceSwitch) ../sdk/app/audio_app/hal_i2s_audio.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/audio_app_hal_i2s_audio$(ObjectSuffix) -MF$(IntermediateDirectory)/audio_app_hal_i2s_audio$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/audio_app_hal_i2s_audio$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/audio_app_hal_i2s_audio$(PreprocessSuffix): ../sdk/app/audio_app/hal_i2s_audio.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/audio_app_hal_i2s_audio$(PreprocessSuffix) ../sdk/app/audio_app/hal_i2s_audio.c

$(IntermediateDirectory)/audio_app_pdm_audio$(ObjectSuffix): ../sdk/app/audio_app/pdm_audio.c  
	$(CC) $(SourceSwitch) ../sdk/app/audio_app/pdm_audio.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/audio_app_pdm_audio$(ObjectSuffix) -MF$(IntermediateDirectory)/audio_app_pdm_audio$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/audio_app_pdm_audio$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/audio_app_pdm_audio$(PreprocessSuffix): ../sdk/app/audio_app/pdm_audio.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/audio_app_pdm_audio$(PreprocessSuffix) ../sdk/app/audio_app/pdm_audio.c

$(IntermediateDirectory)/test_demo_AT_save_audio$(ObjectSuffix): ../sdk/app/test_demo/AT_save_audio.c  
	$(CC) $(SourceSwitch) ../sdk/app/test_demo/AT_save_audio.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/test_demo_AT_save_audio$(ObjectSuffix) -MF$(IntermediateDirectory)/test_demo_AT_save_audio$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/test_demo_AT_save_audio$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/test_demo_AT_save_audio$(PreprocessSuffix): ../sdk/app/test_demo/AT_save_audio.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/test_demo_AT_save_audio$(PreprocessSuffix) ../sdk/app/test_demo/AT_save_audio.c

$(IntermediateDirectory)/test_demo_AT_save_avi$(ObjectSuffix): ../sdk/app/test_demo/AT_save_avi.c  
	$(CC) $(SourceSwitch) ../sdk/app/test_demo/AT_save_avi.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/test_demo_AT_save_avi$(ObjectSuffix) -MF$(IntermediateDirectory)/test_demo_AT_save_avi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/test_demo_AT_save_avi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/test_demo_AT_save_avi$(PreprocessSuffix): ../sdk/app/test_demo/AT_save_avi.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/test_demo_AT_save_avi$(PreprocessSuffix) ../sdk/app/test_demo/AT_save_avi.c

$(IntermediateDirectory)/test_demo_AT_save_photo$(ObjectSuffix): ../sdk/app/test_demo/AT_save_photo.c  
	$(CC) $(SourceSwitch) ../sdk/app/test_demo/AT_save_photo.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/test_demo_AT_save_photo$(ObjectSuffix) -MF$(IntermediateDirectory)/test_demo_AT_save_photo$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/test_demo_AT_save_photo$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/test_demo_AT_save_photo$(PreprocessSuffix): ../sdk/app/test_demo/AT_save_photo.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/test_demo_AT_save_photo$(PreprocessSuffix) ../sdk/app/test_demo/AT_save_photo.c

$(IntermediateDirectory)/flash_flash_read_demo$(ObjectSuffix): ../sdk/app/flash/flash_read_demo.c  
	$(CC) $(SourceSwitch) ../sdk/app/flash/flash_read_demo.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/flash_flash_read_demo$(ObjectSuffix) -MF$(IntermediateDirectory)/flash_flash_read_demo$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/flash_flash_read_demo$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/flash_flash_read_demo$(PreprocessSuffix): ../sdk/app/flash/flash_read_demo.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/flash_flash_read_demo$(PreprocessSuffix) ../sdk/app/flash/flash_read_demo.c

$(IntermediateDirectory)/halibaduo_halibaduo$(ObjectSuffix): ../sdk/app/halibaduo/halibaduo.c  
	$(CC) $(SourceSwitch) ../sdk/app/halibaduo/halibaduo.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/halibaduo_halibaduo$(ObjectSuffix) -MF$(IntermediateDirectory)/halibaduo_halibaduo$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/halibaduo_halibaduo$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/halibaduo_halibaduo$(PreprocessSuffix): ../sdk/app/halibaduo/halibaduo.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/halibaduo_halibaduo$(PreprocessSuffix) ../sdk/app/halibaduo/halibaduo.c

$(IntermediateDirectory)/halibaduo_hali_list_node$(ObjectSuffix): ../sdk/app/halibaduo/hali_list_node.c  
	$(CC) $(SourceSwitch) ../sdk/app/halibaduo/hali_list_node.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/halibaduo_hali_list_node$(ObjectSuffix) -MF$(IntermediateDirectory)/halibaduo_hali_list_node$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/halibaduo_hali_list_node$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/halibaduo_hali_list_node$(PreprocessSuffix): ../sdk/app/halibaduo/hali_list_node.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/halibaduo_hali_list_node$(PreprocessSuffix) ../sdk/app/halibaduo/hali_list_node.c

$(IntermediateDirectory)/halibaduo_hali_button$(ObjectSuffix): ../sdk/app/halibaduo/hali_button.c  
	$(CC) $(SourceSwitch) ../sdk/app/halibaduo/hali_button.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/halibaduo_hali_button$(ObjectSuffix) -MF$(IntermediateDirectory)/halibaduo_hali_button$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/halibaduo_hali_button$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/halibaduo_hali_button$(PreprocessSuffix): ../sdk/app/halibaduo/hali_button.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/halibaduo_hali_button$(PreprocessSuffix) ../sdk/app/halibaduo/hali_button.c

$(IntermediateDirectory)/halibaduo_hali_led$(ObjectSuffix): ../sdk/app/halibaduo/hali_led.c  
	$(CC) $(SourceSwitch) ../sdk/app/halibaduo/hali_led.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/halibaduo_hali_led$(ObjectSuffix) -MF$(IntermediateDirectory)/halibaduo_hali_led$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/halibaduo_hali_led$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/halibaduo_hali_led$(PreprocessSuffix): ../sdk/app/halibaduo/hali_led.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/halibaduo_hali_led$(PreprocessSuffix) ../sdk/app/halibaduo/hali_led.c

$(IntermediateDirectory)/halibaduo_hali_energy$(ObjectSuffix): ../sdk/app/halibaduo/hali_energy.c  
	$(CC) $(SourceSwitch) ../sdk/app/halibaduo/hali_energy.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/halibaduo_hali_energy$(ObjectSuffix) -MF$(IntermediateDirectory)/halibaduo_hali_energy$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/halibaduo_hali_energy$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/halibaduo_hali_energy$(PreprocessSuffix): ../sdk/app/halibaduo/hali_energy.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/halibaduo_hali_energy$(PreprocessSuffix) ../sdk/app/halibaduo/hali_energy.c

$(IntermediateDirectory)/halibaduo_hali_network$(ObjectSuffix): ../sdk/app/halibaduo/hali_network.c  
	$(CC) $(SourceSwitch) ../sdk/app/halibaduo/hali_network.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/halibaduo_hali_network$(ObjectSuffix) -MF$(IntermediateDirectory)/halibaduo_hali_network$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/halibaduo_hali_network$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/halibaduo_hali_network$(PreprocessSuffix): ../sdk/app/halibaduo/hali_network.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/halibaduo_hali_network$(PreprocessSuffix) ../sdk/app/halibaduo/hali_network.c

$(IntermediateDirectory)/halibaduo_hali_ota$(ObjectSuffix): ../sdk/app/halibaduo/hali_ota.c  
	$(CC) $(SourceSwitch) ../sdk/app/halibaduo/hali_ota.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/halibaduo_hali_ota$(ObjectSuffix) -MF$(IntermediateDirectory)/halibaduo_hali_ota$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/halibaduo_hali_ota$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/halibaduo_hali_ota$(PreprocessSuffix): ../sdk/app/halibaduo/hali_ota.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/halibaduo_hali_ota$(PreprocessSuffix) ../sdk/app/halibaduo/hali_ota.c

$(IntermediateDirectory)/halibaduo_hali_wifi$(ObjectSuffix): ../sdk/app/halibaduo/hali_wifi.c  
	$(CC) $(SourceSwitch) ../sdk/app/halibaduo/hali_wifi.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/halibaduo_hali_wifi$(ObjectSuffix) -MF$(IntermediateDirectory)/halibaduo_hali_wifi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/halibaduo_hali_wifi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/halibaduo_hali_wifi$(PreprocessSuffix): ../sdk/app/halibaduo/hali_wifi.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/halibaduo_hali_wifi$(PreprocessSuffix) ../sdk/app/halibaduo/hali_wifi.c

$(IntermediateDirectory)/halibaduo_hali_picture$(ObjectSuffix): ../sdk/app/halibaduo/hali_picture.c  
	$(CC) $(SourceSwitch) ../sdk/app/halibaduo/hali_picture.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/halibaduo_hali_picture$(ObjectSuffix) -MF$(IntermediateDirectory)/halibaduo_hali_picture$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/halibaduo_hali_picture$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/halibaduo_hali_picture$(PreprocessSuffix): ../sdk/app/halibaduo/hali_picture.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/halibaduo_hali_picture$(PreprocessSuffix) ../sdk/app/halibaduo/hali_picture.c

$(IntermediateDirectory)/adapter_csi_rhino$(ObjectSuffix): ../csky/csi_kernel/rhino/adapter/csi_rhino.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/adapter/csi_rhino.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/adapter_csi_rhino$(ObjectSuffix) -MF$(IntermediateDirectory)/adapter_csi_rhino$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/adapter_csi_rhino$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/adapter_csi_rhino$(PreprocessSuffix): ../csky/csi_kernel/rhino/adapter/csi_rhino.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/adapter_csi_rhino$(PreprocessSuffix) ../csky/csi_kernel/rhino/adapter/csi_rhino.c

$(IntermediateDirectory)/common_k_atomic$(ObjectSuffix): ../csky/csi_kernel/rhino/common/k_atomic.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/common/k_atomic.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/common_k_atomic$(ObjectSuffix) -MF$(IntermediateDirectory)/common_k_atomic$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/common_k_atomic$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/common_k_atomic$(PreprocessSuffix): ../csky/csi_kernel/rhino/common/k_atomic.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/common_k_atomic$(PreprocessSuffix) ../csky/csi_kernel/rhino/common/k_atomic.c

$(IntermediateDirectory)/common_k_ffs$(ObjectSuffix): ../csky/csi_kernel/rhino/common/k_ffs.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/common/k_ffs.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/common_k_ffs$(ObjectSuffix) -MF$(IntermediateDirectory)/common_k_ffs$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/common_k_ffs$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/common_k_ffs$(PreprocessSuffix): ../csky/csi_kernel/rhino/common/k_ffs.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/common_k_ffs$(PreprocessSuffix) ../csky/csi_kernel/rhino/common/k_ffs.c

$(IntermediateDirectory)/common_k_fifo$(ObjectSuffix): ../csky/csi_kernel/rhino/common/k_fifo.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/common/k_fifo.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/common_k_fifo$(ObjectSuffix) -MF$(IntermediateDirectory)/common_k_fifo$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/common_k_fifo$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/common_k_fifo$(PreprocessSuffix): ../csky/csi_kernel/rhino/common/k_fifo.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/common_k_fifo$(PreprocessSuffix) ../csky/csi_kernel/rhino/common/k_fifo.c

$(IntermediateDirectory)/common_k_trace$(ObjectSuffix): ../csky/csi_kernel/rhino/common/k_trace.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/common/k_trace.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/common_k_trace$(ObjectSuffix) -MF$(IntermediateDirectory)/common_k_trace$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/common_k_trace$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/common_k_trace$(PreprocessSuffix): ../csky/csi_kernel/rhino/common/k_trace.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/common_k_trace$(PreprocessSuffix) ../csky/csi_kernel/rhino/common/k_trace.c

$(IntermediateDirectory)/core_k_buf_queue$(ObjectSuffix): ../csky/csi_kernel/rhino/core/k_buf_queue.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/core/k_buf_queue.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_buf_queue$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_buf_queue$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_buf_queue$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_buf_queue$(PreprocessSuffix): ../csky/csi_kernel/rhino/core/k_buf_queue.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_buf_queue$(PreprocessSuffix) ../csky/csi_kernel/rhino/core/k_buf_queue.c

$(IntermediateDirectory)/core_k_dyn_mem_proc$(ObjectSuffix): ../csky/csi_kernel/rhino/core/k_dyn_mem_proc.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/core/k_dyn_mem_proc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_dyn_mem_proc$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_dyn_mem_proc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_dyn_mem_proc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_dyn_mem_proc$(PreprocessSuffix): ../csky/csi_kernel/rhino/core/k_dyn_mem_proc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_dyn_mem_proc$(PreprocessSuffix) ../csky/csi_kernel/rhino/core/k_dyn_mem_proc.c

$(IntermediateDirectory)/core_k_err$(ObjectSuffix): ../csky/csi_kernel/rhino/core/k_err.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/core/k_err.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_err$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_err$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_err$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_err$(PreprocessSuffix): ../csky/csi_kernel/rhino/core/k_err.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_err$(PreprocessSuffix) ../csky/csi_kernel/rhino/core/k_err.c

$(IntermediateDirectory)/core_k_event$(ObjectSuffix): ../csky/csi_kernel/rhino/core/k_event.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/core/k_event.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_event$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_event$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_event$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_event$(PreprocessSuffix): ../csky/csi_kernel/rhino/core/k_event.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_event$(PreprocessSuffix) ../csky/csi_kernel/rhino/core/k_event.c

$(IntermediateDirectory)/core_k_idle$(ObjectSuffix): ../csky/csi_kernel/rhino/core/k_idle.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/core/k_idle.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_idle$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_idle$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_idle$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_idle$(PreprocessSuffix): ../csky/csi_kernel/rhino/core/k_idle.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_idle$(PreprocessSuffix) ../csky/csi_kernel/rhino/core/k_idle.c

$(IntermediateDirectory)/core_k_mm$(ObjectSuffix): ../csky/csi_kernel/rhino/core/k_mm.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/core/k_mm.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_mm$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_mm$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_mm$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_mm$(PreprocessSuffix): ../csky/csi_kernel/rhino/core/k_mm.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_mm$(PreprocessSuffix) ../csky/csi_kernel/rhino/core/k_mm.c

$(IntermediateDirectory)/core_k_mm_blk$(ObjectSuffix): ../csky/csi_kernel/rhino/core/k_mm_blk.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/core/k_mm_blk.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_mm_blk$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_mm_blk$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_mm_blk$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_mm_blk$(PreprocessSuffix): ../csky/csi_kernel/rhino/core/k_mm_blk.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_mm_blk$(PreprocessSuffix) ../csky/csi_kernel/rhino/core/k_mm_blk.c

$(IntermediateDirectory)/core_k_mm_debug$(ObjectSuffix): ../csky/csi_kernel/rhino/core/k_mm_debug.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/core/k_mm_debug.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_mm_debug$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_mm_debug$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_mm_debug$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_mm_debug$(PreprocessSuffix): ../csky/csi_kernel/rhino/core/k_mm_debug.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_mm_debug$(PreprocessSuffix) ../csky/csi_kernel/rhino/core/k_mm_debug.c

$(IntermediateDirectory)/core_k_mutex$(ObjectSuffix): ../csky/csi_kernel/rhino/core/k_mutex.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/core/k_mutex.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_mutex$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_mutex$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_mutex$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_mutex$(PreprocessSuffix): ../csky/csi_kernel/rhino/core/k_mutex.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_mutex$(PreprocessSuffix) ../csky/csi_kernel/rhino/core/k_mutex.c

$(IntermediateDirectory)/core_k_obj$(ObjectSuffix): ../csky/csi_kernel/rhino/core/k_obj.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/core/k_obj.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_obj$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_obj$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_obj$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_obj$(PreprocessSuffix): ../csky/csi_kernel/rhino/core/k_obj.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_obj$(PreprocessSuffix) ../csky/csi_kernel/rhino/core/k_obj.c

$(IntermediateDirectory)/core_k_pend$(ObjectSuffix): ../csky/csi_kernel/rhino/core/k_pend.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/core/k_pend.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_pend$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_pend$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_pend$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_pend$(PreprocessSuffix): ../csky/csi_kernel/rhino/core/k_pend.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_pend$(PreprocessSuffix) ../csky/csi_kernel/rhino/core/k_pend.c

$(IntermediateDirectory)/core_k_queue$(ObjectSuffix): ../csky/csi_kernel/rhino/core/k_queue.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/core/k_queue.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_queue$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_queue$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_queue$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_queue$(PreprocessSuffix): ../csky/csi_kernel/rhino/core/k_queue.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_queue$(PreprocessSuffix) ../csky/csi_kernel/rhino/core/k_queue.c

$(IntermediateDirectory)/core_k_ringbuf$(ObjectSuffix): ../csky/csi_kernel/rhino/core/k_ringbuf.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/core/k_ringbuf.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_ringbuf$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_ringbuf$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_ringbuf$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_ringbuf$(PreprocessSuffix): ../csky/csi_kernel/rhino/core/k_ringbuf.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_ringbuf$(PreprocessSuffix) ../csky/csi_kernel/rhino/core/k_ringbuf.c

$(IntermediateDirectory)/core_k_sched$(ObjectSuffix): ../csky/csi_kernel/rhino/core/k_sched.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/core/k_sched.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_sched$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_sched$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_sched$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_sched$(PreprocessSuffix): ../csky/csi_kernel/rhino/core/k_sched.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_sched$(PreprocessSuffix) ../csky/csi_kernel/rhino/core/k_sched.c

$(IntermediateDirectory)/core_k_sem$(ObjectSuffix): ../csky/csi_kernel/rhino/core/k_sem.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/core/k_sem.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_sem$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_sem$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_sem$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_sem$(PreprocessSuffix): ../csky/csi_kernel/rhino/core/k_sem.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_sem$(PreprocessSuffix) ../csky/csi_kernel/rhino/core/k_sem.c

$(IntermediateDirectory)/core_k_stats$(ObjectSuffix): ../csky/csi_kernel/rhino/core/k_stats.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/core/k_stats.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_stats$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_stats$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_stats$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_stats$(PreprocessSuffix): ../csky/csi_kernel/rhino/core/k_stats.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_stats$(PreprocessSuffix) ../csky/csi_kernel/rhino/core/k_stats.c

$(IntermediateDirectory)/core_k_sys$(ObjectSuffix): ../csky/csi_kernel/rhino/core/k_sys.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/core/k_sys.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_sys$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_sys$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_sys$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_sys$(PreprocessSuffix): ../csky/csi_kernel/rhino/core/k_sys.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_sys$(PreprocessSuffix) ../csky/csi_kernel/rhino/core/k_sys.c

$(IntermediateDirectory)/core_k_task$(ObjectSuffix): ../csky/csi_kernel/rhino/core/k_task.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/core/k_task.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_task$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_task$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_task$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_task$(PreprocessSuffix): ../csky/csi_kernel/rhino/core/k_task.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_task$(PreprocessSuffix) ../csky/csi_kernel/rhino/core/k_task.c

$(IntermediateDirectory)/core_k_task_sem$(ObjectSuffix): ../csky/csi_kernel/rhino/core/k_task_sem.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/core/k_task_sem.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_task_sem$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_task_sem$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_task_sem$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_task_sem$(PreprocessSuffix): ../csky/csi_kernel/rhino/core/k_task_sem.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_task_sem$(PreprocessSuffix) ../csky/csi_kernel/rhino/core/k_task_sem.c

$(IntermediateDirectory)/core_k_tick$(ObjectSuffix): ../csky/csi_kernel/rhino/core/k_tick.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/core/k_tick.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_tick$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_tick$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_tick$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_tick$(PreprocessSuffix): ../csky/csi_kernel/rhino/core/k_tick.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_tick$(PreprocessSuffix) ../csky/csi_kernel/rhino/core/k_tick.c

$(IntermediateDirectory)/core_k_time$(ObjectSuffix): ../csky/csi_kernel/rhino/core/k_time.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/core/k_time.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_time$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_time$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_time$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_time$(PreprocessSuffix): ../csky/csi_kernel/rhino/core/k_time.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_time$(PreprocessSuffix) ../csky/csi_kernel/rhino/core/k_time.c

$(IntermediateDirectory)/core_k_timer$(ObjectSuffix): ../csky/csi_kernel/rhino/core/k_timer.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/core/k_timer.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_timer$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_timer$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_timer$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_timer$(PreprocessSuffix): ../csky/csi_kernel/rhino/core/k_timer.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_timer$(PreprocessSuffix) ../csky/csi_kernel/rhino/core/k_timer.c

$(IntermediateDirectory)/core_k_workqueue$(ObjectSuffix): ../csky/csi_kernel/rhino/core/k_workqueue.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/core/k_workqueue.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_k_workqueue$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_workqueue$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_k_workqueue$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_k_workqueue$(PreprocessSuffix): ../csky/csi_kernel/rhino/core/k_workqueue.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_workqueue$(PreprocessSuffix) ../csky/csi_kernel/rhino/core/k_workqueue.c

$(IntermediateDirectory)/driver_hook_impl$(ObjectSuffix): ../csky/csi_kernel/rhino/driver/hook_impl.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/driver/hook_impl.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/driver_hook_impl$(ObjectSuffix) -MF$(IntermediateDirectory)/driver_hook_impl$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/driver_hook_impl$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/driver_hook_impl$(PreprocessSuffix): ../csky/csi_kernel/rhino/driver/hook_impl.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/driver_hook_impl$(PreprocessSuffix) ../csky/csi_kernel/rhino/driver/hook_impl.c

$(IntermediateDirectory)/driver_systick$(ObjectSuffix): ../csky/csi_kernel/rhino/driver/systick.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/driver/systick.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/driver_systick$(ObjectSuffix) -MF$(IntermediateDirectory)/driver_systick$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/driver_systick$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/driver_systick$(PreprocessSuffix): ../csky/csi_kernel/rhino/driver/systick.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/driver_systick$(PreprocessSuffix) ../csky/csi_kernel/rhino/driver/systick.c

$(IntermediateDirectory)/driver_yoc_impl$(ObjectSuffix): ../csky/csi_kernel/rhino/driver/yoc_impl.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/driver/yoc_impl.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/driver_yoc_impl$(ObjectSuffix) -MF$(IntermediateDirectory)/driver_yoc_impl$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/driver_yoc_impl$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/driver_yoc_impl$(PreprocessSuffix): ../csky/csi_kernel/rhino/driver/yoc_impl.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/driver_yoc_impl$(PreprocessSuffix) ../csky/csi_kernel/rhino/driver/yoc_impl.c

$(IntermediateDirectory)/driver_hook_weak$(ObjectSuffix): ../csky/csi_kernel/rhino/driver/hook_weak.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/driver/hook_weak.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/driver_hook_weak$(ObjectSuffix) -MF$(IntermediateDirectory)/driver_hook_weak$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/driver_hook_weak$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/driver_hook_weak$(PreprocessSuffix): ../csky/csi_kernel/rhino/driver/hook_weak.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/driver_hook_weak$(PreprocessSuffix) ../csky/csi_kernel/rhino/driver/hook_weak.c

$(IntermediateDirectory)/eloop_eloop$(ObjectSuffix): ../sdk/lib/net/eloop/eloop.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/eloop/eloop.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/eloop_eloop$(ObjectSuffix) -MF$(IntermediateDirectory)/eloop_eloop$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/eloop_eloop$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/eloop_eloop$(PreprocessSuffix): ../sdk/lib/net/eloop/eloop.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/eloop_eloop$(PreprocessSuffix) ../sdk/lib/net/eloop/eloop.c

$(IntermediateDirectory)/ethphy_eth_mdio_bus$(ObjectSuffix): ../sdk/lib/net/ethphy/eth_mdio_bus.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/ethphy/eth_mdio_bus.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ethphy_eth_mdio_bus$(ObjectSuffix) -MF$(IntermediateDirectory)/ethphy_eth_mdio_bus$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ethphy_eth_mdio_bus$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ethphy_eth_mdio_bus$(PreprocessSuffix): ../sdk/lib/net/ethphy/eth_mdio_bus.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ethphy_eth_mdio_bus$(PreprocessSuffix) ../sdk/lib/net/ethphy/eth_mdio_bus.c

$(IntermediateDirectory)/ethphy_eth_phy$(ObjectSuffix): ../sdk/lib/net/ethphy/eth_phy.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/ethphy/eth_phy.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ethphy_eth_phy$(ObjectSuffix) -MF$(IntermediateDirectory)/ethphy_eth_phy$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ethphy_eth_phy$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ethphy_eth_phy$(PreprocessSuffix): ../sdk/lib/net/ethphy/eth_phy.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ethphy_eth_phy$(PreprocessSuffix) ../sdk/lib/net/ethphy/eth_phy.c

$(IntermediateDirectory)/ethphy_eth_phy_device$(ObjectSuffix): ../sdk/lib/net/ethphy/eth_phy_device.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/ethphy/eth_phy_device.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ethphy_eth_phy_device$(ObjectSuffix) -MF$(IntermediateDirectory)/ethphy_eth_phy_device$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ethphy_eth_phy_device$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ethphy_eth_phy_device$(PreprocessSuffix): ../sdk/lib/net/ethphy/eth_phy_device.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ethphy_eth_phy_device$(PreprocessSuffix) ../sdk/lib/net/ethphy/eth_phy_device.c

$(IntermediateDirectory)/skmonitor_skmonitor$(ObjectSuffix): ../sdk/lib/net/skmonitor/skmonitor.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/skmonitor/skmonitor.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/skmonitor_skmonitor$(ObjectSuffix) -MF$(IntermediateDirectory)/skmonitor_skmonitor$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/skmonitor_skmonitor$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/skmonitor_skmonitor$(PreprocessSuffix): ../sdk/lib/net/skmonitor/skmonitor.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/skmonitor_skmonitor$(PreprocessSuffix) ../sdk/lib/net/skmonitor/skmonitor.c

$(IntermediateDirectory)/libcurl_altsvc$(ObjectSuffix): ../sdk/lib/net/libcurl/altsvc.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/altsvc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_altsvc$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_altsvc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_altsvc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_altsvc$(PreprocessSuffix): ../sdk/lib/net/libcurl/altsvc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_altsvc$(PreprocessSuffix) ../sdk/lib/net/libcurl/altsvc.c

$(IntermediateDirectory)/libcurl_amigaos$(ObjectSuffix): ../sdk/lib/net/libcurl/amigaos.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/amigaos.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_amigaos$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_amigaos$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_amigaos$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_amigaos$(PreprocessSuffix): ../sdk/lib/net/libcurl/amigaos.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_amigaos$(PreprocessSuffix) ../sdk/lib/net/libcurl/amigaos.c

$(IntermediateDirectory)/libcurl_asyn-ares$(ObjectSuffix): ../sdk/lib/net/libcurl/asyn-ares.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/asyn-ares.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_asyn-ares$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_asyn-ares$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_asyn-ares$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_asyn-ares$(PreprocessSuffix): ../sdk/lib/net/libcurl/asyn-ares.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_asyn-ares$(PreprocessSuffix) ../sdk/lib/net/libcurl/asyn-ares.c

$(IntermediateDirectory)/libcurl_asyn-thread$(ObjectSuffix): ../sdk/lib/net/libcurl/asyn-thread.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/asyn-thread.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_asyn-thread$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_asyn-thread$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_asyn-thread$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_asyn-thread$(PreprocessSuffix): ../sdk/lib/net/libcurl/asyn-thread.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_asyn-thread$(PreprocessSuffix) ../sdk/lib/net/libcurl/asyn-thread.c

$(IntermediateDirectory)/libcurl_base64$(ObjectSuffix): ../sdk/lib/net/libcurl/base64.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/base64.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_base64$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_base64$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_base64$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_base64$(PreprocessSuffix): ../sdk/lib/net/libcurl/base64.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_base64$(PreprocessSuffix) ../sdk/lib/net/libcurl/base64.c

$(IntermediateDirectory)/libcurl_bufref$(ObjectSuffix): ../sdk/lib/net/libcurl/bufref.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/bufref.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_bufref$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_bufref$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_bufref$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_bufref$(PreprocessSuffix): ../sdk/lib/net/libcurl/bufref.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_bufref$(PreprocessSuffix) ../sdk/lib/net/libcurl/bufref.c

$(IntermediateDirectory)/libcurl_c-hyper$(ObjectSuffix): ../sdk/lib/net/libcurl/c-hyper.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/c-hyper.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_c-hyper$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_c-hyper$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_c-hyper$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_c-hyper$(PreprocessSuffix): ../sdk/lib/net/libcurl/c-hyper.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_c-hyper$(PreprocessSuffix) ../sdk/lib/net/libcurl/c-hyper.c

$(IntermediateDirectory)/libcurl_cf-https-connect$(ObjectSuffix): ../sdk/lib/net/libcurl/cf-https-connect.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/cf-https-connect.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_cf-https-connect$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_cf-https-connect$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_cf-https-connect$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_cf-https-connect$(PreprocessSuffix): ../sdk/lib/net/libcurl/cf-https-connect.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_cf-https-connect$(PreprocessSuffix) ../sdk/lib/net/libcurl/cf-https-connect.c

$(IntermediateDirectory)/libcurl_cf-socket$(ObjectSuffix): ../sdk/lib/net/libcurl/cf-socket.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/cf-socket.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_cf-socket$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_cf-socket$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_cf-socket$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_cf-socket$(PreprocessSuffix): ../sdk/lib/net/libcurl/cf-socket.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_cf-socket$(PreprocessSuffix) ../sdk/lib/net/libcurl/cf-socket.c

$(IntermediateDirectory)/libcurl_cfilters$(ObjectSuffix): ../sdk/lib/net/libcurl/cfilters.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/cfilters.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_cfilters$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_cfilters$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_cfilters$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_cfilters$(PreprocessSuffix): ../sdk/lib/net/libcurl/cfilters.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_cfilters$(PreprocessSuffix) ../sdk/lib/net/libcurl/cfilters.c

$(IntermediateDirectory)/libcurl_conncache$(ObjectSuffix): ../sdk/lib/net/libcurl/conncache.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/conncache.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_conncache$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_conncache$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_conncache$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_conncache$(PreprocessSuffix): ../sdk/lib/net/libcurl/conncache.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_conncache$(PreprocessSuffix) ../sdk/lib/net/libcurl/conncache.c

$(IntermediateDirectory)/libcurl_connect$(ObjectSuffix): ../sdk/lib/net/libcurl/connect.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/connect.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_connect$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_connect$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_connect$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_connect$(PreprocessSuffix): ../sdk/lib/net/libcurl/connect.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_connect$(PreprocessSuffix) ../sdk/lib/net/libcurl/connect.c

$(IntermediateDirectory)/libcurl_content_encoding$(ObjectSuffix): ../sdk/lib/net/libcurl/content_encoding.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/content_encoding.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_content_encoding$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_content_encoding$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_content_encoding$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_content_encoding$(PreprocessSuffix): ../sdk/lib/net/libcurl/content_encoding.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_content_encoding$(PreprocessSuffix) ../sdk/lib/net/libcurl/content_encoding.c

$(IntermediateDirectory)/libcurl_cookie$(ObjectSuffix): ../sdk/lib/net/libcurl/cookie.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/cookie.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_cookie$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_cookie$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_cookie$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_cookie$(PreprocessSuffix): ../sdk/lib/net/libcurl/cookie.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_cookie$(PreprocessSuffix) ../sdk/lib/net/libcurl/cookie.c

$(IntermediateDirectory)/libcurl_curl_addrinfo$(ObjectSuffix): ../sdk/lib/net/libcurl/curl_addrinfo.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/curl_addrinfo.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_curl_addrinfo$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_curl_addrinfo$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_curl_addrinfo$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_curl_addrinfo$(PreprocessSuffix): ../sdk/lib/net/libcurl/curl_addrinfo.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_curl_addrinfo$(PreprocessSuffix) ../sdk/lib/net/libcurl/curl_addrinfo.c

$(IntermediateDirectory)/libcurl_curl_des$(ObjectSuffix): ../sdk/lib/net/libcurl/curl_des.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/curl_des.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_curl_des$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_curl_des$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_curl_des$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_curl_des$(PreprocessSuffix): ../sdk/lib/net/libcurl/curl_des.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_curl_des$(PreprocessSuffix) ../sdk/lib/net/libcurl/curl_des.c

$(IntermediateDirectory)/libcurl_curl_endian$(ObjectSuffix): ../sdk/lib/net/libcurl/curl_endian.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/curl_endian.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_curl_endian$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_curl_endian$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_curl_endian$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_curl_endian$(PreprocessSuffix): ../sdk/lib/net/libcurl/curl_endian.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_curl_endian$(PreprocessSuffix) ../sdk/lib/net/libcurl/curl_endian.c

$(IntermediateDirectory)/libcurl_curl_fnmatch$(ObjectSuffix): ../sdk/lib/net/libcurl/curl_fnmatch.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/curl_fnmatch.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_curl_fnmatch$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_curl_fnmatch$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_curl_fnmatch$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_curl_fnmatch$(PreprocessSuffix): ../sdk/lib/net/libcurl/curl_fnmatch.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_curl_fnmatch$(PreprocessSuffix) ../sdk/lib/net/libcurl/curl_fnmatch.c

$(IntermediateDirectory)/libcurl_curl_gethostname$(ObjectSuffix): ../sdk/lib/net/libcurl/curl_gethostname.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/curl_gethostname.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_curl_gethostname$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_curl_gethostname$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_curl_gethostname$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_curl_gethostname$(PreprocessSuffix): ../sdk/lib/net/libcurl/curl_gethostname.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_curl_gethostname$(PreprocessSuffix) ../sdk/lib/net/libcurl/curl_gethostname.c

$(IntermediateDirectory)/libcurl_curl_get_line$(ObjectSuffix): ../sdk/lib/net/libcurl/curl_get_line.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/curl_get_line.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_curl_get_line$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_curl_get_line$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_curl_get_line$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_curl_get_line$(PreprocessSuffix): ../sdk/lib/net/libcurl/curl_get_line.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_curl_get_line$(PreprocessSuffix) ../sdk/lib/net/libcurl/curl_get_line.c

$(IntermediateDirectory)/libcurl_curl_gssapi$(ObjectSuffix): ../sdk/lib/net/libcurl/curl_gssapi.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/curl_gssapi.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_curl_gssapi$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_curl_gssapi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_curl_gssapi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_curl_gssapi$(PreprocessSuffix): ../sdk/lib/net/libcurl/curl_gssapi.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_curl_gssapi$(PreprocessSuffix) ../sdk/lib/net/libcurl/curl_gssapi.c

$(IntermediateDirectory)/libcurl_curl_log$(ObjectSuffix): ../sdk/lib/net/libcurl/curl_log.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/curl_log.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_curl_log$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_curl_log$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_curl_log$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_curl_log$(PreprocessSuffix): ../sdk/lib/net/libcurl/curl_log.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_curl_log$(PreprocessSuffix) ../sdk/lib/net/libcurl/curl_log.c

$(IntermediateDirectory)/libcurl_curl_memrchr$(ObjectSuffix): ../sdk/lib/net/libcurl/curl_memrchr.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/curl_memrchr.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_curl_memrchr$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_curl_memrchr$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_curl_memrchr$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_curl_memrchr$(PreprocessSuffix): ../sdk/lib/net/libcurl/curl_memrchr.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_curl_memrchr$(PreprocessSuffix) ../sdk/lib/net/libcurl/curl_memrchr.c

$(IntermediateDirectory)/libcurl_curl_multibyte$(ObjectSuffix): ../sdk/lib/net/libcurl/curl_multibyte.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/curl_multibyte.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_curl_multibyte$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_curl_multibyte$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_curl_multibyte$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_curl_multibyte$(PreprocessSuffix): ../sdk/lib/net/libcurl/curl_multibyte.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_curl_multibyte$(PreprocessSuffix) ../sdk/lib/net/libcurl/curl_multibyte.c

$(IntermediateDirectory)/libcurl_curl_ntlm_core$(ObjectSuffix): ../sdk/lib/net/libcurl/curl_ntlm_core.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/curl_ntlm_core.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_curl_ntlm_core$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_curl_ntlm_core$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_curl_ntlm_core$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_curl_ntlm_core$(PreprocessSuffix): ../sdk/lib/net/libcurl/curl_ntlm_core.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_curl_ntlm_core$(PreprocessSuffix) ../sdk/lib/net/libcurl/curl_ntlm_core.c

$(IntermediateDirectory)/libcurl_curl_ntlm_wb$(ObjectSuffix): ../sdk/lib/net/libcurl/curl_ntlm_wb.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/curl_ntlm_wb.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_curl_ntlm_wb$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_curl_ntlm_wb$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_curl_ntlm_wb$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_curl_ntlm_wb$(PreprocessSuffix): ../sdk/lib/net/libcurl/curl_ntlm_wb.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_curl_ntlm_wb$(PreprocessSuffix) ../sdk/lib/net/libcurl/curl_ntlm_wb.c

$(IntermediateDirectory)/libcurl_curl_path$(ObjectSuffix): ../sdk/lib/net/libcurl/curl_path.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/curl_path.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_curl_path$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_curl_path$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_curl_path$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_curl_path$(PreprocessSuffix): ../sdk/lib/net/libcurl/curl_path.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_curl_path$(PreprocessSuffix) ../sdk/lib/net/libcurl/curl_path.c

$(IntermediateDirectory)/libcurl_curl_range$(ObjectSuffix): ../sdk/lib/net/libcurl/curl_range.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/curl_range.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_curl_range$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_curl_range$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_curl_range$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_curl_range$(PreprocessSuffix): ../sdk/lib/net/libcurl/curl_range.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_curl_range$(PreprocessSuffix) ../sdk/lib/net/libcurl/curl_range.c

$(IntermediateDirectory)/libcurl_curl_rtmp$(ObjectSuffix): ../sdk/lib/net/libcurl/curl_rtmp.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/curl_rtmp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_curl_rtmp$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_curl_rtmp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_curl_rtmp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_curl_rtmp$(PreprocessSuffix): ../sdk/lib/net/libcurl/curl_rtmp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_curl_rtmp$(PreprocessSuffix) ../sdk/lib/net/libcurl/curl_rtmp.c

$(IntermediateDirectory)/libcurl_curl_sasl$(ObjectSuffix): ../sdk/lib/net/libcurl/curl_sasl.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/curl_sasl.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_curl_sasl$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_curl_sasl$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_curl_sasl$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_curl_sasl$(PreprocessSuffix): ../sdk/lib/net/libcurl/curl_sasl.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_curl_sasl$(PreprocessSuffix) ../sdk/lib/net/libcurl/curl_sasl.c

$(IntermediateDirectory)/libcurl_curl_sspi$(ObjectSuffix): ../sdk/lib/net/libcurl/curl_sspi.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/curl_sspi.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_curl_sspi$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_curl_sspi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_curl_sspi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_curl_sspi$(PreprocessSuffix): ../sdk/lib/net/libcurl/curl_sspi.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_curl_sspi$(PreprocessSuffix) ../sdk/lib/net/libcurl/curl_sspi.c

$(IntermediateDirectory)/libcurl_curl_threads$(ObjectSuffix): ../sdk/lib/net/libcurl/curl_threads.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/curl_threads.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_curl_threads$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_curl_threads$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_curl_threads$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_curl_threads$(PreprocessSuffix): ../sdk/lib/net/libcurl/curl_threads.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_curl_threads$(PreprocessSuffix) ../sdk/lib/net/libcurl/curl_threads.c

$(IntermediateDirectory)/libcurl_dict$(ObjectSuffix): ../sdk/lib/net/libcurl/dict.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/dict.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_dict$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_dict$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_dict$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_dict$(PreprocessSuffix): ../sdk/lib/net/libcurl/dict.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_dict$(PreprocessSuffix) ../sdk/lib/net/libcurl/dict.c

$(IntermediateDirectory)/libcurl_doh$(ObjectSuffix): ../sdk/lib/net/libcurl/doh.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/doh.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_doh$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_doh$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_doh$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_doh$(PreprocessSuffix): ../sdk/lib/net/libcurl/doh.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_doh$(PreprocessSuffix) ../sdk/lib/net/libcurl/doh.c

$(IntermediateDirectory)/libcurl_dynbuf$(ObjectSuffix): ../sdk/lib/net/libcurl/dynbuf.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/dynbuf.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_dynbuf$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_dynbuf$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_dynbuf$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_dynbuf$(PreprocessSuffix): ../sdk/lib/net/libcurl/dynbuf.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_dynbuf$(PreprocessSuffix) ../sdk/lib/net/libcurl/dynbuf.c

$(IntermediateDirectory)/libcurl_easy$(ObjectSuffix): ../sdk/lib/net/libcurl/easy.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/easy.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_easy$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_easy$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_easy$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_easy$(PreprocessSuffix): ../sdk/lib/net/libcurl/easy.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_easy$(PreprocessSuffix) ../sdk/lib/net/libcurl/easy.c

$(IntermediateDirectory)/libcurl_easygetopt$(ObjectSuffix): ../sdk/lib/net/libcurl/easygetopt.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/easygetopt.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_easygetopt$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_easygetopt$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_easygetopt$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_easygetopt$(PreprocessSuffix): ../sdk/lib/net/libcurl/easygetopt.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_easygetopt$(PreprocessSuffix) ../sdk/lib/net/libcurl/easygetopt.c

$(IntermediateDirectory)/libcurl_easyoptions$(ObjectSuffix): ../sdk/lib/net/libcurl/easyoptions.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/easyoptions.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_easyoptions$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_easyoptions$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_easyoptions$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_easyoptions$(PreprocessSuffix): ../sdk/lib/net/libcurl/easyoptions.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_easyoptions$(PreprocessSuffix) ../sdk/lib/net/libcurl/easyoptions.c

$(IntermediateDirectory)/libcurl_escape$(ObjectSuffix): ../sdk/lib/net/libcurl/escape.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/escape.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_escape$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_escape$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_escape$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_escape$(PreprocessSuffix): ../sdk/lib/net/libcurl/escape.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_escape$(PreprocessSuffix) ../sdk/lib/net/libcurl/escape.c

$(IntermediateDirectory)/libcurl_file$(ObjectSuffix): ../sdk/lib/net/libcurl/file.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/file.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_file$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_file$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_file$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_file$(PreprocessSuffix): ../sdk/lib/net/libcurl/file.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_file$(PreprocessSuffix) ../sdk/lib/net/libcurl/file.c

$(IntermediateDirectory)/libcurl_fileinfo$(ObjectSuffix): ../sdk/lib/net/libcurl/fileinfo.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/fileinfo.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_fileinfo$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_fileinfo$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_fileinfo$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_fileinfo$(PreprocessSuffix): ../sdk/lib/net/libcurl/fileinfo.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_fileinfo$(PreprocessSuffix) ../sdk/lib/net/libcurl/fileinfo.c

$(IntermediateDirectory)/libcurl_fopen$(ObjectSuffix): ../sdk/lib/net/libcurl/fopen.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/fopen.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_fopen$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_fopen$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_fopen$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_fopen$(PreprocessSuffix): ../sdk/lib/net/libcurl/fopen.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_fopen$(PreprocessSuffix) ../sdk/lib/net/libcurl/fopen.c

$(IntermediateDirectory)/libcurl_formdata$(ObjectSuffix): ../sdk/lib/net/libcurl/formdata.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/formdata.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_formdata$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_formdata$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_formdata$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_formdata$(PreprocessSuffix): ../sdk/lib/net/libcurl/formdata.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_formdata$(PreprocessSuffix) ../sdk/lib/net/libcurl/formdata.c

$(IntermediateDirectory)/libcurl_ftp$(ObjectSuffix): ../sdk/lib/net/libcurl/ftp.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/ftp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_ftp$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_ftp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_ftp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_ftp$(PreprocessSuffix): ../sdk/lib/net/libcurl/ftp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_ftp$(PreprocessSuffix) ../sdk/lib/net/libcurl/ftp.c

$(IntermediateDirectory)/libcurl_ftplistparser$(ObjectSuffix): ../sdk/lib/net/libcurl/ftplistparser.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/ftplistparser.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_ftplistparser$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_ftplistparser$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_ftplistparser$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_ftplistparser$(PreprocessSuffix): ../sdk/lib/net/libcurl/ftplistparser.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_ftplistparser$(PreprocessSuffix) ../sdk/lib/net/libcurl/ftplistparser.c

$(IntermediateDirectory)/libcurl_getenv$(ObjectSuffix): ../sdk/lib/net/libcurl/getenv.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/getenv.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_getenv$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_getenv$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_getenv$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_getenv$(PreprocessSuffix): ../sdk/lib/net/libcurl/getenv.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_getenv$(PreprocessSuffix) ../sdk/lib/net/libcurl/getenv.c

$(IntermediateDirectory)/libcurl_getinfo$(ObjectSuffix): ../sdk/lib/net/libcurl/getinfo.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/getinfo.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_getinfo$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_getinfo$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_getinfo$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_getinfo$(PreprocessSuffix): ../sdk/lib/net/libcurl/getinfo.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_getinfo$(PreprocessSuffix) ../sdk/lib/net/libcurl/getinfo.c

$(IntermediateDirectory)/libcurl_gopher$(ObjectSuffix): ../sdk/lib/net/libcurl/gopher.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/gopher.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_gopher$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_gopher$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_gopher$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_gopher$(PreprocessSuffix): ../sdk/lib/net/libcurl/gopher.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_gopher$(PreprocessSuffix) ../sdk/lib/net/libcurl/gopher.c

$(IntermediateDirectory)/libcurl_h2h3$(ObjectSuffix): ../sdk/lib/net/libcurl/h2h3.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/h2h3.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_h2h3$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_h2h3$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_h2h3$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_h2h3$(PreprocessSuffix): ../sdk/lib/net/libcurl/h2h3.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_h2h3$(PreprocessSuffix) ../sdk/lib/net/libcurl/h2h3.c

$(IntermediateDirectory)/libcurl_hash$(ObjectSuffix): ../sdk/lib/net/libcurl/hash.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/hash.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_hash$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_hash$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_hash$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_hash$(PreprocessSuffix): ../sdk/lib/net/libcurl/hash.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_hash$(PreprocessSuffix) ../sdk/lib/net/libcurl/hash.c

$(IntermediateDirectory)/libcurl_headers$(ObjectSuffix): ../sdk/lib/net/libcurl/headers.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/headers.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_headers$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_headers$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_headers$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_headers$(PreprocessSuffix): ../sdk/lib/net/libcurl/headers.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_headers$(PreprocessSuffix) ../sdk/lib/net/libcurl/headers.c

$(IntermediateDirectory)/libcurl_hmac$(ObjectSuffix): ../sdk/lib/net/libcurl/hmac.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/hmac.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_hmac$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_hmac$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_hmac$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_hmac$(PreprocessSuffix): ../sdk/lib/net/libcurl/hmac.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_hmac$(PreprocessSuffix) ../sdk/lib/net/libcurl/hmac.c

$(IntermediateDirectory)/libcurl_hostasyn$(ObjectSuffix): ../sdk/lib/net/libcurl/hostasyn.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/hostasyn.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_hostasyn$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_hostasyn$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_hostasyn$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_hostasyn$(PreprocessSuffix): ../sdk/lib/net/libcurl/hostasyn.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_hostasyn$(PreprocessSuffix) ../sdk/lib/net/libcurl/hostasyn.c

$(IntermediateDirectory)/libcurl_hostip$(ObjectSuffix): ../sdk/lib/net/libcurl/hostip.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/hostip.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_hostip$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_hostip$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_hostip$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_hostip$(PreprocessSuffix): ../sdk/lib/net/libcurl/hostip.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_hostip$(PreprocessSuffix) ../sdk/lib/net/libcurl/hostip.c

$(IntermediateDirectory)/libcurl_hostip4$(ObjectSuffix): ../sdk/lib/net/libcurl/hostip4.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/hostip4.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_hostip4$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_hostip4$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_hostip4$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_hostip4$(PreprocessSuffix): ../sdk/lib/net/libcurl/hostip4.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_hostip4$(PreprocessSuffix) ../sdk/lib/net/libcurl/hostip4.c

$(IntermediateDirectory)/libcurl_hostip6$(ObjectSuffix): ../sdk/lib/net/libcurl/hostip6.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/hostip6.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_hostip6$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_hostip6$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_hostip6$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_hostip6$(PreprocessSuffix): ../sdk/lib/net/libcurl/hostip6.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_hostip6$(PreprocessSuffix) ../sdk/lib/net/libcurl/hostip6.c

$(IntermediateDirectory)/libcurl_hostsyn$(ObjectSuffix): ../sdk/lib/net/libcurl/hostsyn.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/hostsyn.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_hostsyn$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_hostsyn$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_hostsyn$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_hostsyn$(PreprocessSuffix): ../sdk/lib/net/libcurl/hostsyn.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_hostsyn$(PreprocessSuffix) ../sdk/lib/net/libcurl/hostsyn.c

$(IntermediateDirectory)/libcurl_hsts$(ObjectSuffix): ../sdk/lib/net/libcurl/hsts.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/hsts.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_hsts$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_hsts$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_hsts$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_hsts$(PreprocessSuffix): ../sdk/lib/net/libcurl/hsts.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_hsts$(PreprocessSuffix) ../sdk/lib/net/libcurl/hsts.c

$(IntermediateDirectory)/libcurl_http$(ObjectSuffix): ../sdk/lib/net/libcurl/http.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/http.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_http$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_http$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_http$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_http$(PreprocessSuffix): ../sdk/lib/net/libcurl/http.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_http$(PreprocessSuffix) ../sdk/lib/net/libcurl/http.c

$(IntermediateDirectory)/libcurl_http2$(ObjectSuffix): ../sdk/lib/net/libcurl/http2.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/http2.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_http2$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_http2$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_http2$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_http2$(PreprocessSuffix): ../sdk/lib/net/libcurl/http2.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_http2$(PreprocessSuffix) ../sdk/lib/net/libcurl/http2.c

$(IntermediateDirectory)/libcurl_http_aws_sigv4$(ObjectSuffix): ../sdk/lib/net/libcurl/http_aws_sigv4.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/http_aws_sigv4.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_http_aws_sigv4$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_http_aws_sigv4$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_http_aws_sigv4$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_http_aws_sigv4$(PreprocessSuffix): ../sdk/lib/net/libcurl/http_aws_sigv4.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_http_aws_sigv4$(PreprocessSuffix) ../sdk/lib/net/libcurl/http_aws_sigv4.c

$(IntermediateDirectory)/libcurl_http_chunks$(ObjectSuffix): ../sdk/lib/net/libcurl/http_chunks.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/http_chunks.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_http_chunks$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_http_chunks$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_http_chunks$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_http_chunks$(PreprocessSuffix): ../sdk/lib/net/libcurl/http_chunks.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_http_chunks$(PreprocessSuffix) ../sdk/lib/net/libcurl/http_chunks.c

$(IntermediateDirectory)/libcurl_http_digest$(ObjectSuffix): ../sdk/lib/net/libcurl/http_digest.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/http_digest.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_http_digest$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_http_digest$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_http_digest$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_http_digest$(PreprocessSuffix): ../sdk/lib/net/libcurl/http_digest.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_http_digest$(PreprocessSuffix) ../sdk/lib/net/libcurl/http_digest.c

$(IntermediateDirectory)/libcurl_http_negotiate$(ObjectSuffix): ../sdk/lib/net/libcurl/http_negotiate.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/http_negotiate.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_http_negotiate$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_http_negotiate$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_http_negotiate$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_http_negotiate$(PreprocessSuffix): ../sdk/lib/net/libcurl/http_negotiate.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_http_negotiate$(PreprocessSuffix) ../sdk/lib/net/libcurl/http_negotiate.c

$(IntermediateDirectory)/libcurl_http_ntlm$(ObjectSuffix): ../sdk/lib/net/libcurl/http_ntlm.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/http_ntlm.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_http_ntlm$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_http_ntlm$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_http_ntlm$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_http_ntlm$(PreprocessSuffix): ../sdk/lib/net/libcurl/http_ntlm.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_http_ntlm$(PreprocessSuffix) ../sdk/lib/net/libcurl/http_ntlm.c

$(IntermediateDirectory)/libcurl_http_proxy$(ObjectSuffix): ../sdk/lib/net/libcurl/http_proxy.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/http_proxy.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_http_proxy$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_http_proxy$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_http_proxy$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_http_proxy$(PreprocessSuffix): ../sdk/lib/net/libcurl/http_proxy.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_http_proxy$(PreprocessSuffix) ../sdk/lib/net/libcurl/http_proxy.c

$(IntermediateDirectory)/libcurl_idn$(ObjectSuffix): ../sdk/lib/net/libcurl/idn.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/idn.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_idn$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_idn$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_idn$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_idn$(PreprocessSuffix): ../sdk/lib/net/libcurl/idn.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_idn$(PreprocessSuffix) ../sdk/lib/net/libcurl/idn.c

$(IntermediateDirectory)/libcurl_if2ip$(ObjectSuffix): ../sdk/lib/net/libcurl/if2ip.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/if2ip.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_if2ip$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_if2ip$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_if2ip$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_if2ip$(PreprocessSuffix): ../sdk/lib/net/libcurl/if2ip.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_if2ip$(PreprocessSuffix) ../sdk/lib/net/libcurl/if2ip.c

$(IntermediateDirectory)/libcurl_imap$(ObjectSuffix): ../sdk/lib/net/libcurl/imap.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/imap.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_imap$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_imap$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_imap$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_imap$(PreprocessSuffix): ../sdk/lib/net/libcurl/imap.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_imap$(PreprocessSuffix) ../sdk/lib/net/libcurl/imap.c

$(IntermediateDirectory)/libcurl_inet_ntop$(ObjectSuffix): ../sdk/lib/net/libcurl/inet_ntop.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/inet_ntop.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_inet_ntop$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_inet_ntop$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_inet_ntop$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_inet_ntop$(PreprocessSuffix): ../sdk/lib/net/libcurl/inet_ntop.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_inet_ntop$(PreprocessSuffix) ../sdk/lib/net/libcurl/inet_ntop.c

$(IntermediateDirectory)/libcurl_inet_pton$(ObjectSuffix): ../sdk/lib/net/libcurl/inet_pton.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/inet_pton.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_inet_pton$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_inet_pton$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_inet_pton$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_inet_pton$(PreprocessSuffix): ../sdk/lib/net/libcurl/inet_pton.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_inet_pton$(PreprocessSuffix) ../sdk/lib/net/libcurl/inet_pton.c

$(IntermediateDirectory)/libcurl_krb5$(ObjectSuffix): ../sdk/lib/net/libcurl/krb5.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/krb5.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_krb5$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_krb5$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_krb5$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_krb5$(PreprocessSuffix): ../sdk/lib/net/libcurl/krb5.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_krb5$(PreprocessSuffix) ../sdk/lib/net/libcurl/krb5.c

$(IntermediateDirectory)/libcurl_ldap$(ObjectSuffix): ../sdk/lib/net/libcurl/ldap.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/ldap.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_ldap$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_ldap$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_ldap$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_ldap$(PreprocessSuffix): ../sdk/lib/net/libcurl/ldap.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_ldap$(PreprocessSuffix) ../sdk/lib/net/libcurl/ldap.c

$(IntermediateDirectory)/libcurl_llist$(ObjectSuffix): ../sdk/lib/net/libcurl/llist.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/llist.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_llist$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_llist$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_llist$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_llist$(PreprocessSuffix): ../sdk/lib/net/libcurl/llist.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_llist$(PreprocessSuffix) ../sdk/lib/net/libcurl/llist.c

$(IntermediateDirectory)/libcurl_md4$(ObjectSuffix): ../sdk/lib/net/libcurl/md4.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/md4.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_md4$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_md4$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_md4$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_md4$(PreprocessSuffix): ../sdk/lib/net/libcurl/md4.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_md4$(PreprocessSuffix) ../sdk/lib/net/libcurl/md4.c

$(IntermediateDirectory)/libcurl_md5$(ObjectSuffix): ../sdk/lib/net/libcurl/md5.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/md5.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_md5$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_md5$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_md5$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_md5$(PreprocessSuffix): ../sdk/lib/net/libcurl/md5.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_md5$(PreprocessSuffix) ../sdk/lib/net/libcurl/md5.c

$(IntermediateDirectory)/libcurl_memdebug$(ObjectSuffix): ../sdk/lib/net/libcurl/memdebug.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/memdebug.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_memdebug$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_memdebug$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_memdebug$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_memdebug$(PreprocessSuffix): ../sdk/lib/net/libcurl/memdebug.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_memdebug$(PreprocessSuffix) ../sdk/lib/net/libcurl/memdebug.c

$(IntermediateDirectory)/libcurl_mime$(ObjectSuffix): ../sdk/lib/net/libcurl/mime.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/mime.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_mime$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_mime$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_mime$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_mime$(PreprocessSuffix): ../sdk/lib/net/libcurl/mime.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_mime$(PreprocessSuffix) ../sdk/lib/net/libcurl/mime.c

$(IntermediateDirectory)/libcurl_mprintf$(ObjectSuffix): ../sdk/lib/net/libcurl/mprintf.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/mprintf.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_mprintf$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_mprintf$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_mprintf$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_mprintf$(PreprocessSuffix): ../sdk/lib/net/libcurl/mprintf.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_mprintf$(PreprocessSuffix) ../sdk/lib/net/libcurl/mprintf.c

$(IntermediateDirectory)/libcurl_mqtt$(ObjectSuffix): ../sdk/lib/net/libcurl/mqtt.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/mqtt.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_mqtt$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_mqtt$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_mqtt$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_mqtt$(PreprocessSuffix): ../sdk/lib/net/libcurl/mqtt.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_mqtt$(PreprocessSuffix) ../sdk/lib/net/libcurl/mqtt.c

$(IntermediateDirectory)/libcurl_multi$(ObjectSuffix): ../sdk/lib/net/libcurl/multi.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/multi.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_multi$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_multi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_multi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_multi$(PreprocessSuffix): ../sdk/lib/net/libcurl/multi.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_multi$(PreprocessSuffix) ../sdk/lib/net/libcurl/multi.c

$(IntermediateDirectory)/libcurl_netrc$(ObjectSuffix): ../sdk/lib/net/libcurl/netrc.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/netrc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_netrc$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_netrc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_netrc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_netrc$(PreprocessSuffix): ../sdk/lib/net/libcurl/netrc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_netrc$(PreprocessSuffix) ../sdk/lib/net/libcurl/netrc.c

$(IntermediateDirectory)/libcurl_nonblock$(ObjectSuffix): ../sdk/lib/net/libcurl/nonblock.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/nonblock.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_nonblock$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_nonblock$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_nonblock$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_nonblock$(PreprocessSuffix): ../sdk/lib/net/libcurl/nonblock.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_nonblock$(PreprocessSuffix) ../sdk/lib/net/libcurl/nonblock.c

$(IntermediateDirectory)/libcurl_noproxy$(ObjectSuffix): ../sdk/lib/net/libcurl/noproxy.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/noproxy.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_noproxy$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_noproxy$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_noproxy$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_noproxy$(PreprocessSuffix): ../sdk/lib/net/libcurl/noproxy.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_noproxy$(PreprocessSuffix) ../sdk/lib/net/libcurl/noproxy.c

$(IntermediateDirectory)/libcurl_openldap$(ObjectSuffix): ../sdk/lib/net/libcurl/openldap.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/openldap.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_openldap$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_openldap$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_openldap$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_openldap$(PreprocessSuffix): ../sdk/lib/net/libcurl/openldap.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_openldap$(PreprocessSuffix) ../sdk/lib/net/libcurl/openldap.c

$(IntermediateDirectory)/libcurl_parsedate$(ObjectSuffix): ../sdk/lib/net/libcurl/parsedate.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/parsedate.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_parsedate$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_parsedate$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_parsedate$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_parsedate$(PreprocessSuffix): ../sdk/lib/net/libcurl/parsedate.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_parsedate$(PreprocessSuffix) ../sdk/lib/net/libcurl/parsedate.c

$(IntermediateDirectory)/libcurl_pingpong$(ObjectSuffix): ../sdk/lib/net/libcurl/pingpong.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/pingpong.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_pingpong$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_pingpong$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_pingpong$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_pingpong$(PreprocessSuffix): ../sdk/lib/net/libcurl/pingpong.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_pingpong$(PreprocessSuffix) ../sdk/lib/net/libcurl/pingpong.c

$(IntermediateDirectory)/libcurl_pop3$(ObjectSuffix): ../sdk/lib/net/libcurl/pop3.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/pop3.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_pop3$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_pop3$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_pop3$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_pop3$(PreprocessSuffix): ../sdk/lib/net/libcurl/pop3.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_pop3$(PreprocessSuffix) ../sdk/lib/net/libcurl/pop3.c

$(IntermediateDirectory)/libcurl_progress$(ObjectSuffix): ../sdk/lib/net/libcurl/progress.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/progress.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_progress$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_progress$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_progress$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_progress$(PreprocessSuffix): ../sdk/lib/net/libcurl/progress.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_progress$(PreprocessSuffix) ../sdk/lib/net/libcurl/progress.c

$(IntermediateDirectory)/libcurl_psl$(ObjectSuffix): ../sdk/lib/net/libcurl/psl.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/psl.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_psl$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_psl$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_psl$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_psl$(PreprocessSuffix): ../sdk/lib/net/libcurl/psl.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_psl$(PreprocessSuffix) ../sdk/lib/net/libcurl/psl.c

$(IntermediateDirectory)/libcurl_rand$(ObjectSuffix): ../sdk/lib/net/libcurl/rand.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/rand.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_rand$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_rand$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_rand$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_rand$(PreprocessSuffix): ../sdk/lib/net/libcurl/rand.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_rand$(PreprocessSuffix) ../sdk/lib/net/libcurl/rand.c

$(IntermediateDirectory)/libcurl_rename$(ObjectSuffix): ../sdk/lib/net/libcurl/rename.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/rename.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_rename$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_rename$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_rename$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_rename$(PreprocessSuffix): ../sdk/lib/net/libcurl/rename.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_rename$(PreprocessSuffix) ../sdk/lib/net/libcurl/rename.c

$(IntermediateDirectory)/libcurl_rtsp$(ObjectSuffix): ../sdk/lib/net/libcurl/rtsp.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/rtsp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_rtsp$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_rtsp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_rtsp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_rtsp$(PreprocessSuffix): ../sdk/lib/net/libcurl/rtsp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_rtsp$(PreprocessSuffix) ../sdk/lib/net/libcurl/rtsp.c

$(IntermediateDirectory)/libcurl_select$(ObjectSuffix): ../sdk/lib/net/libcurl/select.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/select.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_select$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_select$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_select$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_select$(PreprocessSuffix): ../sdk/lib/net/libcurl/select.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_select$(PreprocessSuffix) ../sdk/lib/net/libcurl/select.c

$(IntermediateDirectory)/libcurl_sendf$(ObjectSuffix): ../sdk/lib/net/libcurl/sendf.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/sendf.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_sendf$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_sendf$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_sendf$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_sendf$(PreprocessSuffix): ../sdk/lib/net/libcurl/sendf.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_sendf$(PreprocessSuffix) ../sdk/lib/net/libcurl/sendf.c

$(IntermediateDirectory)/libcurl_setopt$(ObjectSuffix): ../sdk/lib/net/libcurl/setopt.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/setopt.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_setopt$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_setopt$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_setopt$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_setopt$(PreprocessSuffix): ../sdk/lib/net/libcurl/setopt.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_setopt$(PreprocessSuffix) ../sdk/lib/net/libcurl/setopt.c

$(IntermediateDirectory)/libcurl_sha256$(ObjectSuffix): ../sdk/lib/net/libcurl/sha256.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/sha256.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_sha256$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_sha256$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_sha256$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_sha256$(PreprocessSuffix): ../sdk/lib/net/libcurl/sha256.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_sha256$(PreprocessSuffix) ../sdk/lib/net/libcurl/sha256.c

$(IntermediateDirectory)/libcurl_share$(ObjectSuffix): ../sdk/lib/net/libcurl/share.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/share.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_share$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_share$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_share$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_share$(PreprocessSuffix): ../sdk/lib/net/libcurl/share.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_share$(PreprocessSuffix) ../sdk/lib/net/libcurl/share.c

$(IntermediateDirectory)/libcurl_slist$(ObjectSuffix): ../sdk/lib/net/libcurl/slist.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/slist.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_slist$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_slist$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_slist$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_slist$(PreprocessSuffix): ../sdk/lib/net/libcurl/slist.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_slist$(PreprocessSuffix) ../sdk/lib/net/libcurl/slist.c

$(IntermediateDirectory)/libcurl_smb$(ObjectSuffix): ../sdk/lib/net/libcurl/smb.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/smb.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_smb$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_smb$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_smb$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_smb$(PreprocessSuffix): ../sdk/lib/net/libcurl/smb.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_smb$(PreprocessSuffix) ../sdk/lib/net/libcurl/smb.c

$(IntermediateDirectory)/libcurl_smtp$(ObjectSuffix): ../sdk/lib/net/libcurl/smtp.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/smtp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_smtp$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_smtp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_smtp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_smtp$(PreprocessSuffix): ../sdk/lib/net/libcurl/smtp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_smtp$(PreprocessSuffix) ../sdk/lib/net/libcurl/smtp.c

$(IntermediateDirectory)/libcurl_socketpair$(ObjectSuffix): ../sdk/lib/net/libcurl/socketpair.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/socketpair.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_socketpair$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_socketpair$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_socketpair$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_socketpair$(PreprocessSuffix): ../sdk/lib/net/libcurl/socketpair.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_socketpair$(PreprocessSuffix) ../sdk/lib/net/libcurl/socketpair.c

$(IntermediateDirectory)/libcurl_socks$(ObjectSuffix): ../sdk/lib/net/libcurl/socks.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/socks.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_socks$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_socks$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_socks$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_socks$(PreprocessSuffix): ../sdk/lib/net/libcurl/socks.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_socks$(PreprocessSuffix) ../sdk/lib/net/libcurl/socks.c

$(IntermediateDirectory)/libcurl_socks_gssapi$(ObjectSuffix): ../sdk/lib/net/libcurl/socks_gssapi.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/socks_gssapi.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_socks_gssapi$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_socks_gssapi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_socks_gssapi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_socks_gssapi$(PreprocessSuffix): ../sdk/lib/net/libcurl/socks_gssapi.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_socks_gssapi$(PreprocessSuffix) ../sdk/lib/net/libcurl/socks_gssapi.c

$(IntermediateDirectory)/libcurl_socks_sspi$(ObjectSuffix): ../sdk/lib/net/libcurl/socks_sspi.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/socks_sspi.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_socks_sspi$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_socks_sspi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_socks_sspi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_socks_sspi$(PreprocessSuffix): ../sdk/lib/net/libcurl/socks_sspi.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_socks_sspi$(PreprocessSuffix) ../sdk/lib/net/libcurl/socks_sspi.c

$(IntermediateDirectory)/libcurl_speedcheck$(ObjectSuffix): ../sdk/lib/net/libcurl/speedcheck.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/speedcheck.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_speedcheck$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_speedcheck$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_speedcheck$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_speedcheck$(PreprocessSuffix): ../sdk/lib/net/libcurl/speedcheck.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_speedcheck$(PreprocessSuffix) ../sdk/lib/net/libcurl/speedcheck.c

$(IntermediateDirectory)/libcurl_splay$(ObjectSuffix): ../sdk/lib/net/libcurl/splay.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/splay.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_splay$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_splay$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_splay$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_splay$(PreprocessSuffix): ../sdk/lib/net/libcurl/splay.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_splay$(PreprocessSuffix) ../sdk/lib/net/libcurl/splay.c

$(IntermediateDirectory)/libcurl_strcase$(ObjectSuffix): ../sdk/lib/net/libcurl/strcase.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/strcase.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_strcase$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_strcase$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_strcase$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_strcase$(PreprocessSuffix): ../sdk/lib/net/libcurl/strcase.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_strcase$(PreprocessSuffix) ../sdk/lib/net/libcurl/strcase.c

$(IntermediateDirectory)/libcurl_strdup$(ObjectSuffix): ../sdk/lib/net/libcurl/strdup.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/strdup.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_strdup$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_strdup$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_strdup$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_strdup$(PreprocessSuffix): ../sdk/lib/net/libcurl/strdup.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_strdup$(PreprocessSuffix) ../sdk/lib/net/libcurl/strdup.c

$(IntermediateDirectory)/libcurl_strerror$(ObjectSuffix): ../sdk/lib/net/libcurl/strerror.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/strerror.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_strerror$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_strerror$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_strerror$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_strerror$(PreprocessSuffix): ../sdk/lib/net/libcurl/strerror.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_strerror$(PreprocessSuffix) ../sdk/lib/net/libcurl/strerror.c

$(IntermediateDirectory)/libcurl_strtok$(ObjectSuffix): ../sdk/lib/net/libcurl/strtok.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/strtok.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_strtok$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_strtok$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_strtok$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_strtok$(PreprocessSuffix): ../sdk/lib/net/libcurl/strtok.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_strtok$(PreprocessSuffix) ../sdk/lib/net/libcurl/strtok.c

$(IntermediateDirectory)/libcurl_strtoofft$(ObjectSuffix): ../sdk/lib/net/libcurl/strtoofft.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/strtoofft.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_strtoofft$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_strtoofft$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_strtoofft$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_strtoofft$(PreprocessSuffix): ../sdk/lib/net/libcurl/strtoofft.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_strtoofft$(PreprocessSuffix) ../sdk/lib/net/libcurl/strtoofft.c

$(IntermediateDirectory)/libcurl_system_win32$(ObjectSuffix): ../sdk/lib/net/libcurl/system_win32.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/system_win32.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_system_win32$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_system_win32$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_system_win32$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_system_win32$(PreprocessSuffix): ../sdk/lib/net/libcurl/system_win32.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_system_win32$(PreprocessSuffix) ../sdk/lib/net/libcurl/system_win32.c

$(IntermediateDirectory)/libcurl_telnet$(ObjectSuffix): ../sdk/lib/net/libcurl/telnet.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/telnet.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_telnet$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_telnet$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_telnet$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_telnet$(PreprocessSuffix): ../sdk/lib/net/libcurl/telnet.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_telnet$(PreprocessSuffix) ../sdk/lib/net/libcurl/telnet.c

$(IntermediateDirectory)/libcurl_tftp$(ObjectSuffix): ../sdk/lib/net/libcurl/tftp.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/tftp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_tftp$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_tftp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_tftp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_tftp$(PreprocessSuffix): ../sdk/lib/net/libcurl/tftp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_tftp$(PreprocessSuffix) ../sdk/lib/net/libcurl/tftp.c

$(IntermediateDirectory)/libcurl_timediff$(ObjectSuffix): ../sdk/lib/net/libcurl/timediff.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/timediff.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_timediff$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_timediff$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_timediff$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_timediff$(PreprocessSuffix): ../sdk/lib/net/libcurl/timediff.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_timediff$(PreprocessSuffix) ../sdk/lib/net/libcurl/timediff.c

$(IntermediateDirectory)/libcurl_timeval$(ObjectSuffix): ../sdk/lib/net/libcurl/timeval.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/timeval.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_timeval$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_timeval$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_timeval$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_timeval$(PreprocessSuffix): ../sdk/lib/net/libcurl/timeval.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_timeval$(PreprocessSuffix) ../sdk/lib/net/libcurl/timeval.c

$(IntermediateDirectory)/libcurl_transfer$(ObjectSuffix): ../sdk/lib/net/libcurl/transfer.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/transfer.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_transfer$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_transfer$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_transfer$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_transfer$(PreprocessSuffix): ../sdk/lib/net/libcurl/transfer.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_transfer$(PreprocessSuffix) ../sdk/lib/net/libcurl/transfer.c

$(IntermediateDirectory)/libcurl_url$(ObjectSuffix): ../sdk/lib/net/libcurl/url.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/url.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_url$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_url$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_url$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_url$(PreprocessSuffix): ../sdk/lib/net/libcurl/url.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_url$(PreprocessSuffix) ../sdk/lib/net/libcurl/url.c

$(IntermediateDirectory)/libcurl_urlapi$(ObjectSuffix): ../sdk/lib/net/libcurl/urlapi.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/urlapi.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_urlapi$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_urlapi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_urlapi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_urlapi$(PreprocessSuffix): ../sdk/lib/net/libcurl/urlapi.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_urlapi$(PreprocessSuffix) ../sdk/lib/net/libcurl/urlapi.c

$(IntermediateDirectory)/libcurl_version$(ObjectSuffix): ../sdk/lib/net/libcurl/version.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/version.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_version$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_version$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_version$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_version$(PreprocessSuffix): ../sdk/lib/net/libcurl/version.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_version$(PreprocessSuffix) ../sdk/lib/net/libcurl/version.c

$(IntermediateDirectory)/libcurl_version_win32$(ObjectSuffix): ../sdk/lib/net/libcurl/version_win32.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/version_win32.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_version_win32$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_version_win32$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_version_win32$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_version_win32$(PreprocessSuffix): ../sdk/lib/net/libcurl/version_win32.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_version_win32$(PreprocessSuffix) ../sdk/lib/net/libcurl/version_win32.c

$(IntermediateDirectory)/libcurl_warnless$(ObjectSuffix): ../sdk/lib/net/libcurl/warnless.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/warnless.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_warnless$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_warnless$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_warnless$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_warnless$(PreprocessSuffix): ../sdk/lib/net/libcurl/warnless.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_warnless$(PreprocessSuffix) ../sdk/lib/net/libcurl/warnless.c

$(IntermediateDirectory)/libcurl_ws$(ObjectSuffix): ../sdk/lib/net/libcurl/ws.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/ws.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libcurl_ws$(ObjectSuffix) -MF$(IntermediateDirectory)/libcurl_ws$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libcurl_ws$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libcurl_ws$(PreprocessSuffix): ../sdk/lib/net/libcurl/ws.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libcurl_ws$(PreprocessSuffix) ../sdk/lib/net/libcurl/ws.c

$(IntermediateDirectory)/fatfs_diskio$(ObjectSuffix): ../sdk/lib/fs/fatfs/diskio.c  
	$(CC) $(SourceSwitch) ../sdk/lib/fs/fatfs/diskio.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/fatfs_diskio$(ObjectSuffix) -MF$(IntermediateDirectory)/fatfs_diskio$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/fatfs_diskio$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/fatfs_diskio$(PreprocessSuffix): ../sdk/lib/fs/fatfs/diskio.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/fatfs_diskio$(PreprocessSuffix) ../sdk/lib/fs/fatfs/diskio.c

$(IntermediateDirectory)/fatfs_fatfs_test$(ObjectSuffix): ../sdk/lib/fs/fatfs/fatfs_test.c  
	$(CC) $(SourceSwitch) ../sdk/lib/fs/fatfs/fatfs_test.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/fatfs_fatfs_test$(ObjectSuffix) -MF$(IntermediateDirectory)/fatfs_fatfs_test$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/fatfs_fatfs_test$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/fatfs_fatfs_test$(PreprocessSuffix): ../sdk/lib/fs/fatfs/fatfs_test.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/fatfs_fatfs_test$(PreprocessSuffix) ../sdk/lib/fs/fatfs/fatfs_test.c

$(IntermediateDirectory)/fatfs_ff$(ObjectSuffix): ../sdk/lib/fs/fatfs/ff.c  
	$(CC) $(SourceSwitch) ../sdk/lib/fs/fatfs/ff.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/fatfs_ff$(ObjectSuffix) -MF$(IntermediateDirectory)/fatfs_ff$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/fatfs_ff$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/fatfs_ff$(PreprocessSuffix): ../sdk/lib/fs/fatfs/ff.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/fatfs_ff$(PreprocessSuffix) ../sdk/lib/fs/fatfs/ff.c

$(IntermediateDirectory)/fatfs_ffunicode$(ObjectSuffix): ../sdk/lib/fs/fatfs/ffunicode.c  
	$(CC) $(SourceSwitch) ../sdk/lib/fs/fatfs/ffunicode.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/fatfs_ffunicode$(ObjectSuffix) -MF$(IntermediateDirectory)/fatfs_ffunicode$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/fatfs_ffunicode$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/fatfs_ffunicode$(PreprocessSuffix): ../sdk/lib/fs/fatfs/ffunicode.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/fatfs_ffunicode$(PreprocessSuffix) ../sdk/lib/fs/fatfs/ffunicode.c

$(IntermediateDirectory)/fatfs_syscall$(ObjectSuffix): ../sdk/lib/fs/fatfs/syscall.c  
	$(CC) $(SourceSwitch) ../sdk/lib/fs/fatfs/syscall.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/fatfs_syscall$(ObjectSuffix) -MF$(IntermediateDirectory)/fatfs_syscall$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/fatfs_syscall$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/fatfs_syscall$(PreprocessSuffix): ../sdk/lib/fs/fatfs/syscall.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/fatfs_syscall$(PreprocessSuffix) ../sdk/lib/fs/fatfs/syscall.c

$(IntermediateDirectory)/fatfs_osal_file$(ObjectSuffix): ../sdk/lib/fs/fatfs/osal_file.c  
	$(CC) $(SourceSwitch) ../sdk/lib/fs/fatfs/osal_file.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/fatfs_osal_file$(ObjectSuffix) -MF$(IntermediateDirectory)/fatfs_osal_file$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/fatfs_osal_file$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/fatfs_osal_file$(PreprocessSuffix): ../sdk/lib/fs/fatfs/osal_file.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/fatfs_osal_file$(PreprocessSuffix) ../sdk/lib/fs/fatfs/osal_file.c

$(IntermediateDirectory)/uvc_hg_usb_device$(ObjectSuffix): ../sdk/lib/video/uvc/hg_usb_device.c  
	$(CC) $(SourceSwitch) ../sdk/lib/video/uvc/hg_usb_device.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/uvc_hg_usb_device$(ObjectSuffix) -MF$(IntermediateDirectory)/uvc_hg_usb_device$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/uvc_hg_usb_device$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/uvc_hg_usb_device$(PreprocessSuffix): ../sdk/lib/video/uvc/hg_usb_device.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/uvc_hg_usb_device$(PreprocessSuffix) ../sdk/lib/video/uvc/hg_usb_device.c

$(IntermediateDirectory)/uvc_uvc_host$(ObjectSuffix): ../sdk/lib/video/uvc/uvc_host.c  
	$(CC) $(SourceSwitch) ../sdk/lib/video/uvc/uvc_host.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/uvc_uvc_host$(ObjectSuffix) -MF$(IntermediateDirectory)/uvc_uvc_host$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/uvc_uvc_host$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/uvc_uvc_host$(PreprocessSuffix): ../sdk/lib/video/uvc/uvc_host.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/uvc_uvc_host$(PreprocessSuffix) ../sdk/lib/video/uvc/uvc_host.c

$(IntermediateDirectory)/de_avi_avidemux$(ObjectSuffix): ../sdk/lib/video/de_avi/avidemux.c  
	$(CC) $(SourceSwitch) ../sdk/lib/video/de_avi/avidemux.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/de_avi_avidemux$(ObjectSuffix) -MF$(IntermediateDirectory)/de_avi_avidemux$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/de_avi_avidemux$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/de_avi_avidemux$(PreprocessSuffix): ../sdk/lib/video/de_avi/avidemux.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/de_avi_avidemux$(PreprocessSuffix) ../sdk/lib/video/de_avi/avidemux.c

$(IntermediateDirectory)/en_avi_openDML$(ObjectSuffix): ../sdk/lib/video/en_avi/openDML.c  
	$(CC) $(SourceSwitch) ../sdk/lib/video/en_avi/openDML.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/en_avi_openDML$(ObjectSuffix) -MF$(IntermediateDirectory)/en_avi_openDML$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/en_avi_openDML$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/en_avi_openDML$(PreprocessSuffix): ../sdk/lib/video/en_avi/openDML.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/en_avi_openDML$(PreprocessSuffix) ../sdk/lib/video/en_avi/openDML.c

$(IntermediateDirectory)/spi_sensor_spi_sensor$(ObjectSuffix): ../sdk/lib/video/spi_sensor/spi_sensor.c  
	$(CC) $(SourceSwitch) ../sdk/lib/video/spi_sensor/spi_sensor.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/spi_sensor_spi_sensor$(ObjectSuffix) -MF$(IntermediateDirectory)/spi_sensor_spi_sensor$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/spi_sensor_spi_sensor$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/spi_sensor_spi_sensor$(PreprocessSuffix): ../sdk/lib/video/spi_sensor/spi_sensor.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/spi_sensor_spi_sensor$(PreprocessSuffix) ../sdk/lib/video/spi_sensor/spi_sensor.c

$(IntermediateDirectory)/resorce_bat$(ObjectSuffix): ../sdk/lib/gui/resorce/bat.c  
	$(CC) $(SourceSwitch) ../sdk/lib/gui/resorce/bat.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/resorce_bat$(ObjectSuffix) -MF$(IntermediateDirectory)/resorce_bat$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/resorce_bat$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/resorce_bat$(PreprocessSuffix): ../sdk/lib/gui/resorce/bat.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/resorce_bat$(PreprocessSuffix) ../sdk/lib/gui/resorce/bat.c

$(IntermediateDirectory)/resorce_btn0$(ObjectSuffix): ../sdk/lib/gui/resorce/btn0.c  
	$(CC) $(SourceSwitch) ../sdk/lib/gui/resorce/btn0.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/resorce_btn0$(ObjectSuffix) -MF$(IntermediateDirectory)/resorce_btn0$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/resorce_btn0$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/resorce_btn0$(PreprocessSuffix): ../sdk/lib/gui/resorce/btn0.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/resorce_btn0$(PreprocessSuffix) ../sdk/lib/gui/resorce/btn0.c

$(IntermediateDirectory)/resorce_btn0_1$(ObjectSuffix): ../sdk/lib/gui/resorce/btn0_1.c  
	$(CC) $(SourceSwitch) ../sdk/lib/gui/resorce/btn0_1.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/resorce_btn0_1$(ObjectSuffix) -MF$(IntermediateDirectory)/resorce_btn0_1$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/resorce_btn0_1$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/resorce_btn0_1$(PreprocessSuffix): ../sdk/lib/gui/resorce/btn0_1.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/resorce_btn0_1$(PreprocessSuffix) ../sdk/lib/gui/resorce/btn0_1.c

$(IntermediateDirectory)/resorce_dv_r$(ObjectSuffix): ../sdk/lib/gui/resorce/dv_r.c  
	$(CC) $(SourceSwitch) ../sdk/lib/gui/resorce/dv_r.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/resorce_dv_r$(ObjectSuffix) -MF$(IntermediateDirectory)/resorce_dv_r$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/resorce_dv_r$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/resorce_dv_r$(PreprocessSuffix): ../sdk/lib/gui/resorce/dv_r.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/resorce_dv_r$(PreprocessSuffix) ../sdk/lib/gui/resorce/dv_r.c

$(IntermediateDirectory)/resorce_dv_w$(ObjectSuffix): ../sdk/lib/gui/resorce/dv_w.c  
	$(CC) $(SourceSwitch) ../sdk/lib/gui/resorce/dv_w.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/resorce_dv_w$(ObjectSuffix) -MF$(IntermediateDirectory)/resorce_dv_w$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/resorce_dv_w$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/resorce_dv_w$(PreprocessSuffix): ../sdk/lib/gui/resorce/dv_w.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/resorce_dv_w$(PreprocessSuffix) ../sdk/lib/gui/resorce/dv_w.c

$(IntermediateDirectory)/resorce_language$(ObjectSuffix): ../sdk/lib/gui/resorce/language.c  
	$(CC) $(SourceSwitch) ../sdk/lib/gui/resorce/language.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/resorce_language$(ObjectSuffix) -MF$(IntermediateDirectory)/resorce_language$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/resorce_language$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/resorce_language$(PreprocessSuffix): ../sdk/lib/gui/resorce/language.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/resorce_language$(PreprocessSuffix) ../sdk/lib/gui/resorce/language.c

$(IntermediateDirectory)/resorce_main_photo$(ObjectSuffix): ../sdk/lib/gui/resorce/main_photo.c  
	$(CC) $(SourceSwitch) ../sdk/lib/gui/resorce/main_photo.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/resorce_main_photo$(ObjectSuffix) -MF$(IntermediateDirectory)/resorce_main_photo$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/resorce_main_photo$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/resorce_main_photo$(PreprocessSuffix): ../sdk/lib/gui/resorce/main_photo.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/resorce_main_photo$(PreprocessSuffix) ../sdk/lib/gui/resorce/main_photo.c

$(IntermediateDirectory)/resorce_menu1_0$(ObjectSuffix): ../sdk/lib/gui/resorce/menu1_0.c  
	$(CC) $(SourceSwitch) ../sdk/lib/gui/resorce/menu1_0.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/resorce_menu1_0$(ObjectSuffix) -MF$(IntermediateDirectory)/resorce_menu1_0$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/resorce_menu1_0$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/resorce_menu1_0$(PreprocessSuffix): ../sdk/lib/gui/resorce/menu1_0.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/resorce_menu1_0$(PreprocessSuffix) ../sdk/lib/gui/resorce/menu1_0.c

$(IntermediateDirectory)/resorce_menu1_1$(ObjectSuffix): ../sdk/lib/gui/resorce/menu1_1.c  
	$(CC) $(SourceSwitch) ../sdk/lib/gui/resorce/menu1_1.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/resorce_menu1_1$(ObjectSuffix) -MF$(IntermediateDirectory)/resorce_menu1_1$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/resorce_menu1_1$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/resorce_menu1_1$(PreprocessSuffix): ../sdk/lib/gui/resorce/menu1_1.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/resorce_menu1_1$(PreprocessSuffix) ../sdk/lib/gui/resorce/menu1_1.c

$(IntermediateDirectory)/resorce_menu1_2$(ObjectSuffix): ../sdk/lib/gui/resorce/menu1_2.c  
	$(CC) $(SourceSwitch) ../sdk/lib/gui/resorce/menu1_2.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/resorce_menu1_2$(ObjectSuffix) -MF$(IntermediateDirectory)/resorce_menu1_2$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/resorce_menu1_2$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/resorce_menu1_2$(PreprocessSuffix): ../sdk/lib/gui/resorce/menu1_2.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/resorce_menu1_2$(PreprocessSuffix) ../sdk/lib/gui/resorce/menu1_2.c

$(IntermediateDirectory)/resorce_menu2_0$(ObjectSuffix): ../sdk/lib/gui/resorce/menu2_0.c  
	$(CC) $(SourceSwitch) ../sdk/lib/gui/resorce/menu2_0.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/resorce_menu2_0$(ObjectSuffix) -MF$(IntermediateDirectory)/resorce_menu2_0$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/resorce_menu2_0$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/resorce_menu2_0$(PreprocessSuffix): ../sdk/lib/gui/resorce/menu2_0.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/resorce_menu2_0$(PreprocessSuffix) ../sdk/lib/gui/resorce/menu2_0.c

$(IntermediateDirectory)/resorce_menu2_1$(ObjectSuffix): ../sdk/lib/gui/resorce/menu2_1.c  
	$(CC) $(SourceSwitch) ../sdk/lib/gui/resorce/menu2_1.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/resorce_menu2_1$(ObjectSuffix) -MF$(IntermediateDirectory)/resorce_menu2_1$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/resorce_menu2_1$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/resorce_menu2_1$(PreprocessSuffix): ../sdk/lib/gui/resorce/menu2_1.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/resorce_menu2_1$(PreprocessSuffix) ../sdk/lib/gui/resorce/menu2_1.c

$(IntermediateDirectory)/resorce_menu2_2$(ObjectSuffix): ../sdk/lib/gui/resorce/menu2_2.c  
	$(CC) $(SourceSwitch) ../sdk/lib/gui/resorce/menu2_2.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/resorce_menu2_2$(ObjectSuffix) -MF$(IntermediateDirectory)/resorce_menu2_2$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/resorce_menu2_2$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/resorce_menu2_2$(PreprocessSuffix): ../sdk/lib/gui/resorce/menu2_2.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/resorce_menu2_2$(PreprocessSuffix) ../sdk/lib/gui/resorce/menu2_2.c

$(IntermediateDirectory)/resorce_menu3_0$(ObjectSuffix): ../sdk/lib/gui/resorce/menu3_0.c  
	$(CC) $(SourceSwitch) ../sdk/lib/gui/resorce/menu3_0.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/resorce_menu3_0$(ObjectSuffix) -MF$(IntermediateDirectory)/resorce_menu3_0$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/resorce_menu3_0$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/resorce_menu3_0$(PreprocessSuffix): ../sdk/lib/gui/resorce/menu3_0.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/resorce_menu3_0$(PreprocessSuffix) ../sdk/lib/gui/resorce/menu3_0.c

$(IntermediateDirectory)/resorce_menu3_1$(ObjectSuffix): ../sdk/lib/gui/resorce/menu3_1.c  
	$(CC) $(SourceSwitch) ../sdk/lib/gui/resorce/menu3_1.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/resorce_menu3_1$(ObjectSuffix) -MF$(IntermediateDirectory)/resorce_menu3_1$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/resorce_menu3_1$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/resorce_menu3_1$(PreprocessSuffix): ../sdk/lib/gui/resorce/menu3_1.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/resorce_menu3_1$(PreprocessSuffix) ../sdk/lib/gui/resorce/menu3_1.c

$(IntermediateDirectory)/resorce_menu3_2$(ObjectSuffix): ../sdk/lib/gui/resorce/menu3_2.c  
	$(CC) $(SourceSwitch) ../sdk/lib/gui/resorce/menu3_2.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/resorce_menu3_2$(ObjectSuffix) -MF$(IntermediateDirectory)/resorce_menu3_2$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/resorce_menu3_2$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/resorce_menu3_2$(PreprocessSuffix): ../sdk/lib/gui/resorce/menu3_2.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/resorce_menu3_2$(PreprocessSuffix) ../sdk/lib/gui/resorce/menu3_2.c

$(IntermediateDirectory)/resorce_menu4_0$(ObjectSuffix): ../sdk/lib/gui/resorce/menu4_0.c  
	$(CC) $(SourceSwitch) ../sdk/lib/gui/resorce/menu4_0.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/resorce_menu4_0$(ObjectSuffix) -MF$(IntermediateDirectory)/resorce_menu4_0$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/resorce_menu4_0$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/resorce_menu4_0$(PreprocessSuffix): ../sdk/lib/gui/resorce/menu4_0.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/resorce_menu4_0$(PreprocessSuffix) ../sdk/lib/gui/resorce/menu4_0.c

$(IntermediateDirectory)/resorce_menu4_1$(ObjectSuffix): ../sdk/lib/gui/resorce/menu4_1.c  
	$(CC) $(SourceSwitch) ../sdk/lib/gui/resorce/menu4_1.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/resorce_menu4_1$(ObjectSuffix) -MF$(IntermediateDirectory)/resorce_menu4_1$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/resorce_menu4_1$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/resorce_menu4_1$(PreprocessSuffix): ../sdk/lib/gui/resorce/menu4_1.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/resorce_menu4_1$(PreprocessSuffix) ../sdk/lib/gui/resorce/menu4_1.c

$(IntermediateDirectory)/resorce_menu4_2$(ObjectSuffix): ../sdk/lib/gui/resorce/menu4_2.c  
	$(CC) $(SourceSwitch) ../sdk/lib/gui/resorce/menu4_2.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/resorce_menu4_2$(ObjectSuffix) -MF$(IntermediateDirectory)/resorce_menu4_2$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/resorce_menu4_2$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/resorce_menu4_2$(PreprocessSuffix): ../sdk/lib/gui/resorce/menu4_2.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/resorce_menu4_2$(PreprocessSuffix) ../sdk/lib/gui/resorce/menu4_2.c

$(IntermediateDirectory)/resorce_menu5_0$(ObjectSuffix): ../sdk/lib/gui/resorce/menu5_0.c  
	$(CC) $(SourceSwitch) ../sdk/lib/gui/resorce/menu5_0.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/resorce_menu5_0$(ObjectSuffix) -MF$(IntermediateDirectory)/resorce_menu5_0$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/resorce_menu5_0$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/resorce_menu5_0$(PreprocessSuffix): ../sdk/lib/gui/resorce/menu5_0.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/resorce_menu5_0$(PreprocessSuffix) ../sdk/lib/gui/resorce/menu5_0.c

$(IntermediateDirectory)/resorce_menu5_1$(ObjectSuffix): ../sdk/lib/gui/resorce/menu5_1.c  
	$(CC) $(SourceSwitch) ../sdk/lib/gui/resorce/menu5_1.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/resorce_menu5_1$(ObjectSuffix) -MF$(IntermediateDirectory)/resorce_menu5_1$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/resorce_menu5_1$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/resorce_menu5_1$(PreprocessSuffix): ../sdk/lib/gui/resorce/menu5_1.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/resorce_menu5_1$(PreprocessSuffix) ../sdk/lib/gui/resorce/menu5_1.c

$(IntermediateDirectory)/resorce_menu5_2$(ObjectSuffix): ../sdk/lib/gui/resorce/menu5_2.c  
	$(CC) $(SourceSwitch) ../sdk/lib/gui/resorce/menu5_2.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/resorce_menu5_2$(ObjectSuffix) -MF$(IntermediateDirectory)/resorce_menu5_2$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/resorce_menu5_2$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/resorce_menu5_2$(PreprocessSuffix): ../sdk/lib/gui/resorce/menu5_2.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/resorce_menu5_2$(PreprocessSuffix) ../sdk/lib/gui/resorce/menu5_2.c

$(IntermediateDirectory)/resorce_menu6_0$(ObjectSuffix): ../sdk/lib/gui/resorce/menu6_0.c  
	$(CC) $(SourceSwitch) ../sdk/lib/gui/resorce/menu6_0.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/resorce_menu6_0$(ObjectSuffix) -MF$(IntermediateDirectory)/resorce_menu6_0$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/resorce_menu6_0$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/resorce_menu6_0$(PreprocessSuffix): ../sdk/lib/gui/resorce/menu6_0.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/resorce_menu6_0$(PreprocessSuffix) ../sdk/lib/gui/resorce/menu6_0.c

$(IntermediateDirectory)/resorce_menu6_1$(ObjectSuffix): ../sdk/lib/gui/resorce/menu6_1.c  
	$(CC) $(SourceSwitch) ../sdk/lib/gui/resorce/menu6_1.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/resorce_menu6_1$(ObjectSuffix) -MF$(IntermediateDirectory)/resorce_menu6_1$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/resorce_menu6_1$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/resorce_menu6_1$(PreprocessSuffix): ../sdk/lib/gui/resorce/menu6_1.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/resorce_menu6_1$(PreprocessSuffix) ../sdk/lib/gui/resorce/menu6_1.c

$(IntermediateDirectory)/resorce_menu6_2$(ObjectSuffix): ../sdk/lib/gui/resorce/menu6_2.c  
	$(CC) $(SourceSwitch) ../sdk/lib/gui/resorce/menu6_2.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/resorce_menu6_2$(ObjectSuffix) -MF$(IntermediateDirectory)/resorce_menu6_2$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/resorce_menu6_2$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/resorce_menu6_2$(PreprocessSuffix): ../sdk/lib/gui/resorce/menu6_2.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/resorce_menu6_2$(PreprocessSuffix) ../sdk/lib/gui/resorce/menu6_2.c

$(IntermediateDirectory)/resorce_menu_null$(ObjectSuffix): ../sdk/lib/gui/resorce/menu_null.c  
	$(CC) $(SourceSwitch) ../sdk/lib/gui/resorce/menu_null.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/resorce_menu_null$(ObjectSuffix) -MF$(IntermediateDirectory)/resorce_menu_null$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/resorce_menu_null$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/resorce_menu_null$(PreprocessSuffix): ../sdk/lib/gui/resorce/menu_null.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/resorce_menu_null$(PreprocessSuffix) ../sdk/lib/gui/resorce/menu_null.c

$(IntermediateDirectory)/resorce_menu_test$(ObjectSuffix): ../sdk/lib/gui/resorce/menu_test.c  
	$(CC) $(SourceSwitch) ../sdk/lib/gui/resorce/menu_test.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/resorce_menu_test$(ObjectSuffix) -MF$(IntermediateDirectory)/resorce_menu_test$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/resorce_menu_test$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/resorce_menu_test$(PreprocessSuffix): ../sdk/lib/gui/resorce/menu_test.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/resorce_menu_test$(PreprocessSuffix) ../sdk/lib/gui/resorce/menu_test.c

$(IntermediateDirectory)/resorce_myfont$(ObjectSuffix): ../sdk/lib/gui/resorce/myfont.c  
	$(CC) $(SourceSwitch) ../sdk/lib/gui/resorce/myfont.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/resorce_myfont$(ObjectSuffix) -MF$(IntermediateDirectory)/resorce_myfont$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/resorce_myfont$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/resorce_myfont$(PreprocessSuffix): ../sdk/lib/gui/resorce/myfont.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/resorce_myfont$(PreprocessSuffix) ../sdk/lib/gui/resorce/myfont.c

$(IntermediateDirectory)/resorce_photo$(ObjectSuffix): ../sdk/lib/gui/resorce/photo.c  
	$(CC) $(SourceSwitch) ../sdk/lib/gui/resorce/photo.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/resorce_photo$(ObjectSuffix) -MF$(IntermediateDirectory)/resorce_photo$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/resorce_photo$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/resorce_photo$(PreprocessSuffix): ../sdk/lib/gui/resorce/photo.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/resorce_photo$(PreprocessSuffix) ../sdk/lib/gui/resorce/photo.c

$(IntermediateDirectory)/resorce_rec$(ObjectSuffix): ../sdk/lib/gui/resorce/rec.c  
	$(CC) $(SourceSwitch) ../sdk/lib/gui/resorce/rec.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/resorce_rec$(ObjectSuffix) -MF$(IntermediateDirectory)/resorce_rec$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/resorce_rec$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/resorce_rec$(PreprocessSuffix): ../sdk/lib/gui/resorce/rec.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/resorce_rec$(PreprocessSuffix) ../sdk/lib/gui/resorce/rec.c

$(IntermediateDirectory)/resorce_menu_spi$(ObjectSuffix): ../sdk/lib/gui/resorce/menu_spi.c  
	$(CC) $(SourceSwitch) ../sdk/lib/gui/resorce/menu_spi.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/resorce_menu_spi$(ObjectSuffix) -MF$(IntermediateDirectory)/resorce_menu_spi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/resorce_menu_spi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/resorce_menu_spi$(PreprocessSuffix): ../sdk/lib/gui/resorce/menu_spi.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/resorce_menu_spi$(PreprocessSuffix) ../sdk/lib/gui/resorce/menu_spi.c

$(IntermediateDirectory)/porting_lv_port_disp$(ObjectSuffix): ../sdk/lib/lvgl/examples/porting/lv_port_disp.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/examples/porting/lv_port_disp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/porting_lv_port_disp$(ObjectSuffix) -MF$(IntermediateDirectory)/porting_lv_port_disp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/porting_lv_port_disp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/porting_lv_port_disp$(PreprocessSuffix): ../sdk/lib/lvgl/examples/porting/lv_port_disp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/porting_lv_port_disp$(PreprocessSuffix) ../sdk/lib/lvgl/examples/porting/lv_port_disp.c

$(IntermediateDirectory)/porting_lv_port_fs$(ObjectSuffix): ../sdk/lib/lvgl/examples/porting/lv_port_fs.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/examples/porting/lv_port_fs.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/porting_lv_port_fs$(ObjectSuffix) -MF$(IntermediateDirectory)/porting_lv_port_fs$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/porting_lv_port_fs$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/porting_lv_port_fs$(PreprocessSuffix): ../sdk/lib/lvgl/examples/porting/lv_port_fs.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/porting_lv_port_fs$(PreprocessSuffix) ../sdk/lib/lvgl/examples/porting/lv_port_fs.c

$(IntermediateDirectory)/porting_lv_port_indev$(ObjectSuffix): ../sdk/lib/lvgl/examples/porting/lv_port_indev.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/examples/porting/lv_port_indev.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/porting_lv_port_indev$(ObjectSuffix) -MF$(IntermediateDirectory)/porting_lv_port_indev$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/porting_lv_port_indev$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/porting_lv_port_indev$(PreprocessSuffix): ../sdk/lib/lvgl/examples/porting/lv_port_indev.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/porting_lv_port_indev$(PreprocessSuffix) ../sdk/lib/lvgl/examples/porting/lv_port_indev.c

$(IntermediateDirectory)/pdmFilter_pdmFilter$(ObjectSuffix): ../sdk/app/algorithm/pdmFilter/pdmFilter.c  
	$(CC) $(SourceSwitch) ../sdk/app/algorithm/pdmFilter/pdmFilter.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/pdmFilter_pdmFilter$(ObjectSuffix) -MF$(IntermediateDirectory)/pdmFilter_pdmFilter$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/pdmFilter_pdmFilter$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/pdmFilter_pdmFilter$(PreprocessSuffix): ../sdk/app/algorithm/pdmFilter/pdmFilter.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/pdmFilter_pdmFilter$(PreprocessSuffix) ../sdk/app/algorithm/pdmFilter/pdmFilter.c

$(IntermediateDirectory)/stream_frame_stream_frame$(ObjectSuffix): ../sdk/app/algorithm/stream_frame/stream_frame.c  
	$(CC) $(SourceSwitch) ../sdk/app/algorithm/stream_frame/stream_frame.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/stream_frame_stream_frame$(ObjectSuffix) -MF$(IntermediateDirectory)/stream_frame_stream_frame$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/stream_frame_stream_frame$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/stream_frame_stream_frame$(PreprocessSuffix): ../sdk/app/algorithm/stream_frame/stream_frame.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/stream_frame_stream_frame$(PreprocessSuffix) ../sdk/app/algorithm/stream_frame/stream_frame.c

$(IntermediateDirectory)/csky_cpu_impl$(ObjectSuffix): ../csky/csi_kernel/rhino/arch/csky/cpu_impl.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/arch/csky/cpu_impl.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/csky_cpu_impl$(ObjectSuffix) -MF$(IntermediateDirectory)/csky_cpu_impl$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/csky_cpu_impl$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/csky_cpu_impl$(PreprocessSuffix): ../csky/csi_kernel/rhino/arch/csky/cpu_impl.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/csky_cpu_impl$(PreprocessSuffix) ../csky/csi_kernel/rhino/arch/csky/cpu_impl.c

$(IntermediateDirectory)/csky_csky_sched$(ObjectSuffix): ../csky/csi_kernel/rhino/arch/csky/csky_sched.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/arch/csky/csky_sched.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/csky_csky_sched$(ObjectSuffix) -MF$(IntermediateDirectory)/csky_csky_sched$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/csky_csky_sched$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/csky_csky_sched$(PreprocessSuffix): ../csky/csi_kernel/rhino/arch/csky/csky_sched.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/csky_csky_sched$(PreprocessSuffix) ../csky/csi_kernel/rhino/arch/csky/csky_sched.c

$(IntermediateDirectory)/ck803_port_c$(ObjectSuffix): ../csky/csi_kernel/rhino/arch/csky/ck803/port_c.c  
	$(CC) $(SourceSwitch) ../csky/csi_kernel/rhino/arch/csky/ck803/port_c.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ck803_port_c$(ObjectSuffix) -MF$(IntermediateDirectory)/ck803_port_c$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ck803_port_c$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ck803_port_c$(PreprocessSuffix): ../csky/csi_kernel/rhino/arch/csky/ck803/port_c.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ck803_port_c$(PreprocessSuffix) ../csky/csi_kernel/rhino/arch/csky/ck803/port_c.c

$(IntermediateDirectory)/ck803_port_s$(ObjectSuffix): ../csky/csi_kernel/rhino/arch/csky/ck803/port_s.S  
	$(AS) $(SourceSwitch) ../csky/csi_kernel/rhino/arch/csky/ck803/port_s.S $(ASFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ck803_port_s$(ObjectSuffix) -MF$(IntermediateDirectory)/ck803_port_s$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ck803_port_s$(ObjectSuffix) $(IncludeAPath) $(IncludePackagePath)
Lst/ck803_port_s$(PreprocessSuffix): ../csky/csi_kernel/rhino/arch/csky/ck803/port_s.S
	$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ck803_port_s$(PreprocessSuffix) ../csky/csi_kernel/rhino/arch/csky/ck803/port_s.S

$(IntermediateDirectory)/arch_sys_arch$(ObjectSuffix): ../sdk/lib/net/lwip/arch/sys_arch.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/arch/sys_arch.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/arch_sys_arch$(ObjectSuffix) -MF$(IntermediateDirectory)/arch_sys_arch$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/arch_sys_arch$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/arch_sys_arch$(PreprocessSuffix): ../sdk/lib/net/lwip/arch/sys_arch.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/arch_sys_arch$(PreprocessSuffix) ../sdk/lib/net/lwip/arch/sys_arch.c

$(IntermediateDirectory)/phy_auto_phy$(ObjectSuffix): ../sdk/lib/net/ethphy/phy/auto_phy.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/ethphy/phy/auto_phy.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/phy_auto_phy$(ObjectSuffix) -MF$(IntermediateDirectory)/phy_auto_phy$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/phy_auto_phy$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/phy_auto_phy$(PreprocessSuffix): ../sdk/lib/net/ethphy/phy/auto_phy.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/phy_auto_phy$(PreprocessSuffix) ../sdk/lib/net/ethphy/phy/auto_phy.c

$(IntermediateDirectory)/phy_ip101g$(ObjectSuffix): ../sdk/lib/net/ethphy/phy/ip101g.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/ethphy/phy/ip101g.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/phy_ip101g$(ObjectSuffix) -MF$(IntermediateDirectory)/phy_ip101g$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/phy_ip101g$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/phy_ip101g$(PreprocessSuffix): ../sdk/lib/net/ethphy/phy/ip101g.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/phy_ip101g$(PreprocessSuffix) ../sdk/lib/net/ethphy/phy/ip101g.c

$(IntermediateDirectory)/phy_rtl8201f$(ObjectSuffix): ../sdk/lib/net/ethphy/phy/rtl8201f.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/ethphy/phy/rtl8201f.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/phy_rtl8201f$(ObjectSuffix) -MF$(IntermediateDirectory)/phy_rtl8201f$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/phy_rtl8201f$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/phy_rtl8201f$(PreprocessSuffix): ../sdk/lib/net/ethphy/phy/rtl8201f.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/phy_rtl8201f$(PreprocessSuffix) ../sdk/lib/net/ethphy/phy/rtl8201f.c

$(IntermediateDirectory)/phy_sz18201$(ObjectSuffix): ../sdk/lib/net/ethphy/phy/sz18201.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/ethphy/phy/sz18201.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/phy_sz18201$(ObjectSuffix) -MF$(IntermediateDirectory)/phy_sz18201$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/phy_sz18201$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/phy_sz18201$(PreprocessSuffix): ../sdk/lib/net/ethphy/phy/sz18201.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/phy_sz18201$(PreprocessSuffix) ../sdk/lib/net/ethphy/phy/sz18201.c

$(IntermediateDirectory)/vauth_cleartext$(ObjectSuffix): ../sdk/lib/net/libcurl/vauth/cleartext.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vauth/cleartext.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vauth_cleartext$(ObjectSuffix) -MF$(IntermediateDirectory)/vauth_cleartext$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vauth_cleartext$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vauth_cleartext$(PreprocessSuffix): ../sdk/lib/net/libcurl/vauth/cleartext.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vauth_cleartext$(PreprocessSuffix) ../sdk/lib/net/libcurl/vauth/cleartext.c

$(IntermediateDirectory)/vauth_cram$(ObjectSuffix): ../sdk/lib/net/libcurl/vauth/cram.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vauth/cram.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vauth_cram$(ObjectSuffix) -MF$(IntermediateDirectory)/vauth_cram$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vauth_cram$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vauth_cram$(PreprocessSuffix): ../sdk/lib/net/libcurl/vauth/cram.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vauth_cram$(PreprocessSuffix) ../sdk/lib/net/libcurl/vauth/cram.c

$(IntermediateDirectory)/vauth_digest$(ObjectSuffix): ../sdk/lib/net/libcurl/vauth/digest.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vauth/digest.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vauth_digest$(ObjectSuffix) -MF$(IntermediateDirectory)/vauth_digest$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vauth_digest$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vauth_digest$(PreprocessSuffix): ../sdk/lib/net/libcurl/vauth/digest.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vauth_digest$(PreprocessSuffix) ../sdk/lib/net/libcurl/vauth/digest.c

$(IntermediateDirectory)/vauth_digest_sspi$(ObjectSuffix): ../sdk/lib/net/libcurl/vauth/digest_sspi.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vauth/digest_sspi.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vauth_digest_sspi$(ObjectSuffix) -MF$(IntermediateDirectory)/vauth_digest_sspi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vauth_digest_sspi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vauth_digest_sspi$(PreprocessSuffix): ../sdk/lib/net/libcurl/vauth/digest_sspi.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vauth_digest_sspi$(PreprocessSuffix) ../sdk/lib/net/libcurl/vauth/digest_sspi.c

$(IntermediateDirectory)/vauth_gsasl$(ObjectSuffix): ../sdk/lib/net/libcurl/vauth/gsasl.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vauth/gsasl.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vauth_gsasl$(ObjectSuffix) -MF$(IntermediateDirectory)/vauth_gsasl$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vauth_gsasl$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vauth_gsasl$(PreprocessSuffix): ../sdk/lib/net/libcurl/vauth/gsasl.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vauth_gsasl$(PreprocessSuffix) ../sdk/lib/net/libcurl/vauth/gsasl.c

$(IntermediateDirectory)/vauth_krb5_gssapi$(ObjectSuffix): ../sdk/lib/net/libcurl/vauth/krb5_gssapi.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vauth/krb5_gssapi.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vauth_krb5_gssapi$(ObjectSuffix) -MF$(IntermediateDirectory)/vauth_krb5_gssapi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vauth_krb5_gssapi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vauth_krb5_gssapi$(PreprocessSuffix): ../sdk/lib/net/libcurl/vauth/krb5_gssapi.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vauth_krb5_gssapi$(PreprocessSuffix) ../sdk/lib/net/libcurl/vauth/krb5_gssapi.c

$(IntermediateDirectory)/vauth_krb5_sspi$(ObjectSuffix): ../sdk/lib/net/libcurl/vauth/krb5_sspi.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vauth/krb5_sspi.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vauth_krb5_sspi$(ObjectSuffix) -MF$(IntermediateDirectory)/vauth_krb5_sspi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vauth_krb5_sspi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vauth_krb5_sspi$(PreprocessSuffix): ../sdk/lib/net/libcurl/vauth/krb5_sspi.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vauth_krb5_sspi$(PreprocessSuffix) ../sdk/lib/net/libcurl/vauth/krb5_sspi.c

$(IntermediateDirectory)/vauth_ntlm$(ObjectSuffix): ../sdk/lib/net/libcurl/vauth/ntlm.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vauth/ntlm.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vauth_ntlm$(ObjectSuffix) -MF$(IntermediateDirectory)/vauth_ntlm$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vauth_ntlm$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vauth_ntlm$(PreprocessSuffix): ../sdk/lib/net/libcurl/vauth/ntlm.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vauth_ntlm$(PreprocessSuffix) ../sdk/lib/net/libcurl/vauth/ntlm.c

$(IntermediateDirectory)/vauth_ntlm_sspi$(ObjectSuffix): ../sdk/lib/net/libcurl/vauth/ntlm_sspi.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vauth/ntlm_sspi.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vauth_ntlm_sspi$(ObjectSuffix) -MF$(IntermediateDirectory)/vauth_ntlm_sspi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vauth_ntlm_sspi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vauth_ntlm_sspi$(PreprocessSuffix): ../sdk/lib/net/libcurl/vauth/ntlm_sspi.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vauth_ntlm_sspi$(PreprocessSuffix) ../sdk/lib/net/libcurl/vauth/ntlm_sspi.c

$(IntermediateDirectory)/vauth_oauth2$(ObjectSuffix): ../sdk/lib/net/libcurl/vauth/oauth2.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vauth/oauth2.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vauth_oauth2$(ObjectSuffix) -MF$(IntermediateDirectory)/vauth_oauth2$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vauth_oauth2$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vauth_oauth2$(PreprocessSuffix): ../sdk/lib/net/libcurl/vauth/oauth2.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vauth_oauth2$(PreprocessSuffix) ../sdk/lib/net/libcurl/vauth/oauth2.c

$(IntermediateDirectory)/vauth_spnego_gssapi$(ObjectSuffix): ../sdk/lib/net/libcurl/vauth/spnego_gssapi.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vauth/spnego_gssapi.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vauth_spnego_gssapi$(ObjectSuffix) -MF$(IntermediateDirectory)/vauth_spnego_gssapi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vauth_spnego_gssapi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vauth_spnego_gssapi$(PreprocessSuffix): ../sdk/lib/net/libcurl/vauth/spnego_gssapi.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vauth_spnego_gssapi$(PreprocessSuffix) ../sdk/lib/net/libcurl/vauth/spnego_gssapi.c

$(IntermediateDirectory)/vauth_spnego_sspi$(ObjectSuffix): ../sdk/lib/net/libcurl/vauth/spnego_sspi.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vauth/spnego_sspi.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vauth_spnego_sspi$(ObjectSuffix) -MF$(IntermediateDirectory)/vauth_spnego_sspi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vauth_spnego_sspi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vauth_spnego_sspi$(PreprocessSuffix): ../sdk/lib/net/libcurl/vauth/spnego_sspi.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vauth_spnego_sspi$(PreprocessSuffix) ../sdk/lib/net/libcurl/vauth/spnego_sspi.c

$(IntermediateDirectory)/vauth_vauth$(ObjectSuffix): ../sdk/lib/net/libcurl/vauth/vauth.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vauth/vauth.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vauth_vauth$(ObjectSuffix) -MF$(IntermediateDirectory)/vauth_vauth$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vauth_vauth$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vauth_vauth$(PreprocessSuffix): ../sdk/lib/net/libcurl/vauth/vauth.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vauth_vauth$(PreprocessSuffix) ../sdk/lib/net/libcurl/vauth/vauth.c

$(IntermediateDirectory)/vquic_curl_msh3$(ObjectSuffix): ../sdk/lib/net/libcurl/vquic/curl_msh3.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vquic/curl_msh3.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vquic_curl_msh3$(ObjectSuffix) -MF$(IntermediateDirectory)/vquic_curl_msh3$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vquic_curl_msh3$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vquic_curl_msh3$(PreprocessSuffix): ../sdk/lib/net/libcurl/vquic/curl_msh3.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vquic_curl_msh3$(PreprocessSuffix) ../sdk/lib/net/libcurl/vquic/curl_msh3.c

$(IntermediateDirectory)/vquic_curl_ngtcp2$(ObjectSuffix): ../sdk/lib/net/libcurl/vquic/curl_ngtcp2.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vquic/curl_ngtcp2.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vquic_curl_ngtcp2$(ObjectSuffix) -MF$(IntermediateDirectory)/vquic_curl_ngtcp2$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vquic_curl_ngtcp2$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vquic_curl_ngtcp2$(PreprocessSuffix): ../sdk/lib/net/libcurl/vquic/curl_ngtcp2.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vquic_curl_ngtcp2$(PreprocessSuffix) ../sdk/lib/net/libcurl/vquic/curl_ngtcp2.c

$(IntermediateDirectory)/vquic_curl_quiche$(ObjectSuffix): ../sdk/lib/net/libcurl/vquic/curl_quiche.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vquic/curl_quiche.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vquic_curl_quiche$(ObjectSuffix) -MF$(IntermediateDirectory)/vquic_curl_quiche$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vquic_curl_quiche$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vquic_curl_quiche$(PreprocessSuffix): ../sdk/lib/net/libcurl/vquic/curl_quiche.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vquic_curl_quiche$(PreprocessSuffix) ../sdk/lib/net/libcurl/vquic/curl_quiche.c

$(IntermediateDirectory)/vquic_vquic$(ObjectSuffix): ../sdk/lib/net/libcurl/vquic/vquic.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vquic/vquic.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vquic_vquic$(ObjectSuffix) -MF$(IntermediateDirectory)/vquic_vquic$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vquic_vquic$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vquic_vquic$(PreprocessSuffix): ../sdk/lib/net/libcurl/vquic/vquic.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vquic_vquic$(PreprocessSuffix) ../sdk/lib/net/libcurl/vquic/vquic.c

$(IntermediateDirectory)/vssh_libssh$(ObjectSuffix): ../sdk/lib/net/libcurl/vssh/libssh.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vssh/libssh.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vssh_libssh$(ObjectSuffix) -MF$(IntermediateDirectory)/vssh_libssh$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vssh_libssh$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vssh_libssh$(PreprocessSuffix): ../sdk/lib/net/libcurl/vssh/libssh.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vssh_libssh$(PreprocessSuffix) ../sdk/lib/net/libcurl/vssh/libssh.c

$(IntermediateDirectory)/vssh_libssh2$(ObjectSuffix): ../sdk/lib/net/libcurl/vssh/libssh2.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vssh/libssh2.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vssh_libssh2$(ObjectSuffix) -MF$(IntermediateDirectory)/vssh_libssh2$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vssh_libssh2$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vssh_libssh2$(PreprocessSuffix): ../sdk/lib/net/libcurl/vssh/libssh2.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vssh_libssh2$(PreprocessSuffix) ../sdk/lib/net/libcurl/vssh/libssh2.c

$(IntermediateDirectory)/vssh_wolfssh$(ObjectSuffix): ../sdk/lib/net/libcurl/vssh/wolfssh.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vssh/wolfssh.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vssh_wolfssh$(ObjectSuffix) -MF$(IntermediateDirectory)/vssh_wolfssh$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vssh_wolfssh$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vssh_wolfssh$(PreprocessSuffix): ../sdk/lib/net/libcurl/vssh/wolfssh.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vssh_wolfssh$(PreprocessSuffix) ../sdk/lib/net/libcurl/vssh/wolfssh.c

$(IntermediateDirectory)/vtls_bearssl$(ObjectSuffix): ../sdk/lib/net/libcurl/vtls/bearssl.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vtls/bearssl.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vtls_bearssl$(ObjectSuffix) -MF$(IntermediateDirectory)/vtls_bearssl$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vtls_bearssl$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vtls_bearssl$(PreprocessSuffix): ../sdk/lib/net/libcurl/vtls/bearssl.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vtls_bearssl$(PreprocessSuffix) ../sdk/lib/net/libcurl/vtls/bearssl.c

$(IntermediateDirectory)/vtls_gskit$(ObjectSuffix): ../sdk/lib/net/libcurl/vtls/gskit.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vtls/gskit.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vtls_gskit$(ObjectSuffix) -MF$(IntermediateDirectory)/vtls_gskit$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vtls_gskit$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vtls_gskit$(PreprocessSuffix): ../sdk/lib/net/libcurl/vtls/gskit.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vtls_gskit$(PreprocessSuffix) ../sdk/lib/net/libcurl/vtls/gskit.c

$(IntermediateDirectory)/vtls_gtls$(ObjectSuffix): ../sdk/lib/net/libcurl/vtls/gtls.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vtls/gtls.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vtls_gtls$(ObjectSuffix) -MF$(IntermediateDirectory)/vtls_gtls$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vtls_gtls$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vtls_gtls$(PreprocessSuffix): ../sdk/lib/net/libcurl/vtls/gtls.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vtls_gtls$(PreprocessSuffix) ../sdk/lib/net/libcurl/vtls/gtls.c

$(IntermediateDirectory)/vtls_hostcheck$(ObjectSuffix): ../sdk/lib/net/libcurl/vtls/hostcheck.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vtls/hostcheck.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vtls_hostcheck$(ObjectSuffix) -MF$(IntermediateDirectory)/vtls_hostcheck$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vtls_hostcheck$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vtls_hostcheck$(PreprocessSuffix): ../sdk/lib/net/libcurl/vtls/hostcheck.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vtls_hostcheck$(PreprocessSuffix) ../sdk/lib/net/libcurl/vtls/hostcheck.c

$(IntermediateDirectory)/vtls_keylog$(ObjectSuffix): ../sdk/lib/net/libcurl/vtls/keylog.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vtls/keylog.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vtls_keylog$(ObjectSuffix) -MF$(IntermediateDirectory)/vtls_keylog$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vtls_keylog$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vtls_keylog$(PreprocessSuffix): ../sdk/lib/net/libcurl/vtls/keylog.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vtls_keylog$(PreprocessSuffix) ../sdk/lib/net/libcurl/vtls/keylog.c

$(IntermediateDirectory)/vtls_mbedtls$(ObjectSuffix): ../sdk/lib/net/libcurl/vtls/mbedtls.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vtls/mbedtls.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vtls_mbedtls$(ObjectSuffix) -MF$(IntermediateDirectory)/vtls_mbedtls$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vtls_mbedtls$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vtls_mbedtls$(PreprocessSuffix): ../sdk/lib/net/libcurl/vtls/mbedtls.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vtls_mbedtls$(PreprocessSuffix) ../sdk/lib/net/libcurl/vtls/mbedtls.c

$(IntermediateDirectory)/vtls_mbedtls_threadlock$(ObjectSuffix): ../sdk/lib/net/libcurl/vtls/mbedtls_threadlock.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vtls/mbedtls_threadlock.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vtls_mbedtls_threadlock$(ObjectSuffix) -MF$(IntermediateDirectory)/vtls_mbedtls_threadlock$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vtls_mbedtls_threadlock$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vtls_mbedtls_threadlock$(PreprocessSuffix): ../sdk/lib/net/libcurl/vtls/mbedtls_threadlock.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vtls_mbedtls_threadlock$(PreprocessSuffix) ../sdk/lib/net/libcurl/vtls/mbedtls_threadlock.c

$(IntermediateDirectory)/vtls_nss$(ObjectSuffix): ../sdk/lib/net/libcurl/vtls/nss.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vtls/nss.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vtls_nss$(ObjectSuffix) -MF$(IntermediateDirectory)/vtls_nss$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vtls_nss$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vtls_nss$(PreprocessSuffix): ../sdk/lib/net/libcurl/vtls/nss.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vtls_nss$(PreprocessSuffix) ../sdk/lib/net/libcurl/vtls/nss.c

$(IntermediateDirectory)/vtls_openssl$(ObjectSuffix): ../sdk/lib/net/libcurl/vtls/openssl.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vtls/openssl.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vtls_openssl$(ObjectSuffix) -MF$(IntermediateDirectory)/vtls_openssl$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vtls_openssl$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vtls_openssl$(PreprocessSuffix): ../sdk/lib/net/libcurl/vtls/openssl.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vtls_openssl$(PreprocessSuffix) ../sdk/lib/net/libcurl/vtls/openssl.c

$(IntermediateDirectory)/vtls_rustls$(ObjectSuffix): ../sdk/lib/net/libcurl/vtls/rustls.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vtls/rustls.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vtls_rustls$(ObjectSuffix) -MF$(IntermediateDirectory)/vtls_rustls$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vtls_rustls$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vtls_rustls$(PreprocessSuffix): ../sdk/lib/net/libcurl/vtls/rustls.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vtls_rustls$(PreprocessSuffix) ../sdk/lib/net/libcurl/vtls/rustls.c

$(IntermediateDirectory)/vtls_schannel$(ObjectSuffix): ../sdk/lib/net/libcurl/vtls/schannel.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vtls/schannel.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vtls_schannel$(ObjectSuffix) -MF$(IntermediateDirectory)/vtls_schannel$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vtls_schannel$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vtls_schannel$(PreprocessSuffix): ../sdk/lib/net/libcurl/vtls/schannel.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vtls_schannel$(PreprocessSuffix) ../sdk/lib/net/libcurl/vtls/schannel.c

$(IntermediateDirectory)/vtls_schannel_verify$(ObjectSuffix): ../sdk/lib/net/libcurl/vtls/schannel_verify.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vtls/schannel_verify.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vtls_schannel_verify$(ObjectSuffix) -MF$(IntermediateDirectory)/vtls_schannel_verify$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vtls_schannel_verify$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vtls_schannel_verify$(PreprocessSuffix): ../sdk/lib/net/libcurl/vtls/schannel_verify.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vtls_schannel_verify$(PreprocessSuffix) ../sdk/lib/net/libcurl/vtls/schannel_verify.c

$(IntermediateDirectory)/vtls_sectransp$(ObjectSuffix): ../sdk/lib/net/libcurl/vtls/sectransp.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vtls/sectransp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vtls_sectransp$(ObjectSuffix) -MF$(IntermediateDirectory)/vtls_sectransp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vtls_sectransp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vtls_sectransp$(PreprocessSuffix): ../sdk/lib/net/libcurl/vtls/sectransp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vtls_sectransp$(PreprocessSuffix) ../sdk/lib/net/libcurl/vtls/sectransp.c

$(IntermediateDirectory)/vtls_vtls$(ObjectSuffix): ../sdk/lib/net/libcurl/vtls/vtls.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vtls/vtls.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vtls_vtls$(ObjectSuffix) -MF$(IntermediateDirectory)/vtls_vtls$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vtls_vtls$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vtls_vtls$(PreprocessSuffix): ../sdk/lib/net/libcurl/vtls/vtls.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vtls_vtls$(PreprocessSuffix) ../sdk/lib/net/libcurl/vtls/vtls.c

$(IntermediateDirectory)/vtls_wolfssl$(ObjectSuffix): ../sdk/lib/net/libcurl/vtls/wolfssl.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vtls/wolfssl.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vtls_wolfssl$(ObjectSuffix) -MF$(IntermediateDirectory)/vtls_wolfssl$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vtls_wolfssl$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vtls_wolfssl$(PreprocessSuffix): ../sdk/lib/net/libcurl/vtls/wolfssl.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vtls_wolfssl$(PreprocessSuffix) ../sdk/lib/net/libcurl/vtls/wolfssl.c

$(IntermediateDirectory)/vtls_x509asn1$(ObjectSuffix): ../sdk/lib/net/libcurl/vtls/x509asn1.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/libcurl/vtls/x509asn1.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vtls_x509asn1$(ObjectSuffix) -MF$(IntermediateDirectory)/vtls_x509asn1$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vtls_x509asn1$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vtls_x509asn1$(PreprocessSuffix): ../sdk/lib/net/libcurl/vtls/x509asn1.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vtls_x509asn1$(PreprocessSuffix) ../sdk/lib/net/libcurl/vtls/x509asn1.c

$(IntermediateDirectory)/spi_nor_spi_nor_bus$(ObjectSuffix): ../sdk/lib/bus/spi/spi_nor/spi_nor_bus.c  
	$(CC) $(SourceSwitch) ../sdk/lib/bus/spi/spi_nor/spi_nor_bus.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/spi_nor_spi_nor_bus$(ObjectSuffix) -MF$(IntermediateDirectory)/spi_nor_spi_nor_bus$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/spi_nor_spi_nor_bus$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/spi_nor_spi_nor_bus$(PreprocessSuffix): ../sdk/lib/bus/spi/spi_nor/spi_nor_bus.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/spi_nor_spi_nor_bus$(PreprocessSuffix) ../sdk/lib/bus/spi/spi_nor/spi_nor_bus.c

$(IntermediateDirectory)/lcd_st7701s$(ObjectSuffix): ../sdk/lib/bus/spi/lcd/st7701s.c  
	$(CC) $(SourceSwitch) ../sdk/lib/bus/spi/lcd/st7701s.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/lcd_st7701s$(ObjectSuffix) -MF$(IntermediateDirectory)/lcd_st7701s$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/lcd_st7701s$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/lcd_st7701s$(PreprocessSuffix): ../sdk/lib/bus/spi/lcd/st7701s.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/lcd_st7701s$(PreprocessSuffix) ../sdk/lib/bus/spi/lcd/st7701s.c

$(IntermediateDirectory)/lcd_st7789v$(ObjectSuffix): ../sdk/lib/bus/spi/lcd/st7789v.c  
	$(CC) $(SourceSwitch) ../sdk/lib/bus/spi/lcd/st7789v.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/lcd_st7789v$(ObjectSuffix) -MF$(IntermediateDirectory)/lcd_st7789v$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/lcd_st7789v$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/lcd_st7789v$(PreprocessSuffix): ../sdk/lib/bus/spi/lcd/st7789v.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/lcd_st7789v$(PreprocessSuffix) ../sdk/lib/bus/spi/lcd/st7789v.c

$(IntermediateDirectory)/lcd_st7789v_mcu$(ObjectSuffix): ../sdk/lib/bus/spi/lcd/st7789v_mcu.c  
	$(CC) $(SourceSwitch) ../sdk/lib/bus/spi/lcd/st7789v_mcu.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/lcd_st7789v_mcu$(ObjectSuffix) -MF$(IntermediateDirectory)/lcd_st7789v_mcu$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/lcd_st7789v_mcu$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/lcd_st7789v_mcu$(PreprocessSuffix): ../sdk/lib/bus/spi/lcd/st7789v_mcu.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/lcd_st7789v_mcu$(PreprocessSuffix) ../sdk/lib/bus/spi/lcd/st7789v_mcu.c

$(IntermediateDirectory)/lcd_hx8282$(ObjectSuffix): ../sdk/lib/bus/spi/lcd/hx8282.c  
	$(CC) $(SourceSwitch) ../sdk/lib/bus/spi/lcd/hx8282.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/lcd_hx8282$(ObjectSuffix) -MF$(IntermediateDirectory)/lcd_hx8282$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/lcd_hx8282$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/lcd_hx8282$(PreprocessSuffix): ../sdk/lib/bus/spi/lcd/hx8282.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/lcd_hx8282$(PreprocessSuffix) ../sdk/lib/bus/spi/lcd/hx8282.c

$(IntermediateDirectory)/sensor_sensor_bf2013$(ObjectSuffix): ../sdk/lib/bus/iic/sensor/sensor_bf2013.c  
	$(CC) $(SourceSwitch) ../sdk/lib/bus/iic/sensor/sensor_bf2013.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sensor_sensor_bf2013$(ObjectSuffix) -MF$(IntermediateDirectory)/sensor_sensor_bf2013$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sensor_sensor_bf2013$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sensor_sensor_bf2013$(PreprocessSuffix): ../sdk/lib/bus/iic/sensor/sensor_bf2013.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sensor_sensor_bf2013$(PreprocessSuffix) ../sdk/lib/bus/iic/sensor/sensor_bf2013.c

$(IntermediateDirectory)/sensor_sensor_bf3703$(ObjectSuffix): ../sdk/lib/bus/iic/sensor/sensor_bf3703.c  
	$(CC) $(SourceSwitch) ../sdk/lib/bus/iic/sensor/sensor_bf3703.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sensor_sensor_bf3703$(ObjectSuffix) -MF$(IntermediateDirectory)/sensor_sensor_bf3703$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sensor_sensor_bf3703$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sensor_sensor_bf3703$(PreprocessSuffix): ../sdk/lib/bus/iic/sensor/sensor_bf3703.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sensor_sensor_bf3703$(PreprocessSuffix) ../sdk/lib/bus/iic/sensor/sensor_bf3703.c

$(IntermediateDirectory)/sensor_sensor_bf3a03$(ObjectSuffix): ../sdk/lib/bus/iic/sensor/sensor_bf3a03.c  
	$(CC) $(SourceSwitch) ../sdk/lib/bus/iic/sensor/sensor_bf3a03.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sensor_sensor_bf3a03$(ObjectSuffix) -MF$(IntermediateDirectory)/sensor_sensor_bf3a03$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sensor_sensor_bf3a03$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sensor_sensor_bf3a03$(PreprocessSuffix): ../sdk/lib/bus/iic/sensor/sensor_bf3a03.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sensor_sensor_bf3a03$(PreprocessSuffix) ../sdk/lib/bus/iic/sensor/sensor_bf3a03.c

$(IntermediateDirectory)/sensor_sensor_gc0308$(ObjectSuffix): ../sdk/lib/bus/iic/sensor/sensor_gc0308.c  
	$(CC) $(SourceSwitch) ../sdk/lib/bus/iic/sensor/sensor_gc0308.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sensor_sensor_gc0308$(ObjectSuffix) -MF$(IntermediateDirectory)/sensor_sensor_gc0308$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sensor_sensor_gc0308$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sensor_sensor_gc0308$(PreprocessSuffix): ../sdk/lib/bus/iic/sensor/sensor_gc0308.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sensor_sensor_gc0308$(PreprocessSuffix) ../sdk/lib/bus/iic/sensor/sensor_gc0308.c

$(IntermediateDirectory)/sensor_sensor_gc0309$(ObjectSuffix): ../sdk/lib/bus/iic/sensor/sensor_gc0309.c  
	$(CC) $(SourceSwitch) ../sdk/lib/bus/iic/sensor/sensor_gc0309.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sensor_sensor_gc0309$(ObjectSuffix) -MF$(IntermediateDirectory)/sensor_sensor_gc0309$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sensor_sensor_gc0309$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sensor_sensor_gc0309$(PreprocessSuffix): ../sdk/lib/bus/iic/sensor/sensor_gc0309.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sensor_sensor_gc0309$(PreprocessSuffix) ../sdk/lib/bus/iic/sensor/sensor_gc0309.c

$(IntermediateDirectory)/sensor_sensor_gc0328$(ObjectSuffix): ../sdk/lib/bus/iic/sensor/sensor_gc0328.c  
	$(CC) $(SourceSwitch) ../sdk/lib/bus/iic/sensor/sensor_gc0328.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sensor_sensor_gc0328$(ObjectSuffix) -MF$(IntermediateDirectory)/sensor_sensor_gc0328$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sensor_sensor_gc0328$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sensor_sensor_gc0328$(PreprocessSuffix): ../sdk/lib/bus/iic/sensor/sensor_gc0328.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sensor_sensor_gc0328$(PreprocessSuffix) ../sdk/lib/bus/iic/sensor/sensor_gc0328.c

$(IntermediateDirectory)/sensor_sensor_ov2640$(ObjectSuffix): ../sdk/lib/bus/iic/sensor/sensor_ov2640.c  
	$(CC) $(SourceSwitch) ../sdk/lib/bus/iic/sensor/sensor_ov2640.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sensor_sensor_ov2640$(ObjectSuffix) -MF$(IntermediateDirectory)/sensor_sensor_ov2640$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sensor_sensor_ov2640$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sensor_sensor_ov2640$(PreprocessSuffix): ../sdk/lib/bus/iic/sensor/sensor_ov2640.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sensor_sensor_ov2640$(PreprocessSuffix) ../sdk/lib/bus/iic/sensor/sensor_ov2640.c

$(IntermediateDirectory)/sensor_sensor_ov7670$(ObjectSuffix): ../sdk/lib/bus/iic/sensor/sensor_ov7670.c  
	$(CC) $(SourceSwitch) ../sdk/lib/bus/iic/sensor/sensor_ov7670.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sensor_sensor_ov7670$(ObjectSuffix) -MF$(IntermediateDirectory)/sensor_sensor_ov7670$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sensor_sensor_ov7670$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sensor_sensor_ov7670$(PreprocessSuffix): ../sdk/lib/bus/iic/sensor/sensor_ov7670.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sensor_sensor_ov7670$(PreprocessSuffix) ../sdk/lib/bus/iic/sensor/sensor_ov7670.c

$(IntermediateDirectory)/sensor_sensor_ov7725$(ObjectSuffix): ../sdk/lib/bus/iic/sensor/sensor_ov7725.c  
	$(CC) $(SourceSwitch) ../sdk/lib/bus/iic/sensor/sensor_ov7725.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sensor_sensor_ov7725$(ObjectSuffix) -MF$(IntermediateDirectory)/sensor_sensor_ov7725$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sensor_sensor_ov7725$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sensor_sensor_ov7725$(PreprocessSuffix): ../sdk/lib/bus/iic/sensor/sensor_ov7725.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sensor_sensor_ov7725$(PreprocessSuffix) ../sdk/lib/bus/iic/sensor/sensor_ov7725.c

$(IntermediateDirectory)/sensor_sensor_xc7016_h63$(ObjectSuffix): ../sdk/lib/bus/iic/sensor/sensor_xc7016_h63.c  
	$(CC) $(SourceSwitch) ../sdk/lib/bus/iic/sensor/sensor_xc7016_h63.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sensor_sensor_xc7016_h63$(ObjectSuffix) -MF$(IntermediateDirectory)/sensor_sensor_xc7016_h63$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sensor_sensor_xc7016_h63$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sensor_sensor_xc7016_h63$(PreprocessSuffix): ../sdk/lib/bus/iic/sensor/sensor_xc7016_h63.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sensor_sensor_xc7016_h63$(PreprocessSuffix) ../sdk/lib/bus/iic/sensor/sensor_xc7016_h63.c

$(IntermediateDirectory)/sensor_sensor_xcg532$(ObjectSuffix): ../sdk/lib/bus/iic/sensor/sensor_xcg532.c  
	$(CC) $(SourceSwitch) ../sdk/lib/bus/iic/sensor/sensor_xcg532.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sensor_sensor_xcg532$(ObjectSuffix) -MF$(IntermediateDirectory)/sensor_sensor_xcg532$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sensor_sensor_xcg532$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sensor_sensor_xcg532$(PreprocessSuffix): ../sdk/lib/bus/iic/sensor/sensor_xcg532.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sensor_sensor_xcg532$(PreprocessSuffix) ../sdk/lib/bus/iic/sensor/sensor_xcg532.c

$(IntermediateDirectory)/sensor_sensor_xc7011_gc1054$(ObjectSuffix): ../sdk/lib/bus/iic/sensor/sensor_xc7011_gc1054.c  
	$(CC) $(SourceSwitch) ../sdk/lib/bus/iic/sensor/sensor_xc7011_gc1054.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sensor_sensor_xc7011_gc1054$(ObjectSuffix) -MF$(IntermediateDirectory)/sensor_sensor_xc7011_gc1054$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sensor_sensor_xc7011_gc1054$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sensor_sensor_xc7011_gc1054$(PreprocessSuffix): ../sdk/lib/bus/iic/sensor/sensor_xc7011_gc1054.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sensor_sensor_xc7011_gc1054$(PreprocessSuffix) ../sdk/lib/bus/iic/sensor/sensor_xc7011_gc1054.c

$(IntermediateDirectory)/sensor_sensor_xc7011_h63$(ObjectSuffix): ../sdk/lib/bus/iic/sensor/sensor_xc7011_h63.c  
	$(CC) $(SourceSwitch) ../sdk/lib/bus/iic/sensor/sensor_xc7011_h63.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sensor_sensor_xc7011_h63$(ObjectSuffix) -MF$(IntermediateDirectory)/sensor_sensor_xc7011_h63$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sensor_sensor_xc7011_h63$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sensor_sensor_xc7011_h63$(PreprocessSuffix): ../sdk/lib/bus/iic/sensor/sensor_xc7011_h63.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sensor_sensor_xc7011_h63$(PreprocessSuffix) ../sdk/lib/bus/iic/sensor/sensor_xc7011_h63.c

$(IntermediateDirectory)/sensor_sensor_gc0311$(ObjectSuffix): ../sdk/lib/bus/iic/sensor/sensor_gc0311.c  
	$(CC) $(SourceSwitch) ../sdk/lib/bus/iic/sensor/sensor_gc0311.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sensor_sensor_gc0311$(ObjectSuffix) -MF$(IntermediateDirectory)/sensor_sensor_gc0311$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sensor_sensor_gc0311$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sensor_sensor_gc0311$(PreprocessSuffix): ../sdk/lib/bus/iic/sensor/sensor_gc0311.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sensor_sensor_gc0311$(PreprocessSuffix) ../sdk/lib/bus/iic/sensor/sensor_gc0311.c

$(IntermediateDirectory)/sensor_sensor_gc0329$(ObjectSuffix): ../sdk/lib/bus/iic/sensor/sensor_gc0329.c  
	$(CC) $(SourceSwitch) ../sdk/lib/bus/iic/sensor/sensor_gc0329.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sensor_sensor_gc0329$(ObjectSuffix) -MF$(IntermediateDirectory)/sensor_sensor_gc0329$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sensor_sensor_gc0329$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sensor_sensor_gc0329$(PreprocessSuffix): ../sdk/lib/bus/iic/sensor/sensor_gc0329.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sensor_sensor_gc0329$(PreprocessSuffix) ../sdk/lib/bus/iic/sensor/sensor_gc0329.c

$(IntermediateDirectory)/sensor_sensor_gc0312$(ObjectSuffix): ../sdk/lib/bus/iic/sensor/sensor_gc0312.c  
	$(CC) $(SourceSwitch) ../sdk/lib/bus/iic/sensor/sensor_gc0312.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sensor_sensor_gc0312$(ObjectSuffix) -MF$(IntermediateDirectory)/sensor_sensor_gc0312$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sensor_sensor_gc0312$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sensor_sensor_gc0312$(PreprocessSuffix): ../sdk/lib/bus/iic/sensor/sensor_gc0312.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sensor_sensor_gc0312$(PreprocessSuffix) ../sdk/lib/bus/iic/sensor/sensor_gc0312.c

$(IntermediateDirectory)/sensor_sensor_bf3720$(ObjectSuffix): ../sdk/lib/bus/iic/sensor/sensor_bf3720.c  
	$(CC) $(SourceSwitch) ../sdk/lib/bus/iic/sensor/sensor_bf3720.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sensor_sensor_bf3720$(ObjectSuffix) -MF$(IntermediateDirectory)/sensor_sensor_bf3720$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sensor_sensor_bf3720$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sensor_sensor_bf3720$(PreprocessSuffix): ../sdk/lib/bus/iic/sensor/sensor_bf3720.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sensor_sensor_bf3720$(PreprocessSuffix) ../sdk/lib/bus/iic/sensor/sensor_bf3720.c

$(IntermediateDirectory)/sensor_sensor_sp0a19$(ObjectSuffix): ../sdk/lib/bus/iic/sensor/sensor_sp0a19.c  
	$(CC) $(SourceSwitch) ../sdk/lib/bus/iic/sensor/sensor_sp0a19.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sensor_sensor_sp0a19$(ObjectSuffix) -MF$(IntermediateDirectory)/sensor_sensor_sp0a19$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sensor_sensor_sp0a19$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sensor_sensor_sp0a19$(PreprocessSuffix): ../sdk/lib/bus/iic/sensor/sensor_sp0a19.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sensor_sensor_sp0a19$(PreprocessSuffix) ../sdk/lib/bus/iic/sensor/sensor_sp0a19.c

$(IntermediateDirectory)/sensor_sensor_sp0718$(ObjectSuffix): ../sdk/lib/bus/iic/sensor/sensor_sp0718.c  
	$(CC) $(SourceSwitch) ../sdk/lib/bus/iic/sensor/sensor_sp0718.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sensor_sensor_sp0718$(ObjectSuffix) -MF$(IntermediateDirectory)/sensor_sensor_sp0718$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sensor_sensor_sp0718$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sensor_sensor_sp0718$(PreprocessSuffix): ../sdk/lib/bus/iic/sensor/sensor_sp0718.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sensor_sensor_sp0718$(PreprocessSuffix) ../sdk/lib/bus/iic/sensor/sensor_sp0718.c

$(IntermediateDirectory)/sensor_sensor_bf30a2$(ObjectSuffix): ../sdk/lib/bus/iic/sensor/sensor_bf30a2.c  
	$(CC) $(SourceSwitch) ../sdk/lib/bus/iic/sensor/sensor_bf30a2.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sensor_sensor_bf30a2$(ObjectSuffix) -MF$(IntermediateDirectory)/sensor_sensor_bf30a2$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sensor_sensor_bf30a2$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sensor_sensor_bf30a2$(PreprocessSuffix): ../sdk/lib/bus/iic/sensor/sensor_bf30a2.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sensor_sensor_bf30a2$(PreprocessSuffix) ../sdk/lib/bus/iic/sensor/sensor_bf30a2.c

$(IntermediateDirectory)/gsensor_da280$(ObjectSuffix): ../sdk/lib/bus/iic/gsensor/da280.c  
	$(CC) $(SourceSwitch) ../sdk/lib/bus/iic/gsensor/da280.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/gsensor_da280$(ObjectSuffix) -MF$(IntermediateDirectory)/gsensor_da280$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/gsensor_da280$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/gsensor_da280$(PreprocessSuffix): ../sdk/lib/bus/iic/gsensor/da280.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/gsensor_da280$(PreprocessSuffix) ../sdk/lib/bus/iic/gsensor/da280.c

$(IntermediateDirectory)/gsensor_qma7981$(ObjectSuffix): ../sdk/lib/bus/iic/gsensor/qma7981.c  
	$(CC) $(SourceSwitch) ../sdk/lib/bus/iic/gsensor/qma7981.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/gsensor_qma7981$(ObjectSuffix) -MF$(IntermediateDirectory)/gsensor_qma7981$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/gsensor_qma7981$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/gsensor_qma7981$(PreprocessSuffix): ../sdk/lib/bus/iic/gsensor/qma7981.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/gsensor_qma7981$(PreprocessSuffix) ../sdk/lib/bus/iic/gsensor/qma7981.c

$(IntermediateDirectory)/gsensor_sc7a20$(ObjectSuffix): ../sdk/lib/bus/iic/gsensor/sc7a20.c  
	$(CC) $(SourceSwitch) ../sdk/lib/bus/iic/gsensor/sc7a20.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/gsensor_sc7a20$(ObjectSuffix) -MF$(IntermediateDirectory)/gsensor_sc7a20$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/gsensor_sc7a20$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/gsensor_sc7a20$(PreprocessSuffix): ../sdk/lib/bus/iic/gsensor/sc7a20.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/gsensor_sc7a20$(PreprocessSuffix) ../sdk/lib/bus/iic/gsensor/sc7a20.c

$(IntermediateDirectory)/cmos_sensor_csi_v2$(ObjectSuffix): ../sdk/lib/video/dvp/cmos_sensor/csi_v2.c  
	$(CC) $(SourceSwitch) ../sdk/lib/video/dvp/cmos_sensor/csi_v2.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/cmos_sensor_csi_v2$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_csi_v2$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_csi_v2$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/cmos_sensor_csi_v2$(PreprocessSuffix): ../sdk/lib/video/dvp/cmos_sensor/csi_v2.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/cmos_sensor_csi_v2$(PreprocessSuffix) ../sdk/lib/video/dvp/cmos_sensor/csi_v2.c

$(IntermediateDirectory)/jpeg_jpg_table$(ObjectSuffix): ../sdk/lib/video/dvp/jpeg/jpg_table.c  
	$(CC) $(SourceSwitch) ../sdk/lib/video/dvp/jpeg/jpg_table.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/jpeg_jpg_table$(ObjectSuffix) -MF$(IntermediateDirectory)/jpeg_jpg_table$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/jpeg_jpg_table$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/jpeg_jpg_table$(PreprocessSuffix): ../sdk/lib/video/dvp/jpeg/jpg_table.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/jpeg_jpg_table$(PreprocessSuffix) ../sdk/lib/video/dvp/jpeg/jpg_table.c

$(IntermediateDirectory)/jpeg_jpg_v2$(ObjectSuffix): ../sdk/lib/video/dvp/jpeg/jpg_v2.c  
	$(CC) $(SourceSwitch) ../sdk/lib/video/dvp/jpeg/jpg_v2.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/jpeg_jpg_v2$(ObjectSuffix) -MF$(IntermediateDirectory)/jpeg_jpg_v2$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/jpeg_jpg_v2$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/jpeg_jpg_v2$(PreprocessSuffix): ../sdk/lib/video/dvp/jpeg/jpg_v2.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/jpeg_jpg_v2$(PreprocessSuffix) ../sdk/lib/video/dvp/jpeg/jpg_v2.c

$(IntermediateDirectory)/library_aes$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/aes.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/aes.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_aes$(ObjectSuffix) -MF$(IntermediateDirectory)/library_aes$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_aes$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_aes$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/aes.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_aes$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/aes.c

$(IntermediateDirectory)/library_aesce$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/aesce.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/aesce.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_aesce$(ObjectSuffix) -MF$(IntermediateDirectory)/library_aesce$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_aesce$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_aesce$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/aesce.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_aesce$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/aesce.c

$(IntermediateDirectory)/library_aesni$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/aesni.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/aesni.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_aesni$(ObjectSuffix) -MF$(IntermediateDirectory)/library_aesni$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_aesni$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_aesni$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/aesni.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_aesni$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/aesni.c

$(IntermediateDirectory)/library_aria$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/aria.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/aria.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_aria$(ObjectSuffix) -MF$(IntermediateDirectory)/library_aria$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_aria$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_aria$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/aria.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_aria$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/aria.c

$(IntermediateDirectory)/library_asn1parse$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/asn1parse.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/asn1parse.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_asn1parse$(ObjectSuffix) -MF$(IntermediateDirectory)/library_asn1parse$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_asn1parse$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_asn1parse$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/asn1parse.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_asn1parse$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/asn1parse.c

$(IntermediateDirectory)/library_asn1write$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/asn1write.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/asn1write.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_asn1write$(ObjectSuffix) -MF$(IntermediateDirectory)/library_asn1write$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_asn1write$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_asn1write$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/asn1write.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_asn1write$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/asn1write.c

$(IntermediateDirectory)/library_base64$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/base64.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/base64.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_base64$(ObjectSuffix) -MF$(IntermediateDirectory)/library_base64$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_base64$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_base64$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/base64.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_base64$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/base64.c

$(IntermediateDirectory)/library_bignum$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/bignum.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/bignum.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_bignum$(ObjectSuffix) -MF$(IntermediateDirectory)/library_bignum$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_bignum$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_bignum$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/bignum.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_bignum$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/bignum.c

$(IntermediateDirectory)/library_bignum_core$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/bignum_core.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/bignum_core.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_bignum_core$(ObjectSuffix) -MF$(IntermediateDirectory)/library_bignum_core$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_bignum_core$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_bignum_core$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/bignum_core.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_bignum_core$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/bignum_core.c

$(IntermediateDirectory)/library_bignum_mod$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/bignum_mod.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/bignum_mod.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_bignum_mod$(ObjectSuffix) -MF$(IntermediateDirectory)/library_bignum_mod$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_bignum_mod$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_bignum_mod$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/bignum_mod.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_bignum_mod$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/bignum_mod.c

$(IntermediateDirectory)/library_bignum_mod_raw$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/bignum_mod_raw.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/bignum_mod_raw.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_bignum_mod_raw$(ObjectSuffix) -MF$(IntermediateDirectory)/library_bignum_mod_raw$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_bignum_mod_raw$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_bignum_mod_raw$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/bignum_mod_raw.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_bignum_mod_raw$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/bignum_mod_raw.c

$(IntermediateDirectory)/library_camellia$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/camellia.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/camellia.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_camellia$(ObjectSuffix) -MF$(IntermediateDirectory)/library_camellia$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_camellia$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_camellia$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/camellia.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_camellia$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/camellia.c

$(IntermediateDirectory)/library_ccm$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/ccm.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/ccm.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_ccm$(ObjectSuffix) -MF$(IntermediateDirectory)/library_ccm$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_ccm$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_ccm$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/ccm.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_ccm$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/ccm.c

$(IntermediateDirectory)/library_chacha20$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/chacha20.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/chacha20.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_chacha20$(ObjectSuffix) -MF$(IntermediateDirectory)/library_chacha20$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_chacha20$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_chacha20$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/chacha20.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_chacha20$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/chacha20.c

$(IntermediateDirectory)/library_chachapoly$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/chachapoly.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/chachapoly.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_chachapoly$(ObjectSuffix) -MF$(IntermediateDirectory)/library_chachapoly$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_chachapoly$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_chachapoly$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/chachapoly.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_chachapoly$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/chachapoly.c

$(IntermediateDirectory)/library_cipher$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/cipher.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/cipher.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_cipher$(ObjectSuffix) -MF$(IntermediateDirectory)/library_cipher$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_cipher$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_cipher$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/cipher.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_cipher$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/cipher.c

$(IntermediateDirectory)/library_cipher_wrap$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/cipher_wrap.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/cipher_wrap.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_cipher_wrap$(ObjectSuffix) -MF$(IntermediateDirectory)/library_cipher_wrap$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_cipher_wrap$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_cipher_wrap$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/cipher_wrap.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_cipher_wrap$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/cipher_wrap.c

$(IntermediateDirectory)/library_cmac$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/cmac.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/cmac.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_cmac$(ObjectSuffix) -MF$(IntermediateDirectory)/library_cmac$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_cmac$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_cmac$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/cmac.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_cmac$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/cmac.c

$(IntermediateDirectory)/library_constant_time$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/constant_time.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/constant_time.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_constant_time$(ObjectSuffix) -MF$(IntermediateDirectory)/library_constant_time$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_constant_time$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_constant_time$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/constant_time.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_constant_time$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/constant_time.c

$(IntermediateDirectory)/library_ctr_drbg$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/ctr_drbg.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/ctr_drbg.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_ctr_drbg$(ObjectSuffix) -MF$(IntermediateDirectory)/library_ctr_drbg$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_ctr_drbg$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_ctr_drbg$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/ctr_drbg.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_ctr_drbg$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/ctr_drbg.c

$(IntermediateDirectory)/library_debug$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/debug.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/debug.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_debug$(ObjectSuffix) -MF$(IntermediateDirectory)/library_debug$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_debug$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_debug$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/debug.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_debug$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/debug.c

$(IntermediateDirectory)/library_des$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/des.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/des.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_des$(ObjectSuffix) -MF$(IntermediateDirectory)/library_des$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_des$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_des$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/des.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_des$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/des.c

$(IntermediateDirectory)/library_dhm$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/dhm.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/dhm.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_dhm$(ObjectSuffix) -MF$(IntermediateDirectory)/library_dhm$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_dhm$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_dhm$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/dhm.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_dhm$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/dhm.c

$(IntermediateDirectory)/library_ecdh$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/ecdh.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/ecdh.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_ecdh$(ObjectSuffix) -MF$(IntermediateDirectory)/library_ecdh$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_ecdh$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_ecdh$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/ecdh.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_ecdh$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/ecdh.c

$(IntermediateDirectory)/library_ecdsa$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/ecdsa.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/ecdsa.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_ecdsa$(ObjectSuffix) -MF$(IntermediateDirectory)/library_ecdsa$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_ecdsa$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_ecdsa$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/ecdsa.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_ecdsa$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/ecdsa.c

$(IntermediateDirectory)/library_ecjpake$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/ecjpake.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/ecjpake.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_ecjpake$(ObjectSuffix) -MF$(IntermediateDirectory)/library_ecjpake$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_ecjpake$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_ecjpake$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/ecjpake.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_ecjpake$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/ecjpake.c

$(IntermediateDirectory)/library_ecp$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/ecp.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/ecp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_ecp$(ObjectSuffix) -MF$(IntermediateDirectory)/library_ecp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_ecp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_ecp$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/ecp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_ecp$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/ecp.c

$(IntermediateDirectory)/library_ecp_curves$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/ecp_curves.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/ecp_curves.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_ecp_curves$(ObjectSuffix) -MF$(IntermediateDirectory)/library_ecp_curves$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_ecp_curves$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_ecp_curves$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/ecp_curves.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_ecp_curves$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/ecp_curves.c

$(IntermediateDirectory)/library_entropy$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/entropy.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/entropy.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_entropy$(ObjectSuffix) -MF$(IntermediateDirectory)/library_entropy$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_entropy$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_entropy$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/entropy.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_entropy$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/entropy.c

$(IntermediateDirectory)/library_entropy_hwpoll$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/entropy_hwpoll.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/entropy_hwpoll.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_entropy_hwpoll$(ObjectSuffix) -MF$(IntermediateDirectory)/library_entropy_hwpoll$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_entropy_hwpoll$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_entropy_hwpoll$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/entropy_hwpoll.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_entropy_hwpoll$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/entropy_hwpoll.c

$(IntermediateDirectory)/library_entropy_poll$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/entropy_poll.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/entropy_poll.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_entropy_poll$(ObjectSuffix) -MF$(IntermediateDirectory)/library_entropy_poll$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_entropy_poll$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_entropy_poll$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/entropy_poll.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_entropy_poll$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/entropy_poll.c

$(IntermediateDirectory)/library_error$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/error.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/error.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_error$(ObjectSuffix) -MF$(IntermediateDirectory)/library_error$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_error$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_error$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/error.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_error$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/error.c

$(IntermediateDirectory)/library_gcm$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/gcm.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/gcm.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_gcm$(ObjectSuffix) -MF$(IntermediateDirectory)/library_gcm$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_gcm$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_gcm$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/gcm.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_gcm$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/gcm.c

$(IntermediateDirectory)/library_hash_info$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/hash_info.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/hash_info.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_hash_info$(ObjectSuffix) -MF$(IntermediateDirectory)/library_hash_info$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_hash_info$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_hash_info$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/hash_info.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_hash_info$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/hash_info.c

$(IntermediateDirectory)/library_hkdf$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/hkdf.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/hkdf.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_hkdf$(ObjectSuffix) -MF$(IntermediateDirectory)/library_hkdf$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_hkdf$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_hkdf$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/hkdf.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_hkdf$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/hkdf.c

$(IntermediateDirectory)/library_hmac_drbg$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/hmac_drbg.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/hmac_drbg.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_hmac_drbg$(ObjectSuffix) -MF$(IntermediateDirectory)/library_hmac_drbg$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_hmac_drbg$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_hmac_drbg$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/hmac_drbg.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_hmac_drbg$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/hmac_drbg.c

$(IntermediateDirectory)/library_lmots$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/lmots.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/lmots.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_lmots$(ObjectSuffix) -MF$(IntermediateDirectory)/library_lmots$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_lmots$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_lmots$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/lmots.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_lmots$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/lmots.c

$(IntermediateDirectory)/library_lms$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/lms.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/lms.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_lms$(ObjectSuffix) -MF$(IntermediateDirectory)/library_lms$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_lms$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_lms$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/lms.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_lms$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/lms.c

$(IntermediateDirectory)/library_md$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/md.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/md.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_md$(ObjectSuffix) -MF$(IntermediateDirectory)/library_md$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_md$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_md$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/md.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_md$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/md.c

$(IntermediateDirectory)/library_md5$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/md5.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/md5.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_md5$(ObjectSuffix) -MF$(IntermediateDirectory)/library_md5$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_md5$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_md5$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/md5.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_md5$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/md5.c

$(IntermediateDirectory)/library_memory_buffer_alloc$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/memory_buffer_alloc.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/memory_buffer_alloc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_memory_buffer_alloc$(ObjectSuffix) -MF$(IntermediateDirectory)/library_memory_buffer_alloc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_memory_buffer_alloc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_memory_buffer_alloc$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/memory_buffer_alloc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_memory_buffer_alloc$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/memory_buffer_alloc.c

$(IntermediateDirectory)/library_mps_reader$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/mps_reader.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/mps_reader.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_mps_reader$(ObjectSuffix) -MF$(IntermediateDirectory)/library_mps_reader$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_mps_reader$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_mps_reader$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/mps_reader.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_mps_reader$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/mps_reader.c

$(IntermediateDirectory)/library_mps_trace$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/mps_trace.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/mps_trace.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_mps_trace$(ObjectSuffix) -MF$(IntermediateDirectory)/library_mps_trace$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_mps_trace$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_mps_trace$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/mps_trace.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_mps_trace$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/mps_trace.c

$(IntermediateDirectory)/library_net_sockets$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/net_sockets.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/net_sockets.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_net_sockets$(ObjectSuffix) -MF$(IntermediateDirectory)/library_net_sockets$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_net_sockets$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_net_sockets$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/net_sockets.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_net_sockets$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/net_sockets.c

$(IntermediateDirectory)/library_nist_kw$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/nist_kw.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/nist_kw.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_nist_kw$(ObjectSuffix) -MF$(IntermediateDirectory)/library_nist_kw$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_nist_kw$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_nist_kw$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/nist_kw.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_nist_kw$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/nist_kw.c

$(IntermediateDirectory)/library_oid$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/oid.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/oid.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_oid$(ObjectSuffix) -MF$(IntermediateDirectory)/library_oid$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_oid$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_oid$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/oid.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_oid$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/oid.c

$(IntermediateDirectory)/library_padlock$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/padlock.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/padlock.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_padlock$(ObjectSuffix) -MF$(IntermediateDirectory)/library_padlock$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_padlock$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_padlock$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/padlock.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_padlock$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/padlock.c

$(IntermediateDirectory)/library_pem$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/pem.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/pem.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_pem$(ObjectSuffix) -MF$(IntermediateDirectory)/library_pem$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_pem$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_pem$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/pem.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_pem$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/pem.c

$(IntermediateDirectory)/library_pk$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/pk.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/pk.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_pk$(ObjectSuffix) -MF$(IntermediateDirectory)/library_pk$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_pk$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_pk$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/pk.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_pk$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/pk.c

$(IntermediateDirectory)/library_pkcs12$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/pkcs12.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/pkcs12.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_pkcs12$(ObjectSuffix) -MF$(IntermediateDirectory)/library_pkcs12$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_pkcs12$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_pkcs12$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/pkcs12.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_pkcs12$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/pkcs12.c

$(IntermediateDirectory)/library_pkcs5$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/pkcs5.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/pkcs5.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_pkcs5$(ObjectSuffix) -MF$(IntermediateDirectory)/library_pkcs5$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_pkcs5$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_pkcs5$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/pkcs5.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_pkcs5$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/pkcs5.c

$(IntermediateDirectory)/library_pkcs7$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/pkcs7.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/pkcs7.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_pkcs7$(ObjectSuffix) -MF$(IntermediateDirectory)/library_pkcs7$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_pkcs7$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_pkcs7$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/pkcs7.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_pkcs7$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/pkcs7.c

$(IntermediateDirectory)/library_pkparse$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/pkparse.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/pkparse.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_pkparse$(ObjectSuffix) -MF$(IntermediateDirectory)/library_pkparse$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_pkparse$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_pkparse$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/pkparse.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_pkparse$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/pkparse.c

$(IntermediateDirectory)/library_pkwrite$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/pkwrite.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/pkwrite.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_pkwrite$(ObjectSuffix) -MF$(IntermediateDirectory)/library_pkwrite$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_pkwrite$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_pkwrite$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/pkwrite.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_pkwrite$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/pkwrite.c

$(IntermediateDirectory)/library_pk_wrap$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/pk_wrap.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/pk_wrap.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_pk_wrap$(ObjectSuffix) -MF$(IntermediateDirectory)/library_pk_wrap$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_pk_wrap$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_pk_wrap$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/pk_wrap.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_pk_wrap$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/pk_wrap.c

$(IntermediateDirectory)/library_platform$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/platform.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/platform.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_platform$(ObjectSuffix) -MF$(IntermediateDirectory)/library_platform$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_platform$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_platform$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/platform.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_platform$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/platform.c

$(IntermediateDirectory)/library_platform_util$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/platform_util.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/platform_util.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_platform_util$(ObjectSuffix) -MF$(IntermediateDirectory)/library_platform_util$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_platform_util$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_platform_util$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/platform_util.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_platform_util$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/platform_util.c

$(IntermediateDirectory)/library_poly1305$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/poly1305.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/poly1305.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_poly1305$(ObjectSuffix) -MF$(IntermediateDirectory)/library_poly1305$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_poly1305$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_poly1305$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/poly1305.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_poly1305$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/poly1305.c

$(IntermediateDirectory)/library_psa_crypto$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/psa_crypto.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/psa_crypto.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_psa_crypto$(ObjectSuffix) -MF$(IntermediateDirectory)/library_psa_crypto$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_psa_crypto$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_psa_crypto$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/psa_crypto.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_psa_crypto$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/psa_crypto.c

$(IntermediateDirectory)/library_psa_crypto_aead$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/psa_crypto_aead.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/psa_crypto_aead.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_psa_crypto_aead$(ObjectSuffix) -MF$(IntermediateDirectory)/library_psa_crypto_aead$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_psa_crypto_aead$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_psa_crypto_aead$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/psa_crypto_aead.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_psa_crypto_aead$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/psa_crypto_aead.c

$(IntermediateDirectory)/library_psa_crypto_cipher$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/psa_crypto_cipher.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/psa_crypto_cipher.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_psa_crypto_cipher$(ObjectSuffix) -MF$(IntermediateDirectory)/library_psa_crypto_cipher$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_psa_crypto_cipher$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_psa_crypto_cipher$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/psa_crypto_cipher.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_psa_crypto_cipher$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/psa_crypto_cipher.c

$(IntermediateDirectory)/library_psa_crypto_client$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/psa_crypto_client.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/psa_crypto_client.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_psa_crypto_client$(ObjectSuffix) -MF$(IntermediateDirectory)/library_psa_crypto_client$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_psa_crypto_client$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_psa_crypto_client$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/psa_crypto_client.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_psa_crypto_client$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/psa_crypto_client.c

$(IntermediateDirectory)/library_psa_crypto_driver_wrappers$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/psa_crypto_driver_wrappers.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/psa_crypto_driver_wrappers.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_psa_crypto_driver_wrappers$(ObjectSuffix) -MF$(IntermediateDirectory)/library_psa_crypto_driver_wrappers$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_psa_crypto_driver_wrappers$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_psa_crypto_driver_wrappers$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/psa_crypto_driver_wrappers.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_psa_crypto_driver_wrappers$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/psa_crypto_driver_wrappers.c

$(IntermediateDirectory)/library_psa_crypto_ecp$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/psa_crypto_ecp.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/psa_crypto_ecp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_psa_crypto_ecp$(ObjectSuffix) -MF$(IntermediateDirectory)/library_psa_crypto_ecp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_psa_crypto_ecp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_psa_crypto_ecp$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/psa_crypto_ecp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_psa_crypto_ecp$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/psa_crypto_ecp.c

$(IntermediateDirectory)/library_psa_crypto_hash$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/psa_crypto_hash.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/psa_crypto_hash.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_psa_crypto_hash$(ObjectSuffix) -MF$(IntermediateDirectory)/library_psa_crypto_hash$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_psa_crypto_hash$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_psa_crypto_hash$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/psa_crypto_hash.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_psa_crypto_hash$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/psa_crypto_hash.c

$(IntermediateDirectory)/library_psa_crypto_mac$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/psa_crypto_mac.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/psa_crypto_mac.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_psa_crypto_mac$(ObjectSuffix) -MF$(IntermediateDirectory)/library_psa_crypto_mac$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_psa_crypto_mac$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_psa_crypto_mac$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/psa_crypto_mac.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_psa_crypto_mac$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/psa_crypto_mac.c

$(IntermediateDirectory)/library_psa_crypto_pake$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/psa_crypto_pake.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/psa_crypto_pake.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_psa_crypto_pake$(ObjectSuffix) -MF$(IntermediateDirectory)/library_psa_crypto_pake$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_psa_crypto_pake$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_psa_crypto_pake$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/psa_crypto_pake.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_psa_crypto_pake$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/psa_crypto_pake.c

$(IntermediateDirectory)/library_psa_crypto_rsa$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/psa_crypto_rsa.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/psa_crypto_rsa.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_psa_crypto_rsa$(ObjectSuffix) -MF$(IntermediateDirectory)/library_psa_crypto_rsa$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_psa_crypto_rsa$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_psa_crypto_rsa$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/psa_crypto_rsa.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_psa_crypto_rsa$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/psa_crypto_rsa.c

$(IntermediateDirectory)/library_psa_crypto_se$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/psa_crypto_se.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/psa_crypto_se.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_psa_crypto_se$(ObjectSuffix) -MF$(IntermediateDirectory)/library_psa_crypto_se$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_psa_crypto_se$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_psa_crypto_se$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/psa_crypto_se.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_psa_crypto_se$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/psa_crypto_se.c

$(IntermediateDirectory)/library_psa_crypto_slot_management$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/psa_crypto_slot_management.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/psa_crypto_slot_management.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_psa_crypto_slot_management$(ObjectSuffix) -MF$(IntermediateDirectory)/library_psa_crypto_slot_management$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_psa_crypto_slot_management$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_psa_crypto_slot_management$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/psa_crypto_slot_management.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_psa_crypto_slot_management$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/psa_crypto_slot_management.c

$(IntermediateDirectory)/library_psa_crypto_storage$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/psa_crypto_storage.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/psa_crypto_storage.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_psa_crypto_storage$(ObjectSuffix) -MF$(IntermediateDirectory)/library_psa_crypto_storage$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_psa_crypto_storage$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_psa_crypto_storage$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/psa_crypto_storage.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_psa_crypto_storage$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/psa_crypto_storage.c

$(IntermediateDirectory)/library_psa_its_file$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/psa_its_file.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/psa_its_file.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_psa_its_file$(ObjectSuffix) -MF$(IntermediateDirectory)/library_psa_its_file$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_psa_its_file$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_psa_its_file$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/psa_its_file.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_psa_its_file$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/psa_its_file.c

$(IntermediateDirectory)/library_psa_util$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/psa_util.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/psa_util.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_psa_util$(ObjectSuffix) -MF$(IntermediateDirectory)/library_psa_util$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_psa_util$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_psa_util$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/psa_util.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_psa_util$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/psa_util.c

$(IntermediateDirectory)/library_ripemd160$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/ripemd160.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/ripemd160.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_ripemd160$(ObjectSuffix) -MF$(IntermediateDirectory)/library_ripemd160$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_ripemd160$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_ripemd160$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/ripemd160.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_ripemd160$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/ripemd160.c

$(IntermediateDirectory)/library_rsa$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/rsa.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/rsa.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_rsa$(ObjectSuffix) -MF$(IntermediateDirectory)/library_rsa$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_rsa$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_rsa$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/rsa.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_rsa$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/rsa.c

$(IntermediateDirectory)/library_rsa_alt_helpers$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/rsa_alt_helpers.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/rsa_alt_helpers.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_rsa_alt_helpers$(ObjectSuffix) -MF$(IntermediateDirectory)/library_rsa_alt_helpers$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_rsa_alt_helpers$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_rsa_alt_helpers$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/rsa_alt_helpers.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_rsa_alt_helpers$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/rsa_alt_helpers.c

$(IntermediateDirectory)/library_sha1$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/sha1.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/sha1.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_sha1$(ObjectSuffix) -MF$(IntermediateDirectory)/library_sha1$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_sha1$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_sha1$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/sha1.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_sha1$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/sha1.c

$(IntermediateDirectory)/library_sha256$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/sha256.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/sha256.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_sha256$(ObjectSuffix) -MF$(IntermediateDirectory)/library_sha256$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_sha256$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_sha256$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/sha256.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_sha256$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/sha256.c

$(IntermediateDirectory)/library_sha512$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/sha512.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/sha512.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_sha512$(ObjectSuffix) -MF$(IntermediateDirectory)/library_sha512$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_sha512$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_sha512$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/sha512.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_sha512$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/sha512.c

$(IntermediateDirectory)/library_ssl_cache$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/ssl_cache.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/ssl_cache.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_ssl_cache$(ObjectSuffix) -MF$(IntermediateDirectory)/library_ssl_cache$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_ssl_cache$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_ssl_cache$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/ssl_cache.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_ssl_cache$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/ssl_cache.c

$(IntermediateDirectory)/library_ssl_ciphersuites$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/ssl_ciphersuites.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/ssl_ciphersuites.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_ssl_ciphersuites$(ObjectSuffix) -MF$(IntermediateDirectory)/library_ssl_ciphersuites$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_ssl_ciphersuites$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_ssl_ciphersuites$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/ssl_ciphersuites.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_ssl_ciphersuites$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/ssl_ciphersuites.c

$(IntermediateDirectory)/library_ssl_client$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/ssl_client.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/ssl_client.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_ssl_client$(ObjectSuffix) -MF$(IntermediateDirectory)/library_ssl_client$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_ssl_client$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_ssl_client$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/ssl_client.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_ssl_client$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/ssl_client.c

$(IntermediateDirectory)/library_ssl_cookie$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/ssl_cookie.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/ssl_cookie.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_ssl_cookie$(ObjectSuffix) -MF$(IntermediateDirectory)/library_ssl_cookie$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_ssl_cookie$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_ssl_cookie$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/ssl_cookie.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_ssl_cookie$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/ssl_cookie.c

$(IntermediateDirectory)/library_ssl_debug_helpers_generated$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/ssl_debug_helpers_generated.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/ssl_debug_helpers_generated.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_ssl_debug_helpers_generated$(ObjectSuffix) -MF$(IntermediateDirectory)/library_ssl_debug_helpers_generated$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_ssl_debug_helpers_generated$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_ssl_debug_helpers_generated$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/ssl_debug_helpers_generated.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_ssl_debug_helpers_generated$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/ssl_debug_helpers_generated.c

$(IntermediateDirectory)/library_ssl_msg$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/ssl_msg.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/ssl_msg.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_ssl_msg$(ObjectSuffix) -MF$(IntermediateDirectory)/library_ssl_msg$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_ssl_msg$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_ssl_msg$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/ssl_msg.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_ssl_msg$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/ssl_msg.c

$(IntermediateDirectory)/library_ssl_ticket$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/ssl_ticket.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/ssl_ticket.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_ssl_ticket$(ObjectSuffix) -MF$(IntermediateDirectory)/library_ssl_ticket$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_ssl_ticket$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_ssl_ticket$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/ssl_ticket.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_ssl_ticket$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/ssl_ticket.c

$(IntermediateDirectory)/library_ssl_tls$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/ssl_tls.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/ssl_tls.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_ssl_tls$(ObjectSuffix) -MF$(IntermediateDirectory)/library_ssl_tls$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_ssl_tls$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_ssl_tls$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/ssl_tls.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_ssl_tls$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/ssl_tls.c

$(IntermediateDirectory)/library_ssl_tls12_client$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/ssl_tls12_client.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/ssl_tls12_client.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_ssl_tls12_client$(ObjectSuffix) -MF$(IntermediateDirectory)/library_ssl_tls12_client$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_ssl_tls12_client$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_ssl_tls12_client$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/ssl_tls12_client.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_ssl_tls12_client$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/ssl_tls12_client.c

$(IntermediateDirectory)/library_ssl_tls12_server$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/ssl_tls12_server.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/ssl_tls12_server.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_ssl_tls12_server$(ObjectSuffix) -MF$(IntermediateDirectory)/library_ssl_tls12_server$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_ssl_tls12_server$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_ssl_tls12_server$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/ssl_tls12_server.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_ssl_tls12_server$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/ssl_tls12_server.c

$(IntermediateDirectory)/library_ssl_tls13_client$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/ssl_tls13_client.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/ssl_tls13_client.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_ssl_tls13_client$(ObjectSuffix) -MF$(IntermediateDirectory)/library_ssl_tls13_client$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_ssl_tls13_client$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_ssl_tls13_client$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/ssl_tls13_client.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_ssl_tls13_client$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/ssl_tls13_client.c

$(IntermediateDirectory)/library_ssl_tls13_generic$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/ssl_tls13_generic.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/ssl_tls13_generic.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_ssl_tls13_generic$(ObjectSuffix) -MF$(IntermediateDirectory)/library_ssl_tls13_generic$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_ssl_tls13_generic$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_ssl_tls13_generic$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/ssl_tls13_generic.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_ssl_tls13_generic$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/ssl_tls13_generic.c

$(IntermediateDirectory)/library_ssl_tls13_keys$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/ssl_tls13_keys.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/ssl_tls13_keys.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_ssl_tls13_keys$(ObjectSuffix) -MF$(IntermediateDirectory)/library_ssl_tls13_keys$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_ssl_tls13_keys$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_ssl_tls13_keys$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/ssl_tls13_keys.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_ssl_tls13_keys$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/ssl_tls13_keys.c

$(IntermediateDirectory)/library_ssl_tls13_server$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/ssl_tls13_server.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/ssl_tls13_server.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_ssl_tls13_server$(ObjectSuffix) -MF$(IntermediateDirectory)/library_ssl_tls13_server$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_ssl_tls13_server$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_ssl_tls13_server$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/ssl_tls13_server.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_ssl_tls13_server$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/ssl_tls13_server.c

$(IntermediateDirectory)/library_threading$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/threading.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/threading.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_threading$(ObjectSuffix) -MF$(IntermediateDirectory)/library_threading$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_threading$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_threading$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/threading.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_threading$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/threading.c

$(IntermediateDirectory)/library_timing$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/timing.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/timing.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_timing$(ObjectSuffix) -MF$(IntermediateDirectory)/library_timing$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_timing$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_timing$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/timing.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_timing$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/timing.c

$(IntermediateDirectory)/library_version$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/version.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/version.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_version$(ObjectSuffix) -MF$(IntermediateDirectory)/library_version$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_version$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_version$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/version.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_version$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/version.c

$(IntermediateDirectory)/library_version_features$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/version_features.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/version_features.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_version_features$(ObjectSuffix) -MF$(IntermediateDirectory)/library_version_features$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_version_features$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_version_features$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/version_features.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_version_features$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/version_features.c

$(IntermediateDirectory)/library_x509$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/x509.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/x509.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_x509$(ObjectSuffix) -MF$(IntermediateDirectory)/library_x509$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_x509$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_x509$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/x509.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_x509$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/x509.c

$(IntermediateDirectory)/library_x509write_crt$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/x509write_crt.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/x509write_crt.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_x509write_crt$(ObjectSuffix) -MF$(IntermediateDirectory)/library_x509write_crt$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_x509write_crt$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_x509write_crt$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/x509write_crt.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_x509write_crt$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/x509write_crt.c

$(IntermediateDirectory)/library_x509write_csr$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/x509write_csr.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/x509write_csr.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_x509write_csr$(ObjectSuffix) -MF$(IntermediateDirectory)/library_x509write_csr$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_x509write_csr$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_x509write_csr$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/x509write_csr.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_x509write_csr$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/x509write_csr.c

$(IntermediateDirectory)/library_x509_create$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/x509_create.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/x509_create.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_x509_create$(ObjectSuffix) -MF$(IntermediateDirectory)/library_x509_create$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_x509_create$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_x509_create$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/x509_create.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_x509_create$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/x509_create.c

$(IntermediateDirectory)/library_x509_crl$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/x509_crl.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/x509_crl.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_x509_crl$(ObjectSuffix) -MF$(IntermediateDirectory)/library_x509_crl$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_x509_crl$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_x509_crl$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/x509_crl.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_x509_crl$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/x509_crl.c

$(IntermediateDirectory)/library_x509_crt$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/x509_crt.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/x509_crt.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_x509_crt$(ObjectSuffix) -MF$(IntermediateDirectory)/library_x509_crt$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_x509_crt$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_x509_crt$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/x509_crt.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_x509_crt$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/x509_crt.c

$(IntermediateDirectory)/library_x509_csr$(ObjectSuffix): ../sdk/lib/crypto/mbedtls/library/x509_csr.c  
	$(CC) $(SourceSwitch) ../sdk/lib/crypto/mbedtls/library/x509_csr.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/library_x509_csr$(ObjectSuffix) -MF$(IntermediateDirectory)/library_x509_csr$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/library_x509_csr$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/library_x509_csr$(PreprocessSuffix): ../sdk/lib/crypto/mbedtls/library/x509_csr.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/library_x509_csr$(PreprocessSuffix) ../sdk/lib/crypto/mbedtls/library/x509_csr.c

$(IntermediateDirectory)/benchmark_lv_demo_benchmark$(ObjectSuffix): ../sdk/lib/lvgl/demos/benchmark/lv_demo_benchmark.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/benchmark/lv_demo_benchmark.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/benchmark_lv_demo_benchmark$(ObjectSuffix) -MF$(IntermediateDirectory)/benchmark_lv_demo_benchmark$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/benchmark_lv_demo_benchmark$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/benchmark_lv_demo_benchmark$(PreprocessSuffix): ../sdk/lib/lvgl/demos/benchmark/lv_demo_benchmark.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/benchmark_lv_demo_benchmark$(PreprocessSuffix) ../sdk/lib/lvgl/demos/benchmark/lv_demo_benchmark.c

$(IntermediateDirectory)/keypad_encoder_lv_demo_keypad_encoder$(ObjectSuffix): ../sdk/lib/lvgl/demos/keypad_encoder/lv_demo_keypad_encoder.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/keypad_encoder/lv_demo_keypad_encoder.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/keypad_encoder_lv_demo_keypad_encoder$(ObjectSuffix) -MF$(IntermediateDirectory)/keypad_encoder_lv_demo_keypad_encoder$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/keypad_encoder_lv_demo_keypad_encoder$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/keypad_encoder_lv_demo_keypad_encoder$(PreprocessSuffix): ../sdk/lib/lvgl/demos/keypad_encoder/lv_demo_keypad_encoder.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/keypad_encoder_lv_demo_keypad_encoder$(PreprocessSuffix) ../sdk/lib/lvgl/demos/keypad_encoder/lv_demo_keypad_encoder.c

$(IntermediateDirectory)/music_lv_demo_music$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/lv_demo_music.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/lv_demo_music.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/music_lv_demo_music$(ObjectSuffix) -MF$(IntermediateDirectory)/music_lv_demo_music$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/music_lv_demo_music$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/music_lv_demo_music$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/lv_demo_music.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/music_lv_demo_music$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/lv_demo_music.c

$(IntermediateDirectory)/music_lv_demo_music_list$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/lv_demo_music_list.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/lv_demo_music_list.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/music_lv_demo_music_list$(ObjectSuffix) -MF$(IntermediateDirectory)/music_lv_demo_music_list$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/music_lv_demo_music_list$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/music_lv_demo_music_list$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/lv_demo_music_list.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/music_lv_demo_music_list$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/lv_demo_music_list.c

$(IntermediateDirectory)/music_lv_demo_music_main$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/lv_demo_music_main.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/lv_demo_music_main.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/music_lv_demo_music_main$(ObjectSuffix) -MF$(IntermediateDirectory)/music_lv_demo_music_main$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/music_lv_demo_music_main$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/music_lv_demo_music_main$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/lv_demo_music_main.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/music_lv_demo_music_main$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/lv_demo_music_main.c

$(IntermediateDirectory)/stress_lv_demo_stress$(ObjectSuffix): ../sdk/lib/lvgl/demos/stress/lv_demo_stress.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/stress/lv_demo_stress.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/stress_lv_demo_stress$(ObjectSuffix) -MF$(IntermediateDirectory)/stress_lv_demo_stress$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/stress_lv_demo_stress$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/stress_lv_demo_stress$(PreprocessSuffix): ../sdk/lib/lvgl/demos/stress/lv_demo_stress.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/stress_lv_demo_stress$(PreprocessSuffix) ../sdk/lib/lvgl/demos/stress/lv_demo_stress.c

$(IntermediateDirectory)/core_lv_disp$(ObjectSuffix): ../sdk/lib/lvgl/src/core/lv_disp.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/core/lv_disp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_lv_disp$(ObjectSuffix) -MF$(IntermediateDirectory)/core_lv_disp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_lv_disp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_lv_disp$(PreprocessSuffix): ../sdk/lib/lvgl/src/core/lv_disp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_lv_disp$(PreprocessSuffix) ../sdk/lib/lvgl/src/core/lv_disp.c

$(IntermediateDirectory)/core_lv_event$(ObjectSuffix): ../sdk/lib/lvgl/src/core/lv_event.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/core/lv_event.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_lv_event$(ObjectSuffix) -MF$(IntermediateDirectory)/core_lv_event$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_lv_event$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_lv_event$(PreprocessSuffix): ../sdk/lib/lvgl/src/core/lv_event.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_lv_event$(PreprocessSuffix) ../sdk/lib/lvgl/src/core/lv_event.c

$(IntermediateDirectory)/core_lv_group$(ObjectSuffix): ../sdk/lib/lvgl/src/core/lv_group.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/core/lv_group.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_lv_group$(ObjectSuffix) -MF$(IntermediateDirectory)/core_lv_group$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_lv_group$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_lv_group$(PreprocessSuffix): ../sdk/lib/lvgl/src/core/lv_group.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_lv_group$(PreprocessSuffix) ../sdk/lib/lvgl/src/core/lv_group.c

$(IntermediateDirectory)/core_lv_indev$(ObjectSuffix): ../sdk/lib/lvgl/src/core/lv_indev.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/core/lv_indev.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_lv_indev$(ObjectSuffix) -MF$(IntermediateDirectory)/core_lv_indev$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_lv_indev$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_lv_indev$(PreprocessSuffix): ../sdk/lib/lvgl/src/core/lv_indev.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_lv_indev$(PreprocessSuffix) ../sdk/lib/lvgl/src/core/lv_indev.c

$(IntermediateDirectory)/core_lv_indev_scroll$(ObjectSuffix): ../sdk/lib/lvgl/src/core/lv_indev_scroll.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/core/lv_indev_scroll.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_lv_indev_scroll$(ObjectSuffix) -MF$(IntermediateDirectory)/core_lv_indev_scroll$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_lv_indev_scroll$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_lv_indev_scroll$(PreprocessSuffix): ../sdk/lib/lvgl/src/core/lv_indev_scroll.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_lv_indev_scroll$(PreprocessSuffix) ../sdk/lib/lvgl/src/core/lv_indev_scroll.c

$(IntermediateDirectory)/core_lv_obj$(ObjectSuffix): ../sdk/lib/lvgl/src/core/lv_obj.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/core/lv_obj.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_lv_obj$(ObjectSuffix) -MF$(IntermediateDirectory)/core_lv_obj$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_lv_obj$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_lv_obj$(PreprocessSuffix): ../sdk/lib/lvgl/src/core/lv_obj.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_lv_obj$(PreprocessSuffix) ../sdk/lib/lvgl/src/core/lv_obj.c

$(IntermediateDirectory)/core_lv_obj_class$(ObjectSuffix): ../sdk/lib/lvgl/src/core/lv_obj_class.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/core/lv_obj_class.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_lv_obj_class$(ObjectSuffix) -MF$(IntermediateDirectory)/core_lv_obj_class$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_lv_obj_class$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_lv_obj_class$(PreprocessSuffix): ../sdk/lib/lvgl/src/core/lv_obj_class.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_lv_obj_class$(PreprocessSuffix) ../sdk/lib/lvgl/src/core/lv_obj_class.c

$(IntermediateDirectory)/core_lv_obj_draw$(ObjectSuffix): ../sdk/lib/lvgl/src/core/lv_obj_draw.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/core/lv_obj_draw.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_lv_obj_draw$(ObjectSuffix) -MF$(IntermediateDirectory)/core_lv_obj_draw$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_lv_obj_draw$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_lv_obj_draw$(PreprocessSuffix): ../sdk/lib/lvgl/src/core/lv_obj_draw.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_lv_obj_draw$(PreprocessSuffix) ../sdk/lib/lvgl/src/core/lv_obj_draw.c

$(IntermediateDirectory)/core_lv_obj_pos$(ObjectSuffix): ../sdk/lib/lvgl/src/core/lv_obj_pos.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/core/lv_obj_pos.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_lv_obj_pos$(ObjectSuffix) -MF$(IntermediateDirectory)/core_lv_obj_pos$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_lv_obj_pos$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_lv_obj_pos$(PreprocessSuffix): ../sdk/lib/lvgl/src/core/lv_obj_pos.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_lv_obj_pos$(PreprocessSuffix) ../sdk/lib/lvgl/src/core/lv_obj_pos.c

$(IntermediateDirectory)/core_lv_obj_scroll$(ObjectSuffix): ../sdk/lib/lvgl/src/core/lv_obj_scroll.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/core/lv_obj_scroll.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_lv_obj_scroll$(ObjectSuffix) -MF$(IntermediateDirectory)/core_lv_obj_scroll$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_lv_obj_scroll$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_lv_obj_scroll$(PreprocessSuffix): ../sdk/lib/lvgl/src/core/lv_obj_scroll.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_lv_obj_scroll$(PreprocessSuffix) ../sdk/lib/lvgl/src/core/lv_obj_scroll.c

$(IntermediateDirectory)/core_lv_obj_style$(ObjectSuffix): ../sdk/lib/lvgl/src/core/lv_obj_style.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/core/lv_obj_style.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_lv_obj_style$(ObjectSuffix) -MF$(IntermediateDirectory)/core_lv_obj_style$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_lv_obj_style$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_lv_obj_style$(PreprocessSuffix): ../sdk/lib/lvgl/src/core/lv_obj_style.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_lv_obj_style$(PreprocessSuffix) ../sdk/lib/lvgl/src/core/lv_obj_style.c

$(IntermediateDirectory)/core_lv_obj_style_gen$(ObjectSuffix): ../sdk/lib/lvgl/src/core/lv_obj_style_gen.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/core/lv_obj_style_gen.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_lv_obj_style_gen$(ObjectSuffix) -MF$(IntermediateDirectory)/core_lv_obj_style_gen$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_lv_obj_style_gen$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_lv_obj_style_gen$(PreprocessSuffix): ../sdk/lib/lvgl/src/core/lv_obj_style_gen.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_lv_obj_style_gen$(PreprocessSuffix) ../sdk/lib/lvgl/src/core/lv_obj_style_gen.c

$(IntermediateDirectory)/core_lv_obj_tree$(ObjectSuffix): ../sdk/lib/lvgl/src/core/lv_obj_tree.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/core/lv_obj_tree.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_lv_obj_tree$(ObjectSuffix) -MF$(IntermediateDirectory)/core_lv_obj_tree$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_lv_obj_tree$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_lv_obj_tree$(PreprocessSuffix): ../sdk/lib/lvgl/src/core/lv_obj_tree.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_lv_obj_tree$(PreprocessSuffix) ../sdk/lib/lvgl/src/core/lv_obj_tree.c

$(IntermediateDirectory)/core_lv_refr$(ObjectSuffix): ../sdk/lib/lvgl/src/core/lv_refr.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/core/lv_refr.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_lv_refr$(ObjectSuffix) -MF$(IntermediateDirectory)/core_lv_refr$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_lv_refr$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_lv_refr$(PreprocessSuffix): ../sdk/lib/lvgl/src/core/lv_refr.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_lv_refr$(PreprocessSuffix) ../sdk/lib/lvgl/src/core/lv_refr.c

$(IntermediateDirectory)/core_lv_theme$(ObjectSuffix): ../sdk/lib/lvgl/src/core/lv_theme.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/core/lv_theme.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_lv_theme$(ObjectSuffix) -MF$(IntermediateDirectory)/core_lv_theme$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_lv_theme$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_lv_theme$(PreprocessSuffix): ../sdk/lib/lvgl/src/core/lv_theme.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_lv_theme$(PreprocessSuffix) ../sdk/lib/lvgl/src/core/lv_theme.c

$(IntermediateDirectory)/draw_lv_draw$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/lv_draw.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/lv_draw.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/draw_lv_draw$(ObjectSuffix) -MF$(IntermediateDirectory)/draw_lv_draw$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/draw_lv_draw$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/draw_lv_draw$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/lv_draw.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/draw_lv_draw$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/lv_draw.c

$(IntermediateDirectory)/draw_lv_draw_arc$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/lv_draw_arc.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/lv_draw_arc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/draw_lv_draw_arc$(ObjectSuffix) -MF$(IntermediateDirectory)/draw_lv_draw_arc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/draw_lv_draw_arc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/draw_lv_draw_arc$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/lv_draw_arc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/draw_lv_draw_arc$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/lv_draw_arc.c

$(IntermediateDirectory)/draw_lv_draw_img$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/lv_draw_img.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/lv_draw_img.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/draw_lv_draw_img$(ObjectSuffix) -MF$(IntermediateDirectory)/draw_lv_draw_img$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/draw_lv_draw_img$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/draw_lv_draw_img$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/lv_draw_img.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/draw_lv_draw_img$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/lv_draw_img.c

$(IntermediateDirectory)/draw_lv_draw_label$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/lv_draw_label.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/lv_draw_label.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/draw_lv_draw_label$(ObjectSuffix) -MF$(IntermediateDirectory)/draw_lv_draw_label$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/draw_lv_draw_label$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/draw_lv_draw_label$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/lv_draw_label.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/draw_lv_draw_label$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/lv_draw_label.c

$(IntermediateDirectory)/draw_lv_draw_layer$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/lv_draw_layer.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/lv_draw_layer.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/draw_lv_draw_layer$(ObjectSuffix) -MF$(IntermediateDirectory)/draw_lv_draw_layer$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/draw_lv_draw_layer$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/draw_lv_draw_layer$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/lv_draw_layer.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/draw_lv_draw_layer$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/lv_draw_layer.c

$(IntermediateDirectory)/draw_lv_draw_line$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/lv_draw_line.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/lv_draw_line.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/draw_lv_draw_line$(ObjectSuffix) -MF$(IntermediateDirectory)/draw_lv_draw_line$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/draw_lv_draw_line$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/draw_lv_draw_line$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/lv_draw_line.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/draw_lv_draw_line$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/lv_draw_line.c

$(IntermediateDirectory)/draw_lv_draw_mask$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/lv_draw_mask.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/lv_draw_mask.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/draw_lv_draw_mask$(ObjectSuffix) -MF$(IntermediateDirectory)/draw_lv_draw_mask$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/draw_lv_draw_mask$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/draw_lv_draw_mask$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/lv_draw_mask.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/draw_lv_draw_mask$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/lv_draw_mask.c

$(IntermediateDirectory)/draw_lv_draw_rect$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/lv_draw_rect.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/lv_draw_rect.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/draw_lv_draw_rect$(ObjectSuffix) -MF$(IntermediateDirectory)/draw_lv_draw_rect$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/draw_lv_draw_rect$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/draw_lv_draw_rect$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/lv_draw_rect.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/draw_lv_draw_rect$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/lv_draw_rect.c

$(IntermediateDirectory)/draw_lv_draw_transform$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/lv_draw_transform.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/lv_draw_transform.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/draw_lv_draw_transform$(ObjectSuffix) -MF$(IntermediateDirectory)/draw_lv_draw_transform$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/draw_lv_draw_transform$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/draw_lv_draw_transform$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/lv_draw_transform.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/draw_lv_draw_transform$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/lv_draw_transform.c

$(IntermediateDirectory)/draw_lv_draw_triangle$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/lv_draw_triangle.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/lv_draw_triangle.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/draw_lv_draw_triangle$(ObjectSuffix) -MF$(IntermediateDirectory)/draw_lv_draw_triangle$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/draw_lv_draw_triangle$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/draw_lv_draw_triangle$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/lv_draw_triangle.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/draw_lv_draw_triangle$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/lv_draw_triangle.c

$(IntermediateDirectory)/draw_lv_img_buf$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/lv_img_buf.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/lv_img_buf.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/draw_lv_img_buf$(ObjectSuffix) -MF$(IntermediateDirectory)/draw_lv_img_buf$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/draw_lv_img_buf$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/draw_lv_img_buf$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/lv_img_buf.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/draw_lv_img_buf$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/lv_img_buf.c

$(IntermediateDirectory)/draw_lv_img_cache$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/lv_img_cache.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/lv_img_cache.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/draw_lv_img_cache$(ObjectSuffix) -MF$(IntermediateDirectory)/draw_lv_img_cache$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/draw_lv_img_cache$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/draw_lv_img_cache$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/lv_img_cache.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/draw_lv_img_cache$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/lv_img_cache.c

$(IntermediateDirectory)/draw_lv_img_cache_builtin$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/lv_img_cache_builtin.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/lv_img_cache_builtin.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/draw_lv_img_cache_builtin$(ObjectSuffix) -MF$(IntermediateDirectory)/draw_lv_img_cache_builtin$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/draw_lv_img_cache_builtin$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/draw_lv_img_cache_builtin$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/lv_img_cache_builtin.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/draw_lv_img_cache_builtin$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/lv_img_cache_builtin.c

$(IntermediateDirectory)/draw_lv_img_decoder$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/lv_img_decoder.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/lv_img_decoder.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/draw_lv_img_decoder$(ObjectSuffix) -MF$(IntermediateDirectory)/draw_lv_img_decoder$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/draw_lv_img_decoder$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/draw_lv_img_decoder$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/lv_img_decoder.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/draw_lv_img_decoder$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/lv_img_decoder.c

$(IntermediateDirectory)/font_lv_font$(ObjectSuffix): ../sdk/lib/lvgl/src/font/lv_font.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/font/lv_font.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/font_lv_font$(ObjectSuffix) -MF$(IntermediateDirectory)/font_lv_font$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/font_lv_font$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/font_lv_font$(PreprocessSuffix): ../sdk/lib/lvgl/src/font/lv_font.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/font_lv_font$(PreprocessSuffix) ../sdk/lib/lvgl/src/font/lv_font.c

$(IntermediateDirectory)/font_lv_font_dejavu_16_persian_hebrew$(ObjectSuffix): ../sdk/lib/lvgl/src/font/lv_font_dejavu_16_persian_hebrew.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/font/lv_font_dejavu_16_persian_hebrew.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/font_lv_font_dejavu_16_persian_hebrew$(ObjectSuffix) -MF$(IntermediateDirectory)/font_lv_font_dejavu_16_persian_hebrew$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/font_lv_font_dejavu_16_persian_hebrew$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/font_lv_font_dejavu_16_persian_hebrew$(PreprocessSuffix): ../sdk/lib/lvgl/src/font/lv_font_dejavu_16_persian_hebrew.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/font_lv_font_dejavu_16_persian_hebrew$(PreprocessSuffix) ../sdk/lib/lvgl/src/font/lv_font_dejavu_16_persian_hebrew.c

$(IntermediateDirectory)/font_lv_font_fmt_txt$(ObjectSuffix): ../sdk/lib/lvgl/src/font/lv_font_fmt_txt.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/font/lv_font_fmt_txt.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/font_lv_font_fmt_txt$(ObjectSuffix) -MF$(IntermediateDirectory)/font_lv_font_fmt_txt$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/font_lv_font_fmt_txt$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/font_lv_font_fmt_txt$(PreprocessSuffix): ../sdk/lib/lvgl/src/font/lv_font_fmt_txt.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/font_lv_font_fmt_txt$(PreprocessSuffix) ../sdk/lib/lvgl/src/font/lv_font_fmt_txt.c

$(IntermediateDirectory)/font_lv_font_loader$(ObjectSuffix): ../sdk/lib/lvgl/src/font/lv_font_loader.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/font/lv_font_loader.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/font_lv_font_loader$(ObjectSuffix) -MF$(IntermediateDirectory)/font_lv_font_loader$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/font_lv_font_loader$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/font_lv_font_loader$(PreprocessSuffix): ../sdk/lib/lvgl/src/font/lv_font_loader.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/font_lv_font_loader$(PreprocessSuffix) ../sdk/lib/lvgl/src/font/lv_font_loader.c

$(IntermediateDirectory)/font_lv_font_montserrat_10$(ObjectSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_10.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/font/lv_font_montserrat_10.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/font_lv_font_montserrat_10$(ObjectSuffix) -MF$(IntermediateDirectory)/font_lv_font_montserrat_10$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/font_lv_font_montserrat_10$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/font_lv_font_montserrat_10$(PreprocessSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_10.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/font_lv_font_montserrat_10$(PreprocessSuffix) ../sdk/lib/lvgl/src/font/lv_font_montserrat_10.c

$(IntermediateDirectory)/font_lv_font_montserrat_12$(ObjectSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_12.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/font/lv_font_montserrat_12.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/font_lv_font_montserrat_12$(ObjectSuffix) -MF$(IntermediateDirectory)/font_lv_font_montserrat_12$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/font_lv_font_montserrat_12$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/font_lv_font_montserrat_12$(PreprocessSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_12.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/font_lv_font_montserrat_12$(PreprocessSuffix) ../sdk/lib/lvgl/src/font/lv_font_montserrat_12.c

$(IntermediateDirectory)/font_lv_font_montserrat_12_subpx$(ObjectSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_12_subpx.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/font/lv_font_montserrat_12_subpx.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/font_lv_font_montserrat_12_subpx$(ObjectSuffix) -MF$(IntermediateDirectory)/font_lv_font_montserrat_12_subpx$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/font_lv_font_montserrat_12_subpx$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/font_lv_font_montserrat_12_subpx$(PreprocessSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_12_subpx.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/font_lv_font_montserrat_12_subpx$(PreprocessSuffix) ../sdk/lib/lvgl/src/font/lv_font_montserrat_12_subpx.c

$(IntermediateDirectory)/font_lv_font_montserrat_14$(ObjectSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_14.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/font/lv_font_montserrat_14.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/font_lv_font_montserrat_14$(ObjectSuffix) -MF$(IntermediateDirectory)/font_lv_font_montserrat_14$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/font_lv_font_montserrat_14$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/font_lv_font_montserrat_14$(PreprocessSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_14.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/font_lv_font_montserrat_14$(PreprocessSuffix) ../sdk/lib/lvgl/src/font/lv_font_montserrat_14.c

$(IntermediateDirectory)/font_lv_font_montserrat_16$(ObjectSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_16.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/font/lv_font_montserrat_16.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/font_lv_font_montserrat_16$(ObjectSuffix) -MF$(IntermediateDirectory)/font_lv_font_montserrat_16$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/font_lv_font_montserrat_16$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/font_lv_font_montserrat_16$(PreprocessSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_16.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/font_lv_font_montserrat_16$(PreprocessSuffix) ../sdk/lib/lvgl/src/font/lv_font_montserrat_16.c

$(IntermediateDirectory)/font_lv_font_montserrat_18$(ObjectSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_18.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/font/lv_font_montserrat_18.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/font_lv_font_montserrat_18$(ObjectSuffix) -MF$(IntermediateDirectory)/font_lv_font_montserrat_18$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/font_lv_font_montserrat_18$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/font_lv_font_montserrat_18$(PreprocessSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_18.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/font_lv_font_montserrat_18$(PreprocessSuffix) ../sdk/lib/lvgl/src/font/lv_font_montserrat_18.c

$(IntermediateDirectory)/font_lv_font_montserrat_20$(ObjectSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_20.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/font/lv_font_montserrat_20.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/font_lv_font_montserrat_20$(ObjectSuffix) -MF$(IntermediateDirectory)/font_lv_font_montserrat_20$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/font_lv_font_montserrat_20$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/font_lv_font_montserrat_20$(PreprocessSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_20.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/font_lv_font_montserrat_20$(PreprocessSuffix) ../sdk/lib/lvgl/src/font/lv_font_montserrat_20.c

$(IntermediateDirectory)/font_lv_font_montserrat_22$(ObjectSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_22.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/font/lv_font_montserrat_22.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/font_lv_font_montserrat_22$(ObjectSuffix) -MF$(IntermediateDirectory)/font_lv_font_montserrat_22$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/font_lv_font_montserrat_22$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/font_lv_font_montserrat_22$(PreprocessSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_22.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/font_lv_font_montserrat_22$(PreprocessSuffix) ../sdk/lib/lvgl/src/font/lv_font_montserrat_22.c

$(IntermediateDirectory)/font_lv_font_montserrat_24$(ObjectSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_24.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/font/lv_font_montserrat_24.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/font_lv_font_montserrat_24$(ObjectSuffix) -MF$(IntermediateDirectory)/font_lv_font_montserrat_24$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/font_lv_font_montserrat_24$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/font_lv_font_montserrat_24$(PreprocessSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_24.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/font_lv_font_montserrat_24$(PreprocessSuffix) ../sdk/lib/lvgl/src/font/lv_font_montserrat_24.c

$(IntermediateDirectory)/font_lv_font_montserrat_26$(ObjectSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_26.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/font/lv_font_montserrat_26.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/font_lv_font_montserrat_26$(ObjectSuffix) -MF$(IntermediateDirectory)/font_lv_font_montserrat_26$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/font_lv_font_montserrat_26$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/font_lv_font_montserrat_26$(PreprocessSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_26.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/font_lv_font_montserrat_26$(PreprocessSuffix) ../sdk/lib/lvgl/src/font/lv_font_montserrat_26.c

$(IntermediateDirectory)/font_lv_font_montserrat_28$(ObjectSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_28.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/font/lv_font_montserrat_28.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/font_lv_font_montserrat_28$(ObjectSuffix) -MF$(IntermediateDirectory)/font_lv_font_montserrat_28$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/font_lv_font_montserrat_28$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/font_lv_font_montserrat_28$(PreprocessSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_28.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/font_lv_font_montserrat_28$(PreprocessSuffix) ../sdk/lib/lvgl/src/font/lv_font_montserrat_28.c

$(IntermediateDirectory)/font_lv_font_montserrat_28_compressed$(ObjectSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_28_compressed.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/font/lv_font_montserrat_28_compressed.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/font_lv_font_montserrat_28_compressed$(ObjectSuffix) -MF$(IntermediateDirectory)/font_lv_font_montserrat_28_compressed$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/font_lv_font_montserrat_28_compressed$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/font_lv_font_montserrat_28_compressed$(PreprocessSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_28_compressed.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/font_lv_font_montserrat_28_compressed$(PreprocessSuffix) ../sdk/lib/lvgl/src/font/lv_font_montserrat_28_compressed.c

$(IntermediateDirectory)/font_lv_font_montserrat_30$(ObjectSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_30.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/font/lv_font_montserrat_30.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/font_lv_font_montserrat_30$(ObjectSuffix) -MF$(IntermediateDirectory)/font_lv_font_montserrat_30$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/font_lv_font_montserrat_30$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/font_lv_font_montserrat_30$(PreprocessSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_30.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/font_lv_font_montserrat_30$(PreprocessSuffix) ../sdk/lib/lvgl/src/font/lv_font_montserrat_30.c

$(IntermediateDirectory)/font_lv_font_montserrat_32$(ObjectSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_32.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/font/lv_font_montserrat_32.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/font_lv_font_montserrat_32$(ObjectSuffix) -MF$(IntermediateDirectory)/font_lv_font_montserrat_32$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/font_lv_font_montserrat_32$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/font_lv_font_montserrat_32$(PreprocessSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_32.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/font_lv_font_montserrat_32$(PreprocessSuffix) ../sdk/lib/lvgl/src/font/lv_font_montserrat_32.c

$(IntermediateDirectory)/font_lv_font_montserrat_34$(ObjectSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_34.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/font/lv_font_montserrat_34.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/font_lv_font_montserrat_34$(ObjectSuffix) -MF$(IntermediateDirectory)/font_lv_font_montserrat_34$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/font_lv_font_montserrat_34$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/font_lv_font_montserrat_34$(PreprocessSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_34.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/font_lv_font_montserrat_34$(PreprocessSuffix) ../sdk/lib/lvgl/src/font/lv_font_montserrat_34.c

$(IntermediateDirectory)/font_lv_font_montserrat_36$(ObjectSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_36.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/font/lv_font_montserrat_36.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/font_lv_font_montserrat_36$(ObjectSuffix) -MF$(IntermediateDirectory)/font_lv_font_montserrat_36$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/font_lv_font_montserrat_36$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/font_lv_font_montserrat_36$(PreprocessSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_36.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/font_lv_font_montserrat_36$(PreprocessSuffix) ../sdk/lib/lvgl/src/font/lv_font_montserrat_36.c

$(IntermediateDirectory)/font_lv_font_montserrat_38$(ObjectSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_38.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/font/lv_font_montserrat_38.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/font_lv_font_montserrat_38$(ObjectSuffix) -MF$(IntermediateDirectory)/font_lv_font_montserrat_38$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/font_lv_font_montserrat_38$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/font_lv_font_montserrat_38$(PreprocessSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_38.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/font_lv_font_montserrat_38$(PreprocessSuffix) ../sdk/lib/lvgl/src/font/lv_font_montserrat_38.c

$(IntermediateDirectory)/font_lv_font_montserrat_40$(ObjectSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_40.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/font/lv_font_montserrat_40.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/font_lv_font_montserrat_40$(ObjectSuffix) -MF$(IntermediateDirectory)/font_lv_font_montserrat_40$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/font_lv_font_montserrat_40$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/font_lv_font_montserrat_40$(PreprocessSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_40.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/font_lv_font_montserrat_40$(PreprocessSuffix) ../sdk/lib/lvgl/src/font/lv_font_montserrat_40.c

$(IntermediateDirectory)/font_lv_font_montserrat_42$(ObjectSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_42.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/font/lv_font_montserrat_42.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/font_lv_font_montserrat_42$(ObjectSuffix) -MF$(IntermediateDirectory)/font_lv_font_montserrat_42$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/font_lv_font_montserrat_42$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/font_lv_font_montserrat_42$(PreprocessSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_42.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/font_lv_font_montserrat_42$(PreprocessSuffix) ../sdk/lib/lvgl/src/font/lv_font_montserrat_42.c

$(IntermediateDirectory)/font_lv_font_montserrat_44$(ObjectSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_44.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/font/lv_font_montserrat_44.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/font_lv_font_montserrat_44$(ObjectSuffix) -MF$(IntermediateDirectory)/font_lv_font_montserrat_44$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/font_lv_font_montserrat_44$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/font_lv_font_montserrat_44$(PreprocessSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_44.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/font_lv_font_montserrat_44$(PreprocessSuffix) ../sdk/lib/lvgl/src/font/lv_font_montserrat_44.c

$(IntermediateDirectory)/font_lv_font_montserrat_46$(ObjectSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_46.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/font/lv_font_montserrat_46.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/font_lv_font_montserrat_46$(ObjectSuffix) -MF$(IntermediateDirectory)/font_lv_font_montserrat_46$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/font_lv_font_montserrat_46$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/font_lv_font_montserrat_46$(PreprocessSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_46.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/font_lv_font_montserrat_46$(PreprocessSuffix) ../sdk/lib/lvgl/src/font/lv_font_montserrat_46.c

$(IntermediateDirectory)/font_lv_font_montserrat_48$(ObjectSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_48.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/font/lv_font_montserrat_48.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/font_lv_font_montserrat_48$(ObjectSuffix) -MF$(IntermediateDirectory)/font_lv_font_montserrat_48$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/font_lv_font_montserrat_48$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/font_lv_font_montserrat_48$(PreprocessSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_48.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/font_lv_font_montserrat_48$(PreprocessSuffix) ../sdk/lib/lvgl/src/font/lv_font_montserrat_48.c

$(IntermediateDirectory)/font_lv_font_montserrat_8$(ObjectSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_8.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/font/lv_font_montserrat_8.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/font_lv_font_montserrat_8$(ObjectSuffix) -MF$(IntermediateDirectory)/font_lv_font_montserrat_8$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/font_lv_font_montserrat_8$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/font_lv_font_montserrat_8$(PreprocessSuffix): ../sdk/lib/lvgl/src/font/lv_font_montserrat_8.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/font_lv_font_montserrat_8$(PreprocessSuffix) ../sdk/lib/lvgl/src/font/lv_font_montserrat_8.c

$(IntermediateDirectory)/font_lv_font_simsun_16_cjk$(ObjectSuffix): ../sdk/lib/lvgl/src/font/lv_font_simsun_16_cjk.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/font/lv_font_simsun_16_cjk.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/font_lv_font_simsun_16_cjk$(ObjectSuffix) -MF$(IntermediateDirectory)/font_lv_font_simsun_16_cjk$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/font_lv_font_simsun_16_cjk$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/font_lv_font_simsun_16_cjk$(PreprocessSuffix): ../sdk/lib/lvgl/src/font/lv_font_simsun_16_cjk.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/font_lv_font_simsun_16_cjk$(PreprocessSuffix) ../sdk/lib/lvgl/src/font/lv_font_simsun_16_cjk.c

$(IntermediateDirectory)/font_lv_font_unscii_16$(ObjectSuffix): ../sdk/lib/lvgl/src/font/lv_font_unscii_16.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/font/lv_font_unscii_16.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/font_lv_font_unscii_16$(ObjectSuffix) -MF$(IntermediateDirectory)/font_lv_font_unscii_16$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/font_lv_font_unscii_16$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/font_lv_font_unscii_16$(PreprocessSuffix): ../sdk/lib/lvgl/src/font/lv_font_unscii_16.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/font_lv_font_unscii_16$(PreprocessSuffix) ../sdk/lib/lvgl/src/font/lv_font_unscii_16.c

$(IntermediateDirectory)/font_lv_font_unscii_8$(ObjectSuffix): ../sdk/lib/lvgl/src/font/lv_font_unscii_8.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/font/lv_font_unscii_8.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/font_lv_font_unscii_8$(ObjectSuffix) -MF$(IntermediateDirectory)/font_lv_font_unscii_8$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/font_lv_font_unscii_8$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/font_lv_font_unscii_8$(PreprocessSuffix): ../sdk/lib/lvgl/src/font/lv_font_unscii_8.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/font_lv_font_unscii_8$(PreprocessSuffix) ../sdk/lib/lvgl/src/font/lv_font_unscii_8.c

$(IntermediateDirectory)/hal_lv_hal_disp$(ObjectSuffix): ../sdk/lib/lvgl/src/hal/lv_hal_disp.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/hal/lv_hal_disp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hal_lv_hal_disp$(ObjectSuffix) -MF$(IntermediateDirectory)/hal_lv_hal_disp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hal_lv_hal_disp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hal_lv_hal_disp$(PreprocessSuffix): ../sdk/lib/lvgl/src/hal/lv_hal_disp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hal_lv_hal_disp$(PreprocessSuffix) ../sdk/lib/lvgl/src/hal/lv_hal_disp.c

$(IntermediateDirectory)/hal_lv_hal_indev$(ObjectSuffix): ../sdk/lib/lvgl/src/hal/lv_hal_indev.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/hal/lv_hal_indev.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hal_lv_hal_indev$(ObjectSuffix) -MF$(IntermediateDirectory)/hal_lv_hal_indev$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hal_lv_hal_indev$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hal_lv_hal_indev$(PreprocessSuffix): ../sdk/lib/lvgl/src/hal/lv_hal_indev.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hal_lv_hal_indev$(PreprocessSuffix) ../sdk/lib/lvgl/src/hal/lv_hal_indev.c

$(IntermediateDirectory)/hal_lv_hal_tick$(ObjectSuffix): ../sdk/lib/lvgl/src/hal/lv_hal_tick.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/hal/lv_hal_tick.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hal_lv_hal_tick$(ObjectSuffix) -MF$(IntermediateDirectory)/hal_lv_hal_tick$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hal_lv_hal_tick$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hal_lv_hal_tick$(PreprocessSuffix): ../sdk/lib/lvgl/src/hal/lv_hal_tick.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hal_lv_hal_tick$(PreprocessSuffix) ../sdk/lib/lvgl/src/hal/lv_hal_tick.c

$(IntermediateDirectory)/misc_lv_anim$(ObjectSuffix): ../sdk/lib/lvgl/src/misc/lv_anim.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/misc/lv_anim.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/misc_lv_anim$(ObjectSuffix) -MF$(IntermediateDirectory)/misc_lv_anim$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/misc_lv_anim$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/misc_lv_anim$(PreprocessSuffix): ../sdk/lib/lvgl/src/misc/lv_anim.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/misc_lv_anim$(PreprocessSuffix) ../sdk/lib/lvgl/src/misc/lv_anim.c

$(IntermediateDirectory)/misc_lv_anim_timeline$(ObjectSuffix): ../sdk/lib/lvgl/src/misc/lv_anim_timeline.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/misc/lv_anim_timeline.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/misc_lv_anim_timeline$(ObjectSuffix) -MF$(IntermediateDirectory)/misc_lv_anim_timeline$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/misc_lv_anim_timeline$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/misc_lv_anim_timeline$(PreprocessSuffix): ../sdk/lib/lvgl/src/misc/lv_anim_timeline.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/misc_lv_anim_timeline$(PreprocessSuffix) ../sdk/lib/lvgl/src/misc/lv_anim_timeline.c

$(IntermediateDirectory)/misc_lv_area$(ObjectSuffix): ../sdk/lib/lvgl/src/misc/lv_area.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/misc/lv_area.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/misc_lv_area$(ObjectSuffix) -MF$(IntermediateDirectory)/misc_lv_area$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/misc_lv_area$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/misc_lv_area$(PreprocessSuffix): ../sdk/lib/lvgl/src/misc/lv_area.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/misc_lv_area$(PreprocessSuffix) ../sdk/lib/lvgl/src/misc/lv_area.c

$(IntermediateDirectory)/misc_lv_async$(ObjectSuffix): ../sdk/lib/lvgl/src/misc/lv_async.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/misc/lv_async.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/misc_lv_async$(ObjectSuffix) -MF$(IntermediateDirectory)/misc_lv_async$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/misc_lv_async$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/misc_lv_async$(PreprocessSuffix): ../sdk/lib/lvgl/src/misc/lv_async.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/misc_lv_async$(PreprocessSuffix) ../sdk/lib/lvgl/src/misc/lv_async.c

$(IntermediateDirectory)/misc_lv_bidi$(ObjectSuffix): ../sdk/lib/lvgl/src/misc/lv_bidi.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/misc/lv_bidi.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/misc_lv_bidi$(ObjectSuffix) -MF$(IntermediateDirectory)/misc_lv_bidi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/misc_lv_bidi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/misc_lv_bidi$(PreprocessSuffix): ../sdk/lib/lvgl/src/misc/lv_bidi.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/misc_lv_bidi$(PreprocessSuffix) ../sdk/lib/lvgl/src/misc/lv_bidi.c

$(IntermediateDirectory)/misc_lv_color$(ObjectSuffix): ../sdk/lib/lvgl/src/misc/lv_color.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/misc/lv_color.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/misc_lv_color$(ObjectSuffix) -MF$(IntermediateDirectory)/misc_lv_color$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/misc_lv_color$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/misc_lv_color$(PreprocessSuffix): ../sdk/lib/lvgl/src/misc/lv_color.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/misc_lv_color$(PreprocessSuffix) ../sdk/lib/lvgl/src/misc/lv_color.c

$(IntermediateDirectory)/misc_lv_fs$(ObjectSuffix): ../sdk/lib/lvgl/src/misc/lv_fs.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/misc/lv_fs.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/misc_lv_fs$(ObjectSuffix) -MF$(IntermediateDirectory)/misc_lv_fs$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/misc_lv_fs$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/misc_lv_fs$(PreprocessSuffix): ../sdk/lib/lvgl/src/misc/lv_fs.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/misc_lv_fs$(PreprocessSuffix) ../sdk/lib/lvgl/src/misc/lv_fs.c

$(IntermediateDirectory)/misc_lv_gc$(ObjectSuffix): ../sdk/lib/lvgl/src/misc/lv_gc.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/misc/lv_gc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/misc_lv_gc$(ObjectSuffix) -MF$(IntermediateDirectory)/misc_lv_gc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/misc_lv_gc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/misc_lv_gc$(PreprocessSuffix): ../sdk/lib/lvgl/src/misc/lv_gc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/misc_lv_gc$(PreprocessSuffix) ../sdk/lib/lvgl/src/misc/lv_gc.c

$(IntermediateDirectory)/misc_lv_ll$(ObjectSuffix): ../sdk/lib/lvgl/src/misc/lv_ll.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/misc/lv_ll.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/misc_lv_ll$(ObjectSuffix) -MF$(IntermediateDirectory)/misc_lv_ll$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/misc_lv_ll$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/misc_lv_ll$(PreprocessSuffix): ../sdk/lib/lvgl/src/misc/lv_ll.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/misc_lv_ll$(PreprocessSuffix) ../sdk/lib/lvgl/src/misc/lv_ll.c

$(IntermediateDirectory)/misc_lv_log$(ObjectSuffix): ../sdk/lib/lvgl/src/misc/lv_log.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/misc/lv_log.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/misc_lv_log$(ObjectSuffix) -MF$(IntermediateDirectory)/misc_lv_log$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/misc_lv_log$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/misc_lv_log$(PreprocessSuffix): ../sdk/lib/lvgl/src/misc/lv_log.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/misc_lv_log$(PreprocessSuffix) ../sdk/lib/lvgl/src/misc/lv_log.c

$(IntermediateDirectory)/misc_lv_lru$(ObjectSuffix): ../sdk/lib/lvgl/src/misc/lv_lru.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/misc/lv_lru.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/misc_lv_lru$(ObjectSuffix) -MF$(IntermediateDirectory)/misc_lv_lru$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/misc_lv_lru$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/misc_lv_lru$(PreprocessSuffix): ../sdk/lib/lvgl/src/misc/lv_lru.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/misc_lv_lru$(PreprocessSuffix) ../sdk/lib/lvgl/src/misc/lv_lru.c

$(IntermediateDirectory)/misc_lv_malloc_builtin$(ObjectSuffix): ../sdk/lib/lvgl/src/misc/lv_malloc_builtin.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/misc/lv_malloc_builtin.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/misc_lv_malloc_builtin$(ObjectSuffix) -MF$(IntermediateDirectory)/misc_lv_malloc_builtin$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/misc_lv_malloc_builtin$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/misc_lv_malloc_builtin$(PreprocessSuffix): ../sdk/lib/lvgl/src/misc/lv_malloc_builtin.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/misc_lv_malloc_builtin$(PreprocessSuffix) ../sdk/lib/lvgl/src/misc/lv_malloc_builtin.c

$(IntermediateDirectory)/misc_lv_math$(ObjectSuffix): ../sdk/lib/lvgl/src/misc/lv_math.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/misc/lv_math.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/misc_lv_math$(ObjectSuffix) -MF$(IntermediateDirectory)/misc_lv_math$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/misc_lv_math$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/misc_lv_math$(PreprocessSuffix): ../sdk/lib/lvgl/src/misc/lv_math.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/misc_lv_math$(PreprocessSuffix) ../sdk/lib/lvgl/src/misc/lv_math.c

$(IntermediateDirectory)/misc_lv_mem$(ObjectSuffix): ../sdk/lib/lvgl/src/misc/lv_mem.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/misc/lv_mem.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/misc_lv_mem$(ObjectSuffix) -MF$(IntermediateDirectory)/misc_lv_mem$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/misc_lv_mem$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/misc_lv_mem$(PreprocessSuffix): ../sdk/lib/lvgl/src/misc/lv_mem.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/misc_lv_mem$(PreprocessSuffix) ../sdk/lib/lvgl/src/misc/lv_mem.c

$(IntermediateDirectory)/misc_lv_memcpy_builtin$(ObjectSuffix): ../sdk/lib/lvgl/src/misc/lv_memcpy_builtin.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/misc/lv_memcpy_builtin.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/misc_lv_memcpy_builtin$(ObjectSuffix) -MF$(IntermediateDirectory)/misc_lv_memcpy_builtin$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/misc_lv_memcpy_builtin$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/misc_lv_memcpy_builtin$(PreprocessSuffix): ../sdk/lib/lvgl/src/misc/lv_memcpy_builtin.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/misc_lv_memcpy_builtin$(PreprocessSuffix) ../sdk/lib/lvgl/src/misc/lv_memcpy_builtin.c

$(IntermediateDirectory)/misc_lv_printf$(ObjectSuffix): ../sdk/lib/lvgl/src/misc/lv_printf.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/misc/lv_printf.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/misc_lv_printf$(ObjectSuffix) -MF$(IntermediateDirectory)/misc_lv_printf$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/misc_lv_printf$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/misc_lv_printf$(PreprocessSuffix): ../sdk/lib/lvgl/src/misc/lv_printf.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/misc_lv_printf$(PreprocessSuffix) ../sdk/lib/lvgl/src/misc/lv_printf.c

$(IntermediateDirectory)/misc_lv_style$(ObjectSuffix): ../sdk/lib/lvgl/src/misc/lv_style.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/misc/lv_style.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/misc_lv_style$(ObjectSuffix) -MF$(IntermediateDirectory)/misc_lv_style$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/misc_lv_style$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/misc_lv_style$(PreprocessSuffix): ../sdk/lib/lvgl/src/misc/lv_style.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/misc_lv_style$(PreprocessSuffix) ../sdk/lib/lvgl/src/misc/lv_style.c

$(IntermediateDirectory)/misc_lv_style_gen$(ObjectSuffix): ../sdk/lib/lvgl/src/misc/lv_style_gen.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/misc/lv_style_gen.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/misc_lv_style_gen$(ObjectSuffix) -MF$(IntermediateDirectory)/misc_lv_style_gen$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/misc_lv_style_gen$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/misc_lv_style_gen$(PreprocessSuffix): ../sdk/lib/lvgl/src/misc/lv_style_gen.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/misc_lv_style_gen$(PreprocessSuffix) ../sdk/lib/lvgl/src/misc/lv_style_gen.c

$(IntermediateDirectory)/misc_lv_templ$(ObjectSuffix): ../sdk/lib/lvgl/src/misc/lv_templ.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/misc/lv_templ.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/misc_lv_templ$(ObjectSuffix) -MF$(IntermediateDirectory)/misc_lv_templ$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/misc_lv_templ$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/misc_lv_templ$(PreprocessSuffix): ../sdk/lib/lvgl/src/misc/lv_templ.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/misc_lv_templ$(PreprocessSuffix) ../sdk/lib/lvgl/src/misc/lv_templ.c

$(IntermediateDirectory)/misc_lv_timer$(ObjectSuffix): ../sdk/lib/lvgl/src/misc/lv_timer.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/misc/lv_timer.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/misc_lv_timer$(ObjectSuffix) -MF$(IntermediateDirectory)/misc_lv_timer$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/misc_lv_timer$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/misc_lv_timer$(PreprocessSuffix): ../sdk/lib/lvgl/src/misc/lv_timer.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/misc_lv_timer$(PreprocessSuffix) ../sdk/lib/lvgl/src/misc/lv_timer.c

$(IntermediateDirectory)/misc_lv_tlsf$(ObjectSuffix): ../sdk/lib/lvgl/src/misc/lv_tlsf.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/misc/lv_tlsf.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/misc_lv_tlsf$(ObjectSuffix) -MF$(IntermediateDirectory)/misc_lv_tlsf$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/misc_lv_tlsf$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/misc_lv_tlsf$(PreprocessSuffix): ../sdk/lib/lvgl/src/misc/lv_tlsf.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/misc_lv_tlsf$(PreprocessSuffix) ../sdk/lib/lvgl/src/misc/lv_tlsf.c

$(IntermediateDirectory)/misc_lv_txt$(ObjectSuffix): ../sdk/lib/lvgl/src/misc/lv_txt.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/misc/lv_txt.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/misc_lv_txt$(ObjectSuffix) -MF$(IntermediateDirectory)/misc_lv_txt$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/misc_lv_txt$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/misc_lv_txt$(PreprocessSuffix): ../sdk/lib/lvgl/src/misc/lv_txt.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/misc_lv_txt$(PreprocessSuffix) ../sdk/lib/lvgl/src/misc/lv_txt.c

$(IntermediateDirectory)/misc_lv_txt_ap$(ObjectSuffix): ../sdk/lib/lvgl/src/misc/lv_txt_ap.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/misc/lv_txt_ap.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/misc_lv_txt_ap$(ObjectSuffix) -MF$(IntermediateDirectory)/misc_lv_txt_ap$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/misc_lv_txt_ap$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/misc_lv_txt_ap$(PreprocessSuffix): ../sdk/lib/lvgl/src/misc/lv_txt_ap.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/misc_lv_txt_ap$(PreprocessSuffix) ../sdk/lib/lvgl/src/misc/lv_txt_ap.c

$(IntermediateDirectory)/misc_lv_utils$(ObjectSuffix): ../sdk/lib/lvgl/src/misc/lv_utils.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/misc/lv_utils.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/misc_lv_utils$(ObjectSuffix) -MF$(IntermediateDirectory)/misc_lv_utils$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/misc_lv_utils$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/misc_lv_utils$(PreprocessSuffix): ../sdk/lib/lvgl/src/misc/lv_utils.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/misc_lv_utils$(PreprocessSuffix) ../sdk/lib/lvgl/src/misc/lv_utils.c

$(IntermediateDirectory)/project_1_project_1$(ObjectSuffix): ../sdk/app/halibaduo/hali_mcu_prj/project_1/project_1.c  
	$(CC) $(SourceSwitch) ../sdk/app/halibaduo/hali_mcu_prj/project_1/project_1.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/project_1_project_1$(ObjectSuffix) -MF$(IntermediateDirectory)/project_1_project_1$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/project_1_project_1$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/project_1_project_1$(PreprocessSuffix): ../sdk/app/halibaduo/hali_mcu_prj/project_1/project_1.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/project_1_project_1$(PreprocessSuffix) ../sdk/app/halibaduo/hali_mcu_prj/project_1/project_1.c

$(IntermediateDirectory)/api_api_lib$(ObjectSuffix): ../sdk/lib/net/lwip/src/api/api_lib.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/api/api_lib.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/api_api_lib$(ObjectSuffix) -MF$(IntermediateDirectory)/api_api_lib$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/api_api_lib$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/api_api_lib$(PreprocessSuffix): ../sdk/lib/net/lwip/src/api/api_lib.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/api_api_lib$(PreprocessSuffix) ../sdk/lib/net/lwip/src/api/api_lib.c

$(IntermediateDirectory)/api_api_msg$(ObjectSuffix): ../sdk/lib/net/lwip/src/api/api_msg.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/api/api_msg.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/api_api_msg$(ObjectSuffix) -MF$(IntermediateDirectory)/api_api_msg$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/api_api_msg$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/api_api_msg$(PreprocessSuffix): ../sdk/lib/net/lwip/src/api/api_msg.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/api_api_msg$(PreprocessSuffix) ../sdk/lib/net/lwip/src/api/api_msg.c

$(IntermediateDirectory)/api_err$(ObjectSuffix): ../sdk/lib/net/lwip/src/api/err.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/api/err.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/api_err$(ObjectSuffix) -MF$(IntermediateDirectory)/api_err$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/api_err$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/api_err$(PreprocessSuffix): ../sdk/lib/net/lwip/src/api/err.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/api_err$(PreprocessSuffix) ../sdk/lib/net/lwip/src/api/err.c

$(IntermediateDirectory)/api_if_api$(ObjectSuffix): ../sdk/lib/net/lwip/src/api/if_api.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/api/if_api.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/api_if_api$(ObjectSuffix) -MF$(IntermediateDirectory)/api_if_api$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/api_if_api$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/api_if_api$(PreprocessSuffix): ../sdk/lib/net/lwip/src/api/if_api.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/api_if_api$(PreprocessSuffix) ../sdk/lib/net/lwip/src/api/if_api.c

$(IntermediateDirectory)/api_netbuf$(ObjectSuffix): ../sdk/lib/net/lwip/src/api/netbuf.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/api/netbuf.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/api_netbuf$(ObjectSuffix) -MF$(IntermediateDirectory)/api_netbuf$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/api_netbuf$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/api_netbuf$(PreprocessSuffix): ../sdk/lib/net/lwip/src/api/netbuf.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/api_netbuf$(PreprocessSuffix) ../sdk/lib/net/lwip/src/api/netbuf.c

$(IntermediateDirectory)/api_netdb$(ObjectSuffix): ../sdk/lib/net/lwip/src/api/netdb.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/api/netdb.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/api_netdb$(ObjectSuffix) -MF$(IntermediateDirectory)/api_netdb$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/api_netdb$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/api_netdb$(PreprocessSuffix): ../sdk/lib/net/lwip/src/api/netdb.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/api_netdb$(PreprocessSuffix) ../sdk/lib/net/lwip/src/api/netdb.c

$(IntermediateDirectory)/api_netifapi$(ObjectSuffix): ../sdk/lib/net/lwip/src/api/netifapi.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/api/netifapi.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/api_netifapi$(ObjectSuffix) -MF$(IntermediateDirectory)/api_netifapi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/api_netifapi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/api_netifapi$(PreprocessSuffix): ../sdk/lib/net/lwip/src/api/netifapi.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/api_netifapi$(PreprocessSuffix) ../sdk/lib/net/lwip/src/api/netifapi.c

$(IntermediateDirectory)/api_sockets$(ObjectSuffix): ../sdk/lib/net/lwip/src/api/sockets.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/api/sockets.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/api_sockets$(ObjectSuffix) -MF$(IntermediateDirectory)/api_sockets$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/api_sockets$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/api_sockets$(PreprocessSuffix): ../sdk/lib/net/lwip/src/api/sockets.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/api_sockets$(PreprocessSuffix) ../sdk/lib/net/lwip/src/api/sockets.c

$(IntermediateDirectory)/api_tcpip$(ObjectSuffix): ../sdk/lib/net/lwip/src/api/tcpip.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/api/tcpip.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/api_tcpip$(ObjectSuffix) -MF$(IntermediateDirectory)/api_tcpip$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/api_tcpip$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/api_tcpip$(PreprocessSuffix): ../sdk/lib/net/lwip/src/api/tcpip.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/api_tcpip$(PreprocessSuffix) ../sdk/lib/net/lwip/src/api/tcpip.c

$(IntermediateDirectory)/api_ping$(ObjectSuffix): ../sdk/lib/net/lwip/src/api/ping.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/api/ping.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/api_ping$(ObjectSuffix) -MF$(IntermediateDirectory)/api_ping$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/api_ping$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/api_ping$(PreprocessSuffix): ../sdk/lib/net/lwip/src/api/ping.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/api_ping$(PreprocessSuffix) ../sdk/lib/net/lwip/src/api/ping.c

$(IntermediateDirectory)/core_altcp$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/altcp.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/altcp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_altcp$(ObjectSuffix) -MF$(IntermediateDirectory)/core_altcp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_altcp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_altcp$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/altcp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_altcp$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/altcp.c

$(IntermediateDirectory)/core_altcp_alloc$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/altcp_alloc.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/altcp_alloc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_altcp_alloc$(ObjectSuffix) -MF$(IntermediateDirectory)/core_altcp_alloc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_altcp_alloc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_altcp_alloc$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/altcp_alloc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_altcp_alloc$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/altcp_alloc.c

$(IntermediateDirectory)/core_altcp_tcp$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/altcp_tcp.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/altcp_tcp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_altcp_tcp$(ObjectSuffix) -MF$(IntermediateDirectory)/core_altcp_tcp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_altcp_tcp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_altcp_tcp$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/altcp_tcp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_altcp_tcp$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/altcp_tcp.c

$(IntermediateDirectory)/core_def$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/def.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/def.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_def$(ObjectSuffix) -MF$(IntermediateDirectory)/core_def$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_def$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_def$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/def.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_def$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/def.c

$(IntermediateDirectory)/core_dns$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/dns.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/dns.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_dns$(ObjectSuffix) -MF$(IntermediateDirectory)/core_dns$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_dns$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_dns$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/dns.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_dns$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/dns.c

$(IntermediateDirectory)/core_inet_chksum$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/inet_chksum.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/inet_chksum.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_inet_chksum$(ObjectSuffix) -MF$(IntermediateDirectory)/core_inet_chksum$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_inet_chksum$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_inet_chksum$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/inet_chksum.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_inet_chksum$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/inet_chksum.c

$(IntermediateDirectory)/core_init$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/init.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/init.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_init$(ObjectSuffix) -MF$(IntermediateDirectory)/core_init$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_init$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_init$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/init.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_init$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/init.c

$(IntermediateDirectory)/core_ip$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/ip.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/ip.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_ip$(ObjectSuffix) -MF$(IntermediateDirectory)/core_ip$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_ip$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_ip$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/ip.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_ip$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/ip.c

$(IntermediateDirectory)/core_mem$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/mem.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/mem.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_mem$(ObjectSuffix) -MF$(IntermediateDirectory)/core_mem$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_mem$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_mem$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/mem.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_mem$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/mem.c

$(IntermediateDirectory)/core_memp$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/memp.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/memp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_memp$(ObjectSuffix) -MF$(IntermediateDirectory)/core_memp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_memp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_memp$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/memp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_memp$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/memp.c

$(IntermediateDirectory)/core_netif$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/netif.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/netif.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_netif$(ObjectSuffix) -MF$(IntermediateDirectory)/core_netif$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_netif$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_netif$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/netif.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_netif$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/netif.c

$(IntermediateDirectory)/core_pbuf$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/pbuf.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/pbuf.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_pbuf$(ObjectSuffix) -MF$(IntermediateDirectory)/core_pbuf$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_pbuf$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_pbuf$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/pbuf.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_pbuf$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/pbuf.c

$(IntermediateDirectory)/core_raw$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/raw.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/raw.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_raw$(ObjectSuffix) -MF$(IntermediateDirectory)/core_raw$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_raw$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_raw$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/raw.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_raw$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/raw.c

$(IntermediateDirectory)/core_stats$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/stats.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/stats.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_stats$(ObjectSuffix) -MF$(IntermediateDirectory)/core_stats$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_stats$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_stats$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/stats.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_stats$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/stats.c

$(IntermediateDirectory)/core_sys$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/sys.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/sys.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_sys$(ObjectSuffix) -MF$(IntermediateDirectory)/core_sys$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_sys$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_sys$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/sys.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_sys$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/sys.c

$(IntermediateDirectory)/core_tcp$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/tcp.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/tcp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_tcp$(ObjectSuffix) -MF$(IntermediateDirectory)/core_tcp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_tcp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_tcp$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/tcp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_tcp$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/tcp.c

$(IntermediateDirectory)/core_tcp_in$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/tcp_in.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/tcp_in.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_tcp_in$(ObjectSuffix) -MF$(IntermediateDirectory)/core_tcp_in$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_tcp_in$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_tcp_in$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/tcp_in.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_tcp_in$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/tcp_in.c

$(IntermediateDirectory)/core_tcp_out$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/tcp_out.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/tcp_out.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_tcp_out$(ObjectSuffix) -MF$(IntermediateDirectory)/core_tcp_out$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_tcp_out$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_tcp_out$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/tcp_out.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_tcp_out$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/tcp_out.c

$(IntermediateDirectory)/core_timeouts$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/timeouts.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/timeouts.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_timeouts$(ObjectSuffix) -MF$(IntermediateDirectory)/core_timeouts$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_timeouts$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_timeouts$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/timeouts.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_timeouts$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/timeouts.c

$(IntermediateDirectory)/core_udp$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/udp.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/udp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/core_udp$(ObjectSuffix) -MF$(IntermediateDirectory)/core_udp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/core_udp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/core_udp$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/udp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_udp$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/udp.c

$(IntermediateDirectory)/netif_bridgeif$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/bridgeif.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/bridgeif.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/netif_bridgeif$(ObjectSuffix) -MF$(IntermediateDirectory)/netif_bridgeif$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/netif_bridgeif$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/netif_bridgeif$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/bridgeif.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/netif_bridgeif$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/bridgeif.c

$(IntermediateDirectory)/netif_bridgeif_fdb$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/bridgeif_fdb.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/bridgeif_fdb.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/netif_bridgeif_fdb$(ObjectSuffix) -MF$(IntermediateDirectory)/netif_bridgeif_fdb$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/netif_bridgeif_fdb$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/netif_bridgeif_fdb$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/bridgeif_fdb.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/netif_bridgeif_fdb$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/bridgeif_fdb.c

$(IntermediateDirectory)/netif_ethernet$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/ethernet.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/ethernet.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/netif_ethernet$(ObjectSuffix) -MF$(IntermediateDirectory)/netif_ethernet$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/netif_ethernet$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/netif_ethernet$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/ethernet.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/netif_ethernet$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/ethernet.c

$(IntermediateDirectory)/netif_ethernetif$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/ethernetif.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/ethernetif.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/netif_ethernetif$(ObjectSuffix) -MF$(IntermediateDirectory)/netif_ethernetif$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/netif_ethernetif$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/netif_ethernetif$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/ethernetif.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/netif_ethernetif$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/ethernetif.c

$(IntermediateDirectory)/netif_lowpan6$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/lowpan6.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/lowpan6.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/netif_lowpan6$(ObjectSuffix) -MF$(IntermediateDirectory)/netif_lowpan6$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/netif_lowpan6$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/netif_lowpan6$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/lowpan6.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/netif_lowpan6$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/lowpan6.c

$(IntermediateDirectory)/netif_lowpan6_ble$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/lowpan6_ble.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/lowpan6_ble.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/netif_lowpan6_ble$(ObjectSuffix) -MF$(IntermediateDirectory)/netif_lowpan6_ble$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/netif_lowpan6_ble$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/netif_lowpan6_ble$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/lowpan6_ble.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/netif_lowpan6_ble$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/lowpan6_ble.c

$(IntermediateDirectory)/netif_lowpan6_common$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/lowpan6_common.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/lowpan6_common.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/netif_lowpan6_common$(ObjectSuffix) -MF$(IntermediateDirectory)/netif_lowpan6_common$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/netif_lowpan6_common$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/netif_lowpan6_common$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/lowpan6_common.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/netif_lowpan6_common$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/lowpan6_common.c

$(IntermediateDirectory)/netif_slipif$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/slipif.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/slipif.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/netif_slipif$(ObjectSuffix) -MF$(IntermediateDirectory)/netif_slipif$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/netif_slipif$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/netif_slipif$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/slipif.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/netif_slipif$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/slipif.c

$(IntermediateDirectory)/netif_zepif$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/zepif.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/zepif.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/netif_zepif$(ObjectSuffix) -MF$(IntermediateDirectory)/netif_zepif$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/netif_zepif$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/netif_zepif$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/zepif.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/netif_zepif$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/zepif.c

$(IntermediateDirectory)/assets_img_benchmark_cogwheel_alpha16$(ObjectSuffix): ../sdk/lib/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_alpha16.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_alpha16.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_benchmark_cogwheel_alpha16$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_benchmark_cogwheel_alpha16$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_benchmark_cogwheel_alpha16$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_benchmark_cogwheel_alpha16$(PreprocessSuffix): ../sdk/lib/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_alpha16.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_benchmark_cogwheel_alpha16$(PreprocessSuffix) ../sdk/lib/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_alpha16.c

$(IntermediateDirectory)/assets_img_benchmark_cogwheel_argb$(ObjectSuffix): ../sdk/lib/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_argb.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_argb.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_benchmark_cogwheel_argb$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_benchmark_cogwheel_argb$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_benchmark_cogwheel_argb$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_benchmark_cogwheel_argb$(PreprocessSuffix): ../sdk/lib/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_argb.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_benchmark_cogwheel_argb$(PreprocessSuffix) ../sdk/lib/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_argb.c

$(IntermediateDirectory)/assets_img_benchmark_cogwheel_chroma_keyed$(ObjectSuffix): ../sdk/lib/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_chroma_keyed.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_chroma_keyed.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_benchmark_cogwheel_chroma_keyed$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_benchmark_cogwheel_chroma_keyed$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_benchmark_cogwheel_chroma_keyed$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_benchmark_cogwheel_chroma_keyed$(PreprocessSuffix): ../sdk/lib/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_chroma_keyed.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_benchmark_cogwheel_chroma_keyed$(PreprocessSuffix) ../sdk/lib/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_chroma_keyed.c

$(IntermediateDirectory)/assets_img_benchmark_cogwheel_indexed16$(ObjectSuffix): ../sdk/lib/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_indexed16.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_indexed16.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_benchmark_cogwheel_indexed16$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_benchmark_cogwheel_indexed16$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_benchmark_cogwheel_indexed16$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_benchmark_cogwheel_indexed16$(PreprocessSuffix): ../sdk/lib/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_indexed16.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_benchmark_cogwheel_indexed16$(PreprocessSuffix) ../sdk/lib/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_indexed16.c

$(IntermediateDirectory)/assets_img_benchmark_cogwheel_rgb$(ObjectSuffix): ../sdk/lib/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_rgb.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_rgb.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_benchmark_cogwheel_rgb$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_benchmark_cogwheel_rgb$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_benchmark_cogwheel_rgb$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_benchmark_cogwheel_rgb$(PreprocessSuffix): ../sdk/lib/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_rgb.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_benchmark_cogwheel_rgb$(PreprocessSuffix) ../sdk/lib/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_rgb.c

$(IntermediateDirectory)/assets_img_benchmark_cogwheel_rgb565a8$(ObjectSuffix): ../sdk/lib/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_rgb565a8.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_rgb565a8.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_benchmark_cogwheel_rgb565a8$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_benchmark_cogwheel_rgb565a8$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_benchmark_cogwheel_rgb565a8$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_benchmark_cogwheel_rgb565a8$(PreprocessSuffix): ../sdk/lib/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_rgb565a8.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_benchmark_cogwheel_rgb565a8$(PreprocessSuffix) ../sdk/lib/lvgl/demos/benchmark/assets/img_benchmark_cogwheel_rgb565a8.c

$(IntermediateDirectory)/assets_lv_font_bechmark_montserrat_12_compr_az.c$(ObjectSuffix): ../sdk/lib/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_12_compr_az.c.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_12_compr_az.c.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_lv_font_bechmark_montserrat_12_compr_az.c$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_lv_font_bechmark_montserrat_12_compr_az.c$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_lv_font_bechmark_montserrat_12_compr_az.c$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_lv_font_bechmark_montserrat_12_compr_az.c$(PreprocessSuffix): ../sdk/lib/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_12_compr_az.c.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_lv_font_bechmark_montserrat_12_compr_az.c$(PreprocessSuffix) ../sdk/lib/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_12_compr_az.c.c

$(IntermediateDirectory)/assets_lv_font_bechmark_montserrat_16_compr_az.c$(ObjectSuffix): ../sdk/lib/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_16_compr_az.c.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_16_compr_az.c.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_lv_font_bechmark_montserrat_16_compr_az.c$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_lv_font_bechmark_montserrat_16_compr_az.c$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_lv_font_bechmark_montserrat_16_compr_az.c$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_lv_font_bechmark_montserrat_16_compr_az.c$(PreprocessSuffix): ../sdk/lib/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_16_compr_az.c.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_lv_font_bechmark_montserrat_16_compr_az.c$(PreprocessSuffix) ../sdk/lib/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_16_compr_az.c.c

$(IntermediateDirectory)/assets_lv_font_bechmark_montserrat_28_compr_az.c$(ObjectSuffix): ../sdk/lib/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_28_compr_az.c.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_28_compr_az.c.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_lv_font_bechmark_montserrat_28_compr_az.c$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_lv_font_bechmark_montserrat_28_compr_az.c$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_lv_font_bechmark_montserrat_28_compr_az.c$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_lv_font_bechmark_montserrat_28_compr_az.c$(PreprocessSuffix): ../sdk/lib/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_28_compr_az.c.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_lv_font_bechmark_montserrat_28_compr_az.c$(PreprocessSuffix) ../sdk/lib/lvgl/demos/benchmark/assets/lv_font_bechmark_montserrat_28_compr_az.c.c

$(IntermediateDirectory)/assets_img_lv_demo_music_btn_corner_large$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_corner_large.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_corner_large.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_btn_corner_large$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_btn_corner_large$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_btn_corner_large$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_btn_corner_large$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_corner_large.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_btn_corner_large$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_corner_large.c

$(IntermediateDirectory)/assets_img_lv_demo_music_btn_list_pause$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_list_pause.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_list_pause.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_btn_list_pause$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_btn_list_pause$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_btn_list_pause$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_btn_list_pause$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_list_pause.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_btn_list_pause$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_list_pause.c

$(IntermediateDirectory)/assets_img_lv_demo_music_btn_list_pause_large$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_list_pause_large.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_list_pause_large.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_btn_list_pause_large$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_btn_list_pause_large$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_btn_list_pause_large$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_btn_list_pause_large$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_list_pause_large.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_btn_list_pause_large$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_list_pause_large.c

$(IntermediateDirectory)/assets_img_lv_demo_music_btn_list_play$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_list_play.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_list_play.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_btn_list_play$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_btn_list_play$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_btn_list_play$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_btn_list_play$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_list_play.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_btn_list_play$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_list_play.c

$(IntermediateDirectory)/assets_img_lv_demo_music_btn_list_play_large$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_list_play_large.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_list_play_large.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_btn_list_play_large$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_btn_list_play_large$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_btn_list_play_large$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_btn_list_play_large$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_list_play_large.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_btn_list_play_large$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_list_play_large.c

$(IntermediateDirectory)/assets_img_lv_demo_music_btn_loop$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_loop.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_loop.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_btn_loop$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_btn_loop$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_btn_loop$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_btn_loop$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_loop.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_btn_loop$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_loop.c

$(IntermediateDirectory)/assets_img_lv_demo_music_btn_loop_large$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_loop_large.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_loop_large.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_btn_loop_large$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_btn_loop_large$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_btn_loop_large$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_btn_loop_large$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_loop_large.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_btn_loop_large$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_loop_large.c

$(IntermediateDirectory)/assets_img_lv_demo_music_btn_next$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_next.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_next.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_btn_next$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_btn_next$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_btn_next$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_btn_next$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_next.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_btn_next$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_next.c

$(IntermediateDirectory)/assets_img_lv_demo_music_btn_next_large$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_next_large.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_next_large.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_btn_next_large$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_btn_next_large$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_btn_next_large$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_btn_next_large$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_next_large.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_btn_next_large$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_next_large.c

$(IntermediateDirectory)/assets_img_lv_demo_music_btn_pause$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_pause.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_pause.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_btn_pause$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_btn_pause$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_btn_pause$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_btn_pause$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_pause.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_btn_pause$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_pause.c

$(IntermediateDirectory)/assets_img_lv_demo_music_btn_pause_large$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_pause_large.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_pause_large.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_btn_pause_large$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_btn_pause_large$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_btn_pause_large$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_btn_pause_large$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_pause_large.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_btn_pause_large$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_pause_large.c

$(IntermediateDirectory)/assets_img_lv_demo_music_btn_play$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_play.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_play.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_btn_play$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_btn_play$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_btn_play$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_btn_play$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_play.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_btn_play$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_play.c

$(IntermediateDirectory)/assets_img_lv_demo_music_btn_play_large$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_play_large.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_play_large.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_btn_play_large$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_btn_play_large$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_btn_play_large$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_btn_play_large$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_play_large.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_btn_play_large$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_play_large.c

$(IntermediateDirectory)/assets_img_lv_demo_music_btn_prev$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_prev.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_prev.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_btn_prev$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_btn_prev$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_btn_prev$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_btn_prev$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_prev.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_btn_prev$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_prev.c

$(IntermediateDirectory)/assets_img_lv_demo_music_btn_prev_large$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_prev_large.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_prev_large.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_btn_prev_large$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_btn_prev_large$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_btn_prev_large$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_btn_prev_large$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_prev_large.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_btn_prev_large$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_prev_large.c

$(IntermediateDirectory)/assets_img_lv_demo_music_btn_rnd$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_rnd.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_rnd.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_btn_rnd$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_btn_rnd$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_btn_rnd$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_btn_rnd$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_rnd.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_btn_rnd$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_rnd.c

$(IntermediateDirectory)/assets_img_lv_demo_music_btn_rnd_large$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_rnd_large.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_rnd_large.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_btn_rnd_large$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_btn_rnd_large$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_btn_rnd_large$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_btn_rnd_large$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_rnd_large.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_btn_rnd_large$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_btn_rnd_large.c

$(IntermediateDirectory)/assets_img_lv_demo_music_corner_left$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_corner_left.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_corner_left.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_corner_left$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_corner_left$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_corner_left$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_corner_left$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_corner_left.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_corner_left$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_corner_left.c

$(IntermediateDirectory)/assets_img_lv_demo_music_corner_left_large$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_corner_left_large.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_corner_left_large.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_corner_left_large$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_corner_left_large$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_corner_left_large$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_corner_left_large$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_corner_left_large.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_corner_left_large$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_corner_left_large.c

$(IntermediateDirectory)/assets_img_lv_demo_music_corner_right$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_corner_right.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_corner_right.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_corner_right$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_corner_right$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_corner_right$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_corner_right$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_corner_right.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_corner_right$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_corner_right.c

$(IntermediateDirectory)/assets_img_lv_demo_music_corner_right_large$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_corner_right_large.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_corner_right_large.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_corner_right_large$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_corner_right_large$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_corner_right_large$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_corner_right_large$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_corner_right_large.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_corner_right_large$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_corner_right_large.c

$(IntermediateDirectory)/assets_img_lv_demo_music_cover_1$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_cover_1.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_cover_1.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_cover_1$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_cover_1$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_cover_1$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_cover_1$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_cover_1.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_cover_1$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_cover_1.c

$(IntermediateDirectory)/assets_img_lv_demo_music_cover_1_large$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_cover_1_large.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_cover_1_large.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_cover_1_large$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_cover_1_large$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_cover_1_large$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_cover_1_large$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_cover_1_large.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_cover_1_large$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_cover_1_large.c

$(IntermediateDirectory)/assets_img_lv_demo_music_cover_2$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_cover_2.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_cover_2.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_cover_2$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_cover_2$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_cover_2$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_cover_2$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_cover_2.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_cover_2$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_cover_2.c

$(IntermediateDirectory)/assets_img_lv_demo_music_cover_2_large$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_cover_2_large.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_cover_2_large.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_cover_2_large$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_cover_2_large$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_cover_2_large$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_cover_2_large$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_cover_2_large.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_cover_2_large$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_cover_2_large.c

$(IntermediateDirectory)/assets_img_lv_demo_music_cover_3$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_cover_3.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_cover_3.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_cover_3$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_cover_3$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_cover_3$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_cover_3$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_cover_3.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_cover_3$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_cover_3.c

$(IntermediateDirectory)/assets_img_lv_demo_music_cover_3_large$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_cover_3_large.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_cover_3_large.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_cover_3_large$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_cover_3_large$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_cover_3_large$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_cover_3_large$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_cover_3_large.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_cover_3_large$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_cover_3_large.c

$(IntermediateDirectory)/assets_img_lv_demo_music_icon_1$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_icon_1.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_icon_1.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_icon_1$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_icon_1$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_icon_1$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_icon_1$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_icon_1.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_icon_1$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_icon_1.c

$(IntermediateDirectory)/assets_img_lv_demo_music_icon_1_large$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_icon_1_large.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_icon_1_large.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_icon_1_large$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_icon_1_large$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_icon_1_large$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_icon_1_large$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_icon_1_large.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_icon_1_large$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_icon_1_large.c

$(IntermediateDirectory)/assets_img_lv_demo_music_icon_2$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_icon_2.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_icon_2.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_icon_2$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_icon_2$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_icon_2$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_icon_2$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_icon_2.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_icon_2$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_icon_2.c

$(IntermediateDirectory)/assets_img_lv_demo_music_icon_2_large$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_icon_2_large.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_icon_2_large.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_icon_2_large$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_icon_2_large$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_icon_2_large$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_icon_2_large$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_icon_2_large.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_icon_2_large$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_icon_2_large.c

$(IntermediateDirectory)/assets_img_lv_demo_music_icon_3$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_icon_3.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_icon_3.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_icon_3$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_icon_3$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_icon_3$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_icon_3$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_icon_3.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_icon_3$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_icon_3.c

$(IntermediateDirectory)/assets_img_lv_demo_music_icon_3_large$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_icon_3_large.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_icon_3_large.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_icon_3_large$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_icon_3_large$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_icon_3_large$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_icon_3_large$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_icon_3_large.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_icon_3_large$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_icon_3_large.c

$(IntermediateDirectory)/assets_img_lv_demo_music_icon_4$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_icon_4.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_icon_4.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_icon_4$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_icon_4$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_icon_4$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_icon_4$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_icon_4.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_icon_4$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_icon_4.c

$(IntermediateDirectory)/assets_img_lv_demo_music_icon_4_large$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_icon_4_large.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_icon_4_large.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_icon_4_large$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_icon_4_large$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_icon_4_large$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_icon_4_large$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_icon_4_large.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_icon_4_large$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_icon_4_large.c

$(IntermediateDirectory)/assets_img_lv_demo_music_list_border$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_list_border.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_list_border.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_list_border$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_list_border$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_list_border$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_list_border$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_list_border.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_list_border$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_list_border.c

$(IntermediateDirectory)/assets_img_lv_demo_music_list_border_large$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_list_border_large.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_list_border_large.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_list_border_large$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_list_border_large$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_list_border_large$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_list_border_large$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_list_border_large.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_list_border_large$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_list_border_large.c

$(IntermediateDirectory)/assets_img_lv_demo_music_logo$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_logo.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_logo.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_logo$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_logo$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_logo$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_logo$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_logo.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_logo$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_logo.c

$(IntermediateDirectory)/assets_img_lv_demo_music_slider_knob$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_slider_knob.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_slider_knob.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_slider_knob$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_slider_knob$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_slider_knob$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_slider_knob$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_slider_knob.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_slider_knob$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_slider_knob.c

$(IntermediateDirectory)/assets_img_lv_demo_music_slider_knob_large$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_slider_knob_large.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_slider_knob_large.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_slider_knob_large$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_slider_knob_large$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_slider_knob_large$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_slider_knob_large$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_slider_knob_large.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_slider_knob_large$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_slider_knob_large.c

$(IntermediateDirectory)/assets_img_lv_demo_music_wave_bottom$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_wave_bottom.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_wave_bottom.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_wave_bottom$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_wave_bottom$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_wave_bottom$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_wave_bottom$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_wave_bottom.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_wave_bottom$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_wave_bottom.c

$(IntermediateDirectory)/assets_img_lv_demo_music_wave_bottom_large$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_wave_bottom_large.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_wave_bottom_large.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_wave_bottom_large$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_wave_bottom_large$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_wave_bottom_large$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_wave_bottom_large$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_wave_bottom_large.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_wave_bottom_large$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_wave_bottom_large.c

$(IntermediateDirectory)/assets_img_lv_demo_music_wave_top$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_wave_top.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_wave_top.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_wave_top$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_wave_top$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_wave_top$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_wave_top$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_wave_top.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_wave_top$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_wave_top.c

$(IntermediateDirectory)/assets_img_lv_demo_music_wave_top_large$(ObjectSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_wave_top_large.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_wave_top_large.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lv_demo_music_wave_top_large$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lv_demo_music_wave_top_large$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lv_demo_music_wave_top_large$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lv_demo_music_wave_top_large$(PreprocessSuffix): ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_wave_top_large.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lv_demo_music_wave_top_large$(PreprocessSuffix) ../sdk/lib/lvgl/demos/music/assets/img_lv_demo_music_wave_top_large.c

$(IntermediateDirectory)/assets_img_clothes$(ObjectSuffix): ../sdk/lib/lvgl/demos/widgets/assets/img_clothes.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/widgets/assets/img_clothes.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_clothes$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_clothes$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_clothes$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_clothes$(PreprocessSuffix): ../sdk/lib/lvgl/demos/widgets/assets/img_clothes.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_clothes$(PreprocessSuffix) ../sdk/lib/lvgl/demos/widgets/assets/img_clothes.c

$(IntermediateDirectory)/assets_img_demo_widgets_avatar$(ObjectSuffix): ../sdk/lib/lvgl/demos/widgets/assets/img_demo_widgets_avatar.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/widgets/assets/img_demo_widgets_avatar.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_demo_widgets_avatar$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_demo_widgets_avatar$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_demo_widgets_avatar$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_demo_widgets_avatar$(PreprocessSuffix): ../sdk/lib/lvgl/demos/widgets/assets/img_demo_widgets_avatar.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_demo_widgets_avatar$(PreprocessSuffix) ../sdk/lib/lvgl/demos/widgets/assets/img_demo_widgets_avatar.c

$(IntermediateDirectory)/assets_img_lvgl_logo$(ObjectSuffix): ../sdk/lib/lvgl/demos/widgets/assets/img_lvgl_logo.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/demos/widgets/assets/img_lvgl_logo.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/assets_img_lvgl_logo$(ObjectSuffix) -MF$(IntermediateDirectory)/assets_img_lvgl_logo$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/assets_img_lvgl_logo$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/assets_img_lvgl_logo$(PreprocessSuffix): ../sdk/lib/lvgl/demos/widgets/assets/img_lvgl_logo.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/assets_img_lvgl_logo$(PreprocessSuffix) ../sdk/lib/lvgl/demos/widgets/assets/img_lvgl_logo.c

$(IntermediateDirectory)/arm2d_lv_gpu_arm2d$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/arm2d/lv_gpu_arm2d.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/arm2d/lv_gpu_arm2d.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/arm2d_lv_gpu_arm2d$(ObjectSuffix) -MF$(IntermediateDirectory)/arm2d_lv_gpu_arm2d$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/arm2d_lv_gpu_arm2d$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/arm2d_lv_gpu_arm2d$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/arm2d/lv_gpu_arm2d.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/arm2d_lv_gpu_arm2d$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/arm2d/lv_gpu_arm2d.c

$(IntermediateDirectory)/gd32_ipa_lv_gpu_gd32_ipa$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/gd32_ipa/lv_gpu_gd32_ipa.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/gd32_ipa/lv_gpu_gd32_ipa.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/gd32_ipa_lv_gpu_gd32_ipa$(ObjectSuffix) -MF$(IntermediateDirectory)/gd32_ipa_lv_gpu_gd32_ipa$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/gd32_ipa_lv_gpu_gd32_ipa$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/gd32_ipa_lv_gpu_gd32_ipa$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/gd32_ipa/lv_gpu_gd32_ipa.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/gd32_ipa_lv_gpu_gd32_ipa$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/gd32_ipa/lv_gpu_gd32_ipa.c

$(IntermediateDirectory)/nxp_lv_gpu_nxp$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/nxp/lv_gpu_nxp.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/nxp/lv_gpu_nxp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/nxp_lv_gpu_nxp$(ObjectSuffix) -MF$(IntermediateDirectory)/nxp_lv_gpu_nxp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/nxp_lv_gpu_nxp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/nxp_lv_gpu_nxp$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/nxp/lv_gpu_nxp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/nxp_lv_gpu_nxp$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/nxp/lv_gpu_nxp.c

$(IntermediateDirectory)/sdl_lv_draw_sdl$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sdl_lv_draw_sdl$(ObjectSuffix) -MF$(IntermediateDirectory)/sdl_lv_draw_sdl$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sdl_lv_draw_sdl$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sdl_lv_draw_sdl$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sdl_lv_draw_sdl$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl.c

$(IntermediateDirectory)/sdl_lv_draw_sdl_arc$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_arc.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_arc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sdl_lv_draw_sdl_arc$(ObjectSuffix) -MF$(IntermediateDirectory)/sdl_lv_draw_sdl_arc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sdl_lv_draw_sdl_arc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sdl_lv_draw_sdl_arc$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_arc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sdl_lv_draw_sdl_arc$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_arc.c

$(IntermediateDirectory)/sdl_lv_draw_sdl_bg$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_bg.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_bg.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sdl_lv_draw_sdl_bg$(ObjectSuffix) -MF$(IntermediateDirectory)/sdl_lv_draw_sdl_bg$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sdl_lv_draw_sdl_bg$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sdl_lv_draw_sdl_bg$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_bg.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sdl_lv_draw_sdl_bg$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_bg.c

$(IntermediateDirectory)/sdl_lv_draw_sdl_composite$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_composite.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_composite.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sdl_lv_draw_sdl_composite$(ObjectSuffix) -MF$(IntermediateDirectory)/sdl_lv_draw_sdl_composite$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sdl_lv_draw_sdl_composite$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sdl_lv_draw_sdl_composite$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_composite.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sdl_lv_draw_sdl_composite$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_composite.c

$(IntermediateDirectory)/sdl_lv_draw_sdl_img$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_img.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_img.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sdl_lv_draw_sdl_img$(ObjectSuffix) -MF$(IntermediateDirectory)/sdl_lv_draw_sdl_img$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sdl_lv_draw_sdl_img$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sdl_lv_draw_sdl_img$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_img.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sdl_lv_draw_sdl_img$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_img.c

$(IntermediateDirectory)/sdl_lv_draw_sdl_label$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_label.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_label.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sdl_lv_draw_sdl_label$(ObjectSuffix) -MF$(IntermediateDirectory)/sdl_lv_draw_sdl_label$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sdl_lv_draw_sdl_label$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sdl_lv_draw_sdl_label$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_label.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sdl_lv_draw_sdl_label$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_label.c

$(IntermediateDirectory)/sdl_lv_draw_sdl_layer$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_layer.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_layer.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sdl_lv_draw_sdl_layer$(ObjectSuffix) -MF$(IntermediateDirectory)/sdl_lv_draw_sdl_layer$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sdl_lv_draw_sdl_layer$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sdl_lv_draw_sdl_layer$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_layer.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sdl_lv_draw_sdl_layer$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_layer.c

$(IntermediateDirectory)/sdl_lv_draw_sdl_line$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_line.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_line.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sdl_lv_draw_sdl_line$(ObjectSuffix) -MF$(IntermediateDirectory)/sdl_lv_draw_sdl_line$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sdl_lv_draw_sdl_line$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sdl_lv_draw_sdl_line$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_line.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sdl_lv_draw_sdl_line$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_line.c

$(IntermediateDirectory)/sdl_lv_draw_sdl_mask$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_mask.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_mask.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sdl_lv_draw_sdl_mask$(ObjectSuffix) -MF$(IntermediateDirectory)/sdl_lv_draw_sdl_mask$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sdl_lv_draw_sdl_mask$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sdl_lv_draw_sdl_mask$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_mask.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sdl_lv_draw_sdl_mask$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_mask.c

$(IntermediateDirectory)/sdl_lv_draw_sdl_polygon$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_polygon.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_polygon.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sdl_lv_draw_sdl_polygon$(ObjectSuffix) -MF$(IntermediateDirectory)/sdl_lv_draw_sdl_polygon$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sdl_lv_draw_sdl_polygon$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sdl_lv_draw_sdl_polygon$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_polygon.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sdl_lv_draw_sdl_polygon$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_polygon.c

$(IntermediateDirectory)/sdl_lv_draw_sdl_rect$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_rect.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_rect.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sdl_lv_draw_sdl_rect$(ObjectSuffix) -MF$(IntermediateDirectory)/sdl_lv_draw_sdl_rect$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sdl_lv_draw_sdl_rect$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sdl_lv_draw_sdl_rect$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_rect.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sdl_lv_draw_sdl_rect$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_rect.c

$(IntermediateDirectory)/sdl_lv_draw_sdl_stack_blur$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_stack_blur.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_stack_blur.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sdl_lv_draw_sdl_stack_blur$(ObjectSuffix) -MF$(IntermediateDirectory)/sdl_lv_draw_sdl_stack_blur$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sdl_lv_draw_sdl_stack_blur$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sdl_lv_draw_sdl_stack_blur$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_stack_blur.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sdl_lv_draw_sdl_stack_blur$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_stack_blur.c

$(IntermediateDirectory)/sdl_lv_draw_sdl_texture_cache$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_texture_cache.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_texture_cache.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sdl_lv_draw_sdl_texture_cache$(ObjectSuffix) -MF$(IntermediateDirectory)/sdl_lv_draw_sdl_texture_cache$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sdl_lv_draw_sdl_texture_cache$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sdl_lv_draw_sdl_texture_cache$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_texture_cache.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sdl_lv_draw_sdl_texture_cache$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_texture_cache.c

$(IntermediateDirectory)/sdl_lv_draw_sdl_utils$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_utils.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_utils.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sdl_lv_draw_sdl_utils$(ObjectSuffix) -MF$(IntermediateDirectory)/sdl_lv_draw_sdl_utils$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sdl_lv_draw_sdl_utils$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sdl_lv_draw_sdl_utils$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_utils.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sdl_lv_draw_sdl_utils$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/sdl/lv_draw_sdl_utils.c

$(IntermediateDirectory)/stm32_dma2d_lv_gpu_stm32_dma2d$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/stm32_dma2d/lv_gpu_stm32_dma2d.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/stm32_dma2d/lv_gpu_stm32_dma2d.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/stm32_dma2d_lv_gpu_stm32_dma2d$(ObjectSuffix) -MF$(IntermediateDirectory)/stm32_dma2d_lv_gpu_stm32_dma2d$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/stm32_dma2d_lv_gpu_stm32_dma2d$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/stm32_dma2d_lv_gpu_stm32_dma2d$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/stm32_dma2d/lv_gpu_stm32_dma2d.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/stm32_dma2d_lv_gpu_stm32_dma2d$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/stm32_dma2d/lv_gpu_stm32_dma2d.c

$(IntermediateDirectory)/sw_lv_draw_sw$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sw_lv_draw_sw$(ObjectSuffix) -MF$(IntermediateDirectory)/sw_lv_draw_sw$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sw_lv_draw_sw$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sw_lv_draw_sw$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sw_lv_draw_sw$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw.c

$(IntermediateDirectory)/sw_lv_draw_sw_arc$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_arc.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_arc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sw_lv_draw_sw_arc$(ObjectSuffix) -MF$(IntermediateDirectory)/sw_lv_draw_sw_arc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sw_lv_draw_sw_arc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sw_lv_draw_sw_arc$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_arc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sw_lv_draw_sw_arc$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_arc.c

$(IntermediateDirectory)/sw_lv_draw_sw_blend$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_blend.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_blend.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sw_lv_draw_sw_blend$(ObjectSuffix) -MF$(IntermediateDirectory)/sw_lv_draw_sw_blend$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sw_lv_draw_sw_blend$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sw_lv_draw_sw_blend$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_blend.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sw_lv_draw_sw_blend$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_blend.c

$(IntermediateDirectory)/sw_lv_draw_sw_dither$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_dither.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_dither.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sw_lv_draw_sw_dither$(ObjectSuffix) -MF$(IntermediateDirectory)/sw_lv_draw_sw_dither$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sw_lv_draw_sw_dither$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sw_lv_draw_sw_dither$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_dither.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sw_lv_draw_sw_dither$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_dither.c

$(IntermediateDirectory)/sw_lv_draw_sw_gradient$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_gradient.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_gradient.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sw_lv_draw_sw_gradient$(ObjectSuffix) -MF$(IntermediateDirectory)/sw_lv_draw_sw_gradient$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sw_lv_draw_sw_gradient$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sw_lv_draw_sw_gradient$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_gradient.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sw_lv_draw_sw_gradient$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_gradient.c

$(IntermediateDirectory)/sw_lv_draw_sw_img$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_img.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_img.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sw_lv_draw_sw_img$(ObjectSuffix) -MF$(IntermediateDirectory)/sw_lv_draw_sw_img$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sw_lv_draw_sw_img$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sw_lv_draw_sw_img$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_img.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sw_lv_draw_sw_img$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_img.c

$(IntermediateDirectory)/sw_lv_draw_sw_layer$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_layer.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_layer.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sw_lv_draw_sw_layer$(ObjectSuffix) -MF$(IntermediateDirectory)/sw_lv_draw_sw_layer$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sw_lv_draw_sw_layer$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sw_lv_draw_sw_layer$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_layer.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sw_lv_draw_sw_layer$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_layer.c

$(IntermediateDirectory)/sw_lv_draw_sw_letter$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_letter.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_letter.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sw_lv_draw_sw_letter$(ObjectSuffix) -MF$(IntermediateDirectory)/sw_lv_draw_sw_letter$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sw_lv_draw_sw_letter$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sw_lv_draw_sw_letter$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_letter.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sw_lv_draw_sw_letter$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_letter.c

$(IntermediateDirectory)/sw_lv_draw_sw_line$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_line.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_line.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sw_lv_draw_sw_line$(ObjectSuffix) -MF$(IntermediateDirectory)/sw_lv_draw_sw_line$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sw_lv_draw_sw_line$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sw_lv_draw_sw_line$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_line.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sw_lv_draw_sw_line$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_line.c

$(IntermediateDirectory)/sw_lv_draw_sw_polygon$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_polygon.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_polygon.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sw_lv_draw_sw_polygon$(ObjectSuffix) -MF$(IntermediateDirectory)/sw_lv_draw_sw_polygon$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sw_lv_draw_sw_polygon$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sw_lv_draw_sw_polygon$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_polygon.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sw_lv_draw_sw_polygon$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_polygon.c

$(IntermediateDirectory)/sw_lv_draw_sw_rect$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_rect.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_rect.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sw_lv_draw_sw_rect$(ObjectSuffix) -MF$(IntermediateDirectory)/sw_lv_draw_sw_rect$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sw_lv_draw_sw_rect$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sw_lv_draw_sw_rect$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_rect.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sw_lv_draw_sw_rect$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_rect.c

$(IntermediateDirectory)/sw_lv_draw_sw_transform$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_transform.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_transform.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sw_lv_draw_sw_transform$(ObjectSuffix) -MF$(IntermediateDirectory)/sw_lv_draw_sw_transform$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sw_lv_draw_sw_transform$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sw_lv_draw_sw_transform$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_transform.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sw_lv_draw_sw_transform$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/sw/lv_draw_sw_transform.c

$(IntermediateDirectory)/swm341_dma2d_lv_gpu_swm341_dma2d$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/swm341_dma2d/lv_gpu_swm341_dma2d.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/swm341_dma2d/lv_gpu_swm341_dma2d.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/swm341_dma2d_lv_gpu_swm341_dma2d$(ObjectSuffix) -MF$(IntermediateDirectory)/swm341_dma2d_lv_gpu_swm341_dma2d$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/swm341_dma2d_lv_gpu_swm341_dma2d$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/swm341_dma2d_lv_gpu_swm341_dma2d$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/swm341_dma2d/lv_gpu_swm341_dma2d.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/swm341_dma2d_lv_gpu_swm341_dma2d$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/swm341_dma2d/lv_gpu_swm341_dma2d.c

$(IntermediateDirectory)/flex_lv_flex$(ObjectSuffix): ../sdk/lib/lvgl/src/layouts/flex/lv_flex.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/layouts/flex/lv_flex.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/flex_lv_flex$(ObjectSuffix) -MF$(IntermediateDirectory)/flex_lv_flex$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/flex_lv_flex$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/flex_lv_flex$(PreprocessSuffix): ../sdk/lib/lvgl/src/layouts/flex/lv_flex.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/flex_lv_flex$(PreprocessSuffix) ../sdk/lib/lvgl/src/layouts/flex/lv_flex.c

$(IntermediateDirectory)/grid_lv_grid$(ObjectSuffix): ../sdk/lib/lvgl/src/layouts/grid/lv_grid.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/layouts/grid/lv_grid.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/grid_lv_grid$(ObjectSuffix) -MF$(IntermediateDirectory)/grid_lv_grid$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/grid_lv_grid$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/grid_lv_grid$(PreprocessSuffix): ../sdk/lib/lvgl/src/layouts/grid/lv_grid.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/grid_lv_grid$(PreprocessSuffix) ../sdk/lib/lvgl/src/layouts/grid/lv_grid.c

$(IntermediateDirectory)/bmp_lv_bmp$(ObjectSuffix): ../sdk/lib/lvgl/src/libs/bmp/lv_bmp.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/libs/bmp/lv_bmp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/bmp_lv_bmp$(ObjectSuffix) -MF$(IntermediateDirectory)/bmp_lv_bmp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/bmp_lv_bmp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/bmp_lv_bmp$(PreprocessSuffix): ../sdk/lib/lvgl/src/libs/bmp/lv_bmp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/bmp_lv_bmp$(PreprocessSuffix) ../sdk/lib/lvgl/src/libs/bmp/lv_bmp.c

$(IntermediateDirectory)/ffmpeg_lv_ffmpeg$(ObjectSuffix): ../sdk/lib/lvgl/src/libs/ffmpeg/lv_ffmpeg.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/libs/ffmpeg/lv_ffmpeg.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ffmpeg_lv_ffmpeg$(ObjectSuffix) -MF$(IntermediateDirectory)/ffmpeg_lv_ffmpeg$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ffmpeg_lv_ffmpeg$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ffmpeg_lv_ffmpeg$(PreprocessSuffix): ../sdk/lib/lvgl/src/libs/ffmpeg/lv_ffmpeg.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ffmpeg_lv_ffmpeg$(PreprocessSuffix) ../sdk/lib/lvgl/src/libs/ffmpeg/lv_ffmpeg.c

$(IntermediateDirectory)/freetype_lv_freetype$(ObjectSuffix): ../sdk/lib/lvgl/src/libs/freetype/lv_freetype.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/libs/freetype/lv_freetype.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/freetype_lv_freetype$(ObjectSuffix) -MF$(IntermediateDirectory)/freetype_lv_freetype$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/freetype_lv_freetype$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/freetype_lv_freetype$(PreprocessSuffix): ../sdk/lib/lvgl/src/libs/freetype/lv_freetype.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/freetype_lv_freetype$(PreprocessSuffix) ../sdk/lib/lvgl/src/libs/freetype/lv_freetype.c

$(IntermediateDirectory)/freetype_lv_ftsystem$(ObjectSuffix): ../sdk/lib/lvgl/src/libs/freetype/lv_ftsystem.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/libs/freetype/lv_ftsystem.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/freetype_lv_ftsystem$(ObjectSuffix) -MF$(IntermediateDirectory)/freetype_lv_ftsystem$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/freetype_lv_ftsystem$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/freetype_lv_ftsystem$(PreprocessSuffix): ../sdk/lib/lvgl/src/libs/freetype/lv_ftsystem.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/freetype_lv_ftsystem$(PreprocessSuffix) ../sdk/lib/lvgl/src/libs/freetype/lv_ftsystem.c

$(IntermediateDirectory)/fsdrv_lv_fs_cbfs$(ObjectSuffix): ../sdk/lib/lvgl/src/libs/fsdrv/lv_fs_cbfs.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/libs/fsdrv/lv_fs_cbfs.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/fsdrv_lv_fs_cbfs$(ObjectSuffix) -MF$(IntermediateDirectory)/fsdrv_lv_fs_cbfs$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/fsdrv_lv_fs_cbfs$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/fsdrv_lv_fs_cbfs$(PreprocessSuffix): ../sdk/lib/lvgl/src/libs/fsdrv/lv_fs_cbfs.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/fsdrv_lv_fs_cbfs$(PreprocessSuffix) ../sdk/lib/lvgl/src/libs/fsdrv/lv_fs_cbfs.c

$(IntermediateDirectory)/fsdrv_lv_fs_fatfs$(ObjectSuffix): ../sdk/lib/lvgl/src/libs/fsdrv/lv_fs_fatfs.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/libs/fsdrv/lv_fs_fatfs.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/fsdrv_lv_fs_fatfs$(ObjectSuffix) -MF$(IntermediateDirectory)/fsdrv_lv_fs_fatfs$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/fsdrv_lv_fs_fatfs$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/fsdrv_lv_fs_fatfs$(PreprocessSuffix): ../sdk/lib/lvgl/src/libs/fsdrv/lv_fs_fatfs.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/fsdrv_lv_fs_fatfs$(PreprocessSuffix) ../sdk/lib/lvgl/src/libs/fsdrv/lv_fs_fatfs.c

$(IntermediateDirectory)/fsdrv_lv_fs_posix$(ObjectSuffix): ../sdk/lib/lvgl/src/libs/fsdrv/lv_fs_posix.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/libs/fsdrv/lv_fs_posix.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/fsdrv_lv_fs_posix$(ObjectSuffix) -MF$(IntermediateDirectory)/fsdrv_lv_fs_posix$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/fsdrv_lv_fs_posix$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/fsdrv_lv_fs_posix$(PreprocessSuffix): ../sdk/lib/lvgl/src/libs/fsdrv/lv_fs_posix.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/fsdrv_lv_fs_posix$(PreprocessSuffix) ../sdk/lib/lvgl/src/libs/fsdrv/lv_fs_posix.c

$(IntermediateDirectory)/fsdrv_lv_fs_stdio$(ObjectSuffix): ../sdk/lib/lvgl/src/libs/fsdrv/lv_fs_stdio.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/libs/fsdrv/lv_fs_stdio.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/fsdrv_lv_fs_stdio$(ObjectSuffix) -MF$(IntermediateDirectory)/fsdrv_lv_fs_stdio$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/fsdrv_lv_fs_stdio$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/fsdrv_lv_fs_stdio$(PreprocessSuffix): ../sdk/lib/lvgl/src/libs/fsdrv/lv_fs_stdio.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/fsdrv_lv_fs_stdio$(PreprocessSuffix) ../sdk/lib/lvgl/src/libs/fsdrv/lv_fs_stdio.c

$(IntermediateDirectory)/fsdrv_lv_fs_win32$(ObjectSuffix): ../sdk/lib/lvgl/src/libs/fsdrv/lv_fs_win32.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/libs/fsdrv/lv_fs_win32.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/fsdrv_lv_fs_win32$(ObjectSuffix) -MF$(IntermediateDirectory)/fsdrv_lv_fs_win32$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/fsdrv_lv_fs_win32$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/fsdrv_lv_fs_win32$(PreprocessSuffix): ../sdk/lib/lvgl/src/libs/fsdrv/lv_fs_win32.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/fsdrv_lv_fs_win32$(PreprocessSuffix) ../sdk/lib/lvgl/src/libs/fsdrv/lv_fs_win32.c

$(IntermediateDirectory)/gif_gifdec$(ObjectSuffix): ../sdk/lib/lvgl/src/libs/gif/gifdec.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/libs/gif/gifdec.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/gif_gifdec$(ObjectSuffix) -MF$(IntermediateDirectory)/gif_gifdec$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/gif_gifdec$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/gif_gifdec$(PreprocessSuffix): ../sdk/lib/lvgl/src/libs/gif/gifdec.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/gif_gifdec$(PreprocessSuffix) ../sdk/lib/lvgl/src/libs/gif/gifdec.c

$(IntermediateDirectory)/gif_lv_gif$(ObjectSuffix): ../sdk/lib/lvgl/src/libs/gif/lv_gif.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/libs/gif/lv_gif.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/gif_lv_gif$(ObjectSuffix) -MF$(IntermediateDirectory)/gif_lv_gif$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/gif_lv_gif$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/gif_lv_gif$(PreprocessSuffix): ../sdk/lib/lvgl/src/libs/gif/lv_gif.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/gif_lv_gif$(PreprocessSuffix) ../sdk/lib/lvgl/src/libs/gif/lv_gif.c

$(IntermediateDirectory)/png_lodepng$(ObjectSuffix): ../sdk/lib/lvgl/src/libs/png/lodepng.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/libs/png/lodepng.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/png_lodepng$(ObjectSuffix) -MF$(IntermediateDirectory)/png_lodepng$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/png_lodepng$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/png_lodepng$(PreprocessSuffix): ../sdk/lib/lvgl/src/libs/png/lodepng.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/png_lodepng$(PreprocessSuffix) ../sdk/lib/lvgl/src/libs/png/lodepng.c

$(IntermediateDirectory)/png_lv_png$(ObjectSuffix): ../sdk/lib/lvgl/src/libs/png/lv_png.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/libs/png/lv_png.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/png_lv_png$(ObjectSuffix) -MF$(IntermediateDirectory)/png_lv_png$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/png_lv_png$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/png_lv_png$(PreprocessSuffix): ../sdk/lib/lvgl/src/libs/png/lv_png.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/png_lv_png$(PreprocessSuffix) ../sdk/lib/lvgl/src/libs/png/lv_png.c

$(IntermediateDirectory)/qrcode_lv_qrcode$(ObjectSuffix): ../sdk/lib/lvgl/src/libs/qrcode/lv_qrcode.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/libs/qrcode/lv_qrcode.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/qrcode_lv_qrcode$(ObjectSuffix) -MF$(IntermediateDirectory)/qrcode_lv_qrcode$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/qrcode_lv_qrcode$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/qrcode_lv_qrcode$(PreprocessSuffix): ../sdk/lib/lvgl/src/libs/qrcode/lv_qrcode.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/qrcode_lv_qrcode$(PreprocessSuffix) ../sdk/lib/lvgl/src/libs/qrcode/lv_qrcode.c

$(IntermediateDirectory)/qrcode_qrcodegen$(ObjectSuffix): ../sdk/lib/lvgl/src/libs/qrcode/qrcodegen.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/libs/qrcode/qrcodegen.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/qrcode_qrcodegen$(ObjectSuffix) -MF$(IntermediateDirectory)/qrcode_qrcodegen$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/qrcode_qrcodegen$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/qrcode_qrcodegen$(PreprocessSuffix): ../sdk/lib/lvgl/src/libs/qrcode/qrcodegen.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/qrcode_qrcodegen$(PreprocessSuffix) ../sdk/lib/lvgl/src/libs/qrcode/qrcodegen.c

$(IntermediateDirectory)/rlottie_lv_rlottie$(ObjectSuffix): ../sdk/lib/lvgl/src/libs/rlottie/lv_rlottie.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/libs/rlottie/lv_rlottie.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/rlottie_lv_rlottie$(ObjectSuffix) -MF$(IntermediateDirectory)/rlottie_lv_rlottie$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/rlottie_lv_rlottie$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/rlottie_lv_rlottie$(PreprocessSuffix): ../sdk/lib/lvgl/src/libs/rlottie/lv_rlottie.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/rlottie_lv_rlottie$(PreprocessSuffix) ../sdk/lib/lvgl/src/libs/rlottie/lv_rlottie.c

$(IntermediateDirectory)/sjpg_lv_sjpg$(ObjectSuffix): ../sdk/lib/lvgl/src/libs/sjpg/lv_sjpg.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/libs/sjpg/lv_sjpg.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sjpg_lv_sjpg$(ObjectSuffix) -MF$(IntermediateDirectory)/sjpg_lv_sjpg$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sjpg_lv_sjpg$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sjpg_lv_sjpg$(PreprocessSuffix): ../sdk/lib/lvgl/src/libs/sjpg/lv_sjpg.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sjpg_lv_sjpg$(PreprocessSuffix) ../sdk/lib/lvgl/src/libs/sjpg/lv_sjpg.c

$(IntermediateDirectory)/sjpg_tjpgd$(ObjectSuffix): ../sdk/lib/lvgl/src/libs/sjpg/tjpgd.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/libs/sjpg/tjpgd.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sjpg_tjpgd$(ObjectSuffix) -MF$(IntermediateDirectory)/sjpg_tjpgd$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sjpg_tjpgd$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sjpg_tjpgd$(PreprocessSuffix): ../sdk/lib/lvgl/src/libs/sjpg/tjpgd.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sjpg_tjpgd$(PreprocessSuffix) ../sdk/lib/lvgl/src/libs/sjpg/tjpgd.c

$(IntermediateDirectory)/tiny_ttf_lv_tiny_ttf$(ObjectSuffix): ../sdk/lib/lvgl/src/libs/tiny_ttf/lv_tiny_ttf.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/libs/tiny_ttf/lv_tiny_ttf.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/tiny_ttf_lv_tiny_ttf$(ObjectSuffix) -MF$(IntermediateDirectory)/tiny_ttf_lv_tiny_ttf$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/tiny_ttf_lv_tiny_ttf$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/tiny_ttf_lv_tiny_ttf$(PreprocessSuffix): ../sdk/lib/lvgl/src/libs/tiny_ttf/lv_tiny_ttf.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/tiny_ttf_lv_tiny_ttf$(PreprocessSuffix) ../sdk/lib/lvgl/src/libs/tiny_ttf/lv_tiny_ttf.c

$(IntermediateDirectory)/file_explorer_lv_file_explorer$(ObjectSuffix): ../sdk/lib/lvgl/src/others/file_explorer/lv_file_explorer.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/others/file_explorer/lv_file_explorer.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/file_explorer_lv_file_explorer$(ObjectSuffix) -MF$(IntermediateDirectory)/file_explorer_lv_file_explorer$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/file_explorer_lv_file_explorer$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/file_explorer_lv_file_explorer$(PreprocessSuffix): ../sdk/lib/lvgl/src/others/file_explorer/lv_file_explorer.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/file_explorer_lv_file_explorer$(PreprocessSuffix) ../sdk/lib/lvgl/src/others/file_explorer/lv_file_explorer.c

$(IntermediateDirectory)/fragment_lv_fragment$(ObjectSuffix): ../sdk/lib/lvgl/src/others/fragment/lv_fragment.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/others/fragment/lv_fragment.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/fragment_lv_fragment$(ObjectSuffix) -MF$(IntermediateDirectory)/fragment_lv_fragment$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/fragment_lv_fragment$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/fragment_lv_fragment$(PreprocessSuffix): ../sdk/lib/lvgl/src/others/fragment/lv_fragment.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/fragment_lv_fragment$(PreprocessSuffix) ../sdk/lib/lvgl/src/others/fragment/lv_fragment.c

$(IntermediateDirectory)/fragment_lv_fragment_manager$(ObjectSuffix): ../sdk/lib/lvgl/src/others/fragment/lv_fragment_manager.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/others/fragment/lv_fragment_manager.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/fragment_lv_fragment_manager$(ObjectSuffix) -MF$(IntermediateDirectory)/fragment_lv_fragment_manager$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/fragment_lv_fragment_manager$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/fragment_lv_fragment_manager$(PreprocessSuffix): ../sdk/lib/lvgl/src/others/fragment/lv_fragment_manager.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/fragment_lv_fragment_manager$(PreprocessSuffix) ../sdk/lib/lvgl/src/others/fragment/lv_fragment_manager.c

$(IntermediateDirectory)/gridnav_lv_gridnav$(ObjectSuffix): ../sdk/lib/lvgl/src/others/gridnav/lv_gridnav.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/others/gridnav/lv_gridnav.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/gridnav_lv_gridnav$(ObjectSuffix) -MF$(IntermediateDirectory)/gridnav_lv_gridnav$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/gridnav_lv_gridnav$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/gridnav_lv_gridnav$(PreprocessSuffix): ../sdk/lib/lvgl/src/others/gridnav/lv_gridnav.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/gridnav_lv_gridnav$(PreprocessSuffix) ../sdk/lib/lvgl/src/others/gridnav/lv_gridnav.c

$(IntermediateDirectory)/ime_lv_ime_pinyin$(ObjectSuffix): ../sdk/lib/lvgl/src/others/ime/lv_ime_pinyin.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/others/ime/lv_ime_pinyin.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ime_lv_ime_pinyin$(ObjectSuffix) -MF$(IntermediateDirectory)/ime_lv_ime_pinyin$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ime_lv_ime_pinyin$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ime_lv_ime_pinyin$(PreprocessSuffix): ../sdk/lib/lvgl/src/others/ime/lv_ime_pinyin.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ime_lv_ime_pinyin$(PreprocessSuffix) ../sdk/lib/lvgl/src/others/ime/lv_ime_pinyin.c

$(IntermediateDirectory)/imgfont_lv_imgfont$(ObjectSuffix): ../sdk/lib/lvgl/src/others/imgfont/lv_imgfont.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/others/imgfont/lv_imgfont.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/imgfont_lv_imgfont$(ObjectSuffix) -MF$(IntermediateDirectory)/imgfont_lv_imgfont$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/imgfont_lv_imgfont$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/imgfont_lv_imgfont$(PreprocessSuffix): ../sdk/lib/lvgl/src/others/imgfont/lv_imgfont.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/imgfont_lv_imgfont$(PreprocessSuffix) ../sdk/lib/lvgl/src/others/imgfont/lv_imgfont.c

$(IntermediateDirectory)/monkey_lv_monkey$(ObjectSuffix): ../sdk/lib/lvgl/src/others/monkey/lv_monkey.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/others/monkey/lv_monkey.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/monkey_lv_monkey$(ObjectSuffix) -MF$(IntermediateDirectory)/monkey_lv_monkey$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/monkey_lv_monkey$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/monkey_lv_monkey$(PreprocessSuffix): ../sdk/lib/lvgl/src/others/monkey/lv_monkey.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/monkey_lv_monkey$(PreprocessSuffix) ../sdk/lib/lvgl/src/others/monkey/lv_monkey.c

$(IntermediateDirectory)/msg_lv_msg$(ObjectSuffix): ../sdk/lib/lvgl/src/others/msg/lv_msg.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/others/msg/lv_msg.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/msg_lv_msg$(ObjectSuffix) -MF$(IntermediateDirectory)/msg_lv_msg$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/msg_lv_msg$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/msg_lv_msg$(PreprocessSuffix): ../sdk/lib/lvgl/src/others/msg/lv_msg.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/msg_lv_msg$(PreprocessSuffix) ../sdk/lib/lvgl/src/others/msg/lv_msg.c

$(IntermediateDirectory)/snapshot_lv_snapshot$(ObjectSuffix): ../sdk/lib/lvgl/src/others/snapshot/lv_snapshot.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/others/snapshot/lv_snapshot.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/snapshot_lv_snapshot$(ObjectSuffix) -MF$(IntermediateDirectory)/snapshot_lv_snapshot$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/snapshot_lv_snapshot$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/snapshot_lv_snapshot$(PreprocessSuffix): ../sdk/lib/lvgl/src/others/snapshot/lv_snapshot.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/snapshot_lv_snapshot$(PreprocessSuffix) ../sdk/lib/lvgl/src/others/snapshot/lv_snapshot.c

$(IntermediateDirectory)/basic_lv_theme_basic$(ObjectSuffix): ../sdk/lib/lvgl/src/themes/basic/lv_theme_basic.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/themes/basic/lv_theme_basic.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/basic_lv_theme_basic$(ObjectSuffix) -MF$(IntermediateDirectory)/basic_lv_theme_basic$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/basic_lv_theme_basic$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/basic_lv_theme_basic$(PreprocessSuffix): ../sdk/lib/lvgl/src/themes/basic/lv_theme_basic.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/basic_lv_theme_basic$(PreprocessSuffix) ../sdk/lib/lvgl/src/themes/basic/lv_theme_basic.c

$(IntermediateDirectory)/default_lv_theme_default$(ObjectSuffix): ../sdk/lib/lvgl/src/themes/default/lv_theme_default.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/themes/default/lv_theme_default.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/default_lv_theme_default$(ObjectSuffix) -MF$(IntermediateDirectory)/default_lv_theme_default$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/default_lv_theme_default$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/default_lv_theme_default$(PreprocessSuffix): ../sdk/lib/lvgl/src/themes/default/lv_theme_default.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/default_lv_theme_default$(PreprocessSuffix) ../sdk/lib/lvgl/src/themes/default/lv_theme_default.c

$(IntermediateDirectory)/mono_lv_theme_mono$(ObjectSuffix): ../sdk/lib/lvgl/src/themes/mono/lv_theme_mono.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/themes/mono/lv_theme_mono.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mono_lv_theme_mono$(ObjectSuffix) -MF$(IntermediateDirectory)/mono_lv_theme_mono$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mono_lv_theme_mono$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mono_lv_theme_mono$(PreprocessSuffix): ../sdk/lib/lvgl/src/themes/mono/lv_theme_mono.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mono_lv_theme_mono$(PreprocessSuffix) ../sdk/lib/lvgl/src/themes/mono/lv_theme_mono.c

$(IntermediateDirectory)/animimg_lv_animimg$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/animimg/lv_animimg.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/animimg/lv_animimg.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/animimg_lv_animimg$(ObjectSuffix) -MF$(IntermediateDirectory)/animimg_lv_animimg$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/animimg_lv_animimg$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/animimg_lv_animimg$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/animimg/lv_animimg.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/animimg_lv_animimg$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/animimg/lv_animimg.c

$(IntermediateDirectory)/arc_lv_arc$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/arc/lv_arc.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/arc/lv_arc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/arc_lv_arc$(ObjectSuffix) -MF$(IntermediateDirectory)/arc_lv_arc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/arc_lv_arc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/arc_lv_arc$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/arc/lv_arc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/arc_lv_arc$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/arc/lv_arc.c

$(IntermediateDirectory)/bar_lv_bar$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/bar/lv_bar.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/bar/lv_bar.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/bar_lv_bar$(ObjectSuffix) -MF$(IntermediateDirectory)/bar_lv_bar$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/bar_lv_bar$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/bar_lv_bar$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/bar/lv_bar.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/bar_lv_bar$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/bar/lv_bar.c

$(IntermediateDirectory)/btn_lv_btn$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/btn/lv_btn.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/btn/lv_btn.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/btn_lv_btn$(ObjectSuffix) -MF$(IntermediateDirectory)/btn_lv_btn$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/btn_lv_btn$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/btn_lv_btn$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/btn/lv_btn.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/btn_lv_btn$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/btn/lv_btn.c

$(IntermediateDirectory)/btnmatrix_lv_btnmatrix$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/btnmatrix/lv_btnmatrix.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/btnmatrix/lv_btnmatrix.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/btnmatrix_lv_btnmatrix$(ObjectSuffix) -MF$(IntermediateDirectory)/btnmatrix_lv_btnmatrix$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/btnmatrix_lv_btnmatrix$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/btnmatrix_lv_btnmatrix$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/btnmatrix/lv_btnmatrix.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/btnmatrix_lv_btnmatrix$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/btnmatrix/lv_btnmatrix.c

$(IntermediateDirectory)/calendar_lv_calendar$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/calendar/lv_calendar.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/calendar/lv_calendar.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/calendar_lv_calendar$(ObjectSuffix) -MF$(IntermediateDirectory)/calendar_lv_calendar$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/calendar_lv_calendar$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/calendar_lv_calendar$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/calendar/lv_calendar.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/calendar_lv_calendar$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/calendar/lv_calendar.c

$(IntermediateDirectory)/calendar_lv_calendar_header_arrow$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/calendar/lv_calendar_header_arrow.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/calendar/lv_calendar_header_arrow.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/calendar_lv_calendar_header_arrow$(ObjectSuffix) -MF$(IntermediateDirectory)/calendar_lv_calendar_header_arrow$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/calendar_lv_calendar_header_arrow$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/calendar_lv_calendar_header_arrow$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/calendar/lv_calendar_header_arrow.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/calendar_lv_calendar_header_arrow$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/calendar/lv_calendar_header_arrow.c

$(IntermediateDirectory)/calendar_lv_calendar_header_dropdown$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/calendar/lv_calendar_header_dropdown.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/calendar/lv_calendar_header_dropdown.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/calendar_lv_calendar_header_dropdown$(ObjectSuffix) -MF$(IntermediateDirectory)/calendar_lv_calendar_header_dropdown$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/calendar_lv_calendar_header_dropdown$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/calendar_lv_calendar_header_dropdown$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/calendar/lv_calendar_header_dropdown.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/calendar_lv_calendar_header_dropdown$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/calendar/lv_calendar_header_dropdown.c

$(IntermediateDirectory)/canvas_lv_canvas$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/canvas/lv_canvas.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/canvas/lv_canvas.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/canvas_lv_canvas$(ObjectSuffix) -MF$(IntermediateDirectory)/canvas_lv_canvas$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/canvas_lv_canvas$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/canvas_lv_canvas$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/canvas/lv_canvas.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/canvas_lv_canvas$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/canvas/lv_canvas.c

$(IntermediateDirectory)/chart_lv_chart$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/chart/lv_chart.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/chart/lv_chart.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/chart_lv_chart$(ObjectSuffix) -MF$(IntermediateDirectory)/chart_lv_chart$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/chart_lv_chart$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/chart_lv_chart$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/chart/lv_chart.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/chart_lv_chart$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/chart/lv_chart.c

$(IntermediateDirectory)/checkbox_lv_checkbox$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/checkbox/lv_checkbox.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/checkbox/lv_checkbox.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/checkbox_lv_checkbox$(ObjectSuffix) -MF$(IntermediateDirectory)/checkbox_lv_checkbox$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/checkbox_lv_checkbox$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/checkbox_lv_checkbox$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/checkbox/lv_checkbox.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/checkbox_lv_checkbox$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/checkbox/lv_checkbox.c

$(IntermediateDirectory)/colorwheel_lv_colorwheel$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/colorwheel/lv_colorwheel.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/colorwheel/lv_colorwheel.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/colorwheel_lv_colorwheel$(ObjectSuffix) -MF$(IntermediateDirectory)/colorwheel_lv_colorwheel$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/colorwheel_lv_colorwheel$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/colorwheel_lv_colorwheel$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/colorwheel/lv_colorwheel.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/colorwheel_lv_colorwheel$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/colorwheel/lv_colorwheel.c

$(IntermediateDirectory)/dropdown_lv_dropdown$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/dropdown/lv_dropdown.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/dropdown/lv_dropdown.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/dropdown_lv_dropdown$(ObjectSuffix) -MF$(IntermediateDirectory)/dropdown_lv_dropdown$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/dropdown_lv_dropdown$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/dropdown_lv_dropdown$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/dropdown/lv_dropdown.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/dropdown_lv_dropdown$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/dropdown/lv_dropdown.c

$(IntermediateDirectory)/img_lv_img$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/img/lv_img.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/img/lv_img.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/img_lv_img$(ObjectSuffix) -MF$(IntermediateDirectory)/img_lv_img$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/img_lv_img$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/img_lv_img$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/img/lv_img.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/img_lv_img$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/img/lv_img.c

$(IntermediateDirectory)/imgbtn_lv_imgbtn$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/imgbtn/lv_imgbtn.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/imgbtn/lv_imgbtn.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/imgbtn_lv_imgbtn$(ObjectSuffix) -MF$(IntermediateDirectory)/imgbtn_lv_imgbtn$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/imgbtn_lv_imgbtn$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/imgbtn_lv_imgbtn$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/imgbtn/lv_imgbtn.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/imgbtn_lv_imgbtn$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/imgbtn/lv_imgbtn.c

$(IntermediateDirectory)/keyboard_lv_keyboard$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/keyboard/lv_keyboard.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/keyboard/lv_keyboard.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/keyboard_lv_keyboard$(ObjectSuffix) -MF$(IntermediateDirectory)/keyboard_lv_keyboard$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/keyboard_lv_keyboard$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/keyboard_lv_keyboard$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/keyboard/lv_keyboard.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/keyboard_lv_keyboard$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/keyboard/lv_keyboard.c

$(IntermediateDirectory)/label_lv_label$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/label/lv_label.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/label/lv_label.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/label_lv_label$(ObjectSuffix) -MF$(IntermediateDirectory)/label_lv_label$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/label_lv_label$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/label_lv_label$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/label/lv_label.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/label_lv_label$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/label/lv_label.c

$(IntermediateDirectory)/led_lv_led$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/led/lv_led.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/led/lv_led.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/led_lv_led$(ObjectSuffix) -MF$(IntermediateDirectory)/led_lv_led$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/led_lv_led$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/led_lv_led$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/led/lv_led.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/led_lv_led$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/led/lv_led.c

$(IntermediateDirectory)/line_lv_line$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/line/lv_line.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/line/lv_line.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/line_lv_line$(ObjectSuffix) -MF$(IntermediateDirectory)/line_lv_line$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/line_lv_line$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/line_lv_line$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/line/lv_line.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/line_lv_line$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/line/lv_line.c

$(IntermediateDirectory)/list_lv_list$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/list/lv_list.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/list/lv_list.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/list_lv_list$(ObjectSuffix) -MF$(IntermediateDirectory)/list_lv_list$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/list_lv_list$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/list_lv_list$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/list/lv_list.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/list_lv_list$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/list/lv_list.c

$(IntermediateDirectory)/menu_lv_menu$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/menu/lv_menu.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/menu/lv_menu.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/menu_lv_menu$(ObjectSuffix) -MF$(IntermediateDirectory)/menu_lv_menu$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/menu_lv_menu$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/menu_lv_menu$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/menu/lv_menu.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/menu_lv_menu$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/menu/lv_menu.c

$(IntermediateDirectory)/meter_lv_meter$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/meter/lv_meter.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/meter/lv_meter.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/meter_lv_meter$(ObjectSuffix) -MF$(IntermediateDirectory)/meter_lv_meter$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/meter_lv_meter$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/meter_lv_meter$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/meter/lv_meter.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/meter_lv_meter$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/meter/lv_meter.c

$(IntermediateDirectory)/msgbox_lv_msgbox$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/msgbox/lv_msgbox.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/msgbox/lv_msgbox.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/msgbox_lv_msgbox$(ObjectSuffix) -MF$(IntermediateDirectory)/msgbox_lv_msgbox$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/msgbox_lv_msgbox$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/msgbox_lv_msgbox$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/msgbox/lv_msgbox.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/msgbox_lv_msgbox$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/msgbox/lv_msgbox.c

$(IntermediateDirectory)/objx_templ_lv_objx_templ$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/objx_templ/lv_objx_templ.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/objx_templ/lv_objx_templ.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/objx_templ_lv_objx_templ$(ObjectSuffix) -MF$(IntermediateDirectory)/objx_templ_lv_objx_templ$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/objx_templ_lv_objx_templ$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/objx_templ_lv_objx_templ$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/objx_templ/lv_objx_templ.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/objx_templ_lv_objx_templ$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/objx_templ/lv_objx_templ.c

$(IntermediateDirectory)/roller_lv_roller$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/roller/lv_roller.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/roller/lv_roller.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/roller_lv_roller$(ObjectSuffix) -MF$(IntermediateDirectory)/roller_lv_roller$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/roller_lv_roller$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/roller_lv_roller$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/roller/lv_roller.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/roller_lv_roller$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/roller/lv_roller.c

$(IntermediateDirectory)/slider_lv_slider$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/slider/lv_slider.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/slider/lv_slider.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/slider_lv_slider$(ObjectSuffix) -MF$(IntermediateDirectory)/slider_lv_slider$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/slider_lv_slider$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/slider_lv_slider$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/slider/lv_slider.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/slider_lv_slider$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/slider/lv_slider.c

$(IntermediateDirectory)/span_lv_span$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/span/lv_span.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/span/lv_span.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/span_lv_span$(ObjectSuffix) -MF$(IntermediateDirectory)/span_lv_span$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/span_lv_span$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/span_lv_span$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/span/lv_span.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/span_lv_span$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/span/lv_span.c

$(IntermediateDirectory)/spinbox_lv_spinbox$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/spinbox/lv_spinbox.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/spinbox/lv_spinbox.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/spinbox_lv_spinbox$(ObjectSuffix) -MF$(IntermediateDirectory)/spinbox_lv_spinbox$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/spinbox_lv_spinbox$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/spinbox_lv_spinbox$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/spinbox/lv_spinbox.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/spinbox_lv_spinbox$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/spinbox/lv_spinbox.c

$(IntermediateDirectory)/spinner_lv_spinner$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/spinner/lv_spinner.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/spinner/lv_spinner.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/spinner_lv_spinner$(ObjectSuffix) -MF$(IntermediateDirectory)/spinner_lv_spinner$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/spinner_lv_spinner$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/spinner_lv_spinner$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/spinner/lv_spinner.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/spinner_lv_spinner$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/spinner/lv_spinner.c

$(IntermediateDirectory)/switch_lv_switch$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/switch/lv_switch.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/switch/lv_switch.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/switch_lv_switch$(ObjectSuffix) -MF$(IntermediateDirectory)/switch_lv_switch$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/switch_lv_switch$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/switch_lv_switch$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/switch/lv_switch.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/switch_lv_switch$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/switch/lv_switch.c

$(IntermediateDirectory)/table_lv_table$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/table/lv_table.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/table/lv_table.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/table_lv_table$(ObjectSuffix) -MF$(IntermediateDirectory)/table_lv_table$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/table_lv_table$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/table_lv_table$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/table/lv_table.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/table_lv_table$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/table/lv_table.c

$(IntermediateDirectory)/tabview_lv_tabview$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/tabview/lv_tabview.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/tabview/lv_tabview.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/tabview_lv_tabview$(ObjectSuffix) -MF$(IntermediateDirectory)/tabview_lv_tabview$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/tabview_lv_tabview$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/tabview_lv_tabview$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/tabview/lv_tabview.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/tabview_lv_tabview$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/tabview/lv_tabview.c

$(IntermediateDirectory)/textarea_lv_textarea$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/textarea/lv_textarea.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/textarea/lv_textarea.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/textarea_lv_textarea$(ObjectSuffix) -MF$(IntermediateDirectory)/textarea_lv_textarea$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/textarea_lv_textarea$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/textarea_lv_textarea$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/textarea/lv_textarea.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/textarea_lv_textarea$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/textarea/lv_textarea.c

$(IntermediateDirectory)/tileview_lv_tileview$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/tileview/lv_tileview.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/tileview/lv_tileview.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/tileview_lv_tileview$(ObjectSuffix) -MF$(IntermediateDirectory)/tileview_lv_tileview$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/tileview_lv_tileview$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/tileview_lv_tileview$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/tileview/lv_tileview.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/tileview_lv_tileview$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/tileview/lv_tileview.c

$(IntermediateDirectory)/win_lv_win$(ObjectSuffix): ../sdk/lib/lvgl/src/widgets/win/lv_win.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/widgets/win/lv_win.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/win_lv_win$(ObjectSuffix) -MF$(IntermediateDirectory)/win_lv_win$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/win_lv_win$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/win_lv_win$(PreprocessSuffix): ../sdk/lib/lvgl/src/widgets/win/lv_win.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/win_lv_win$(PreprocessSuffix) ../sdk/lib/lvgl/src/widgets/win/lv_win.c

$(IntermediateDirectory)/ipv4_autoip$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/ipv4/autoip.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/ipv4/autoip.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ipv4_autoip$(ObjectSuffix) -MF$(IntermediateDirectory)/ipv4_autoip$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ipv4_autoip$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ipv4_autoip$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/ipv4/autoip.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ipv4_autoip$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/ipv4/autoip.c

$(IntermediateDirectory)/ipv4_dhcp$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/ipv4/dhcp.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/ipv4/dhcp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ipv4_dhcp$(ObjectSuffix) -MF$(IntermediateDirectory)/ipv4_dhcp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ipv4_dhcp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ipv4_dhcp$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/ipv4/dhcp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ipv4_dhcp$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/ipv4/dhcp.c

$(IntermediateDirectory)/ipv4_etharp$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/ipv4/etharp.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/ipv4/etharp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ipv4_etharp$(ObjectSuffix) -MF$(IntermediateDirectory)/ipv4_etharp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ipv4_etharp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ipv4_etharp$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/ipv4/etharp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ipv4_etharp$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/ipv4/etharp.c

$(IntermediateDirectory)/ipv4_icmp$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/ipv4/icmp.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/ipv4/icmp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ipv4_icmp$(ObjectSuffix) -MF$(IntermediateDirectory)/ipv4_icmp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ipv4_icmp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ipv4_icmp$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/ipv4/icmp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ipv4_icmp$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/ipv4/icmp.c

$(IntermediateDirectory)/ipv4_igmp$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/ipv4/igmp.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/ipv4/igmp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ipv4_igmp$(ObjectSuffix) -MF$(IntermediateDirectory)/ipv4_igmp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ipv4_igmp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ipv4_igmp$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/ipv4/igmp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ipv4_igmp$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/ipv4/igmp.c

$(IntermediateDirectory)/ipv4_ip4$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/ipv4/ip4.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/ipv4/ip4.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ipv4_ip4$(ObjectSuffix) -MF$(IntermediateDirectory)/ipv4_ip4$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ipv4_ip4$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ipv4_ip4$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/ipv4/ip4.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ipv4_ip4$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/ipv4/ip4.c

$(IntermediateDirectory)/ipv4_ip4_addr$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/ipv4/ip4_addr.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/ipv4/ip4_addr.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ipv4_ip4_addr$(ObjectSuffix) -MF$(IntermediateDirectory)/ipv4_ip4_addr$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ipv4_ip4_addr$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ipv4_ip4_addr$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/ipv4/ip4_addr.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ipv4_ip4_addr$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/ipv4/ip4_addr.c

$(IntermediateDirectory)/ipv4_ip4_frag$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/ipv4/ip4_frag.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/ipv4/ip4_frag.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ipv4_ip4_frag$(ObjectSuffix) -MF$(IntermediateDirectory)/ipv4_ip4_frag$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ipv4_ip4_frag$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ipv4_ip4_frag$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/ipv4/ip4_frag.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ipv4_ip4_frag$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/ipv4/ip4_frag.c

$(IntermediateDirectory)/ipv6_dhcp6$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/ipv6/dhcp6.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/ipv6/dhcp6.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ipv6_dhcp6$(ObjectSuffix) -MF$(IntermediateDirectory)/ipv6_dhcp6$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ipv6_dhcp6$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ipv6_dhcp6$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/ipv6/dhcp6.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ipv6_dhcp6$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/ipv6/dhcp6.c

$(IntermediateDirectory)/ipv6_ethip6$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/ipv6/ethip6.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/ipv6/ethip6.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ipv6_ethip6$(ObjectSuffix) -MF$(IntermediateDirectory)/ipv6_ethip6$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ipv6_ethip6$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ipv6_ethip6$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/ipv6/ethip6.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ipv6_ethip6$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/ipv6/ethip6.c

$(IntermediateDirectory)/ipv6_icmp6$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/ipv6/icmp6.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/ipv6/icmp6.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ipv6_icmp6$(ObjectSuffix) -MF$(IntermediateDirectory)/ipv6_icmp6$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ipv6_icmp6$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ipv6_icmp6$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/ipv6/icmp6.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ipv6_icmp6$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/ipv6/icmp6.c

$(IntermediateDirectory)/ipv6_inet6$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/ipv6/inet6.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/ipv6/inet6.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ipv6_inet6$(ObjectSuffix) -MF$(IntermediateDirectory)/ipv6_inet6$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ipv6_inet6$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ipv6_inet6$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/ipv6/inet6.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ipv6_inet6$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/ipv6/inet6.c

$(IntermediateDirectory)/ipv6_ip6$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/ipv6/ip6.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/ipv6/ip6.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ipv6_ip6$(ObjectSuffix) -MF$(IntermediateDirectory)/ipv6_ip6$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ipv6_ip6$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ipv6_ip6$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/ipv6/ip6.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ipv6_ip6$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/ipv6/ip6.c

$(IntermediateDirectory)/ipv6_ip6_addr$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/ipv6/ip6_addr.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/ipv6/ip6_addr.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ipv6_ip6_addr$(ObjectSuffix) -MF$(IntermediateDirectory)/ipv6_ip6_addr$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ipv6_ip6_addr$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ipv6_ip6_addr$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/ipv6/ip6_addr.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ipv6_ip6_addr$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/ipv6/ip6_addr.c

$(IntermediateDirectory)/ipv6_ip6_frag$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/ipv6/ip6_frag.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/ipv6/ip6_frag.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ipv6_ip6_frag$(ObjectSuffix) -MF$(IntermediateDirectory)/ipv6_ip6_frag$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ipv6_ip6_frag$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ipv6_ip6_frag$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/ipv6/ip6_frag.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ipv6_ip6_frag$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/ipv6/ip6_frag.c

$(IntermediateDirectory)/ipv6_mld6$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/ipv6/mld6.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/ipv6/mld6.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ipv6_mld6$(ObjectSuffix) -MF$(IntermediateDirectory)/ipv6_mld6$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ipv6_mld6$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ipv6_mld6$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/ipv6/mld6.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ipv6_mld6$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/ipv6/mld6.c

$(IntermediateDirectory)/ipv6_nd6$(ObjectSuffix): ../sdk/lib/net/lwip/src/core/ipv6/nd6.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/core/ipv6/nd6.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ipv6_nd6$(ObjectSuffix) -MF$(IntermediateDirectory)/ipv6_nd6$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ipv6_nd6$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ipv6_nd6$(PreprocessSuffix): ../sdk/lib/net/lwip/src/core/ipv6/nd6.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ipv6_nd6$(PreprocessSuffix) ../sdk/lib/net/lwip/src/core/ipv6/nd6.c

$(IntermediateDirectory)/ppp_auth$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/ppp/auth.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/ppp/auth.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ppp_auth$(ObjectSuffix) -MF$(IntermediateDirectory)/ppp_auth$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ppp_auth$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ppp_auth$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/ppp/auth.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ppp_auth$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/ppp/auth.c

$(IntermediateDirectory)/ppp_ccp$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/ppp/ccp.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/ppp/ccp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ppp_ccp$(ObjectSuffix) -MF$(IntermediateDirectory)/ppp_ccp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ppp_ccp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ppp_ccp$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/ppp/ccp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ppp_ccp$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/ppp/ccp.c

$(IntermediateDirectory)/ppp_chap-md5$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/ppp/chap-md5.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/ppp/chap-md5.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ppp_chap-md5$(ObjectSuffix) -MF$(IntermediateDirectory)/ppp_chap-md5$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ppp_chap-md5$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ppp_chap-md5$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/ppp/chap-md5.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ppp_chap-md5$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/ppp/chap-md5.c

$(IntermediateDirectory)/ppp_chap-new$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/ppp/chap-new.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/ppp/chap-new.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ppp_chap-new$(ObjectSuffix) -MF$(IntermediateDirectory)/ppp_chap-new$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ppp_chap-new$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ppp_chap-new$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/ppp/chap-new.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ppp_chap-new$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/ppp/chap-new.c

$(IntermediateDirectory)/ppp_chap_ms$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/ppp/chap_ms.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/ppp/chap_ms.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ppp_chap_ms$(ObjectSuffix) -MF$(IntermediateDirectory)/ppp_chap_ms$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ppp_chap_ms$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ppp_chap_ms$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/ppp/chap_ms.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ppp_chap_ms$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/ppp/chap_ms.c

$(IntermediateDirectory)/ppp_demand$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/ppp/demand.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/ppp/demand.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ppp_demand$(ObjectSuffix) -MF$(IntermediateDirectory)/ppp_demand$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ppp_demand$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ppp_demand$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/ppp/demand.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ppp_demand$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/ppp/demand.c

$(IntermediateDirectory)/ppp_eap$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/ppp/eap.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/ppp/eap.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ppp_eap$(ObjectSuffix) -MF$(IntermediateDirectory)/ppp_eap$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ppp_eap$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ppp_eap$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/ppp/eap.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ppp_eap$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/ppp/eap.c

$(IntermediateDirectory)/ppp_ecp$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/ppp/ecp.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/ppp/ecp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ppp_ecp$(ObjectSuffix) -MF$(IntermediateDirectory)/ppp_ecp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ppp_ecp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ppp_ecp$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/ppp/ecp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ppp_ecp$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/ppp/ecp.c

$(IntermediateDirectory)/ppp_eui64$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/ppp/eui64.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/ppp/eui64.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ppp_eui64$(ObjectSuffix) -MF$(IntermediateDirectory)/ppp_eui64$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ppp_eui64$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ppp_eui64$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/ppp/eui64.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ppp_eui64$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/ppp/eui64.c

$(IntermediateDirectory)/ppp_fsm$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/ppp/fsm.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/ppp/fsm.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ppp_fsm$(ObjectSuffix) -MF$(IntermediateDirectory)/ppp_fsm$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ppp_fsm$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ppp_fsm$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/ppp/fsm.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ppp_fsm$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/ppp/fsm.c

$(IntermediateDirectory)/ppp_ipcp$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/ppp/ipcp.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/ppp/ipcp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ppp_ipcp$(ObjectSuffix) -MF$(IntermediateDirectory)/ppp_ipcp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ppp_ipcp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ppp_ipcp$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/ppp/ipcp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ppp_ipcp$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/ppp/ipcp.c

$(IntermediateDirectory)/ppp_ipv6cp$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/ppp/ipv6cp.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/ppp/ipv6cp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ppp_ipv6cp$(ObjectSuffix) -MF$(IntermediateDirectory)/ppp_ipv6cp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ppp_ipv6cp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ppp_ipv6cp$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/ppp/ipv6cp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ppp_ipv6cp$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/ppp/ipv6cp.c

$(IntermediateDirectory)/ppp_lcp$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/ppp/lcp.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/ppp/lcp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ppp_lcp$(ObjectSuffix) -MF$(IntermediateDirectory)/ppp_lcp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ppp_lcp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ppp_lcp$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/ppp/lcp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ppp_lcp$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/ppp/lcp.c

$(IntermediateDirectory)/ppp_magic$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/ppp/magic.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/ppp/magic.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ppp_magic$(ObjectSuffix) -MF$(IntermediateDirectory)/ppp_magic$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ppp_magic$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ppp_magic$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/ppp/magic.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ppp_magic$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/ppp/magic.c

$(IntermediateDirectory)/ppp_mppe$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/ppp/mppe.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/ppp/mppe.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ppp_mppe$(ObjectSuffix) -MF$(IntermediateDirectory)/ppp_mppe$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ppp_mppe$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ppp_mppe$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/ppp/mppe.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ppp_mppe$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/ppp/mppe.c

$(IntermediateDirectory)/ppp_multilink$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/ppp/multilink.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/ppp/multilink.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ppp_multilink$(ObjectSuffix) -MF$(IntermediateDirectory)/ppp_multilink$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ppp_multilink$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ppp_multilink$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/ppp/multilink.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ppp_multilink$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/ppp/multilink.c

$(IntermediateDirectory)/ppp_ppp$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/ppp/ppp.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/ppp/ppp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ppp_ppp$(ObjectSuffix) -MF$(IntermediateDirectory)/ppp_ppp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ppp_ppp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ppp_ppp$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/ppp/ppp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ppp_ppp$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/ppp/ppp.c

$(IntermediateDirectory)/ppp_pppapi$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/ppp/pppapi.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/ppp/pppapi.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ppp_pppapi$(ObjectSuffix) -MF$(IntermediateDirectory)/ppp_pppapi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ppp_pppapi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ppp_pppapi$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/ppp/pppapi.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ppp_pppapi$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/ppp/pppapi.c

$(IntermediateDirectory)/ppp_pppcrypt$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/ppp/pppcrypt.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/ppp/pppcrypt.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ppp_pppcrypt$(ObjectSuffix) -MF$(IntermediateDirectory)/ppp_pppcrypt$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ppp_pppcrypt$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ppp_pppcrypt$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/ppp/pppcrypt.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ppp_pppcrypt$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/ppp/pppcrypt.c

$(IntermediateDirectory)/ppp_pppoe$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/ppp/pppoe.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/ppp/pppoe.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ppp_pppoe$(ObjectSuffix) -MF$(IntermediateDirectory)/ppp_pppoe$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ppp_pppoe$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ppp_pppoe$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/ppp/pppoe.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ppp_pppoe$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/ppp/pppoe.c

$(IntermediateDirectory)/ppp_pppol2tp$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/ppp/pppol2tp.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/ppp/pppol2tp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ppp_pppol2tp$(ObjectSuffix) -MF$(IntermediateDirectory)/ppp_pppol2tp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ppp_pppol2tp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ppp_pppol2tp$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/ppp/pppol2tp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ppp_pppol2tp$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/ppp/pppol2tp.c

$(IntermediateDirectory)/ppp_pppos$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/ppp/pppos.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/ppp/pppos.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ppp_pppos$(ObjectSuffix) -MF$(IntermediateDirectory)/ppp_pppos$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ppp_pppos$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ppp_pppos$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/ppp/pppos.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ppp_pppos$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/ppp/pppos.c

$(IntermediateDirectory)/ppp_upap$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/ppp/upap.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/ppp/upap.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ppp_upap$(ObjectSuffix) -MF$(IntermediateDirectory)/ppp_upap$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ppp_upap$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ppp_upap$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/ppp/upap.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ppp_upap$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/ppp/upap.c

$(IntermediateDirectory)/ppp_utils$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/ppp/utils.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/ppp/utils.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ppp_utils$(ObjectSuffix) -MF$(IntermediateDirectory)/ppp_utils$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ppp_utils$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ppp_utils$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/ppp/utils.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ppp_utils$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/ppp/utils.c

$(IntermediateDirectory)/ppp_vj$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/ppp/vj.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/ppp/vj.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ppp_vj$(ObjectSuffix) -MF$(IntermediateDirectory)/ppp_vj$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ppp_vj$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ppp_vj$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/ppp/vj.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ppp_vj$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/ppp/vj.c

$(IntermediateDirectory)/pxp_lv_draw_pxp_blend$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_blend.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_blend.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/pxp_lv_draw_pxp_blend$(ObjectSuffix) -MF$(IntermediateDirectory)/pxp_lv_draw_pxp_blend$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/pxp_lv_draw_pxp_blend$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/pxp_lv_draw_pxp_blend$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_blend.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/pxp_lv_draw_pxp_blend$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/nxp/pxp/lv_draw_pxp_blend.c

$(IntermediateDirectory)/pxp_lv_gpu_nxp_pxp$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/nxp/pxp/lv_gpu_nxp_pxp.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/nxp/pxp/lv_gpu_nxp_pxp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/pxp_lv_gpu_nxp_pxp$(ObjectSuffix) -MF$(IntermediateDirectory)/pxp_lv_gpu_nxp_pxp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/pxp_lv_gpu_nxp_pxp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/pxp_lv_gpu_nxp_pxp$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/nxp/pxp/lv_gpu_nxp_pxp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/pxp_lv_gpu_nxp_pxp$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/nxp/pxp/lv_gpu_nxp_pxp.c

$(IntermediateDirectory)/pxp_lv_gpu_nxp_pxp_osa$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/nxp/pxp/lv_gpu_nxp_pxp_osa.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/nxp/pxp/lv_gpu_nxp_pxp_osa.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/pxp_lv_gpu_nxp_pxp_osa$(ObjectSuffix) -MF$(IntermediateDirectory)/pxp_lv_gpu_nxp_pxp_osa$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/pxp_lv_gpu_nxp_pxp_osa$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/pxp_lv_gpu_nxp_pxp_osa$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/nxp/pxp/lv_gpu_nxp_pxp_osa.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/pxp_lv_gpu_nxp_pxp_osa$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/nxp/pxp/lv_gpu_nxp_pxp_osa.c

$(IntermediateDirectory)/vglite_lv_draw_vglite_arc$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_arc.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_arc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vglite_lv_draw_vglite_arc$(ObjectSuffix) -MF$(IntermediateDirectory)/vglite_lv_draw_vglite_arc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vglite_lv_draw_vglite_arc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vglite_lv_draw_vglite_arc$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_arc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vglite_lv_draw_vglite_arc$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_arc.c

$(IntermediateDirectory)/vglite_lv_draw_vglite_blend$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_blend.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_blend.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vglite_lv_draw_vglite_blend$(ObjectSuffix) -MF$(IntermediateDirectory)/vglite_lv_draw_vglite_blend$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vglite_lv_draw_vglite_blend$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vglite_lv_draw_vglite_blend$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_blend.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vglite_lv_draw_vglite_blend$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_blend.c

$(IntermediateDirectory)/vglite_lv_draw_vglite_rect$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_rect.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_rect.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vglite_lv_draw_vglite_rect$(ObjectSuffix) -MF$(IntermediateDirectory)/vglite_lv_draw_vglite_rect$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vglite_lv_draw_vglite_rect$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vglite_lv_draw_vglite_rect$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_rect.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vglite_lv_draw_vglite_rect$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/nxp/vglite/lv_draw_vglite_rect.c

$(IntermediateDirectory)/vglite_lv_gpu_nxp_vglite$(ObjectSuffix): ../sdk/lib/lvgl/src/draw/nxp/vglite/lv_gpu_nxp_vglite.c  
	$(CC) $(SourceSwitch) ../sdk/lib/lvgl/src/draw/nxp/vglite/lv_gpu_nxp_vglite.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/vglite_lv_gpu_nxp_vglite$(ObjectSuffix) -MF$(IntermediateDirectory)/vglite_lv_gpu_nxp_vglite$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/vglite_lv_gpu_nxp_vglite$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/vglite_lv_gpu_nxp_vglite$(PreprocessSuffix): ../sdk/lib/lvgl/src/draw/nxp/vglite/lv_gpu_nxp_vglite.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/vglite_lv_gpu_nxp_vglite$(PreprocessSuffix) ../sdk/lib/lvgl/src/draw/nxp/vglite/lv_gpu_nxp_vglite.c

$(IntermediateDirectory)/polarssl_arc4$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/ppp/polarssl/arc4.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/ppp/polarssl/arc4.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/polarssl_arc4$(ObjectSuffix) -MF$(IntermediateDirectory)/polarssl_arc4$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/polarssl_arc4$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/polarssl_arc4$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/ppp/polarssl/arc4.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/polarssl_arc4$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/ppp/polarssl/arc4.c

$(IntermediateDirectory)/polarssl_des$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/ppp/polarssl/des.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/ppp/polarssl/des.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/polarssl_des$(ObjectSuffix) -MF$(IntermediateDirectory)/polarssl_des$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/polarssl_des$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/polarssl_des$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/ppp/polarssl/des.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/polarssl_des$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/ppp/polarssl/des.c

$(IntermediateDirectory)/polarssl_md4$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/ppp/polarssl/md4.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/ppp/polarssl/md4.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/polarssl_md4$(ObjectSuffix) -MF$(IntermediateDirectory)/polarssl_md4$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/polarssl_md4$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/polarssl_md4$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/ppp/polarssl/md4.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/polarssl_md4$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/ppp/polarssl/md4.c

$(IntermediateDirectory)/polarssl_md5$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/ppp/polarssl/md5.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/ppp/polarssl/md5.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/polarssl_md5$(ObjectSuffix) -MF$(IntermediateDirectory)/polarssl_md5$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/polarssl_md5$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/polarssl_md5$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/ppp/polarssl/md5.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/polarssl_md5$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/ppp/polarssl/md5.c

$(IntermediateDirectory)/polarssl_sha1$(ObjectSuffix): ../sdk/lib/net/lwip/src/netif/ppp/polarssl/sha1.c  
	$(CC) $(SourceSwitch) ../sdk/lib/net/lwip/src/netif/ppp/polarssl/sha1.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/polarssl_sha1$(ObjectSuffix) -MF$(IntermediateDirectory)/polarssl_sha1$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/polarssl_sha1$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/polarssl_sha1$(PreprocessSuffix): ../sdk/lib/net/lwip/src/netif/ppp/polarssl/sha1.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/polarssl_sha1$(PreprocessSuffix) ../sdk/lib/net/lwip/src/netif/ppp/polarssl/sha1.c


$(IntermediateDirectory)/__rt_entry$(ObjectSuffix): $(IntermediateDirectory)/__rt_entry$(DependSuffix)
	@$(AS) $(SourceSwitch) $(ProjectPath)/$(IntermediateDirectory)/__rt_entry.S $(ASFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/__rt_entry$(ObjectSuffix) $(IncludeAPath)
$(IntermediateDirectory)/__rt_entry$(DependSuffix):
	@$(CC) $(CFLAGS) $(IncludeAPath) -MG -MP -MT$(IntermediateDirectory)/__rt_entry$(ObjectSuffix) -MF$(IntermediateDirectory)/__rt_entry$(DependSuffix) -MM $(ProjectPath)/$(IntermediateDirectory)/__rt_entry.S

-include $(IntermediateDirectory)/*$(DependSuffix)
