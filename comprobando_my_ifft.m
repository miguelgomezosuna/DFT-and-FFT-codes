%Comprobación de nuestra función IFFT

%Señal temporal
x = [3; 5; -1; 6; -4; 5; 2; 1];

N =length(x);

%Calculamos con función que hemos programado
X = my_fft(x);
disp(X);

%Comprobamos función inversa
x1 = my_ifft(X);
%Multiplicamos por factor de normalización
x1 = (1/N)*x1;
disp(x1);

%Frecuencia de Muestreo
Fs = 1;

%Paso Temporal
dt = 1/Fs;

%Tiempos de la Muestra
t = (0 : N - 1) * dt;

figure(1)
plot(t,abs(x1),'LineWidth',2)
title('Señal temporal recuperada con IFFT')
xlabel('$t$','Interpreter','latex','FontSize',24)
ylabel('$x(t)$','Interpreter','latex','FontSize',24);
set(gca,'FontSize',24)
wc = N-1;
xlim([0 wc])