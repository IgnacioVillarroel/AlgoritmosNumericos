function [iteraciones,errores,raices,error, operaciones] =  secante(f,x0,x1,tolerancia)
    x=x1;
    xan = x0;
    aux = 0;
    iters = 0;
    iteraciones = [];
    errores = [];
    raices = [];
    operaciones = 0;
    error = 1;
    iteracionesMax = 0;
    while ( error > tolerancia)
        aux = x;
        x = x - (f(x)*(x-xan))/(f(x) - f(xan));
        % operaciones: resta, f(x), multi,resta, div, f(x), resta, f(xan)
        operaciones = operaciones + 8;
        xan = aux;
        iters = iters + 1;
        iteraciones = [iteraciones,iters];
        %se guarda el error
        error = norm(f(x));
        errores = [errores,error];
        raices = [raices,x];
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