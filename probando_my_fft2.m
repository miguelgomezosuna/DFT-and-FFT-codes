%Señal temporal de ejemplo
x = [1;2;3;4];

%Calculamos transformada con función que implementa el algoritmo FFT
X = my_fft(x');
disp(X);

%Comparamos con solución de Matlab
X_mat = fft(x);
disp(X_mat);