#include "display.h"
#include <stdio.h>

int displayMsg(const char* content, MsgType type)
{
    switch(type)
    {
        case INFO_TYPE:
             return printf("\033[36;1m%s\033[0m", content);
        case ERROR_TYPE:
            return printf("\033[31;1m%s\033[0m", content);
        case WARNING_TYPE:
            return printf("\033[33;1m%s\033[0m", content);
        case SUCCESS_TYPE:
            return printf("\033[32;1m%s\033[0m", content);
    }

    return printf("\033[36;1m%s\033[0m", content);
}
