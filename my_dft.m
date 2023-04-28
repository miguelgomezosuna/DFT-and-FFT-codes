function X = my_dft(x)
%Función para calcular la DFT de una señal discreta x
%Definimos la raíz N-ésima de la unidad: W = exp(1i*2*pi/N);
%Vector W es: (1,W,W^2,W^3,...,W^(N-1))' 
%Podemos obtener señal de frecuencias con el producto escalar

%Vemos que el vector de W para cada muestra se puede ver enteramente como
%una matriz (la matriz de Fourier)

%Al igual que antes cada coeficiente de la señal en frecuencias vendrá dado
%por el producto escalar del vector W y x
%Llamando F a la matriz de Foruier: X = F*x


%Comrprobamos que el usuario ha pasado señal de entrada como vector columna
n = size(x);

%Nos pasan vector columna
if(n(1) > 1)
    N = n(1); %Número de muestras
else %Nos pasan vector fila, transponemos
    x = x';
    N = n(2); %Número de muestras
end

%Matriz de Fourier
F = DFT_matrix(N);

%Relación matricial
X = F*x;

end












