#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <string.h>
#include <math.h>

/**
* Cargar los datos de proporciones obtenidos mediante la decompilacion y contabilizacion de las instrucciones MIPS
*@param matrizIter La matriz que recibe los datos de numero de instrucciones de cada optimizacion en el algoritmo iterativo
*@param matrizIter La matriz que recibe los datos de numero de instrucciones de cada optimizacion en el algoritmo recursivo
*@return No aplica, salida a travez de parametros
*/
void inicializarMatricesDeDatos(double ** matrizIter, double ** matrizRec){
	//Optimizacion O0 con Tipo I R y J respectivamente
	matrizIter[0][0] = (double) 46; matrizRec[0][0] = (double) 72;
	matrizIter[0][1] = (double) 14; matrizRec[0][1] = (double) 39;
	matrizIter[0][2] = (double) 2; matrizRec[0][2] = (double) 4;
	matrizIter[0][3] = (double) 74; matrizRec[0][3] = (double) 115;
	matrizIter[0][4] = (double) 60; matrizRec[0][4] = (double) 85;
	//Optimizacion O1 con Tipo I R y J respectivamente
	matrizIter[1][0] = (double) 14; matrizRec[1][0] = (double) 39;
	matrizIter[1][1] = (double) 9; matrizRec[1][1] = (double) 40;
	matrizIter[1][2] = (double) 2; matrizRec[1][2] = (double) 7;
	matrizIter[1][3] = (double) 25; matrizRec[1][3] = (double) 86;
	matrizIter[1][4] = (double) 21; matrizRec[1][4] = (double) 65;
	//Optimizacion O2 con Tipo I R y J respectivamente
	matrizIter[2][0] = (double) 13; matrizRec[2][0] = (double) 40;
	matrizIter[2][1] = (double) 11; matrizRec[2][1] = (double) 40;
	matrizIter[2][2] = (double) 0; matrizRec[2][2] = (double) 4;
	matrizIter[2][3] = (double) 24; matrizRec[2][3] = (double) 84;
	matrizIter[2][4] = (double) 17; matrizRec[2][4] = (double) 63;
	//Optimizacion O3 con Tipo I R y J respectivamente
	matrizIter[3][0] = (double) 13; matrizRec[3][0] = (double) 294;
	matrizIter[3][1] = (double) 11; matrizRec[3][1] = (double) 297;
	matrizIter[3][2] = (double) 0; matrizRec[3][2] = (double) 4;
	matrizIter[3][3] = (double) 24; matrizRec[3][3] = (double) 620;
	matrizIter[3][4] = (double) 17; matrizRec[3][4] = (double) 595;
	//Optimizacion Os con Tipo I R y J respectivamente
	matrizIter[4][0] = (double) 11; matrizRec[4][0] = (double) 27;
	matrizIter[4][1] = (double) 8; matrizRec[4][1] = (double) 29;
	matrizIter[4][2] = (double) 1; matrizRec[4][2] = (double) 4;
	matrizIter[4][3] = (double) 20; matrizRec[4][3] = (double) 60;
	matrizIter[4][4] = (double) 15; matrizRec[4][4] = (double) 34;
}

/**
* Generar e imprimir el formato de los datos en archivo de salida.
* @param input La cantidad de números a ordenar.
* @param mipsIt Nnúmero de mips segun la aproximacion de la iteracion
* @param mipsRec Número de mips segun la aproximacion de la recursion
* @param tiemposEstimadosIt Conjunto de tiempos segun optimizacion segun la aproximacion de la iteracion
* @param tiemposEstimadosRec Conjunto de tiempos segun optimizacion segun la aproximacion de la recursion
* @return no aplica, resultados por parametros
*/
void formatearSalida(FILE *file, double valor_mips , double *tiemposIter,double * tiemposRec){
	if(file !=NULL && tiemposIter!=NULL && tiemposRec!=NULL){
		fprintf(file, "MIPS calculados: %.0lf instrucciones/segundo\n", valor_mips);
		int optimizacion = 0;
		for(optimizacion;optimizacion<5;optimizacion++){
			if(optimizacion!=4){
				fprintf(file, "Tiempo de ejecución del programa iterativo (-0%d): %.10lfs (estimado)\n", optimizacion,tiemposIter[optimizacion]);
			}else{
				fprintf(file, "Tiempo de ejecución del programa iterativo (-0s): %.10lfs (estimado)\n", tiemposIter[optimizacion]);
			}
		}
		optimizacion = 0;
		for(optimizacion;optimizacion<5;optimizacion++){
			if(optimizacion!=4){
				fprintf(file, "Tiempo de ejecución del programa recursivo (-0%d): %.10lfs (estimado)\n", optimizacion,tiemposRec[optimizacion]);
			}else{
				fprintf(file, "Tiempo de ejecución del programa recursivo (-0s): %.10lfs (estimado)\n", tiemposRec[optimizacion]);
			}
		}
	}else
	{
		fprintf(file, "ERROR: error en la obtención de datos\n" );
	}
}


/**
* Obtener tiempo de ejecucion de las instrucciones de assembly MIPS
*@param optimizacion El numero identificador del nivel de optimizacion
*@param matriz Fuente de los datos de numero de instrucciones
*@return double con el tiempo de ejecucion de las instrucciones del algoritmo
*/
double tiempo_ejecucion(int optimizacion,double **matriz)
{
	if(optimizacion<=5 && optimizacion>=0){
		clock_t t_inicial;
		double tiempo_resultado =0;
		int i;
		t_inicial = clock();
		//Ejecucion de instruccion assembly MIPS del TIPO I repite instruccion de tipo R tantas veces como indica la proporcion
		for(i=0;i<matriz[optimizacion][0];i++){
			__asm__("addi $s0,$s0,1");
		}
		//Ejecucion de instruccion assembly MIPS del TIPO R repite instruccion de tipo R tantas veces como indica la proporcion
		for(i=0;i<matriz[optimizacion][1];i++){
			__asm__("add $s1,$s1,$s0");
		}
		//Ejecucion de instruccion assembly MIPS del TIPO J
		i=0;
		__asm__("li $t0,0");
		__asm__("$L2: ");
		__asm__("jal $L");
		__asm__("$L: ");
		__asm__("addi $t0,$t0,1");
		__asm__("li $t1,200000000");
		__asm__("blt $t0,$t1, $L2");
	
		//Captacion del tiempo de ejecucion mediante time.h
		tiempo_resultado = ((double)clock()-t_inicial)/CLOCKS_PER_SEC; 
		//printf("%.10lf\n", tiempo_resultado);
		return tiempo_resultado;
	}
	else{
		return -1;
	}
}

/**
*	Obtener número de instrucciones dado el porcentaje de instrucciones que se iteran o entran en recursion
*	es decir, se utiliza el valor de la entrada, en este caso 20000 datos, usando como límite O(n^2) para iterativo y O(nlogn) para recursivo.
*@param optimizacion Nivel de optimizacion
*@param matriz Matriz con datos de numero de instrucciones
*@param tipo Determina el origen de los datos, algoritmo Iterativo o Recursivo
*@return numero de instrucciones que se ejecutan finalmente
*/
double numero_instrucciones(int optimizacion, double ** matriz, int tipo){
	//Calculo: (NItotales - NIafectadas) + NIafectadas * [n²|nlogn]
	if(tipo == 0){
		return (matriz[optimizacion][3]-matriz[optimizacion][4])+ matriz[optimizacion][4]*20000*20000;
	}else if(tipo == 1){
		return (matriz[optimizacion][3]-matriz[optimizacion][4])+ matriz[optimizacion][4]*20000*log(20000);
	}else{
		return -1;
	}
}

/**
*	Obtener tiempos estimados dado un valor de mips previamente calculado
*@param valor_mips MIPS calculados
*@param tiempos_iter Arreglo que recibe los calculos de tiempo iterativo
*@param tiempos_rec Arreglo que recibe los calculos de tiempo recursivo
*@return Salida mediante parametros
*/
void tiemposEstimados(double valor_mips,double tiempos_iter[],double tiempos_rec[],double ** matrizIter,double ** matrizRec){
	int optimizacion;
	for(optimizacion=0; optimizacion<5;optimizacion++){
		tiempos_iter[optimizacion] = numero_instrucciones(optimizacion,matrizIter,0)/(valor_mips*1E6);
		tiempos_rec[optimizacion] = numero_instrucciones(optimizacion,matrizRec,1)/(valor_mips*1E6);
	}
}

/**
* Obtener el valor MIPS promedio de todas las ejecuciones de los algoritmos para cada uno de los niveles de optimizacion y los dos algoritmos
*@param arreglo_iter Arreglo con los valores de MIPS de la ejecucion iterativa
*@param arreglo_rec Arreglo con los valores de MIPS de la ejecucion recursiva
*return promedio de los mips iterativos y recursivos
*/
double promedioMips(double arreglo_iter[],double arreglo_rec[]){
	int count = 0;
	int i;
	for(i=0;i<5;i++){
		count = count + arreglo_iter[i]+arreglo_rec[i];
	}
	return count/10;
}


/**
*	Obtencion del valor de mips para un cierto NI y tiempo de ejecucion
*@param numero_instrucciones Valor del conteo de instrucciones
*@param tiempo_ejecucion Valor del tiempo de ejecucion
*@return valor MIPS
*/
double millions_instructions_per_second(double numero_instrucciones, double tiempo_ejecucion){
	double resultado = 0;
	resultado =  numero_instrucciones / (tiempo_ejecucion * 1E6);
	return resultado;
}

/**
*	Realizar el proceso de benchmarking
*   @param No aplica
*	@return No aplica
*/
void benchmarck(char const * archivo_salida){
	FILE * fileOut = fopen(archivo_salida, "w"); //Archivo para la salida de los resultados
	int optimizacion; //Variable para manejar la optimizacion O0,O1,O2,O3,Os
	double numero_instrucciones_aprox_iter; //variables para obtener el numero de instrucciones según la entrada para ambos algoritmos
	double numero_instrucciones_aprox_rec;  
	double ** matrizIter; //matrices que albergan el conteo de instrucciones, revisar informe con tabla
	double ** matrizRec;
	double exec_time_iter; // variable para obtener el tiempo de ejecucion del algoritmo
	double exec_time_rec;
	double arreglo_mips_iter[5];
	double arreglo_mips_rec[5];
	double tiempoEstimadoIter[5];
	double tiempoEstimadoRec[5];
	matrizIter = (double**)malloc(5*sizeof(double*));
	matrizRec = (double**)malloc(5*sizeof(double*));
	int i;
	for (i = 0; i < 5; i++)
	{
		matrizIter[i] =(double*)malloc(4*sizeof(double));
		matrizRec[i] =(double*)malloc(4*sizeof(double));
	}
	inicializarMatricesDeDatos(matrizIter,matrizRec);
	for (optimizacion = 0; optimizacion < 5; optimizacion++)
	{
		//Obtencion del número de isntrucciones dinámicas aproximado con respecto a la complejidad del algoritmo
		numero_instrucciones_aprox_iter = numero_instrucciones(optimizacion,matrizIter,0);
		numero_instrucciones_aprox_rec = numero_instrucciones(optimizacion,matrizRec,1);
		//Obtencion de el valor de tiempo de ejecucion delas instruccione MIPS en las proporciones dadas
		exec_time_iter = tiempo_ejecucion(optimizacion,matrizIter);
		exec_time_rec = tiempo_ejecucion(optimizacion,matrizRec);
		//Obtencion del calculo de MIPS para cada uno de los niveles de optimizacion y algoritmo
		arreglo_mips_iter[optimizacion]= millions_instructions_per_second(numero_instrucciones_aprox_iter,exec_time_iter);
		arreglo_mips_rec[optimizacion]= millions_instructions_per_second(numero_instrucciones_aprox_rec,exec_time_rec);
	}
	//Calculo del valor mips total para calculo de los tiempos estimados
	//Este valor es un PROMEDIO SIMPLE DE LA EJECUCION DE TODOS LOS NIVELES Y ALGORITMOS
	double valor_mips = promedioMips(arreglo_mips_iter,arreglo_mips_rec);
	//Calculo de los TIEMPOS ESTIMADOS a partir del valor MIPS y las instrucciones dinámicas
	tiemposEstimados(valor_mips,tiempoEstimadoIter,tiempoEstimadoRec,matrizIter,matrizRec);
	//TODOS LOS DATOS OBTENIDOS
	//Dar formato de salida a los datos ya obtenidos
	formatearSalida(fileOut,valor_mips,tiempoEstimadoIter,tiempoEstimadoRec);
	fclose(fileOut);
	//Muestra por consola el archivo recien creado
	printf("Revisar archivo de salida: %s\n",archivo_salida);
}

int main(int argc, char const *argv[])
{
	if(argc != 2){
		printf("benchmark requires a minimum of 1 argument.\n\n Usage:	./benchmark [ARG...]\n\nWhere [ARG...] => outputfile\n");
	}else{
		benchmarck(argv[1]);
	}
	return 0;
}
