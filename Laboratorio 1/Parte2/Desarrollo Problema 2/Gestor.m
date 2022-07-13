%############### PROBLEMA 2 ####################
% ALUMNO: Ignacio Villarroel E.
% DESCRIPCIÓN: Programa GESTOR que se encarga de mostrar las 
% mejores opciones para el desarrollo de matrices.

user_choice = menu ('Seleccione Matriz:' , 'Matriz 289x289' , 'Matriz 1089x1089', 'Matriz 4225x4225')
    switch (user_choice)

        %############### Matriz 289x289 ################
    case 1
        %Se carga matriz
        A289 = load('A289.dat');
        b289 = load('b289.dat');
        disp("Matriz seleccionada 289x289")
        % Se ve la tolerancia.
        tol1 = 0.00000001;
        n1 = 289;

        user_choice = menu ('Seleccione su prioridad' , 'Eficiencia (tiempo)' , 'Eficacia (error)', 'Costo Operacional (iteraciones)')
        switch(user_choice)
        case 1
             % MÉTODO LSQR
            disp("Tiempo LSQR:")
            tic
            [solucionLSQR1, errorLSQR1,operacionesLSQR1] = lsqr(A289,b289, tol1);
            tLSQR1 = toc
        
        case 2
            % MÉTODO LU
            disp("Tiempo LU:")
            tic
            [iteracionesLU1, solucionesLU1, errorLU1, operacionesLU1] = metodoLUDoolittle(A289, b289);
            tLU1 = toc
        case 3
            % MÉTODO QR
            disp("Tiempo QR:")
            tic
            [iteracionesQR1, solucionQR1, errorQR1, operacionesQR1] = metodoQR(A289, b289);
            tQR1 = toc
        end
           

              %############### Matriz 1089x1089 ################
      case 2
          % Se carga la matriz.
          A1089 = load('A1089.dat');
          b1089 = load('b1089.dat');
          disp("Matriz seleccionada 1089x1089")
          tol2 = 0.00000001;
          n2 = 1089;
          user_choice = menu ('Seleccione su prioridad' , 'Eficiencia (tiempo)' , 'Eficacia (error)' , 'Costo Operacional (iteraciones)')
          switch(user_choice)
              case 1
                  % MÉTODO LSQR DISPERSO
                  disp("Tiempo LSQR-Disperso:")
                  tic
                  [operacionesLSQRD2,errorLSQRD2,solucionLSQRD2] = lsqrDisperso(A1089,b1089,tol2);
                  tLSQRD2 = toc
              case 2
                  % MÉTODO LU
                  disp("Tiempo LU:")
                  tic
                  [iteracionesLU2, solucionesLU2, errorLU2, operacionesLU2] = metodoLUDoolittle(A1089, b1089);
                  tLU2 = toc
              case 3
                  % MÉTODO QR
                  disp("Tiempo QR:")
                  tic
                  [iteracionesQR2, solucionQR2, errorQR2, operacionesQR2] = metodoQR(A1089, b1089);
                  tQR2 = toc
          end
                %############### Matriz 4225x4225 ################
        case 3
            A4225 = load('A4225.dat');
            b4225 = load('b4225.dat');
            disp("Matriz seleccionada 4225x4225")
            tol3 = 0.00000001;
            n3 = 4225;
            user_choice = menu ('Seleccione su prioridad' , 'Eficiencia (tiempo)' , 'Eficacia (error)', 'Costo Operacional (iteraciones)')
            switch(user_choice)
                case 1
                    % MÉTODO LSQR DISPERSO
                    disp("Tiempo LSQR-Disperso:")
                    tic
                    [operacionesLSQRD3,errorLSQRD3,solucionLSQRD3] = lsqrDisperso(A4225,b4225,tol3);
                    tLSQRD3 = toc;
                case 2
                    % MÉTODO LU
                    disp("Tiempo LU:")
                    tic
                    [iteracionesLU3, solucionesLU3, errorLU3, operacionesLU3] = metodoLUDoolittle(A4225, b4225);
                    tLU3 = toc
                case 3
                    % MÉTODO QR
                    disp("Tiempo QR:")
                    tic
                    [iteracionesQR3, solucionQR3, errorQR3, operacionesQR3] = metodoQR(A4225, b4225);
                    tQR3 = toc
            end
    end