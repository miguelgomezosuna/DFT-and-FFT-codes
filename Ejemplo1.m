%Comparación de tiempos para trasformada discreta de Fourier de distintas formas

%Número de puntos
N = 2^14;

%Frecuencia de Muestreo 
%Separación de muestras en el tiempo
Fs = 10;

%Paso Temporal
dn = 1/Fs;

%Tiempos de la Muestra
n = (0 : N - 1) * dn;

%Diferencial de Frecuencia Angular
dw = (2 * pi) / (N*dn);

%Vector de Frecuencias Angulares
w = (0 : N - 1) * dw;

%Señal
%Se evalúa cada valor temporal y quedaran N muestras de la señal
%f es vector fila, debe ser columna para DFT
x = cos(n) + 0.5 .* cos(3*n) + 0.7 * cos(4*n) + 0.2 * cos(6*n);

%DFT (Transformada Discreta de Fourier)
fprintf("------------DFT------------\n");
%Calculamos señal en dominio de frecuencias matricialmente
tic
X1 = my_dft(x);
toc 
%Medimos tiempo en hacer la transformada (muy costoso computacionalmente)

%Regla de Horner para evaluación de polinomios, O(N)
fprintf("\n------------Horner------------\n");
tic
X2 = my_dft_horner(x);
toc

%FFT (Transformada rápida de Fourier)
%Regla de Horner para evaluación de polinomios, O(N)
fprintf("\n------------FFT------------\n");
tic
X3 = my_fft(x);
toc

%IDFT (Transformada Discreta Inversa de Fourier)
fprintf("\n-------------IDFT------------\n");
tic
x1 = my_idft(x);
toc

%IFFT (Transformada Rápida Inversa de Fourier)
fprintf("\n-------------IFFT------------\n");
tic
x2 = my_ifft(x);
toc

%Representamos transformada
figure(1)
plot(w,abs(X3),'LineWidth',2)
xlabel('$\omega$','Interpreter','latex','FontSize',24)
ylabel('$X(\omega)$','Interpreter','latex','FontSize',24);
set(gca,'FontSize',24)
wc = pi / dn; %Límite de la frecuencia
xlim([0 wc])
