#include <stdio.h>

int sumar(int vector[],int cantElementos);
int imprimir(int vector[],int cantElementos,int suma);

int main(void){
	int cantElementos;
	printf("Digite la cantidad de elementos del vector: ");
	scanf("%d",&cantElementos);

	int vector[cantElementos];

	int i;
	for(i=0;i<cantElementos;i++){
		printf("Digite el elemento %d: ",i+1);
		scanf("%d",&vector[i]);
	}

	int irSumar=sumar(vector,cantElementos);
	return 0;
}

int sumar(int vector[],int cantElementos){
	int suma=0;
	int i;
	for(i=0;i<cantElementos;i++){
		suma=suma+vector[i];
	}
	int irImprimir=imprimir(vector,cantElementos,suma);
	return 1;
}

int imprimir(int vector[],int cantElementos,int suma){
	int i;
	for(i=0;i<cantElementos;i++){
		if(i==0){
			printf("La suma del vector [ %d,",vector[i]);
		}
		else{
			if(i>0 && i<=cantElementos-2){
				printf(" %d,",vector[i]);
			}
			else{
				printf(" %d ] es %d.",vector[i], suma);
			}
		}
	}
	return 2;
}
