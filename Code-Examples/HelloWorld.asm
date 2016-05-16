; HelloWorld.asm 
; Author: Brandon Dennis

;Interuprt Handler Table located at  /usr/include/i386-linux-gnu/asm/unistd_32.h

global _start

section .text

_start:

	; print hello world on the screen

	mov eax, 0x4 ; moves syscall # into eax
	mov ebx, 0x1 ; moves the first arg STDOUT 1 in ebx
	mov ecx, message ; passes the message defines byte into ecx
	mov edx, mlen ; passes the length of messages into edx
	int 0x80 ; executes the syscall commmand in eax


	; exit the program gracefully

	mov eax, 0x1
	mov ebx, 0x5 ; exit code, arg 1
	int 0x80



section .data

	message: db "Hello World!"
	mlen	equ  $-message ; short way to get length of a string




