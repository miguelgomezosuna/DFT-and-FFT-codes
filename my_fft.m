function X = my_fft(x)
%Función que implementa el algoritmo FFT para construir la DFT de una señal
%Algoritmo que consiste en dividir la señal en dos partes y llamarse a sí
%misma (condición: entrada deber ser de tamaño 2^N)
%Cuando llegue a un sólo punto, la tranformada es ese punto

%Comprobamos si la señal x tiene un número de elementos como potencia de 2
%Debemos tener n elementos: n=2^m
N = length(x);
m = log2(N);
if m ~= floor(m) %Si es un entero es porque n es potencia de 2
    error('El número de elementos de la señal debe ser una potencia de 2');
end

%Calcula la DFT utilizando el algoritmo FFT
if N == 1
    %Caso base del algoritmo recursivo
    %Como k=0:N-1 => k=0:0 => k=0 -> El término de la exponencial es 1
    X = x; 

else

    %Inicializamos señal en frecuencias
    X = zeros(N,1);
    %Inicializamos vector de raíces N-ésimas
    w = zeros((N/2),1);

    %Dividimos las señal en dos mitades y calculamos la DFT de cada una
    %Tenemos en cuenta que en Matlab, los arrays empiezan en 1
    x_even = x(1:2:N-1); %Elementos pares: x(0),x(2),...,x(N-2)
    x_odd = x(2:2:N); %Elementos pares: x(1),x(3),...,x(N-1)
    X_even = my_fft(x_even);
    X_odd = my_fft(x_odd);

    %Raíces N-ésimas
    w_val = exp(-2i*pi/N); 
    %Construiremos vector de las raíces N-ésimas: (1,w,w^2,...,w^((N/2)-1)))
    %(Vector w)^k, con k=0,1,2,..,(N/2)-1

    for k=1:N/2 %Desplazamos índice para facilitar tratamiento de arrays en Matlab
        w(k) = w_val^(k-1);
        %Primera mitad de la solución
        X(k) = X_even(k) + w(k).*X_odd(k);
        %Segunda mitad
        X(k + (N/2)) = X_even(k) - w(k).*X_odd(k);
    
    end
   
end


end
