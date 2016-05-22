; Filename: Procedure-Function.asm
; Author: Brandon Dennis

global _start

section .txt

; notice that this is not inside of the _start section since _start is where the entry point is, this will not get executed
; upon the application starting
ProcHelloWorld:
  
  ; Prints Hello World using the write syscall # 4
  
  mov eax, 0x4 ; moves syscall write #4 to eax
  mov ebx, 0x1 ; moves the fiel descriptor sysout to ebx
  mov ecx, message ; moves the string hello world into ecx
  mov edx, mlen ; moves the length of the string hello world to edx
  int 0x80 ; executes the syscall in eax
  ret ; this returns to the place that used the call ProcHelloWorld instruction
  
  
_start:
  
  mov ecx, 0x10 ; moving 10 into ecx as a counter
  
PrintHelloWorld:
  
  push ecx ; this pushes ecx onto the stack to save it
  
  call ProcHelloWorld ; this call the procedure ProcHElloWorld to be ran
  pop ecx ; this pops ecx back off the stack into ecx
  loop PrintHelloWorld ; this will dec 1 from ecx then issue a call PrintHelloWorld instruction
  ; once ecx is set to 0 the ZF flag will be set and if that flag is set it will skip the loop instruction
  
  
  ; exit the application
  mov eax, 0x1 ; moves the syscall for exit #1 into eax
  mov ebx, 0x1 ; moves the exit code into ebx
  int 0x80 ; executes the syscall in eax
  
section .data





  
  
  
    








