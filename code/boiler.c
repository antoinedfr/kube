#include "display.h"
#include "create.h"
#include <string.h>
#include <stdio.h>

int main(int argc, char *argv[])
{


    char *action="create";

    if(argv[1] != NULL){
       action=argv[1];
    }


    if(strcmp(action, "create") == 0){

        createFile(".gitignore", ".env\n.terraform\n*tfvars*\n*tfstate*\n", WRITE_MODE);
        createFile(".gitattributes", "*text=auto eol=lf\n", WRITE_MODE);
        createFile(".tflint.hcl", "", WRITE_MODE);
        createFile("checkmate.ini", "[minphony]\ndisable = true", WRITE_MODE);
        createFile(".pre-commit-config.yaml", "", WRITE_MODE);
        createFile(".env", "", WRITE_MODE);

    } else {

        remove(".gitignore");
        remove(".gitattributes");
        remove(".tflint.hcl");
        remove("checkmate.ini");
        //remove(".pre-commit.config.yaml");
        remove(".env");
    }




}
