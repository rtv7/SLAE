#include <stdio.h>
int main(int argc, char *argv[])
{
char buffer[256];
memcpy(buffer, argv[1],strlen(argv[1]));
printf(buffer);
}
