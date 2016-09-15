#include <stdlib.h>
#include <stdio.h>
/*
	Procedimiento que se encarga de ordenar los elementos de un arreglo de menor a mayor,
	utilizando el algoritmo de burbuja.
	@param: arreglo con elementos enteros desordenados.
	@param: numero de elementos en el arreglo.
	@out: no aplica.
*/
int ordenamiento_iterativo(int* arreglo, int n){
	int i,j,temp;
	for(i=1;i<n;i++){
		for(j=0;j<n-i;j++){
			if(arreglo[j]>arreglo[j+1]){
				temp = arreglo[j];
				arreglo[j]=arreglo[j+1];
				arreglo[j+1]=temp;
			}
		}
	}
	return 0;
}


int main(int argc, char* argv[]){
	int n;
	int* arreglo;
	int i;
	FILE * fileIN,*fileOUT;
	switch (argc){
		case 0:
			printf("%s\n", "ARGUMENTOS INSUFICIENTES");
			exit(EXIT_FAILURE);
			break;
		case 1:
			printf("%s\n", "ARGUMENTOS INSUFICIENTES");
			exit(EXIT_FAILURE);
			break;
		case 2:
			printf("%s\n", argv[1]);
			fileIN = fopen(argv[1],"r");
			if(fileIN){
				if(fscanf(fileIN,"%d\n",&n)==EOF){
					printf("%s\n", "ERROR DE LECTURA DE ARCHIVO");
					exit(EXIT_FAILURE);
				}else
				{
					arreglo = (int*)malloc(n*sizeof(int));	
				}
				i=0;
				while (!feof(fileIN)){
					if(fscanf(fileIN,"%d",&arreglo[i])==EOF){
						printf("%s\n", "ERROR DE LECTURA DE ARCHIVO");
						exit(EXIT_FAILURE);
					}
					i++;
				}
				
				
				if(ordenamiento_iterativo(arreglo,n)){
					printf("%s\n", "ERROR EN ORDENAMIENTO");
					exit(EXIT_FAILURE);
				}else{
					printf("%s\n", "ORDENAMIENTO EXISTOSO");
					fileOUT = fopen("ARCHIVO_SALIDA_ITERATIVO.txt","w");
					for (i = 0; i < n; ++i)
					{
						fprintf(fileOUT, "%d\n", arreglo[i]);
					}
					fclose(fileIN);
					fclose(fileOUT);
					exit(EXIT_SUCCESS);
				}
				
			}else{
				printf("%s\n", "ERROR DE LECTURA DE ARCHIVO");
				exit(EXIT_FAILURE);
			}
			
		default:
			printf("%s\n", "DEMACIADOS ARGUMENTOS");
			exit(EXIT_FAILURE);
			break;
	}
}	
