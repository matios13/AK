#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define SIZE 50000

int main ()
{
int *dane = (int*) malloc(SIZE * sizeof(int)); 
int i=0;
srand(time(NULL));
for(i=0; i<SIZE; ++i)
dane[i] = 1;
for(i=0; i<SIZE; ++i){
	printf("przed %d" , dane[i]);
	//dodawanie liczby losowej
	__asm(
	"movl (%%edi,%%ecx,4),%%eax \n\
	add %%ecx, %%eax \n\
	movl %%eax, (%%edi, %%ecx,4)"
	:
	:"c"(i), "D"(dane)
	);
	printf(", po %d\n" , dane[i]);
}
free(dane); 
}
