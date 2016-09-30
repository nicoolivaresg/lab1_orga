#include <stdio.h>
#include <stdlib.h>

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
	int n = 0;
	int * arreglo =NULL;
	int i=0;
	FILE * fileIN =NULL;
	FILE *fileOUT =NULL;
	fileIN = fopen(argv[1],"r");
	fileOUT = fopen("salida_rec.txt","w");
	fscanf(fileIN,"%d\n",&n);
	arreglo = (int*)malloc(n*sizeof(int));
	while (!feof(fileIN)){
		fscanf(fileIN,"%d",&arreglo[i]);
		i++;
	}
	ordenamiento_recursivo(arreglo,0,n-1);
	for (i = 0; i < n; i++)
	{
		fprintf(fileOUT, "%d\n", arreglo[i]);
	}
	fclose(fileIN);
	fclose(fileOUT);
}