SYSCALL32 = 0x80
EXIT = 1
STDIN = 0
READ = 3
STDOUT = 1
WRITE = 4
MASK = 0x20
ROZMIAR_BUFORA = 254

.data 


BUFOR: .space ROZMIAR_BUFORA
TEXT_SIZE: .long 0

.text
.globl _start
_start:

#czytanie
movl $READ, %eax
movl $STDIN, %ebx
movl $BUFOR, %ecx
movl $ROZMIAR_BUFORA, %edx
int $SYSCALL32

sub $1, %eax
movl %eax, TEXT_SIZE

CALL maleNaDuze

#pisanie
movl $WRITE, %eax
movl $STDOUT, %ebx
movl $BUFOR, %ecx
int $SYSCALL32

#wychodzenie
movl $EXIT, %eax
int $SYSCALL32


#petla przetwarzajaca and
maleNaDuze:
movl $0, %edi
loop:
movb BUFOR(,%edi, 1), %bl
xorb $MASK, %bl
movb %bl, BUFOR(,%edi,1)
noChange:
incl %edi
cmpl TEXT_SIZE, %edi
jbe loop
ret

