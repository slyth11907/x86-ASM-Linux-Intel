; Template.asm 
; Author: Brandon Dennis

;Interuprt Handler Table located at  /usr/include/i386-linux-gnu/asm/unistd_32.h

global _start

section .text

_start:

	;Print onto the screen

	mov eax, 0x4
	mov ebx, 0x1
	mov ecx, message
	mov edx, mlen
	int 0x80


	; exit the program gracefully

	mov eax, 0x1
	mov ebx, 0x0 ; exit code, arg 1
	int 0x80



section .data

	var1: db 0xAA
	var2: db 0xBB, 0xCC, 0xDD
	var3: dw 0xEE
	var4: dd 0xAABBCCDD
	var5: dd 0x112233
	var6: TIMES 6 db 0xFF

	message: db "Hellow World"
	mlen: equ $-message


section .bss

	var7: resb 100
	var8: resw 20
