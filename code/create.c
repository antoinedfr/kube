#include "create.h"
#include <string.h>
#include <stdio.h>

int createFile(const char* filename,const char* content, FileMode mode)
{
    if (filename == NULL || content == NULL) return 0;
    FILE *fp=NULL;
    if(mode == WRITE_MODE){
        fp=fopen(filename, "w");
        if (fputs(content,fp) == EOF )
        {
            fclose(fp);
            return -1;
        }
        return (fclose(fp) == 0) ? 0 : 1;
    }
    return 0;

}
