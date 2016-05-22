; Filename: bitwise.asm
; Authro: Brandon Dennis

global _start

section .txt
_start:

  ; AND
  mov al, 0x10 ; this move 10 into al
  and al, 0x01 ; this performs an AND on al & 01 resulting in 0x00

  and byte [var1], 0xaa ; this performs an AND on 0xaa & 0xaa resulting in 0xaa
  and word [var2], 0x1122 ; this performs an AND on 0x1122 & 0xbbcc resulting in 0x1100
  
  ; OR
  mov al, 0x10 ; this move 10 into al
  or al, 0x01 ; this performs an OR on al & 01 resulting in 0x11
  
  or byte [var1], 0xaa ; this performs an OR on 0xaa & 0xaa resulting in 0xaa
  
  mov eax, 0 ; this move 0 into eax
  or eax, 0x0 ; this performs an OR on eax & 0 resulting in 0x00000000
  
  ; XOR
  ; xoring the sam value will produce 0, good thing to note if you want to avoid 0x0 in your source when compile to shellcode
  xor dword [var3], 0x11223344 ; this performs an XOR on 11223344 & 00000000 resulting in 0x00000000
  xor dword [var3], 0x11223344 ; this performs an XOR on 00000000 & 11223344 resulting in 0x11223344
  
  ; NOT
  mov eax, 0xFFFFFFFF ; moves 0xFFFFFFFF into eax
  not eax ; this performs an NOT on eax resulting in 0x00000000
  ; since NOT inverts the bits the above command 0's them out as they were all 1's and the following command brings them back to 1's
  not eax ; this performs an NOT on eax resulting in 0x11111111
  
  
  ; exit the application
  mov eax, 1 ; this adds the syscall # for exit to eax
  mov ebx, 1 ; this is the exit code and we set it to 1
  int 0x80 ; this init's the syscall in eax
  
section .data

  var1 db 0xaa
  var2 dw 0xbbcc
  var3 dd 0x11223344
  
