%Comprobacion de nuestra funcion FFT

%Senal temporal
x = [3; 5; -1; 6; -4; 5; 2; 1];

%Calculamos con funcion que hemos programado
X = my_fft(x);
disp(X);

%Comprobamos con funcion de Matlab
X_mat = fft(x);
disp(X_mat);