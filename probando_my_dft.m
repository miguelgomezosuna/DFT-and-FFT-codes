%Definir una señal discreta de ejemplo
x = [4; 1; 5; 3; 0; 6; 3; 8];
x = x';

%Calcular la DFT de la señal utilizando my_dft
X = my_dft(x);
disp(X);
%Comparamos con resultado de Matlab
X_mat = fft(x);
disp(X_mat);

% Graficar la magnitud de la DFT
figure;
stem(abs(X));
xlabel('Frecuencia');
ylabel('Magnitud');
