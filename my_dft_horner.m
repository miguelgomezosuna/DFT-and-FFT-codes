function X = my_dft_horner(x)
%Calculando transformada evaluando polinomios con regla de Horner
%De esta manera pasamos de tener que hacer un numero de operaciones que sigue O(N^2) a O(N)
%Menos complejo computacionalmente

%Número de puntos
N = length(x);

%Incializamos polinomio
q = zeros(N,1);

%Polinomio q(z), lo guardamos como array (cada elemento es un coeficiente)
for k = 0:N-1
    q(k+1) = x(k+1); %Tenemos en cuenta que arrays en Matlab empiezan en 1
end

%Pero queremos tener los coeficientes del polinomio en array
%Matlab tiene como convenio que los primeros elementos se correspondan con
%los que tienen una mayor potencia
%Invertimos orden de array y hacemos el transpuesto para polinomios en
%Matlab
q = flip(q');

w = exp(-1i*2*pi/N);
X = zeros(N,1);

%Transformada discreta de Fourier mediante regla de Horner
for j=0:N-1
    X(j+1) = regla_Horner(q,w^j);
end

end