function [iteraciones,errores,raices,error,operaciones] =  biseccion(f,a,b,tolerancia)
    m = 0;
    iters = 0;
    iteraciones = [];
    errores = [];
    raices = [];
    error = 1;
    iteracionesMax = 0;
    operaciones = 0;
    while ( error > tolerancia)
        m = a + (b-a)/2;
        %3 operaciones en el cálculo de m
        operaciones = operaciones + 3;
        if f(m) == 0
            %1 operación por evaluar f(m)
            operaciones = operaciones + 1;
            a = m;
            b = m;
        end
        if sign(f(a)) == sign(f(m))
            %2 operaciones por evaluar f(a) y f(m)
            operaciones = operaciones + 2;
            a = m;
        end
        if sign(f(b)) == sign(f(m))
            %2 operaciones por evaluar f(b) y f(m)
            operaciones = operaciones + 2;
            b = m;
        end
        iters = iters + 1;
        iteraciones = [iteraciones,iters];
        %se guarda el error
        error = norm(f(m));
        errores = [errores,error];
        raices = [raices,m];
        %criterio de parada
        iteracionesMax = iteracionesMax + 1;
        if iteracionesMax > 100
            %se obtiene el valor de los últimos 100 errores, y si la
            %varianza entre ellos es 0, indica que es preciso
            if var(errores(1,end-99:end)) == 0
                break;
            end
        end
    end
end