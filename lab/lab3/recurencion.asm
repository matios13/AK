SYSCALL = 0x80
			EXIT = 1
.text
.globl _start
_start:
			mov $8 , %eax
			pushl %eax
			CALL funkcja
			pop %eax
			end:
			movl $EXIT , %eax
			int $SYSCALL

funkcja:
			pushl %ebp
			movl %esp, %ebp
			movl 8(%ebp) , %edi
			cmp $2, %edi
			ja adder
							movl $1, 8(%ebp)
							movl %ebp, %esp
							pop %ebp
							ret
			adder:
							dec %edi
							pushl %edi
							CALL funkcja
#							popl %eax
#							pushl %eax
			adder2:
							movl 8(%ebp) , %edi
							dec %edi
							dec %edi
							pushl %edi
							CALL funkcja
							popl %ebx
			adder3:
							popl %eax
							add %eax, %ebx
							stop2:
			movl %ebx, 8(%ebp)
			movl %ebp, %esp
			popl %ebp
ret
