; Filename: Strings.asm
; Author: Brandon Dennis


global _start

section .txt

_start:

  ; copy a string form the source to the dest
  
  mov ecx, sourceLen
  lea esi, [source] ; this loads the memeory address into esi
  lea edi [destination] ; this loads the memory address into edi
  
  cld ; this clears the direction flag
  rep movsb ; this moves the bytes from esi into edi, since the DF flag is not set it will go through from Left to Right
  
  ; Print out Hello World
  
  mov eax, 0x4 ; sets eax to the write syscall #
  mov ebx, 0x1 ; sets the fiel descriptor 1 into ebx
  mov ecx, destination ; sets the descination string to ecx
  mov edx, sourceLen ; set the string's length to edx
  int 0x80 ; executes the syscall
  
  ; compaire the strings
  
  mov ecx, sourceLen ; this moves the length of the source string into ecs as a counter
  mov esi, [source] ; this moves into esi our source string
  mov edi, [destination] ; this moves our destination into edi
  repe cmpsb ; this will compare esi to edi byte by byte based on the # of bytes in ecx to check if anything matches
  
  jz SetEqual ; this will jump is the ZF flag is set, if its not set it will skip the jump
  mov ecx, results2 ; this moves results2 string into ecx
  mov edx, results2Len ; this moves the results2 string length into edx
  jmp Print ; this jumps to the Print label
  
SetEqual:

  mov ecx, result1 ; we move our label result1 into ecx
  mov edx, result1Len ; we move our result1 length into edx
  
  
Print: 

  ; Print out whats in ecx
  
  mov eax, 0x4 ; sets eax to the write syscall #
  mov ebx, 0x1 ; sets the fiel descriptor 1 into ebx
  int 0x80 ; executes the syscall 
  
  ; exits the application
  mov eax, 0x1 ; sets the syscall exit into eax
  mov ebx, 0x1 ; sets the exit code into ebx
  int 0x80 ; executes the syscall
  
section .data

  ; 0xA is 10 as a decimal,10 is a linefeed AKA new line

  source: db "Hello World!", 0xA
  sourceLen equ $-source
  
  comparison: db "Hello"
  
  result1: db "Strings are Equal", 0xA
  result1Len equ $-result1
  
  result2: db "Strings are Unequal", 0xA
  result2Len equ $-result2
  
section .bss

  destination: resb 100 ; this reserves 100 bytes for the label destination

