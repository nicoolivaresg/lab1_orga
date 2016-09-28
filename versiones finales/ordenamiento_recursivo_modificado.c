#include <stdlib.h>
#include <stdio.h>
#include <time.h>

void ordenamiento_recursivo(int * arreglo, int inicio, int fin){
	int i = inicio;
	int f = fin;
	int pivote = arreglo[(i+f)/2];
	int temp;
	while(i<=f){
		while(arreglo[i]<pivote){
			i++;
		}
		while(arreglo[f]>pivote){
			f--;
		}
		if(i<=f){
			temp = arreglo[i];
			arreglo[i]=arreglo[f];
			arreglo[f]=temp;
			i++;
			f--;
		}
	}

	if(inicio < f){
		ordenamiento_recursivo(arreglo,inicio,f);
	}
	if(fin > i){
		ordenamiento_recursivo(arreglo,i,fin);
	}
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
			//printf("%s\n", argv[1]);
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
					fscanf(fileIN,"%d",&arreglo[i])==EOF;
					i++;
				}
				fclose(fileIN);
				
				clock_t t_inicial =clock();
				ordenamiento_recursivo(arreglo,0,n-1);
				printf("Tiempo de ejecución: %f <-Iterativo\n", ((double)clock()-t_inicial)/CLOCKS_PER_SEC);
				fileOUT = fopen("ARCHIVO_SALIDA_RECURSIVO.txt","w");
				for (i = 0; i < n; i++)
				{
					fprintf(fileOUT, "%d\n", arreglo[i]);
				}
				fclose(fileOUT);
				exit(EXIT_SUCCESS);				
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