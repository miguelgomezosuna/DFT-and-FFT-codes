%Comparación de varios senores que captaron mismo seísmo (de Sumatra) en Alaska

%Importacion de señales
Ts = readmatrix("seismicstation_ts.csv");
harp = readtimetable("harp.csv","SampleRate",1/Ts(1));
pax = readtimetable("pax.csv","SampleRate",1/Ts(2));
wanc = readtimetable("wanc.csv","SampleRate",1/Ts(3));

%Remuestreo y normalizacion (para la comparación de las señales)
wanc = timetable(harp.Time,resample(wanc.Signal,1,2),'VariableNames',"Signal");
harp = normalize(harp);
pax = normalize(pax);
wanc = normalize(wanc);

%Alineamiento de señales
harp.Properties.StartTime = seconds(finddelay(harp.Signal,wanc.Signal)*Ts(1));
pax.Properties.StartTime = seconds(finddelay(pax.Signal,wanc.Signal)*Ts(2));

%Todas las señales en una tabla
quakes = synchronize(harp,pax,wanc);
quakes.Properties.VariableNames = ["HARP" "PAX" "WANC"];
%Forma rápida de graficar todas las señales de una
figure(1)
stackedplot(quakes)

%Cogemos sólo región de interés (ROI), donde hay muestras (alineadas)
roi = timerange(seconds(2800),seconds(3500));
quakes = quakes(roi,:);

[p,f] = pspectrum(quakes);
%Mismo gráfico pero en decibelios (10*log10(p))
figure(2)
semilogx(f,db(p,"power"))
xlabel("Frecuencia (Hz)")
ylabel("Espectro de potencia (dB)")
legend("HARP","PAX","WANC")

%Vemos que la señal Wanc tiene fuertes componentes de alta frecuencia, esto
%se puede deber a los terremotos locales que se produjeron por la zona a
%raíz del fuerte terremoto en Sumatra

%Filtro paso bajo a Wanc, dejamos pasar frecuencias menores a 0.1 Hz
%Para poder observar sólo las frecuencias dadas por el terremoto de Sumatra
figure(3)
lowpass(quakes(:,"WANC"),0.1)

%Guardamos valores y aumentamos la pendiente del filtro paso bajo para no
%dejar pasar nada de altas frecuencias
lowWANC = lowpass(quakes(:,"WANC"),0.1,"Steepness",0.95);
quakes.WANC = lowWANC;

figure(4)
stackedplot(quakes)
%Ahora vemos que las señales temporal son prácticamente idénticas y que,
%por tanto, se tratan de señales provocadas por el mismo seísmo