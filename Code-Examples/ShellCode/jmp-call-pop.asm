; Filename: jmp-call-pop.asm
; Author: Brandon Dennis

; Compiles shellcode no nulls
; "\xeb\x15\x59\x31\xc0\xb0\x04\x31\xdb\xb3\x01\x31\xd2\xb2\x13\xcd\x80\x31\xc0\xb0\x01\xcd\x80\xe8\xe6\xff\xff\xff\x48\x65\x6c\x6c\x6f\x20\x57\x6f\x72\x6c\x64\x21\x0a"

global _start

section .text

_start:

; We need to remove all null values from the shell code. Lines will be commented out

	; we issue our jmp short to start jmp call pop
	jmp short call_shellcode


shellcode:

	; we now use our pop to get the memory address of message
	pop ecx

	;mov eax, 0x4 
	xor eax, eax ; this will 0 out eax so we only have to lead 4 into al instead of all 32bits
	mov al, 0x4
	
	;mov ebx, 0x1 
	xor ebx, ebx ; this will 0 out ebx so we only have to lead 4 into bl instead of all 32bits
	mov bl, 0x1
	
	;mov ecx, message 
	
	;mov edx, mlen 
	xor edx, edx
	mov dl, 0x13
	int 0x80 

	;mov eax, 0x1
	xor eax, eax
	mov al, 0x1
	;mov ebx, 0x5 ; we can remove this entirly as it doesnt matter the exit code
	int 0x80

	

call_shellcode:
	call shellcode
	message: db "Hello World!", 0xA ; this makes the amount of bits as 13 for Hello World!
;	mlen	equ  $-message ; this is removed due to the length not fitting the entire register 
