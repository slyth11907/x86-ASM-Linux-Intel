; Filename: bitwise.asm
; Authro: Brandon Dennis

global _start

section .txt
_start:

  ; AND
  mov al, 0x10 ; this move 10 into al
  and al, 0x01 ; this performs an AND on al & 01 resulting in 0x00

  and byte [var1], 0xaa
  and word [var2], 0x1122
  
  ; OR
  mov al, 0x10 ; this move 10 into al
  or al, 0x01 ; this performs an OR on al & 01 resulting in 0x11
  
  or byte [var1], 0xaa
  
  mov eax, 0 ; this move 0 into eax
  or eax, 0x0 ; this performs an OR on eax & 0 resulting in 0x00000000
  
  ; XOR
  xor dword [var3], 0x11223344
  xor dword [var3], 0x11223344
  
  ; NOT
  mov eax, 0xFFFFFFFF
  not eax
  not eax
  
  
  ; exit the application
  mov eax, 1 ; this adds the syscall # for exit to eax
  mov ebx, 1 ; this is the exit code and we set it to 1
  int 0x80 ; this init's the syscall in eax
  
section .data

  var1 db 0xaa
  var2 dw 0xbbcc
  var3 dd 0x11223344
  
