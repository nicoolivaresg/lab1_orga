#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <string.h>

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
* @return no aplica, resultados por referencia
*/
void formatearSalida(FILE *file, double *mipsIt, double * mipsRec, double *tiemposIter,double * tiemposRec){
	if(file !=NULL && mipsIt!=NULL && mipsRec!=NULL && tiemposIter!=NULL && tiemposRec!=NULL){
		fprintf(file, "MIPS calculados: %lf\n", (*mipsIt+*mipsRec)/2);
		int optimizacion = 0;
		for(optimizacion;optimizacion<5;optimizacion++){
			if(optimizacion!=4){
				fprintf(file, "Tiempo de ejecución del programa iterativo (-0%d): %lfs (estimado)\n", optimizacion,tiemposIter[optimizacion]);
			}else{
				fprintf(file, "Tiempo de ejecución del programa iterativo (-0s): %lfs (estimado)\n", tiemposIter[optimizacion]);
			}
		}
		optimizacion = 0;
		for(optimizacion;optimizacion<5;optimizacion++){
			if(optimizacion!=4){
				fprintf(file, "Tiempo de ejecución del programa recursivo (-0%d): %lfs (estimado)\n", optimizacion,tiemposRec[optimizacion]);
			}else{
				fprintf(file, "Tiempo de ejecución del programa recursivo (-0s): %lfs (estimado)\n", tiemposRec[optimizacion]);
			}
		}
	}else
	{
		fprintf(file, "ERROR: error en la obtención de datos\n" );
	}
}

double tiempo_ejecucion(int optimizacion,double **matriz)
{
	if(optimizacion<=5 && optimizacion>=0){
		clock_t t_inicial;
		double tiempo_resultado =0;
		int i;
		t_inicial = clock();
		//TIPO I
		for(i=0;i<matriz[optimizacion][0];i++){
			asm("addi $s0,$s0,4");
		}
		//TIPO R
		for(i=0;i<matriz[optimizacion][1];i++){
			asm("add $s1,$s1,$s0");
		}
		//TIPO J
		for(i=0;i<matriz[optimizacion][2];i++){
			//asm("j LABEL");
		}
		tiempo_resultado = ((double)clock()-t_inicial)/CLOCKS_PER_SEC; 
		return tiempo_resultado;
	}
	else{
		return -1;
	}
}

double numero_instrucciones(int optimizacion, double ** matriz){
	return (matriz[optimizacion][3]-matriz[optimizacion][4])+ matriz[optimizacion][4]*20000;
}

void tiemposEstimados(double valor_mips,double tiempos_iter[],double tiempos_rec[],double ** matrizIter,double ** matrizRec){
	int optimizacion;
	for(optimizacion=0; optimizacion<5;optimizacion++){
		tiempos_iter[optimizacion] = numero_instrucciones(optimizacion,matrizIter)/(valor_mips*1E6);
		tiempos_rec[optimizacion] = numero_instrucciones(optimizacion,matrizRec)/(valor_mips*1E6);
	}
}

double promedioMips(double arreglo_iter[],double arreglo_rec[]){
	int count = 0;
	int i;
	for(i=0;i<5;i++){
		count = count + arreglo_iter[i]+arreglo_rec[i];
	}
	return count/10;
}

double millions_instructions_per_second(double numero_instrucciones, double tiempo_ejecucion){
	double resultado = 0;
	resultado =  numero_instrucciones / 1E6;//(tiempo_ejecucion * 1E6);
	return resultado;
}

void benchmarck(){
	FILE * fileOut = fopen("salida_benchmark.txt", "w");
	int optimizacion;
	double numero_instrucciones_aprox_iter;
	double numero_instrucciones_aprox_rec;
	double ** matrizIter;
	double ** matrizRec;
	double exec_time_iter;
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
		numero_instrucciones_aprox_iter = numero_instrucciones(optimizacion,matrizIter);
		numero_instrucciones_aprox_rec = numero_instrucciones(optimizacion,matrizRec);
		exec_time_iter = tiempo_ejecucion(optimizacion,matrizIter);
		exec_time_rec = tiempo_ejecucion(optimizacion,matrizRec);
		arreglo_mips_iter[optimizacion]= millions_instructions_per_second(numero_instrucciones_aprox_iter,exec_time_iter);
		arreglo_mips_rec[optimizacion]= millions_instructions_per_second(numero_instrucciones_aprox_rec,exec_time_rec);
	}
	double valor_mips = promedioMips(arreglo_mips_iter,arreglo_mips_rec);
	tiemposEstimados(valor_mips,tiempoEstimadoIter,tiempoEstimadoRec,matrizIter,matrizRec);
	formatearSalida(fileOut,arreglo_mips_iter,arreglo_mips_rec,tiempoEstimadoIter,tiempoEstimadoRec);
	fclose(fileOut);
	system("cat salida_benchmark.txt");
}

int main(int argc, char const *argv[])
{
	benchmarck();
	return 0;
}
