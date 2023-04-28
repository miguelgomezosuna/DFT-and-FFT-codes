%Ejemplo de FFT para un sistema dado en ecuación en diferencias

%Mediante una ecuación dada en diferencias podemos describir un sitema que
%actúe de filtro para cualquier señal
b = [0.2,0.5,0.2];
a = 1;

%Necesitamos muestrear la señal para calcular su FFT
fs = 8000;

%Cogemos un número de muestras que sea potencia de dos para reducir
%complejidad temporal de la FFT
N = 4096;

freqz(b,a,N,fs)
%El módulo representa cuanto atenúa la señal para distintas frecuencias
%El módulo representa cuanto retarda la señal para distintas frecuencias

%Que la fase sea lineal significa que la señal se retarda el mismo número de muestras (una muestra)
%para cada frecuencia (retardo de grupo)
%grpdelay(b,a,N,fs)