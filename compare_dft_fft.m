%Tabla comparativa de los algoritmos para la transformada discreta de
%Fourier

%Número de muestras
n = 100;

%Array con los posibles números de muestras
N = 1:1:100;

%FFT
y1 = N.*log2(N);

%DFT
y2 = N.^2;


%Gráficas funciones
figure(1);
plot(N,y1);
hold on
plot(N,y2);

%Tabla según el número de muestras
fprintf('N \t FFT \t\t\t\t DFT \t\t\t\t Diferencia\n');

%Bucle para ir imprimiendo cada valor (elemento del array) en la tabla
for i = 1 : n
    fprintf('%d \t %-.16f \t %-.16f \t %-.16f\n',i,y1(i),y2(i),y2(i)-y1(i));
end

fprintf('\n');
