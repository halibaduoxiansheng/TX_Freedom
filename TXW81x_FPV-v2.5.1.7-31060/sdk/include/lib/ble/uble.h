#ifndef _HGIC_UBLE_H_
#define _HGIC_UBLE_H_

#include "lib/ble/ble_def.h"

#ifdef __cplusplus
extern "C" {
#endif

#define uble_dbg(fmt, ...) os_printf("%s:%d::"fmt, __FUNCTION__, __LINE__, ##__VA_ARGS__)
#define uble_err(fmt, ...) os_printf("%s:%d::"fmt, __FUNCTION__, __LINE__, ##__VA_ARGS__)

#define UBLE_GATT_CHARAC_BROADCAST                   (0x01) // 支持广播
#define UBLE_GATT_CHARAC_READ                        (0x02) // 支持读操作
#define UBLE_GATT_CHARAC_WRITE_WITHOUT_RESPONSE      (0x04) // 支持无响应写
#define UBLE_GATT_CHARAC_WRITE                       (0x08) // 支持有响应写
#define UBLE_GATT_CHARAC_NOTIFY                      (0x10) // 支持通知
#define UBLE_GATT_CHARAC_INDICATE                    (0x20) // 支持指示
#define UBLE_GATT_CHARAC_AUTHENTICATED_SIGNED_WRITES (0x40) // 支持认证签名写
#define UBLE_GATT_CHARAC_EXTENDED_PROPERTIES         (0x80) // 支持扩展属性


#define UBLE_ATT_NOT_FOUND   (0x0A) // 属性未找到
#define UBLE_ATT_NOT_SUPPORT (0x06) // 不支持的操作


#define UBLE_OPCODE_ATT_ERROR               (0x01) // 错误响应
#define UBLE_OPCODE_EXCHANGE_MTU_REQ        (0x02) // MTU 交换请求
#define UBLE_OPCODE_EXCHANGE_MTU_RSP        (0x03) // MTU 交换响应
#define UBLE_OPCODE_FIND_INFORMATION_REQ    (0x04) // 查找信息请求
#define UBLE_OPCODE_FIND_INFORMATION_RSP    (0x05) // 查找信息响应
#define UBLE_OPCODE_FIND_BY_TYPE_VALUE_REQ  (0x06) // 按类型和值查找请求
#define UBLE_OPCODE_READ_BY_TYPE_REQ        (0x08) // 按类型读取请求
#define UBLE_OPCODE_READ_BY_TYPE_RSP        (0x09) // 按类型读取响应
#define UBLE_OPCODE_READ_REQ                (0x0A) // 读取请求
#define UBLE_OPCODE_READ_RSP                (0x0B) // 读取响应
#define UBLE_OPCODE_READ_BLOB_REQ           (0x0C) // 读取 Blob 数据请求
#define UBLE_OPCODE_READ_MULTIPLE_REQ       (0x0E) // 多重读取请求
#define UBLE_OPCODE_READ_BY_GROUP_TYPE_REQ  (0x10) // 按组类型读取请求
#define UBLE_OPCODE_READ_BY_GROUP_TYPE_RSP  (0x11) // 按组类型读取响应
#define UBLE_OPCODE_WRITE_REQ               (0x12) // 写入请求
#define UBLE_OPCODE_WRITE_RESP              (0x13) // 写入响应
#define UBLE_OPCODE_PREPARE_WRITE_REQ       (0x16) // 准备写入请求
#define UBLE_OPCODE_EXECUTE_WRITE_REQ       (0x18) // 执行写入请求
#define UBLE_OPCODE_HANDLE_VALUE_NOTIFY     (0x1B) // 句柄值通知
#define UBLE_OPCODE_HANDLE_VALUE_INDICATION (0x1D) // 句柄值指示
#define UBLE_OPCODE_HANDLE_VALUE_CONFIRM    (0x1E) // 确认指示
#define UBLE_OPCODE_WRITE_CMD               (0x52) // 写命令（无响应）
#define UBLE_OPCODE_SIGNED_WRITE_CMD        (0xD2) // 签名写命令

enum UBLE_VALUE_TYPE {
    UBLE_VALUE_TYPE_UINT8,
    UBLE_VALUE_TYPE_UINT16,
    UBLE_VALUE_TYPE_UINT32,
    UBLE_VALUE_TYPE_UINT8_BIT,
    UBLE_VALUE_TYPE_UINT16_BIT,
    UBLE_VALUE_TYPE_UINT32_BIT,
    UBLE_VALUE_TYPE_BYTES,
    UBLE_VALUE_TYPE_STRING,
    UBLE_VALUE_TYPE_HDL,
};

struct uble_value_entry {
    uint8 type, size, bitoff, maskbit;
    void *value;
};

struct uble_gatt_data {
    uint16 att_type, properties;
    uint32 att_value; /*value att_type or uble_value_entry*/
};

typedef int32(*uble_gatt_valhdl)(const struct uble_value_entry *entry, uint8 read, uint8 *buff, int32 size);

extern int32 uble_init(struct bt_ops *ops, const struct uble_gatt_data *att_table, uint32 att_table_size);
extern int32 uble_gatt_notify(uint16 att_hdl, uint8 *data, int32 len);
extern int32 uble_gatt_indicate(uint16 att_hdl, uint8 *data, int32 len);
#ifdef __cplusplus
}
#endif

#endif


