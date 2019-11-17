//Autor: Juárez Cruz Oscar Daniel

#include<stdio.h>

int main(){
	int array_1 [] = {1, 3, 4, 7, 12, 17};
	int array_2 [] = {3, 5, 8, 9};
	
	/*1 3 3 4 5 7 8 9 12 17*/

	int lon_1 = sizeof(array_1)/sizeof(int);
	int lon_2 = sizeof(array_2)/sizeof(int);

	int longitud = sizeof(array_1)/sizeof(int) + sizeof(array_2)/sizeof(int);

	int array[longitud];
	int index_1 = 0;
	int index_2 = 0;


	for( int i = 0; i < longitud; i++ ){
		if( array_1[index_1] <= array_2[index_2] ){
			array[i] = array_1[index_1];
			index_1++;
		}else{
			array[i] = array_2[index_2];
			index_2++;
		}
		if( index_2 == lon_2  ){
			for(int j = index_1; j < lon_1; j++){
				i++;
				array[i] = array_1[index_1];
				index_1++;
			}
		}
		if( index_1 == lon_1  ){
			for(int j = index_2; j < lon_2; j++){
				i++;
				array[i] = array_2[index_2];
				index_2++;
			}
		}
	}

	for( int i = 0; i < longitud; i++){
		printf("%i  ", array[i] );
	}

	printf("\nFin\n");

	return 0;
}
