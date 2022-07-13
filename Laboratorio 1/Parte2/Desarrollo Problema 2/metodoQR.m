function [iteraciones, solucion, errorSol, operaciones] = metodoQR(A, b) 
    iteraciones = 0;
    operaciones = 0;
    %Para obtener las matrices Q y R se usará el método de Gram-Schmidt.
    [n, m] = size(A);
    if m < n
        error('Las dimensiones de la matriz A son incorrectas');
    end
    Q = A;
    R = zeros(n);
    %Algoritmo de Gram-Schmidt:
    for k = 1:n
        iteraciones = iteraciones + 1;
        for i = 1:k-1
            iteraciones = iteraciones + 1;
            R(i, k) = Q(:, i)'*Q(:, k);
            %Operaciones: una multiplicación 
            operaciones = operaciones + 1;
            Q(:, k) = Q(:, k) - Q(:, i)*R(i, k);
            %Operaciones: una multiplicación y una resta
            operaciones = operaciones + 2;
        end
        R(k, k) = norm(Q(:, k));
        %Operaciones: norma
        operaciones = operaciones + 1;
        Q(:, k) = Q(:, k)/R(k, k);
        %Operaciones: una división
        operaciones = operaciones + 1;
    end
    %Ya teniendo Q y R, se calcularán las soluciones del sistema.
    %La solución se calculará de la forma Rx = Q'b
    %Se hará y = Q'b para efecto de los cálculos.
    y = Q'*b;
    x = inv(R)*y;
    %Se guarda la solución y el error.
    solucion = x;
    errorAux = abs(A*x - b);
    errorSol = norm(errorAux);
end