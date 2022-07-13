%Generador de congruencia lineal.
%Creador de números aleatorios, los cuales siguen una secuencia.
function [array,semilla] = generadorCongruencialLineal(semilla,modulo,aumento,amplificador,cantidadNumeros,minimo,maximo)
    %Se inicializa el arreglo
    array = [];
    for i=1:cantidadNumeros
        valor = (semilla*amplificador)+aumento;
        nRandom = mod(valor,modulo);
        semilla = nRandom;
        numGenerado = minimo + (maximo-minimo)*(nRandom/(modulo-1));
        %Se guarda el número en el arreglo de datos
        array = [array,numGenerado];
    end
    array = array';
end