SYSCALL32 = 0x80           # nr wywo
EXIT = 1                   # nr funkcji restartu (=1)
WRITE = 4                  # nr funkcji „pisz”
STDOUT = 1                 # nr wej
.data
hello: .ascii "Hello world!\n"
ile= .- hello
.text
.globl helloWorld
.type helloWorld ,@function

helloWorld:
pushl %ebp
movl %esp, %ebp
movl $WRITE, %eax
movl $STDOUT, %ebx
movl $hello, %ecx
movl $ile, %edx
int $0x80
popl %ebp
b1:
ret
