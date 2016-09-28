#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include <math.h>

float obtenerFrecuencia(){
	FILE * fileIN;
		char * linea;
		char * token;
		float frecuency;
		int i=1;
		system("cat /proc/cpuinfo | grep 'model name' | uniq > processorclock.txt");
		fileIN = fopen("processorclock.txt","r");
		linea = (char *)malloc(500*sizeof(char));
		while(!feof(fileIN)){
			fscanf(fileIN,"%s",linea);
		}
		token = strtok(linea,"@ ");
		while(token!=NULL){
			sscanf(token,"%f",&frecuency);
			token = strtok(NULL, "@ ");
			i++;
		}
		fclose(fileIN);
		system("rm processorclock.txt");
		return frecuency;
}

void inicializarMatrices(float ** matrizIter, float ** matrizRec){
	matrizIter = (float**)malloc(5*sizeof(float*));
	matrizRec = (float**)malloc(5*sizeof(float*));
	int i=0;
	for(i=0;i<5;i++){
		matrizIter[i] = (float*)malloc(4*sizeof(float));
		matrizRec[i] = (float*)malloc(4*sizeof(float));
	}
	//Optimizacion O0 con Tipo I R y J respectivamente
	matrizIter[0][0] = 46/74; matrizRec[0][0] = 72/115;
	matrizIter[0][1] = 14/74; matrizRec[0][1] = 39/115;
	matrizIter[0][2] = 2/74; matrizRec[0][2] = 4/115;
	matrizIter[0][3] = 74; matrizRec[0][3] = 115;
	//Optimizacion O1 con Tipo I R y J respectivamente
	matrizIter[1][0] = 14/25; matrizRec[1][0] = 39/86;
	matrizIter[1][1] = 9/25; matrizRec[1][1] = 40/86;
	matrizIter[1][2] = 2/25; matrizRec[1][2] = 7/86;
	matrizIter[1][3] = 25; matrizRec[1][3] = 86;
	//Optimizacion O2 con Tipo I R y J respectivamente
	matrizIter[2][0] = 13/24; matrizRec[2][0] = 40/84;
	matrizIter[2][1] = 11/24; matrizRec[2][1] = 40/84;
	matrizIter[2][2] = 0/24; matrizRec[2][2] = 4/84;
	matrizIter[2][3] = 24; matrizRec[2][3] = 84;
	//Optimizacion O3 con Tipo I R y J respectivamente
	matrizIter[3][0] = 13/24; matrizRec[3][0] = 294/620;
	matrizIter[3][1] = 11/24; matrizRec[3][1] = 297/620;
	matrizIter[3][2] = 0/24; matrizRec[3][2] = 4/620;
	matrizIter[3][3] = 24; matrizRec[3][3] = 620;
	//Optimizacion Os con Tipo I R y J respectivamente
	matrizIter[4][0] = 11/20; matrizRec[4][0] = 27/60;
	matrizIter[4][1] = 8/20; matrizRec[4][1] = 29/60;
	matrizIter[4][2] = 1/20; matrizRec[4][2] = 4/60;
	matrizRec[4][3] = 20; matrizRec[4][3] = 60;


}


float CPIMedio(float ** matriz, int optimizacion){
	float CPIMedio = 5*matriz[optimizacion][0]+5*matriz[optimizacion][1]+4*matriz[optimizacion][2];
}

float Millions_of_instructions_per_second(){
	float ** matrizIter=NULL;
	float ** matrizRec=NULL;
	int optimizacion = 0;
	float cpi;
	float meeps;
	float frec;
	float tiemposEstimados[10];
	inicializarMatrices(matrizIter,matrizRec);
	frec = obtenerFrecuencia();
	float meeps[10];
	optimizacion=0;
	while(optimizacion<5){
		cpi = CPIMedio(matrizIter,optimizacion);
		meeps = frec / (cpi * 1000000);
		tiemposEstimados[optimizacion] = matrizIter[optimizacion][3]/(meeps*1000000);
		cpi = CPIMedio(matrizRec,optimizacion);
		meeps= frec / (cpi * 1000000);
		tiemposEstimados[i] = matrizRec[optimizacion][3]/meeps;
		i++;
		optimizacion++;
	}
}



int main(int argc, char* argv[]){
	if(argc == 2){
		FILE * fileIN;
		float frec = obtenerFrecuencia();
		exit(EXIT_SUCCESS);
	}else{
		exit(EXIT_FAILURE);
	}
	
}