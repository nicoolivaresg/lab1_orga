#include <stdio.h>
#include <stdlib.h>

void ordenamiento_iterativo(int* arreglo, int n){
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
}
	
int main(int argc, char* argv[]){
	int n = 0;
	int* arreglo =NULL;
	int i = 0;
	FILE * fileIN =NULL;
	FILE *fileOUT =NULL;
	fileIN = fopen(argv[1],"r");
	fileOUT = fopen("salida_iter.txt","w");
	fscanf(fileIN,"%d\n",&n);
	arreglo = (int*)malloc(n*sizeof(int));
	while (!feof(fileIN)){
		fscanf(fileIN,"%d",&arreglo[i]);
		i++;
	}
	ordenamiento_iterativo(arreglo,n);
	for (i = 0; i < n; i++)
	{
		fprintf(fileOUT, "%d\n", arreglo[i]);
	}
	fclose(fileIN);
	fclose(fileOUT);
}