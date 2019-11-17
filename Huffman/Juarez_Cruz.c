#include "diccionario.h"

int main(){
	lista list = Crear();
	FILE *f;
	f = fopen("test.txt","r");
	char aux;

	while( (aux  = fgetc(f)) != EOF){
		Insertar(lista a, char c);
	}

	fclose(f);

	Imprimir( list->frente );

	return 0;
}

