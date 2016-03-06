SYSCALL32 = 0x80           # nr wywo
EXIT = 1                   # nr funkcji restartu (=1) 
WRITE = 4                  # nr funkcji „pisz” 
STDOUT = 1                 # nr wej
.data
hello: .ascii "Hello world!\n"
ile= .- hello
.text
.globl _start
_start:
    movl $WRITE, %eax # write(1, hello, strlen(hello))
    movl $STDOUT, %ebx
    movl $hello, %ecx
    movl $ile, %edx
    int  $SYSCALL32

    movl $1, %eax # exit(0)
    movl $0, %ebx
    int  $SYSCALL32
