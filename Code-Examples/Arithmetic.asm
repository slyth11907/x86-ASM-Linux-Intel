; Arithmetic.asm 
; Author: Brandon Dennis

;Interuprt Handler Table located at  /usr/include/i386-linux-gnu/asm/unistd_32.h

global _start

section .text

_start:

	
	; register based addition

	mov eax, 0
	add al, 0x22
	add al, 0x11

	mov ax, 0x1122
	add ax, 0x3344

	mov eax, 0xffffffff
	add eax, 0x10


	; memory based addition

	mov eax, 0
	add byte [var1], 0x22
	add byte [var1], 0x11

	add word [var2], 0x1122
	add word [var2], 0x3344

	add dword [var3], 0xffffffff ;Note 0xffffffff is the max value you can hold witha dword
	add dword [var3], 0x10


	; set / clear / complement carry flag

	clc
	stc
	cmc

	;add with carry

	mov eax, 0
	stc
	adc al, 0x22
	stc
	adc al, 0x11

	mov ax, 0x1122
	stc
	adc ax, 0x3344

	mov eax, 0xffffffff
	stc
	adc eax, 0x10

	
	;subtraction

	mov eax, 10
	sub eax, 5
	stc
	sbb eax, 4


	;inc and dec

	inc eax
	dec eax


	; exit the program gracefully

	mov eax, 0x1
	mov ebx, 0x0 ; exit code, arg 1
	int 0x80



section .data

	var1: db 0x00
	var2: dw 0x0000
	var3: dd 0x00000000	

section .bss


