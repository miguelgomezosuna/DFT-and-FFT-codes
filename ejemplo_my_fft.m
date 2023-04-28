%Ejemplo con senal temporal como combinacion de senales sinusoidales

%Espectro temporal, con N muestras (potencia de dos) en (t1-t0) segundos
N = 2^14;
t0 = 0;
t1 = 10;
t = linspace(t0,t1,N);

%Diferencial de tiempo
dt = (t1-t0)/N;

%Diferencial de Frecuencia Angular
dw = (2 * pi) / (N*dt);

%Vector de Frecuencias Angulares
w = (0 : N - 1) * dw;

%Frecuencias para cada subseñal (retorno de la función fft)
w1=500;
w2=1000;
w3=2000;

%Señal temporal
x = 2*sin(w1.*t) + sin(w2.*t) + 4*sin(w3.*t);

%Nuestra función DFT, medimos su tiempo de ejecución
fprintf("\n------------FFT------------\n");
tic
X1 = my_fft(x);
toc

%Con FFT, comprobamos que lo hace más rápido
fprintf("\n------------DFT------------\n");
tic
X2 = my_dft(x'); %Para función necesitamos vector columna
toc

%Gráfica de la magnitud de la transformada
figure(2)
plot(w,abs(X1),'LineWidth',2)
title('Señal transformada con FFT')
xlabel('$\omega$','Interpreter','latex','FontSize',24)
ylabel('$X(\omega)$','Interpreter','latex','FontSize',24);
set(gca,'FontSize',24)
wc = pi / dt; % frecuencia angular crítica
xlim([0 wc])