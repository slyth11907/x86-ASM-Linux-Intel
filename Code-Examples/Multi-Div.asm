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

  mov ax, 0x1122 ; this moves 16bits 1122 into ax
  mov bx, 0x0002 ; This moves 16bits 0002 into bx
  mul bx ; This multiplies whats its ax by whats in bx and saves it's answer in dc & ax
  
  mov ax, 0x1122 ; this moves 16bits 1122 into ax
  mov bx, 0x1122 ; this moves 16bits 1122 into bx
  mul bx ; This multiplies whats its ax by whats in bx and saves it's answer in dc & ax


  


