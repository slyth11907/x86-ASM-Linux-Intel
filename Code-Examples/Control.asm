; Filename: Control.asm
; Author: Brandon Dennis

global _start

section .txt
_start:



  ; Exits the application
  mov eax, 0x1 ; sets the syscall # for exit to eax
  mov ebx, 0x1 ; sets the exit code to the 2nd arg in ebx
  int 0x80 ; runs the syscall command in eax with ebx as arg 1


section .data
