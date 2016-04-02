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
	TEXT_SIZE2: .long 0
	NUMBER: .long 0
	ERR: .ascii "Nie podales liczby"

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
	movl %eax, TEXT_SIZE2

	CALL convert
	movl %ebx, NUMBER

	#czytanie
	movl $READ, %eax
	movl $STDIN, %ebx
	movl $BUFOR, %ecx
	movl $ROZMIAR_BUFORA, %edx
	int $SYSCALL32


	sub $1, %eax
	movl %eax, TEXT_SIZE
	CALL convert

	movl NUMBER , %edx
	add %ebx, %edx

b:
	mov %edx, %ebx
	CALL displayNumber
	#pisanie
	movl $WRITE, %eax
	movl $STDOUT, %ebx
	movl $BUFOR, %ecx
	int $SYSCALL32

	#wychodzenie
	movl $EXIT, %eax
	int $SYSCALL32

convert:
	mov $0, %ebx
	mov $0, %eax
	mov $0, %esi

	for1:

	mov BUFOR(, %esi, 1), %al # val

	cmp $'\n', %al
	je en
	cmp $'9', %al
	ja error
	cmp $'0', %al
	jb error
	sub $'0', %al
	mov %eax, %ecx
	mov %ebx ,%eax
	mov $10 , %ebx
	mul %ebx
	mov %eax, %ebx
	mov %ecx, %eax
	add %eax, %ebx
	inc %esi
	cmp $TEXT_SIZE, %esi
	jb for1
	en:
	ret

displayNumber :
	mov TEXT_SIZE2, %eax
	cmp %eax, TEXT_SIZE
	jg incEsi
	movl %eax, TEXT_SIZE
	incEsi:
		movl $0, %edi
		mov $' ' , %al
		mov %al, BUFOR(, %edi, 1)
		movl TEXT_SIZE, %edi
		mov %ebx, %eax
	loop:
		mov $0, %edx
		mov $10, %bl
		div %bl
		add $'0' , %ah
		mov %ah, BUFOR(, %edi, 1)
		mov $0, %ah
		dec %edi
		cmp $0, %al
		jg loop

	ret


	error:
	#pisanie
	movl $WRITE, %eax
	movl $STDOUT, %ebx
	movl $ERR, %ecx
	int $SYSCALL32

	#wychodzenie
	movl $EXIT, %eax
	int $SYSCALL32
