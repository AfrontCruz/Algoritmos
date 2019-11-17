#ifndef _MATRIZ_
#define _MATRIZ_

struct Matriz
{
	int fila;
	int columna;
	float **matriz;
};

typedef struct Matriz Matriz;

Matriz crearMatriz(int, int);
/*void llenar(int**, int, int);
void imprimir(int**, int, int);
void suma();
void resta();
void multiplica();
void menu();*/

#endif // _MATRIZ_
