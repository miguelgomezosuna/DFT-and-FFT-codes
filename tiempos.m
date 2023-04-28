%Para probar el orden de operaciones vamos a representar el número de
%operaciones respecto del número de muestras para casos reales

%Objetivo: Llegar a #ops = NlogN

%Vamos a realizar muchas operaciones -> Vemos cuanto tarda en total
%Dividimos el tiempo total entre el número de operaciones -> Obtenemos
%tiempo medio por operación (por ejemplo, para una división)
format long

a = 1;
b = 2;
Nops = 1000000;

%Hacemos media de tiempos para unas 100 veces, porque dependiendo de
%ocupación de CPU, se tardará más o menos
iter = 100;
%Guardamos en vector de tiempos
t_total = zeros(1,iter);
t_op = zeros(1,iter);

for j = 1:iter

    tic
    for k = 1:Nops
        a/b;
    end
    toc

    %Tiempo total
    t_total(j) = toc;
    %Tiempo medio para una operción
    t_op(j) = t_total(j)/Nops;
    %fprintf('El tiempo medio para una operación es de %-.16f segundos.\n', t_op(j));

end

%Finalmente hallamos la media de los tiempos medios (para dar mayor
%fiabilidad)
t_mean_op = mean(t_op);
disp(t_mean_op);


%Ahora usamos fft para varios números de muestras (cambiando N) y vemos su
%tiempo de ejecución

%Array de muestras
%Número de veces para el que comprobamos las muestras
max_potencia = 26;
N = zeros(1,max_potencia);

%Vector de tiempos totales para cada fft, con un N dado
t = zeros(1,max_potencia);


for k = 1:max_potencia
    N(k) = 2^k;

    %Parámetros para señal de ejemplo

    %Frecuencia de Muestreo 
    %Separación de muestras en el tiempo
    Fs = 10;

    %Paso Temporal
    dn = 1/Fs;

    %Tiempos de la Muestra
    n = (0 : N(k) - 1) * dn;

    %Diferencial de Frecuencia Angular
    dw = (2 * pi) / (N(k)*dn);

    %Vector de Frecuencias Angulares
    w = (0 : N(k) - 1) * dw;

    %Señal
    %Se evalúa cada valor temporal y quedaran N muestras de la señal
    %f es vector fila, debe ser columna para DFT
    x = cos(n) + 0.5 .* cos(3*n) + 0.7 * cos(4*n) + 0.2 * cos(6*n);

    tic 
    X = fft(x);
    t(k) = toc;

end

%Número de operaciones (tiempo total/tiempo total por operación)
ops = t./t_mean_op;
disp(ops);

%Pintamos el número de operaciones frente al número de muestras
%Número de operaciones teóricas
Nvals = 0:2^max_potencia; %Para pintar gráfica
ops_teoricas = Nvals.*log2(Nvals);
plot(Nvals,ops_teoricas);
xlabel('N');
ylabel('#ops')
hold on
plot(N,ops,'*');

%Hay que tener en cuenta que la primera vez que ejecutemos el script puede
%que nos alejemos del número de operaciones reales por diferencia de tiempos de ejecución
%(por carga de memoria a caché). Es recomendable comprobarlo para ejecución
%a partir de segunda vez.

%Esto también ocurre para el tiempo de ejecución para los primeros números
%de muestras que tomamos (N = 2; N = 4; N = 8,...), por tanto obervamos
%algunas oscilaciones al principio de la gráfica. Pero para N grandes vemos
%que se parece mucho a NlogN

