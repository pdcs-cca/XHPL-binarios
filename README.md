# XHPL-binarios
Archivos de prueba Linpack

Para la ejecución de ambos se requiere que el archivo HPL.dat se encuentre en el mismo directorio.
El binario XHPL tiene instrucciones SSE4.2, AVX
El binario xhpl_intel64_static tiene instruacciones del binario XHPL + AVX2,  FMA3

XHPL version  AVX2
Ejemplos de ejecución, el valor -n  indica el tamaño de la matriz a invertir (ver script meml).
* Utilizar valores de n muy grandes puede provocar el uso intensivo de SWAP y en consecuencia inestabilidad en el sistema

2 hilos indicando el número de core (afinidad) a utilizar por mdeio de varibles del API OPENMP
> env OMP_NUM_THREADS=2 OMP_DISPLAY_ENV=VERBOSE  OMP_PLACES="{16}" ./XHPL -n 10000
> env OMP_NUM_THREADS=2 OMP_DISPLAY_ENV=VERBOSE  OMP_PLACES="{16,17}" ./XHPL -n 10000

2 hilos indicando la afinidad a los cores 16 y 17 por medio de la herramienta numactl
> env OMP_NUM_THREADS=2 numactl -C 16,17 ./XHPL -n 10000

2 hilos y dejar al shceduler seleecione el core a despacharlos
> env OMP_NUM_THREADS=2 OMP_DISPLAY_ENV=VERBOSE  ./XHPL -n 10000


A diferencia de XHPL (versión previa, 2017), esta versión fue compilada para obtener mayor 
rendimiento en el sistema generando tantos hilos como unidades de procesamiento físico.

No sigue el estándar OPENMP y para controlar el número de hilos se debe usar la varible HPL_NUMTHREADS=2.
No es posible indicar el número de core a despachar los hilos, internamente el programa utiliza
los cores físico en orden ascendente {0,1,2 ...}

2 hilos 
> env HPL_NUMTHREADS=2 ./xhpl_intel64_static  -n 10000

