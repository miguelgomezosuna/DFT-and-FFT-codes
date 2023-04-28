%Aplicación de linealidad de la Transformada Discreta de Fourier

Fs = 1000;                %Frecuencia de muestreo
dn = 1/Fs;                %Diferencial de tiempo
N = 2^12;                 %Número de muestras
n = (0:N-1)*dn;            %Vector de tiempos
dw = (2 * pi) / (N*dn);   %Diferencial de frecuencias angulares
w = (0 : N - 1) * dw;     %Vector de frecuencias angulares

%Coeficientes de las subseñales
a1 = 0.5;
a2 = 0.9;
a3 = 0.7;

%Subseñales temporal (cada uno es array de N muestras)
x1 = a1*cos(250*n);     
x2 = a2*cos(500*n);        
x3 = a3*cos(750*n);

%Límite de la frecuencia para graficar
wc = 1000;

%Construimos matriz en la que cada fila es una subseñal (matriz 3*N)
%Para poder graficar con un bucle y no de uno en uno
x = [x1; x2; x3];

%Graficamos las subseñales
figure(1);
for i = 1:3
    subplot(3,1,i)
    plot(n(1:100),x(i,1:100)) %Vemos con 100 primeras muestras
    title(num2str(i) + "º subseñal temporal")
end

%FFT de las subseñales
X1 = my_fft(x1);
X2 = my_fft(x2);
X3 = my_fft(x3);

%Introducimos transformadas en matriz para tratarlas fácilmente
%Nuestra FFT devuelve vector columna, los transponemos para que sean las filas
X = [X1'; X2'; X3'];

%Graficamos las subseñales
figure(2);
for i = 1:3
    subplot(3,1,i)
    plot(w,abs(X(i,:))) %Vemos las magnitudes
    title(num2str(i) + "º subseñal en frecuencias")
    xlim([0 wc])
end

%Para la señal conjunta
xtotal = x1 + x2 + x3;
%Transformada
Xtotal = my_fft(xtotal);

figure(3)
plot(w,abs(Xtotal),'LineWidth',2)
xlabel('$\omega$','Interpreter','latex','FontSize',24)
ylabel('$X(\omega)$','Interpreter','latex','FontSize',24);
set(gca,'FontSize',24)
xlim([0 wc])