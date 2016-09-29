#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include <math.h>


int main(int argc, char* argv[]){
	clock_t t_inicial = clock();
	printf("Tiempo de ejecución recursivo (time.h): %f s\n", ((double)clock()-t_inicial)/CLOCKS_PER_SEC);
}