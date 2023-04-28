% Definir una señal discreta de ejemplo
x = [1 2 3 4 5 6 7 8];

% Calcular la DFT de la señal utilizando my_fft
X = my_fft(x);

% Graficar la magnitud de la DFT
figure;
stem(abs(X));
xlabel('Frecuencia');
ylabel('Magnitud');
title('Magnitud de la DFT de la señal discreta de ejemplo');
