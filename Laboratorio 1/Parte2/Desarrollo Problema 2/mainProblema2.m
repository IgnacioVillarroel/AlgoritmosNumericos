%############### PROBLEMA 2 ####################
% ALUMNO: Ignacio Villarroel E.
% DESCRIPCIÓN: Programa encargado de calcular los métodos solicitados para
% la resolución de matrices, las que son otorgadas, se empezará de la 
% mas pequeña a la mas grande.

clear
% Se aplican los métodos para las matrices, partiendo de las mas pequeña
% a las mas grande.


%MENU
user_choice = menu ('Seleccione Matriz:' , 'Matriz 289x289' , 'Matriz 1089x1089', 'Matriz 4225x4225')

switch (user_choice)
    case 1
        %############### Matriz 289x289 ################
        %Se carga matriz
        A289 = load('A289.dat');
        b289 = load('b289.dat');
        disp("*********** Resultados Matriz 289x289 ***********")
        % Se ve la tolerancia.
        tol1 = 0.00000001;
        n1 = 289;
        % Se aplican los cálculos por método para la matriz.

        % MÉTODO CHOLESKY
        disp("Tiempo Cholesky:")
        tic
        [iteracionesChol1, solucionChol1, errorChol1, operacionesChol1] = cholesky(A289, b289);
        tChol1 = toc
        
        % MÉTODO GAUSS-JACOBI
        disp("Tiempo Gauss-Jacobi:")
        tic
        [iteracionesGJ1, solucionesGJ1, errorGJ1, operacionesGJ1] = gaussJacobi(A289, b289, n1, tol1);
        tGJ1 = toc
        
        % MÉTODO GAUSS-SEIDEL
        disp("Tiempo Gauss-Seidel:")
        tic
        [iteracionesGS1, solucionesGS1, errorGS1, operacionesGS1] = gaussSeidel(A289, b289, n1, tol1);
        tGS1 = toc
    
        % MÉTODO LU
        disp("Tiempo LU:")
        tic
        [iteracionesLU1, solucionesLU1, errorLU1, operacionesLU1] = metodoLUDoolittle(A289, b289);
        tLU1 = toc

        % MÉTODO QR
        disp("Tiempo QR:")
        tic
        [iteracionesQR1, solucionQR1, errorQR1, operacionesQR1] = metodoQR(A289, b289);
        tQR1 = toc
        
        % MÉTODO LSQR
        disp("Tiempo LSQR:")
        tic
        [solucionLSQR1, errorLSQR1,operacionesLSQR1] = lsqr(A289,b289, tol1);
        tLSQR1 = toc

        % MÉTODO LSQR DISPERSO
        disp("Tiempo LSQR-Disperso:")
        tic
        [operacionesLSQRD1,errorLSQRD1,solucionLSQRD] = lsqrDisperso(A289,b289,tol1);
        tLSQRD1 = toc
        
        %Se grafica el error para cada método
        
        vectorErrores289 = [errorGJ1 errorGS1 errorChol1 errorQR1 errorLU1 errorLSQR1 errorLSQRD1];
        vectorNombre = categorical({'Cholesky','Gauss-Jacobi','Gauss-Seidel','QR','LU','LSQR','LSQRD'});
        figure
        hold on
        bar(vectorNombre,vectorErrores289)
        title('Error de cada método para matriz 289 x 289')
        ylabel('Error') 
        xlabel('Nombre del método')
        hold off
        
        %Se grafica el numero de iteraciones (costo operacional)
        vectorOperaciones289 = [operacionesGJ1,operacionesGS1, operacionesChol1, operacionesQR1,operacionesLU1, operacionesLSQR1, operacionesLSQRD1];
        vectorTiempos289 = categorical({'Cholesky','Gauss-Jacobi','Gauss-Seidel','QR','LU','LSQR','LSQRD'});
        figure
        hold on
        bar(vectorTiempos289,vectorOperaciones289)
        title('Costo operacional de cada método para matriz 289 x 289')
        ylabel('Número de iteraciones') 
        xlabel('Nombre del método')
        hold off

    case 2
        %############### Matriz 1089x1089 ################
        
        % Se carga la matriz.
        A1089 = load('A1089.dat');
        b1089 = load('b1089.dat');
        disp("*********** Resultados Matriz 1089x1089 ***********")
        tol2 = 0.00000001;
        n2 = 1089;
        
        % Se aplican los cálculos por método para la matriz.
        
        % MÉTODO CHOLESKY
        disp("Tiempo Cholesky:")
        tic
        [iteracionesChol2, solucionChol2, errorChol2, operacionesChol2] = cholesky(A1089, b1089);
        tChol2 = toc
        
        % MÉTODO GAUSS-JACOBI
        disp("Tiempo Gauss-Jacobi:")
        tic
        [iteracionesGJ2, solucionesGJ2, errorGJ2, operacionesGJ2] = gaussJacobi(A1089, b1089, n2, tol2);
        tGJ2 = toc
        
        % MÉTODO GAUSS-SEIDEL
        disp("Tiempo Gauss-Seidel:")
        tic
        [iteracionesGS2, solucionesGS2, errorGS2, operacionesGS2] = gaussSeidel(A1089, b1089, n2, tol2);
        tGS2 = toc
        
        % MÉTODO LU
        disp("Tiempo LU:")
        tic
        [iteracionesLU2, solucionesLU2, errorLU2, operacionesLU2] = metodoLUDoolittle(A1089, b1089);
        tLU2 = toc
        
        % MÉTODO QR
        disp("Tiempo QR:")
        tic
        [iteracionesQR2, solucionQR2, errorQR2, operacionesQR2] = metodoQR(A1089, b1089);
        tQR2 = toc
        
        % MÉTODO LSQR
        disp("Tiempo LSQR:")
        tic
        [solucionLSQR2, errorLSQR2, operacionesLSQR2] = lsqr(A1089,b1089, tol2);
        tLSQR2 = toc
        
        % MÉTODO LSQR DISPERSO
        disp("Tiempo LSQR-Disperso:")
        tic
        [operacionesLSQRD2,errorLSQRD2,solucionLSQRD2] = lsqrDisperso(A1089,b1089,tol2);
        tLSQRD2 = toc
        
        % Gráfico de error
        vectorErrores1089 = [errorGJ2 errorGS2 errorChol2 errorQR2 errorLU2 errorLSQR2 errorLSQRD2];
        vectorNombre = categorical({'Cholesky','Gauss-Jacobi','Gauss-Seidel','QR','LU','LSQR','LSQRD'});
        figure
        hold on
        bar(vectorNombre,vectorErrores1089)
        title('Error de cada método para matriz 1089 x 1089')
        ylabel('Error') 
        xlabel('Nombre del método')
        hold off
        
        vectorOperaciones1089 = [operacionesGJ2,operacionesGS2, operacionesChol2, operacionesQR2,operacionesLU2, operacionesLSQR2, operacionesLSQRD2];
        vectorTiempos1089 = categorical({'Cholesky','Gauss-Jacobi','Gauss-Seidel','QR','LU','LSQR','LSQRD'});
        figure
        hold on
        bar(vectorTiempos1089,vectorOperaciones1089)
        title('Costo operacional por método para matriz 1089 x 1089')
        ylabel('Número de iteraciones') 
        xlabel('Nombre del método')
        hold off
    case 3
        %############### Matriz 4225x4225 ################
        
        % Se llama a la matriz.
        A4225 = load('A4225.dat');
        b4225 = load('b4225.dat');
        disp("*********** Resultados Matriz 4225x4225 ***********")
        tol3 = 0.00000001;
        n3 = 4225;
        
        %MÉTODO CHOLESKY
        disp("Tiempo Cholesky:")
        tic
        [iteracionesChol3, solucionChol3, errorChol3, operacionesChol3] = cholesky(A4225, b4225);
        tChol3 = toc
        
        % MÉTODO GAUSS-JACOBI
        disp("Tiempo Gauss-Jacobi:")
        tic
        [iteracionesGJ3, solucionesGJ3, errorGJ3, operacionesGJ3] = gaussJacobi(A4225, b4225, n3, tol3);
        tGJ3 = toc
        
        % MÉTODO GAUSS-SEIDEL
        disp("Tiempo Gauss-Seidel:")
        tic
        [iteracionesGS3, solucionesGS3, errorGS3, operacionesGS3] = gaussSeidel(A4225, b4225, n3, tol3);
        tGS3 = toc
        
        % MÉTODO LU
        disp("Tiempo LU:")
        tic
        [iteracionesLU3, solucionesLU3, errorLU3, operacionesLU3] = metodoLUDoolittle(A4225, b4225);
        tLU3 = toc
        
        % MÉTODO QR
        disp("Tiempo QR:")
        tic
        [iteracionesQR3, solucionQR3, errorQR3, operacionesQR3] = metodoQR(A4225, b4225);
        tQR3 = toc
        
        % MÉTODO LSQR
        disp("Tiempo LSQR:")
        tic
        [solucionLSQR3, errorLSQR3, operacionesLSQR3] = lsqr(A4225,b4225, tol3);
        tLSQR3 = toc
        
        % MÉTODO LSQR DISPERSO
        disp("Tiempo LSQR-Disperso:")
        tic
        [operacionesLSQRD3,errorLSQRD3,solucionLSQRD3] = lsqrDisperso(A4225,b4225,tol3);
        tLSQRD3 = toc
        
        %Se grafica el error de cada método.
        vectorErrores4225 = [errorGJ3 errorGS3 errorChol3 errorQR3 errorLU3 errorLSQR3 errorLSQRD3];
        vectorNombre = categorical({'Cholesky','Gauss-Jacobi','Gauss-Seidel','QR','LU','LSQR','LSQRD'});
        figure
        hold on
        bar(vectorNombre,vectorErrores4225)
        title('Error por método matriz 4225x4225')
        ylabel('Error') 
        xlabel('Nombre del método')
        hold off
        
        %Grafico de numero de iteraciones
        vectorOperaciones4225 = [operacionesGJ3,operacionesGS3, operacionesChol3, operacionesQR3,operacionesLU3, operacionesLSQR3, operacionesLSQRD3];
        vectorTiempos4225 = categorical({'Cholesky','Gauss-Jacobi','Gauss-Seidel','QR','LU','LSQR','LSQRD'});
        figure
        hold on
        bar(vectorTiempos4225,vectorOperaciones4225)
        title('Costo operacional por método para matriz 4225 x 4225')
        ylabel('Número de iteraciones') 
        xlabel('Nombre del método')
        hold off
        
    otherwise
        warndlg('Fin de la operacion')
        beep
        beep
end

