function [iteraciones, errores,errores2, errores3, raices, raiz, error, error2, error3, operaciones] = newtonMulti(F, tolerancia, real)
    syms x1 x2 x3
    iters = 0;
    iteraciones = [];
    errores = [];
    errores2 = [];
    errores3 = [];
    raices = [];
    error = 1;
    error2 = 1;
    error3 = 1;
    operaciones = 0;
    X1 = [1;1;1];
    X2 = [0;0;0];
    X3 = X1;
    evF = 1;
    while (evF > tolerancia)
        Jac = jacobian(F); %se obtiene la matriz jacobiana de F
        operaciones = operaciones + 1;
        evJ = subs(Jac,{x1; x2; x3},X1); %se evalúa X1 en el Jacobiano
        operaciones = operaciones + 2;
        evF = subs(F,{x1; x2; x3},X1); %se evalúa X1 en el sistema de ecuaciones no lineales F
        operaciones = operaciones + 2;
        %El H es el Jacobiano a la menos 1 de las funciones y se evalúan
        %los puntos. Esto multiplicado por la matriz de funciones
        H = -inv(evJ)*evF; 
        operaciones = operaciones + 2;
        %nueva solución
        X2 = X1 + H;
        operaciones = operaciones + 1;
        %x3 toma el valor de x1
        X3 = X1;
        %x1 pasa a ser la nueva solución
        X1 = X2;
        iters = iters + 1;
        %se obtiene el error absoluto de X1
        evF = double(subs(F, {x1; x2; x3}, X1));
        operaciones = operaciones + 2;
        evF = sqrt(sum((evF).^2));
        
        %se obtiene el error absoluto de X3
        evF2 = double(subs(F, {x1; x2; x3}, X3));
        evF2 = sqrt(sum((evF2).^2));
       
        operaciones = operaciones + 2;
        raiz = double(X3');
        
        raices = [raices;raiz];
        iteraciones = [iteraciones, iters];
        
        
        %error normal de X1
        error = evF;
        errores = [errores, error];
        
        %error absoluto
        error2 = abs(evF - evF2);
        errores2 = [errores2, error2];
        
        %error relativo
        error3 = abs(evF - evF2)/abs(evF2);
        errores3 = [errores3, error3];     
    end 
    
end
