//AUTOR: Oscar Daniel Juárez Cruz

#include<stdio.h>
#include<stdlib.h>
#include<time.h>

#define TOPE 10000000

void insertar(int array[], int longitud, int posicion, int insertar);
int resize(char *a, int tope);
void imprimir(int *a3, char *s3, int size_a3, FILE *resultado);
void multiplicar(char *s1, char *s2, char *s3);
void leerEntrada();
void leerArchivo();

clock_t inicio, final;


int main(){
	inicio = clock();
	//leerEntrada();
	leerArchivo();

	return 0;
}

void leerEntrada(){
	char *s1, *s2;
	s1 = (char*)malloc(sizeof(char)*TOPE);
	s2 = (char*)malloc(sizeof(char)*TOPE);

	printf("Introduce el primer numero: ");
	//fgets( s1, 1000, stdin );
	fscanf(stdin, "%s", s1);
	
	
	printf("Introduce el segundo numero: ");
	//fgets( s2, 1000, stdin );
	fscanf(stdin, "%s", s2);

	multiplicar(s1, s2, NULL);
}

void leerArchivo(){
	FILE *file = fopen("datos.txt", "r");
	char *s1, *s2, *s3;
	s1 = (char*)malloc(sizeof(char)*TOPE);
	s2 = (char*)malloc(sizeof(char)*TOPE);
	s3 = (char*)malloc(sizeof(char)*TOPE);
	fscanf(file, "%s", s1);
	fscanf(file, "%s", s2);
	fscanf(file, "%s", s3);
	
	multiplicar(s1, s2, s3);
	fclose(file);
}

void multiplicar(char *s1, char *s2, char *s3){
	int size_a1 = resize(s1,TOPE);
	int size_a2 = resize(s2,TOPE);
	int size_a3_aux = resize(s3, TOPE);
	int size_a3 = size_a1 + size_a2;

	//printf("Aux: %i New: %i\n",size_a3_aux, size_a3 );

	FILE *resultado = fopen("resultado.txt", "w");

	fprintf(resultado, "%s\n", s1);
	fprintf(resultado, "%s\n", s2);

	int *a3;
	a3 = (int*) calloc(size_a3, sizeof(int));
	int w = 0, z = 0;

	for( int i = 0; i < size_a2; i++ ){
		for( int j = 0; j < size_a1; j++ ){
			int aux = (s1[size_a1-1-j]-48)*(s2[size_a2-1-i]-48);
			insertar(a3, size_a3, size_a3-i-j-1, aux);
		}
	}

	printf("%s\n", s1);
	printf("%s\n", s2);

	printf("\n\nMultiplicando...\n\n");
	imprimir(a3, s3 ,size_a3, resultado);

	printf("\n\n");

	free(a3);
	free(s1);
	free(s2);	
}

void insertar(int *array, int longitud, int posicion, int new){
	int aux = array[posicion] + new;
	int z = (int) aux/10;
	array[posicion] = aux%10;
	if( z > 0 ){
		insertar( array, longitud,  posicion - 1, z );
	}
}

int resize(char *a, int tope){
	for(int i = 0; i < tope; i++ ){
		if( a[i] == '\0' ){
			a = realloc(a, i);
			return i;
		}
	}
}

void imprimir(int *a3, char *s3 ,int size_a3, FILE *resultado){
	int bandera = 0, flag = 0;
	for(int i = 0; i < size_a3; i++){
		if( a3[i] != (s3[i]-48) ){
			flag = 1;
		}
		if( a3[i] == 0 && bandera == 0 ){
			bandera = 1;
			continue;
		}
		bandera = 1;
		printf("%i", a3[i]);
		fprintf(resultado, "%i", a3[i]);
	}	
	final = clock();
	if( flag == 0){
		printf("\n\nLa multiplicación es correcta\n");
		fprintf(resultado, "\nLa multiplicación es correcta\n");
	}
	else{
		printf("\n\nLa multiplicación NO es correcta\n");
		fprintf(resultado, "\nLa multiplicación NO es correcta\n");
	}

	double segundos = (double) (final - inicio) / CLOCKS_PER_SEC;
	printf("\n\nTiempo en segundos: %f\n", segundos);
	fprintf(resultado, "\n\nTiempo en segundos: %f\n", segundos);
	fclose(resultado);
}

