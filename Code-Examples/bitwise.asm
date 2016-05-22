; Filename: bitwise.asm
; Authro: Brandon Dennis

global _start

section .txt
_start:

  ; AND
  mov al, 0x10 ; this move 10 into al
  and al, 0x01 ; this performs an AND on al & 01 resulting in 0x00
