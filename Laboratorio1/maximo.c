#include <stdio.h>

float main(){
	float x;
	float y;

	printf("Numero X:");
	scanf("%f",&x);
	printf("Numero Y:");
	scanf("%f",&y);
	if(x>y){
		printf("El numero maximo es X: %f",x);
	}else{
		if(y>x){
			printf("El numero maximo es Y: %f",y);
		}else{
			printf("Ambos numeros son iguales: %f",x);
		}
	}
	return 0;
}
