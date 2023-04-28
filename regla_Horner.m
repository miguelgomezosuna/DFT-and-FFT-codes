function sol = regla_Horner(P,alfa)
%Evaluación de un polinomio mediante la regla de Horner
%Mucho más eficiente que sustituir directamente: O(n) mejor que = O(n^2)

%Polinomio ha sido pasado como vector: P = [n n-1 n-2 ... 1 0]
tam = length(P); %Grado del polinomio = tam -1 (tam = n+1)

%P(x) = (x-alfa)*Q(x) + b-1, con P(alfa) = b-1 (OBJETIVO)
%Array para resultado, polinomio de grado n-1 y b-1
R = zeros(tam,1);
R(1) = P(1);

for k=2:tam %Bucle hacia atrás (para calcular b-1 necesitamos anteriores)
    R(k) = alfa*R(k-1) + P(k); 
end

sol = R(tam); %P(alfa) = b-1


end