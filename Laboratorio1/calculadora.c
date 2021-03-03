#include <stdio.h>

float sumar(float x,float y);
float restar(float x,float y);
float dividir(float x,float y);
float multiplicar(float x,float y);

int main(void){

	printf("Bienvenido a la calculadora\n");
	float x;
	printf("Digite el primer numero: \n");
	scanf("%f",&x);

	float y;
	printf("Digite el segundo numero: \n");
	scanf("%f",&y);

	int opcion;
	printf("Por favor elija, alguna de estas opciones\n");
	printf("-1. Sumar.\n");
	printf("-2. Restar.\n");
	printf("-3. Dividirn.\n");
	printf("-4. Multiplicar.\n");
	scanf("%d",&opcion);

	if(opcion==1){
		float resultado=sumar(x,y);
		printf("El resultado es: %f\n",resultado);
	}
	else{
		if(opcion==2){
			float resultado=restar(x,y);
			printf("El resultado es: %f\n",resultado);
		}
		else{
			if(opcion==3){
				float resultado=dividir(x,y);
				printf("El resultado es: %f\n",resultado);

			}else{
				if(opcion==4){
					float resultado=multiplicar(x,y);
					printf("El resultado es: %f\n",resultado);
				}
				else{
					printf("Esta opcion no existe.\n");
				}
			}
		}
	}
	return 0;
}

float sumar(float x,float y){
	float suma;
	suma=x+y;
	return suma;
}

float restar(float x,float y){
	float resta;
	resta=x-y;
	return resta;
}

float dividir(float x, float y){
	float division;
	division=x/y;
	return division;
}

float multiplicar(float x,float y){
	float multiplicacion;
	multiplicacion=x*y;
	return multiplicacion;
}
