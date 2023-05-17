%Queremos encontrar frecuencia de señal original
%Tenemos señal original con ruido
%Usamos FFT

%Creamos una señal con un ruido, amplitud y frecuencia aleatorios
%Amplitud entre 1 y 5
A = randi([1 5]);   

%Frecuencia de señal sin ruido
f = 60;            

%Frecuencia de muestreo
Fs = 500;      

%Periodo de muestreo
dt = 1/Fs; 

%Usamos 512 puntos para muestrear
L = 512;    

%Vector de tiempos
t = (0:L-1)*dt;      

%Señal con ruido
s = A*cos(2*pi*f*t) + randn(size(t));   

figure; 
plot(t,s)
title([num2str(f), ' Hz signal with amplitude = ', num2str(A)])
xlabel('Time (s)')
ylabel('Amplitude (A.U.)')


%Vector de frecuencias correspondientes a magnitud fft
freq_half = Fs*(0:(L/2))/L;

%Módulo de la FFT
S_half = abs(fft(s));
S_half = S_half(1:L/2 +1);

%Nos quedamos sólo con la mitad de las frecuencias, debido a simetría del espectro
figure;
plot(freq_half,S_half)
xlabel("Frecuencias");
ylabel("Módulo de la FFT");

%Encontramos un pico en 60 Hz, frecuencia original de la señal sin ruido
%A decibelios
S_half_db = 10*log10(S_half);
%Graficamos
figure;
plot(freq_half,S_half_db);
xlabel("Frecuencia (Hz)");
ylabel("Densidad espectral de potencia (dB)");

%Nos interesa encontrar la frecuencia asociada al máximo módulo de la potencia -> Será la frecuencia f de la señal sin ruido
[~,idx] = max(S_half_db); %Índice del máximo
fftFrequency = freq_half(idx); %Buscamos el valor de la frecuencia en el array de frecuencias

%Vemos valor aproximado de la frecuencia de la señal original
disp(fftFrequency);

%El máximo obtenido no es exactamente la frecuencia de la señal sin ruido
e1 = abs(f - fftFrequency);
%Error en la obtención de frecuencia
disp(e1);

%Para disminuir el error de la frecuencia obtenida con la FFT, podemos añadir más puntos con zero-padding
%Introduciremos un número de ceros a la señal
%A mayor número de ceros añadidos, disminuiremos el error con la frecuencia de la señal sin ruido
n = 2^14;

%Hacemos FFT añadiendo los ceros
%Vamos a cambiar el nombre de las variables, para no sobreescribir las anteriores
S_half1 = abs(fft(s,n));

freq_half1 = Fs*(0:(n/2))/n;

S_half1 = S_half1(1:n/2+1);

S_half_db1 = 10*log10(S_half1);

figure;
plot(freq_half1,S_half_db1);
xlabel("Frecuencia (Hz)");
ylabel("Densidad espectral de potencia (dB)");

[~,idx1] = max(S_half_db1); 
fftFrequency1 = freq_half1(idx1); 

%Vemos nueva aproximación de la frecuencia original
disp(fftFrequency1);
e2 = abs(f - fftFrequency1);
disp(e2);