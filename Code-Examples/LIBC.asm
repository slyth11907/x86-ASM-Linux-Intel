; Filename: LIBC.asm
; Author: Brandon Dennis

; to link this you will need to do gcc -o filename filename.o

extern printf ; loads in the printf function
extern exit ; loads in the exit function

global main

section .txt

main:

  push message ; this pushes the string hello world onto the stack
  ; since printf just requires the string you wish to print we can just pass it message, see 'man 3 printf'
  
  call printf ; this calls the function printf with the message db on the stack
  add esp, 0x4 ; we adjust the stack size by 4 due to the syscall using 4 bytes of data for the message we passe it
  ; this brings us back to where we were before
  
  mov eax, 0xa
  call exit
  
  
  
section .data
  
  message: db "Hello World!", 0xA, 0x00 ; the 0xA is a LineFeed AKA new Line followed by a null terminator for printf to know where the end of the string is
  mlen equ $-message

