function [iteraciones, solucion, errorSol, operaciones] = cholesky(A, b) 
    iteraciones = 0;
    %se define el número de operaciones aritméticas
    operaciones = 0;
    %Se obtienen las dimensiones de A.
    [filas columnas] = size(A);
    if filas ~= columnas
        error('La matriz no es cuadrada.');
    end
    %Se inicializa la matriz L.
    L = zeros(filas, columnas);
    %Se implementa el algoritmo del método.
    for j = 1:filas
        iteraciones = iteraciones + 1;
        suma1 = 0;
        %Se realizan las sumas correspondiente al caso L(j, j).
        for k = 1:j-1
            iteraciones = iteraciones + 1;
            suma1 = suma1 + (L(j, k))^2;
            %Operaciones: 
            %1 suma y 1 multi
            operaciones = operaciones + 2;
        end
        L(j, j) = sqrt(A(j, j) - suma1);
        %Operaciones: 1 resta
        operaciones = operaciones + 1;
        for i = j+1:filas
            iteraciones = iteraciones + 1;
            %Se realizan las sumas correspondiente al caso j < n.
            suma2 = 0;
            for k = 1:j-1
                iteraciones = iteraciones + 1;
                suma2 = suma2 + L(i, k)*L(j, k);
                %Operaciones: 
                %1 suma y 1 multi
                operaciones = operaciones + 2;
            end
            L(i,j) = (A(i,j)-suma2)/L(j,j);
            %Operaciones: 
            %1 resta y 1 div
            operaciones = operaciones + 2;
        end
    end
    %Luego de obtener la matriz L, se procede a resolver el sistema.
    nuevoA = L*L';
    solucion = inv(nuevoA)*b;
    errorAux = abs(nuevoA*solucion - b);
    errorSol = norm(errorAux);
end