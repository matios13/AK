#include <stdio.h>
extern int calculate (int);

int main ()
{	
	int i=calculate(2);
	printf("liczba ciagu fibonaciego : %d\n",i);
	return 0;
}

int wczytajLiczbe(){
	printf("podaj liczbe : ");
	int i =1;
	if (fscanf(stdin, "%d", &i)){     //wczytanie liczby
      	printf("Liczba wczytana poprawnie: %i\n", i);
	}else{
      	fprintf(stderr, "Błąd wczytania liczby całkowitej.\n");
		return 1;	
	}  	
	return i;
}
int suma( int a, int b){
	int sum = a +b;
return sum;
}
