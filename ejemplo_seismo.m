%Estudio de la señal sísmica captada en Alaska por el terremoto de Sumartra
%en 2004
%Señal sísmica captada con sensor Harp en Alaska

%Importacion de señal, datos (periodo de muestreo) en archivos
%En este archivo constan tres señales captadas por tres sensores
%diferentes, pero estudiaremos la señal Harp (primera señal)
Ts = readmatrix("seismicstation_ts.csv");

%Almacenamos datos en una tabla temporal
%Guarda muestras temporales muestreadas con un frecuencia 1/Ts(1) 
harp = readtimetable("harp.csv","SampleRate",1/Ts(1));

%Ajustamos límites temporal de la señal para visualizarla
timeLimits = timerange(seconds(2000),seconds(4000));
harp = harp(timeLimits,:);

%Graficamos señal temporal
figure(1)
plot(harp.Time,harp.Signal)
title('Harp')
xlabel('tiempo (s)')
ylabel('Amplitud (unidades arbitrarias)')

%Graficamos espectro de potencia
%El cual se realiza mediante la transformada discreta de Fourier (FFT) de
%la señal muestreada y se toma el módulo al cuadrado para ver la potencia
figure(2)
pspectrum(harp)

%Nos interesa observar para qué frecuencia es el pico de potencia
%Para ver si se corresponde con el terremoto de Sumatra
%Vemos que el máximo se alcanza a bajas frecuencias
figure(3)
pspectrum(harp,"FrequencyLimits",[0 1])

%Se observa un pico de potencia en 0.05 Hz, una onda con esa frecuencia
%llega de Sumatra a Alaka en el tiempo que ocurrió el terremoto y que llegó
%La señal se corresponde con el terremoto de Sumatra


%Graficamos señal temporal
figure(4)
plot(harp.Time,harp.Signal)
title('Harp')
xlabel('tiempo (s)')
ylabel('Amplitud (unidades arbitrarias)')

%Ahora viendo los valores que toma el espectro (t es array de tiempos y p
%array de potencias)
[p,f] = pspectrum(harp);
%Mismo gráfico pero en decibelios (10*log10(p))
semilogx(f,db(p,"power"))
xlabel("Frecuencia (Hz)")
ylabel("Espectro de potencia (dB)")
legend("HARP")
