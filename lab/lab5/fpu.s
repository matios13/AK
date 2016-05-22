#gcc -g -o fpu -m32 fpu.s

.section .data

message:
	.asciz "Dzialanie wykonane poprawnie!\n\0"
messageI:
	.asciz "Invalid operation\n\0"
messageZ:
	.asciz "Divide-by-zero\n\0"
messageD:
	.asciz "Denormalized operand\n\0"
messageO:
	.asciz "Numeric overflow\n\0"
messageU:
	.asciz "Numeric underflow\n\0"
messageP:
	.asciz "Inexact result(precision)\n\0"

number1:
	.float 3 
number2:
	.float 2.7
									
.global main
main:

xorl %eax, %eax

fld number1
fdiv number2

fstsw %ax

#Invalid operation							
test $0b0000000000000001, %ax
jz denormal_operand
push $messageI
call printf
jmp end

#Denormal operand
denormal_operand:
test $0b0000000000000010, %ax
jz divide_by_zero
push $messageD
call printf
jmp end

#Divide-by-zero
divide_by_zero:
test $0b0000000000000100, %ax
jz numeric_overflow
push $messageZ
call printf
jmp end

#Numeric overflow
numeric_overflow:
test $0b0000000000001000, %ax
jz numeric_underflow
push $messageO
call printf
jmp end

#Numeric underflow
numeric_underflow:
test $0b0000000000010000, %ax
jz inexact_result_Precision
push $messageU
call printf
jmp end

#Inexact result(Precision)
inexact_result_Precision:
test $0b0000000000100000, %ax
jz no_error
push $messageP
call printf
jmp end

#No error
no_error:
pushl $message
call printf
jmp end

end:
call exit
