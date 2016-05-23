#include<stdio.h>
#include<string.h>

//Compile: gcc -fno-stack-protector -z execstack shellcode.c -o shellcode
//The above removes stack protections and makes the stack executable to avoid issues with running the shell code

unsigned char code[] = \
"SHELLCODE ";

main()
{

  printf("Shellcode Length: %d\n", strlen(code));
  int (*ret)() = (int(*)())code;
  ret();
}
