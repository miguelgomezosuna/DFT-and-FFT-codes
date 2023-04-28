%Definimos un polinomio cualquiera
%Usamos P1(x) = 3 + x
%Como N=2, evaluará 1 y -1
P1 = [3 1];

%Vamos a evaluar 4 puntos (las raíces cuartas de la unidad)
Q1 = my_fft(P1);
disp(Q1);

%Usamos P2(x) = 5 + 3x + 2x^2 + 1x^3
%Como N=4, evaluará 1,-i,-1,i
P2 = [5 3 2 1];
Q2 = my_fft(P2);
disp(Q2);

