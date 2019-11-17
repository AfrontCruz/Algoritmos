#include<stdio.h>

int main(){
	Matria a = crear(3,5);
	printf("Filas: %i \t Columnas: %i\n",a.filas, a.columnas );
	
	free(a);
}


Matriz crear(int filas, int columnas){
    Matriz a;
    
    a.matriz = malloc( float*filas );
    for(int i = 0; i < filas; i++)
        a.matriz[i] = malloc( float*columnas );

    return a;
}