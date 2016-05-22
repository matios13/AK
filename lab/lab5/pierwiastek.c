#include <stdio.h>
extern float pierwiastek(float);

int main ()
{	
	float test = 0.0000000000000000000000000001;
	int i = 0;
	for(;i<100;i++){		
		float W=pierwiastek(test);
		printf("test : %d , wynik : %f\n",i , W);
		test *= 10;
	}
	
	
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

