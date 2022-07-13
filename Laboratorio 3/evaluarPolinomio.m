function [resultado] = evaluarPolinomio(grado,coeficientes,num)
    resultado = 0;
    for i=1:grado
        resultado =  resultado + coeficientes(1,i+1)*(num^i);
    end
end