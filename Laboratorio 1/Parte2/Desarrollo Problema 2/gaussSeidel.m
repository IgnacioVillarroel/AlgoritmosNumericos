function[iteraciones, soluciones, error, operaciones] = gaussSeidel(A, b, n, tol) 
    iteraciones = 0;
    %se define el número de operaciones aritméticas
    operaciones = 0;
    %Se inicializa la matriz de soluciones como una matriz de ceros
    x = zeros(1, n);
    %Se obtiene la matriz traspuesta
    x = x';
    %Valor inicial del error
    error = 1;
    %Se itera de acuerdo a la tolerancia
    while error > tol
        %Se guarda el valor de x en un auxiliar
        aux = x;
        for i = 1:n
            suma = 0;
            %Se realiza la primera sumatoria de la fórmula de Gauss-Seidel
            for j = 1:i-1
                suma = suma + A(i, j)*x(j);
                %Operaciones: 
                %una multiplicación
                %una suma
                operaciones = operaciones + 2;
            end
            %Se realiza la segunda sumatoria de la fórmula de Gauss-Seidel
            for j = i+1:n
                suma = suma + A(i, j)*aux(j);
                %Operaciones: una multiplicación
                %una suma
                operaciones = operaciones + 2;
            end
            %Se realiza lo restante de la fórmula del método
            x(i) = (1/A(i, i))*(b(i) - suma);
            %Operaciones: 
            %una división, una resta, una multiplicación
            operaciones = operaciones + 3;
        end
        iteraciones = iteraciones + 1;
        error = norm(aux-x);
    end
    %Se devuelven la solución y el error
    soluciones = x;
end