.data
format_string:			#okresla liczbe i rodzaj parametrow
.ascii "%s is a %s who loves the number %d\n\0"
txt1: .ascii "You\0" 	# pierwszy parametr %s (zakonczony \0)
txt2: .ascii "person\0"	# drugi parametr %s
number: .long 14			#trzeci parametr %d (liczba dziesietna)
.text
.globl _start

_start:					#start dla ld, main dla gcc
pushl number			#argumenty w odwrotnej kolejnosci
pushl $txt2
pushl $txt1
pushl $format_string
call printf
mov $1, %eax
mov $0, %ebx
int $0x80


