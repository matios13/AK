SYSCALL32 = 0x80
EXIT = 1
STDIN = 0
READ = 3
STDOUT = 1
WRITE = 4
ROZMIAR_BUFORA = 254
JEDEN = '1'


.data
BUFOR: .space ROZMIAR_BUFORA
TEXT_SIZE: .long 0
zmienna: .long 0

.text
.global _start
_start:

#czytanie
movl $READ,%eax
movl $STDIN, %ebx
movl $BUFOR, %ecx
movl $ROZMIAR_BUFORA, %edx
int $SYSCALL32
movl $0, %edi


sub $1, %eax 
movl %eax, TEXT_SIZE

#przetwarzanie
CALL poczatek_petli

movl zmienna , %eax
en:
#pisanie
movl $WRITE, %eax
movl $STDOUT, %ebx
movl zmienna, %ecx
int $SYSCALL32

#wychodzenie
movl $EXIT, %eax
int $SYSCALL32

poczatek_petli:
movl TEXT_SIZE , %eax
sub $1, %eax 
sub %edi, %eax
movb BUFOR(,%eax,1), %bl

q:
cmpb $'1' , %bl
je pow
jmp c2
continue:
movl %ecx , %edi
add zmienna , %eax
mov %eax , zmienna
c2:
incl %edi
cmp %edi , TEXT_SIZE
jne poczatek_petli
ret

#potegowanie dwojki

pow:
movl %edi , %ecx
movl $1 , %eax
movl $0 , %edi
t1:
cmp %edi , %ecx
je continue
loop: 
incl %edi
movl $2, %ebx
mul %ebx
t:
cmp %edi, %ecx
jne loop
cmp %edi, %ecx
je continue


