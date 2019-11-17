#ifndef _DICCIONARIO_
#define _DICCIONARIO_

#include <stdio.h>
#include <stdlib.h>

typedef struct lista *lista;
typedef struct nodo *nodo;

struct lista
{
	int tam;
    nodo frente;
};

struct nodo
{
    char caracter;
    int aparicion;
    nodo sig;
};

lista Crear();
void Borrar(lista);
void Insertar(lista, char);
void Orden(nodo, nodo);
void Imprimir(nodo);
void Eliminar(nodo, int);

#endif // _LISTAS_
