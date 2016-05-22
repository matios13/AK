.data
tekst:
.ascii "Napisz cos!\n\0"
scanf_string:
.ascii "%s"
in: .space 10
printf_string:			
.ascii "Napisales: %s\n\0"


.text
.globl _start

_start:					
pushl $tekst			
call printf
pushl $in
pushl $scanf_string

call scanf
b2:					
pushl $in
pushl $printf_string
call printf				
mov $1, %eax
mov $0, %ebx
int $0x80


