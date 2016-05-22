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
  
  mov al, 0xFF ; Moves FF into al
  mul bl ; This multiplies whats its al by whats in bl and saves it's answer in ax
  
  
