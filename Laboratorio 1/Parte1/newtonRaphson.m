function [iteraciones,errores,raices,error, operaciones] =  newtonRaphson(f,df,x0,tolerancia)
    x=x0;
    iters = 0;
    iteraciones = [];
    errores = [];
    raices = [];
    error = 1;
    iteracionesMax = 0;
    operaciones = 0;
    while ( error > tolerancia)
        x = x - f(x)/df(x);
        %se tienen 4 operaciones: 1 resta,1 división, f(x) y df(x)
        operaciones = operaciones + 4;
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
