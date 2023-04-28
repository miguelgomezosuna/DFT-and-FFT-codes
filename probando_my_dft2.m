%Primera señal
x1 = [1;2;0;-1];

%Solución con dft
X1 = my_dft(x1);
disp(X1);
X1_mat = fft(x1);
disp(X1_mat);

x2 = my_idft(X1);
disp(x2);

%Segunda señal
x2 = [1;2;0;-1;4;6;2];
X2_mat = fft(x2);
X2 = my_dft(x2);

disp(X2_mat);
disp(X2);


