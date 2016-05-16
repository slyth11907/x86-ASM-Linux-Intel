; Stack.asm 
; Author: Brandon Dennis

;Interuprt Handler Table located at  /usr/include/i386-linux-gnu/asm/unistd_32.h

global _start

section .text

_start:

	
	mov eax, 0x66778899
	mov ebx, 0x0
	mov ecx, 0x0

	;push and pop
	;register push and pop


	push ax
	pop bx

	push eax
	pop ecx
	
	;memory push and pop

	push word [sample]
	pop ecx

	push dword [sample]
	pop edx
	





	; exit the program gracefully

	mov eax, 0x1
	mov ebx, 0x0 ; exit code, arg 1
	int 0x80



section .data

	sample: db 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff, 0x11, 0x22	

section .bss


