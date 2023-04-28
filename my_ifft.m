function x = my_ifft(X)
%Función IFFT que recupera la señal temporal, con diferencia de factor 
%de normalización (1/N), a partir de señal enfrecuencias con misma idea
%del algoritmo IFFT.

%Comprobamos si la señal X tiene un número de elementos como potencia de 2
%Debemos tener N elementos, tal que: N=2^m
N = length(X);
m = log2(N);
if m ~= floor(m) %Si es un entero es porque N es potencia de 2
    error('El número de elementos de la señal debe ser una potencia de 2');
end

if N == 1
    x = X; %Caso base
else
    %Inicializamos arrays
    x = zeros(N,1);
    w = zeros((N/2),1);

    %Dividimos en dos subseñales
    X_even = X(1:2:N-1); %Elementos pares
    X_odd = X(2:2:N); %Elementos impares
    %Llamada recursiva
    x_even = my_ifft(X_even);
    x_odd = my_ifft(X_odd);
    
    %Conjugado de las raíces N-ésimas
    w_conj = exp(1i*2*pi/N);

    for k=1:N/2 %Desplazamos índice para facilitar tratamiento de arrays en Matlab
        w(k) = w_conj^(k-1);
        %Primera mitad de la solución
        x(k) = x_even(k) + w(k).*x_odd(k);
        %Segunda mitad
        x(k + (N/2)) = x_even(k) - w(k).*x_odd(k);
    
    end

end

end