#include "diccionario.h"

void Insertar(lista a, char c)
{
    nodo Nuevo = (nodo)malloc(sizeof(nodo));
    if(Nuevo == NULL)
        exit(1);

    Nuevo->caracter = c;
    Nuevo->aparicion = 1;
    Nuevo->sig = NULL;

    if(a->tam == 0)
        a->frente = Nuevo;

    else
        Orden(a->frente, Nuevo);

    a->tam ++;
    return;
}

void Orden(nodo a, nodo b)
{
    if(b->caracter == a->caracter)
    {
        a->aparicion++;
        return;
    }
    if(a->sig == NULL)
    {
        a->sig = b;
        return;
    }
    else
    {
        Orden(a->sig, b);
    }
}

void Imprimir(nodo a)
{
    printf("%c %i \n",a->caracter, a->aparicion);
    if(a->sig != NULL)
    {
        Imprimir(a->sig);
    }
    
    return;
}

lista Crear()
{
    lista a =(lista)malloc(sizeof(lista));
    if(a == NULL)
        exit(1);
    a->tam = 0;
    a->frente = NULL;

    return a;
}