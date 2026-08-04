#ifndef DISPLAY_H
#define DISPLAY_H

typedef enum {
    ERROR_TYPE,
    SUCCESS_TYPE,
    WARNING_TYPE,
    INFO_TYPE
} MsgType;

int displayMsg(const char* content, MsgType mode);
#endif
