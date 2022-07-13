function[iteraciones, errores, raices, error, operaciones] = regulaFalsi(a, b, tolerancia, f)
    c = a;
    iters = 0;
    iteraciones = [];
    errores = [];
    raices = [];
    error = 1;
    iteracionesMax = 0;
    operaciones = 0;
    while error > tolerancia 
        c = b - f(b)* (b-a)/(f(b) - f(a));
        %se tienen 8 operaciones: resta, f(b), multi, resta, div, f(b), resta, f(a) 
        operaciones = operaciones + 8;
        if f(c) == 0
            %1 operación por f(c)
            operaciones = operaciones + 1;
            a = c;
            b = c;
        end
        if sign( f(a) ) == sign( f(c))
            %2 operaciones por f(a) y f(c)
            operaciones = operaciones + 2;
            a = c;
        end
        if sign(f(b)) == sign(f(c))
            %2 operaciones por los f(b) y f(c)
            operaciones = operaciones + 2;
            b = c;
        end
        iters = iters +1;
        iteraciones = [iteraciones, iters];
        %se guarda el error
        error = norm(f(c));
        errores = [errores, error];
        raices = [raices, c];
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
