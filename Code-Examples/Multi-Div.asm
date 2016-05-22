; Filename: Multi-Div.asm
; Author: Brandon Dennis
;


global _start


section .text
_start:
  
  ; 8bit multiplication
  mov eax, 0x0 ; Sets 0 to eax to clear it out
  
  mov al, 0x15 ; Sets 15 to al
  mov bl, 0x3 ; Sets 3 to bl
  mul bl ; This multiplies whats its al by whats in bl and saves it's answer in ax
  
  ; with this the OF and CF flags are set since FF * anything will be more that just 8 bits and in turn will end up in ax
  mov al, 0xFF ; Moves FF into al
  mul bl ; This multiplies whats its al by whats in bl and saves it's answer in ax
  
  ; 16bit multiplication
  mov eax, 0x0 ; This 0's out eax can use xor eax, eax as well to avoid 0's 
  mov ebx, 0x0 ; This 0's out ebx can use xor ebx, ebx as well to avoid 0's 

  ; with this the OF and CF flags are set
  mov ax, 0x1122 ; this moves 16bits 1122 into ax
  mov bx, 0x0002 ; This moves 16bits 0002 into bx
  mul bx ; This multiplies whats its ax by whats in bx and saves it's answer in dc & ax
  
  mov ax, 0x1122 ; this moves 16bits 1122 into ax
  mov bx, 0x1122 ; this moves 16bits 1122 into bx
  mul bx ; This multiplies whats its ax by whats in bx and saves it's answer in dc & ax

  ; 32bit multiplication
  mov eax, 0x11223344 ; this moves 11223344 into eax
  mov ebx, 0x00000002 ; this moves 00000002 into ebx
  mul ebx ; This multiplies eax by ebx and sends the response to edx & eax
  
  ; with this the OF and CF flags are set
  mov eax, 0x11223344 ; this moves 11223344 into eax
  mov ebx, 0x55667788 ; this moves 55667788 into ebx
  mul ebx ; This multiplies eax by ebx and sends the response to edx & eax
  
  ; multiplication with memory addrs
  
  mul byte [var1] ; since var1 is only 8 bits it will multiply al by var1
  mul word [var2] ; since var2 is only 16 bits it will multiply ax by var2
  mul dword [var3] ; since var3 is only 32 bits it will multiply eax by var3
  
  ; division with 16bit
  mov dx, 0x0 ; empty out dx
  mov ax, 0x7788 ; move 7788 into ax
  mov cx, 0x2 ; move 2 into cx
  div cx ; this will device dx+ax / cx, the answer will go into AX and the remainder in DX
  
  mov ax, 0x7788 + 0x1 ; move 7788 +1 to 7789 into ax
  mov cx, 0x2 ; move 2 into cx
  div cx ; this will device dx+ax / cx, the answer will go into AX and the remainder in DX
  
  ; exit the application
  mov eax, 1 ; sets the exit syscall num to eax
  mov ebx, 0 ; sets the exit code, arg #2 as 1
  int 0x80 ; execute teh syscall

  
  
section .data
  var1 db 0x05 ; 8bits
  var2 dw 0x1122 ; 16bits
  var3 dw 0x11223344 ; 32bits
