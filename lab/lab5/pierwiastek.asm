#gcc -g -o fpu -m32 fpu.s

.section .data

message:
	.asciz "Dzialanie wykonane poprawnie!\n\0"
opertaionI:
	.asciz "Invalid operation\n\0"
operandD:
	.asciz "Denormalized operand\n\0"
devideZ:
	.asciz "Divide-by-zero\n\0"
numericO:
	.asciz "Numeric overflow\n\0"
numericU:
	.asciz "Numeric underflow\n\0"
inexactP:
	.asciz "Inexact result(precision)\n\0"
exception:
	.int 0b0000000000000000
number1:
	.int 1111
number2:
	.float 00
									
.global pierwiastek
.type pierwiastek,@function
pierwiastek:

xorl %eax, %eax

pushl %ebp
movl %esp, %ebp
fld 8(%ebp)

fsqrt
fst 8(%ebp)

fstsw exception

mov exception , %ax
						
dupa:							
test $0b0000000000000001, %ax
jz denormalOperand
push $opertaionI
call printf

mov exception , %ax
denormalOperand:
test $0b0000000000000010, %ax
jz divideByZero
push $operandD
call printf

mov exception , %ax

divideByZero:
test $0b0000000000000100, %ax
jz numericOverflow
push $devideZ
call printf

mov exception , %ax

numericOverflow:
test $0b0000000000001000, %ax
jz numericUnderflow
push $numericO
call printf
mov exception , %ax

#Numeric underflow
numericUnderflow:
test $0b0000000000010000, %ax
jz inexactResultPrecision
push $numericU
call printf

mov exception , %ax

#Inexact result(Precision)
inexactResultPrecision:
test $0b0000000000100000, %ax
jz end
push $inexactP
call printf

end:
	movl %ebp, %esp
	popl %ebp
ret
