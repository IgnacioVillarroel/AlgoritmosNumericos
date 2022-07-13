% Laboratorio N°1 Algoritmos Numericos
% Jennifer Velozo
% 20433980-5

%############################# PARTE 1 ####################################
%############## PARA f1 ##############
%Se define una tolerancia
tol = 0.00000000000001;
%Se define la función y su derivada
f1 = @(x) x^2 - 42;
df1 = @(x) 2*x;
%Puntos arbitrarios
a = 1;
b = 100;

%Error a priori
%Considerando un número de iteraciones = 56
N = 56;
prioriBi1 = 2^(-N+1)*(b-a);
%Método de bisección
tic
[iteracionesBi1, erroresBi1, raicesBi1,errorBi1, operacionesBi1] = biseccion (f1,a,b,tol);
tBi1 = toc;
tiempoBi1 = tBi1;

%Error a priori
%Considerando un número de 
N = 350;
prioriRF1 = 2^(-N+1)*(b-a);
%Método Regula Falsi
tic
[iteracionesRF1, erroresRF1, raicesRF1,errorRF1, operacionesRF1] = regulaFalsi (a,b,tol,f1);
tRF1 = toc;
tiempoRF1 = tRF1;


%Error a priori
%Considerando un r cercano a la raíz 
r = 5;
dff1 = @(x)x;
prioriSec1 = 1/2 * (dff1(r)/df1(r)) * 3.399204281606671e-06 * 5.992006890664925e-11;
%Método Secante
tic
[iteracionesSec1,erroresSec1,raicesSec1,errorSec1, operacionesSec1] =  secante(f1,a,b,tol);
tSec1 = toc;
tiempoSec1 = tSec1;

%Error a priori
prioriNR1 = 1/2 * (dff1(r)/df1(r)) * 3.789371234574901e-07^2;
%Método Newton-Raphson
tic
[iteracionesNR1,erroresNR1,raicesNR1,errorNR1, operacionesNR1] =  newtonRaphson(f1,df1,a,tol);
tNR1 = toc;
tiempoNR1 = tNR1;

disp("-------- Costos temporales y espaciales de cada método para f1 --------")
Metodo = {'Bisección';'Secante';'Regula Falsi';'Newton Raphson'};
CostosTemporales = [tiempoBi1; tiempoSec1; tiempoRF1; tiempoNR1];
CostosEspaciales = [operacionesBi1; operacionesSec1; operacionesRF1; operacionesNR1];
Error = [errorBi1; errorSec1; errorRF1; errorNR1];
T1 = table(Metodo, CostosTemporales, CostosEspaciales, Error)


%############## PARA f2 ##############
%Se define la tolerancia
tol = 0.00000000000001;
%Se define la función y su derivada
f2 = @(x) x^3 - 4*(x^2) + 5*sin(2*pi*x);
df2 = @(x) 3*(x^2) - 8*x + 10*pi*cos(2*pi*x);
%Puntos arbitrarios
a = 1;
b = 100;

%Error a priori
%Considerando un número de iteraciones = 55
N = 55;
prioriBi2 = 2^(-N+1)*(b-a);
%Método de bisección
tic
[iteracionesBi2, erroresBi2, raicesBi2,errorBi2, operacionesBi2] = biseccion (f2,a,b,tol);
tBi2 = toc;
tiempoBi2 = tBi2;

%Error a priori
%Considerando un número de 
N = 13860;
prioriRF2 = 2^(-N+1)*(b-a);
%Método Regula Falsi
tic
[iteracionesRF2, erroresRF2, raicesRF2,errorRF2,operacionesRF2] = regulaFalsi (a,b,tol,f2);
tRF2 = toc;
tiempoRF2 = tRF2;

%Error a priori
%Considerando un r cercano a la raíz 
r = 1.13;
dff2 = @(x) 6*x - 8- 20*pi*sin(2*pi*x);
prioriSec2 = 1/2 * (dff2(r)/df2(r)) * 1.635776643027498e-07 * 5.058620189402063e-12;
%Método Secante
tic
[iteracionesSec2,erroresSec2,raicesSec2,errorSec2, operacionesSec2] =  secante(f2,a,b,tol);
tSec2 = toc;
tiempoSec2 = tSec2;

prioriNR2 = 1/2 * (dff2(r)/df2(r)) * 2.471970628192821e-09^2;
%Método Newton-Raphson
tic
[iteracionesNR2,erroresNR2,raicesNR2,errorNR2, operacionesNR2] =  newtonRaphson(f2,df2,a,tol);
tNR2 = toc;
tiempoNR2 = tNR2;

disp("-------- Costos temporales y espaciales de cada método para f2 --------")
Metodo = {'Bisección';'Secante';'Regula Falsi';'Newton Raphson'};
CostosTemporales = [tiempoBi2; tiempoSec2; tiempoRF2; tiempoNR2];
CostosEspaciales = [operacionesBi2; operacionesSec2; operacionesRF2; operacionesNR2];
Error = [errorBi2; errorSec2; errorRF2; errorNR2];
T2 = table(Metodo, CostosTemporales, CostosEspaciales, Error)


%############## PARA F ##############
%se define el sistema de ecuaciones
syms f(x1, x2, x3);
ec1 = x1^2 + x2 - 37;
ec2 = x1 - x2^2 - 5;
ec3 = x1 + x2 + x3 - 3;
F = [ec1 ; ec2 ; ec3];
tol = 0.00000000000001;
%Se obtienen las raíces reales de la ecuación, con WolframAlpha
valorReal = [6.0000; 1.0000; -4.0000];
tic
[iteracionesNM, erroresNM, erroresNM2, erroresNM3, raicesNM, valorExp, errorNM,errorNM2, errorNM3, operacionesNM] = newtonMulti(F, tol, valorReal);
tNM = toc;
% errorNormal = valorReal - valorExp;
% errorAbs = abs(valorReal - valorExp);
% errorRel = valorReal - valorExp/valorReal;
% 
% errorNormalN = norm(errorNormal);
% errorAbsN = norm(errorAbs);
% errorRelN = norm(errorRel);
tiempoNM = tNM;
%Se grafican los 3 tipos de errores
figure
hold on
plot(erroresNM');
plot(erroresNM2');
plot(erroresNM3');
title('Errores sistema F(x)');
xlabel('Iteración');
legend({'Error Normal', 'Error Absoluto','Error Relativo'}, 'Location','northeast');
hold off
