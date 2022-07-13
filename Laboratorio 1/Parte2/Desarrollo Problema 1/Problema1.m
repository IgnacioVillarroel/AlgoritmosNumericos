%############### PROBLEMA 1 ####################
% Laboratorio N°1 de algoritmos numéricos.
% ALUMNO: Ignacio Villarroel E.
% DESCRIPCIÓN: Por medio de la utilización del método de Newton para
% varias variables, se procede a calcular el sistema de ecuaciones.
% Se llama a la función
function [soluciones,errores] = NewtonVariasVariables
soluciones = [];
errores = [];
x0=[1;1;1];
% Se tiene el sistema de ecuaciones que se va a utilizar.
f = @(x,y,z) [x^2 + y - 37; 
                x - y^2 - 5; 
                x + y + z - 3];
% Se tienen las funciones con el jacobiano.
jf= @(x,y) [2*x,1,1;          %Derivadas
            1,-2*y, 0;
            1,1,1];

% Se ven las iteraciones
iteraciones_tope = 30;
% Se coloca la tolerancia.
tolerancia = 0.0000000001;
iter=1;
error = norm(f(x0(1),x0(2),x0(3)),2);
% Se ve el ciclo para calcular la iteraciones 
while error>=tolerancia && iter<iteraciones_tope
    fx0 = f(x0(1),x0(2),x0(3));
    fpx0= jf(x0(1),x0(2));
    x1 = x0-inv(fpx0)*fx0;
    fx1=f(x1(1),x1(2),x1(3));
    error = norm((fx1),2);
    % Se ven las iteraciones del método aplicado con la tolerancia dada.
    fprintf('Iter %2d raiz x=(%14.9f, %14.9f, %14.9f) f(x)=(%14.9f, %14.9f, %14.9f)\n',iter,x1(1),x1(2),x1(3),fx1(1),fx1(2),fx1(3));
    soluciones = [soluciones,x1];    %Se ven las soluciones de las derivadas.
    errores= [errores,error];
    if iter>iteraciones_tope
        return;
    end
    x0=x1;
    iter=iter+1;
    
end
figure;
plot(errores);
soluciones = soluciones';
errores = errores';
end