.data
.text
.global calculate
.type calculate,@function

calculate:
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
							CALL calculate
			adder2:
							movl 8(%ebp) , %edi
							dec %edi
							dec %edi
							pushl %edi
							CALL calculate
							popl %ebx
			adder3:
							popl %eax
							add %eax, %ebx
							stop2:
			movl %ebx, 8(%ebp)
      movl %ebx, %eax
			movl %ebp, %esp
			popl %ebp
ret
