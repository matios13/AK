.data
format_string: .ascii "Hello! my name is %s and im %d years old \n\0"
text1: .ascii "Mateusz\0"
number: .long 22
.text
.globl main
main:

pushl number
pushl $text1
pushl $format_string
call printf
call exit
