#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include <math.h>


/**
* Obtener desde el sistema el valor de la frecuencia de reloj del procesador siendo utilizado
* @param No figuran parametros
* @return Frecuencia de reloj del procesador en Ghz.
*/
double obtenerFrecuencia(){
	FILE * fileIN;
		char * linea;
		char * token;
		float frecuency;
		int i=1;
		//Acceso y filtro del archivo, haciendo un vaciado al archivo processorclock.txt
		system("cat /proc/cpuinfo | grep 'model name' | uniq > processorclock.txt");
		//Apertura del archivo temporal
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
		//Eliminación del archivo teporal luego de utilizarlo
		system("rm processorclock.txt");
		return (double)frecuency;
}

/**
* Poblar las matrices de proporciones.
* @param input La cantidad de números a ordenar.
* @param matrizIter La matriz de proporciones para el algoritmo iterativo.
* @param matrizRec La matriz de proporciones para el algoritmo recursivo.
* @return salen dos matricez de números reales con proporciones.
*/
void inicializarMatricesDeProporciones(double input, double ** matrizIter, double ** matrizRec){
	//A cada una de las proporciones de instrucciones se multiplica por el input^2
	//esto es en base a la complejidad del peor caso de los algoritmos para la entrada input.
	//De esta manera se aproxima el número de instrucciones en una cota superior de O(input^2)
	//Optimizacion O0 con Tipo I R y J respectivamente
	matrizIter[0][0] = (double) 46/74*pow(input,2); matrizRec[0][0] = (double) 72/115*pow(input,2);
	matrizIter[0][1] = (double) 14/74*pow(input,2); matrizRec[0][1] = (double) 39/115*pow(input,2);
	matrizIter[0][2] = (double) 2/74*pow(input,2); matrizRec[0][2] = (double) 4/115*pow(input,2);
	matrizIter[0][3] = (double) 74; matrizRec[0][3] = (double) 115;
	//Optimizacion O1 con Tipo I R y J respectivamente
	matrizIter[1][0] = (double) 14/25*pow(input,2); matrizRec[1][0] = (double) 39/86*pow(input,2);
	matrizIter[1][1] = (double) 9/25*pow(input,2); matrizRec[1][1] = (double) 40/86*pow(input,2);
	matrizIter[1][2] = (double) 2/25*pow(input,2); matrizRec[1][2] = (double) 7/86*pow(input,2);
	matrizIter[1][3] = (double) 25; matrizRec[1][3] = (double) 86;
	//Optimizacion O2 con Tipo I R y J respectivamente
	matrizIter[2][0] = (double) 13/24*pow(input,2); matrizRec[2][0] = (double) 40/84*pow(input,2);
	matrizIter[2][1] = (double) 11/24*pow(input,2); matrizRec[2][1] = (double) 40/84*pow(input,2);
	matrizIter[2][2] = (double) 0/24*pow(input,2); matrizRec[2][2] = (double) 4/84*pow(input,2);
	matrizIter[2][3] = (double) 24; matrizRec[2][3] = (double) 84;
	//Optimizacion O3 con Tipo I R y J respectivamente
	matrizIter[3][0] = (double) 13/24*pow(input,2); matrizRec[3][0] = (double) 294/620*pow(input,2);
	matrizIter[3][1] = (double) 11/24*pow(input,2); matrizRec[3][1] = (double) 297/620*pow(input,2);
	matrizIter[3][2] = (double) 0/24*pow(input,2); matrizRec[3][2] = (double) 4/620*pow(input,2);
	matrizIter[3][3] = (double) 24; matrizRec[3][3] = (double) 620;
	//Optimizacion Os con Tipo I R y J respectivamente
	matrizIter[4][0] = (double) 11/20*pow(input,2); matrizRec[4][0] = (double) 27/60*pow(input,2);
	matrizIter[4][1] = (double) 8/20*pow(input,2); matrizRec[4][1] = (double) 29/60*pow(input,2);
	matrizIter[4][2] = (double) 1/20*pow(input,2); matrizRec[4][2] = (double) 4/60*pow(input,2);
	matrizRec[4][3] = (double) 20; matrizRec[4][3] = (double) 60;
}

/**
* Obtener el CPI Medio o Promedio de las instrucciones de MIPS, I,R y J.
* @param matriz Es la matriz de proporciones poblada.
* @param optimizacion El numero que identifica la optimizacion usada.
* @return cpi El número de ciclos por instruccion promedio para el programa.
*/
double CPIMedio(double ** matriz, int optimizacion){
	//Multiplica el cpi de cada instruccion de tipo I, R, J respectivamente, por el valor de la proporcion de instrucciones
	//generadas por la implementacioón
	double cpi = 5*matriz[optimizacion][0]+5*matriz[optimizacion][1]+4*matriz[optimizacion][2];
	return cpi;
}

/**
* Obtener todos los datos relevantes del programa de Benchmark
* @param input La cantidad de números a ordenar.
* @param mips_It Parametro por referencia para salida del número de mips segun la aproximacion de la iteracion
* @param mips_Rec Parametro por referencia para salida del número de mips segun la aproximacion de la recursion
* @param tiemposEstimadosIt Parametro por referencia para salida de un conjunto de tiempos segun optimizacion segun la aproximacion de la iteracion
* @param tiemposEstimadosRec Parametro por referencia para salida de un conjunto de tiempos segun optimizacion segun la aproximacion de la recursion
* @return no aplica, resultados por referencia
*/
void Millions_of_instructions_per_second(int input, double *mips_It, double * mips_Rec, double *tiemposEstimadosIt,double * tiemposEstimadosRec){
	double ** matrizIter;
	double ** matrizRec;
	matrizIter = (double**)malloc(5*sizeof(double*));
	matrizRec = (double**)malloc(5*sizeof(double*));
	int i=0;
	for(i=0;i<5;i++){
		matrizIter[i] = (double*)malloc(4*sizeof(double));
		matrizRec[i] = (double*)malloc(4*sizeof(double));
	}
	inicializarMatricesDeProporciones(input,matrizIter,matrizRec);
	int optimizacion = 0;
	double cpi;
	double frec;
	frec = obtenerFrecuencia();
	double mipsIt[5];
	double mipsRec[5];
	optimizacion=0;
	while(optimizacion<5){
		//Se obtiene el CPI promedio según la proporcion del número de instrucciones generadas en el decompilado el input
		cpi = CPIMedio(matrizIter,optimizacion);
		mipsIt[optimizacion] = frec * 1E9/ cpi*1E6;
		tiemposEstimadosIt[optimizacion] = pow(input,2)/(mipsIt[optimizacion]*1E6);
		cpi = CPIMedio(matrizRec,optimizacion);
		mipsRec[optimizacion] = frec * 1E9/ cpi*1E6;
		tiemposEstimadosRec[optimizacion] = pow(input,2)/(mipsRec[optimizacion]*1E6);
		optimizacion++;
	}
	
	double count = 0;
	for ( i= 0; i < 5; ++i)
	{
		count = count + mipsIt[i];
	}
	*mips_It = count/5;

	count = 0;
	for ( i= 0; i < 5; ++i)
	{
		count = count + mipsRec[i];
	}
	*mips_Rec = count/5;


}


/**
* Generar e imprimir el formato de los datos en archivo de salida.
* @param input La cantidad de números a ordenar.
* @param mipsIt Nnúmero de mips segun la aproximacion de la iteracion
* @param mipsRec Número de mips segun la aproximacion de la recursion
* @param tiemposEstimadosIt Conjunto de tiempos segun optimizacion segun la aproximacion de la iteracion
* @param tiemposEstimadosRec Conjunto de tiempos segun optimizacion segun la aproximacion de la recursion
* @return no aplica, resultados por referencia
*/
void formatearSalida(FILE *file, double *mipsIt, double * mipsRec, double *tiemposEstimadosIt,double * tiemposEstimadosRec){
	if(file !=NULL && mipsIt!=NULL && mipsRec!=NULL && tiemposEstimadosIt!=NULL && tiemposEstimadosRec!=NULL){
		double frec = obtenerFrecuencia();
		fprintf(file, "MIPS calculados: %lf\nFrecuenia de procesador: %.2lf Ghz\n", *mipsIt,frec);//(*mipsIt+*mipsRec)/2);
		int optimizacion = 0;
		for(optimizacion;optimizacion<5;optimizacion++){
			if(optimizacion!=4){
				fprintf(file, "Tiempo de ejecución del programa iterativo (-0%d): %lfs (estimado)\n", optimizacion,tiemposEstimadosIt[optimizacion]);
			}else{
				fprintf(file, "Tiempo de ejecución del programa iterativo (-0s): %lfs (estimado)\n", tiemposEstimadosIt[optimizacion]);
			}
		}
		optimizacion = 0;
		for(optimizacion;optimizacion<5;optimizacion++){
			if(optimizacion!=4){
				fprintf(file, "Tiempo de ejecución del programa recursivo (-0%d): %lfs (estimado)\n", optimizacion,tiemposEstimadosRec[optimizacion]);
			}else{
				fprintf(file, "Tiempo de ejecución del programa recursivo (-0s): %lfs (estimado)\n", tiemposEstimadosRec[optimizacion]);
			}
		}
	}else
	{
		fprintf(file, "ERROR: error en la obtención de datos\n" );
	}
}

int main(int argc, char* argv[]){
	if(argc == 2){
		FILE * fileOUT = fopen("Resultados_benchmark_MIPS.txt","w");
		double n=20000;
		//sscanf(argv[1], "%lf", &n);
		//printf("%lf\n", n);
		double * tiemposIt;
		double * tiemposRec;
		tiemposIt = (double *)malloc(5*sizeof(double));
		tiemposRec = (double *)malloc(5*sizeof(double));
		double mipsIt;
		double mipsRec;
		Millions_of_instructions_per_second(n,&mipsIt,&mipsRec,tiemposIt,tiemposRec);
		formatearSalida(fileOUT,&mipsIt,&mipsRec,tiemposIt,tiemposRec);
		fclose(fileOUT);
		system("cat Resultados_benchmark_MIPS.txt");
		exit(EXIT_SUCCESS);
	}else{
		exit(EXIT_FAILURE);
	}
	
}