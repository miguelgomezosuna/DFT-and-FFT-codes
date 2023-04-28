function x = my_idft(X)
%Para obtener la señal temporal a partir de la señal en frecuencias
%Aplicamos la relacion matricial demostrada: x = F^(−1)*X

%Comprobamos que el usuario ha pasado señal de entrada como vector columna
n = size(X);
%Nos pasan vector columna
if(n(1) > 1)
    N = n(1); %Número de muestras
else %Nos pasan vector fila, transponemos
    X = X';
    N = n(2); %Número de muestras
end

%Matriz inversa de Fourier
%Se calcula mediante la relación: i_F = (1/N)*Fconj
%Forma mucho más rápida de calcularla para N grandes
i_F = iDFT_matrix(N);

%Relación matricial (sistema de ecuaciones lineales)
x = i_F*X; 

end
