#include <stdio.h>

int main(void){
	int cantElementos;
	printf("Digite la cantidad de elementos del vector: \n");
	scanf("%d",&cantElementos);

	float vector[cantElementos];

	int i;
	for(i=0;i<cantElementos;i++){
		printf("Digite elemento %d: ",i+1);
		scanf("%f",&vector[i]);
	}

	float numeroMenor=vector[0];

	for(i=0;i<cantElementos;i++){
		if(numeroMenor>vector[i]){
			numeroMenor=vector[i];
		}
	}
	printf("Numero menor es: %f \n",numeroMenor);
	return 0;
}
