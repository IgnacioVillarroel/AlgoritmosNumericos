%%%%%%%%%%%%%%%%%%%% LABORATORIO 3 - PEP 3 %%%%%%%%%%%%%%%%%%%%
% Alumno: Ignacio Villarroel 
% Profesor: Oscar Rojas
% Asignatura: Algoritmos Avanzados

% Descripción: El programa por medio de la aplicación de 2 generadores y la división
% del set de datos en 3 partes y con un algoritmo ABC se optimizará
% obteniendo los errores.

%Se cargan los datos utilizados.
datos = importdata("HospitalizadosUCIEtario.csv");
Hospitalizados=datos.data;

%Se obtiene la cantidad de datos 
HospitalizadosHasta39=Hospitalizados(1,:);

%Sacar la cantidad de datos
tamano=size(HospitalizadosHasta39);

%Se realiza un ajuste para los datos.
ajusteHospitalizados=movmean(HospitalizadosHasta39,31);

figure
plot(ajusteHospitalizados);
%Se aproximan a valores de números entero (int)
ajusteHospitalizados =floor(ajusteHospitalizados );

col=100;
fil=19;

%Se establecen los límites tanto superiores como inferiores.
% Límite para la curva N°1
limInf1=0;
limSup1=266;
primerTramo = ajusteHospitalizados(limInf1+1:limSup1+1);

% Límite para la curva N°2
limInf2=267;
limSup2=533;
segundoTramo = ajusteHospitalizados(limInf2:limSup2);

% Límite para la curva N°3
limInf3=534;
limSup3=799;
tercerTramo = ajusteHospitalizados(limInf3:limSup3);

%%%%%%%%%%%%%%%%% APLICACIÓN GENERADOR ITERATIVO %%%%%%%%%%%%%%%%%%
%Se crea un generador iterativo que obtiene números de manera aleatoria
%dentro de un rango.

%%%%%%%%%%%%%%%%% TRAMO N°1 %%%%%%%%%%%%%%%%%
tic;
%Acá hago el index
index=zeros(col,1);
for m=1 :col
    index(m,1)=m;
end
%Saco las cotas iniciales de randoms
inf=-10000*ones(fil,1);
sup=10000*ones(fil,1);

%Saco los grados iniciales para la iteración
gradoMin=3;
gradoMax=18;

    %%% GENERADOR 1%%%
    %Se crea el generador a partir de las iteaciones para una matriz de
    %datos.
for p=1 :100
    grados = randi([gradoMin,gradoMax],col,1);
    %Saco los primeros coeficientes
    matrizCoeficientes= zeros(col,fil);
    for i=1 :fil
        % Se obtiene una matriz de coeficientes con número aleatorios
        matrizCoeficientes(:,i) = randi([inf(i,1),sup(i,1)],col,1);
    end
    if p>1
        for i=1 :porcentaje
            %Se obtiene los mejores coeficientes.
            matrizCoeficientes(i,:)=mejor(i,:);
        end
    end
    
%Se procede a calcular el error cuadrático medio.
    errorCuadraticoMedio1=zeros(col,1);
    integral=zeros(col,1);
    polinomio=zeros(col,limSup1);
    for j=1 :col
        k=1;
        for i=limInf1 :limSup1
            polinomio(j,k)=evaluarPolinomio(grados(j,1),matrizCoeficientes(j,:),i);
            k=k+1;
        end 
        FilaPolinomio=polinomio(j,:);
        errorCuadraticoMedio1(j,1)=mse(primerTramo,FilaPolinomio);
        integral(j,1)=abs(sum(primerTramo)-sum(FilaPolinomio));
        
    end
    selector = [errorCuadraticoMedio1 index];
    selector = sortrows(selector,1);
    
    porcentaje=100*0.1;
    mejor=zeros(porcentaje,fil);
    %Eleccion de los limites nuevos
    gradosElegidos= zeros(porcentaje,1);
    %eleccionesRandom=randi([limInf1+1,limSup1+1],porcentaje,1);
    for j=1 :fil
        colElegida= zeros(porcentaje,1);
        for i=1 :porcentaje
            if i<=porcentaje
                colElegida(i,1)=matrizCoeficientes(selector(i,2),j);
                mejor(i,:)=matrizCoeficientes(selector(i,2),:);
            end
            if i>porcentaje
               colElegida(i,1)=matrizCoeficientes(col-i,j);
            end
        end
        gradosElegidos(j,1)=grados(selector(j,2),1);
        inf(j,1)=min(colElegida);
        sup(j,1)=max(colElegida);
    end
    gradoMin=min(gradosElegidos);
    gradoMax=max(gradosElegidos);
   
end
figure
plot(1:267,polinomio(selector(1,2),1:267));

%%%%%%%%%%%%%%%%% TRAMO N°2 %%%%%%%%%%%%%%%%%

%Acá hago el index
index=zeros(col,1);
for m=1 :col
    index(m,1)=m;
end
%Saco las cotas iniciales de randoms
inf=-10000*ones(fil,1);
sup=10000*ones(fil,1);

%Saco los grados iniciales para la iteración
gradoMin=3;
gradoMax=18;

    %%% GENERADOR 1 %%%
    %Se crea el generador a partir de las iteaciones para una matriz de
    %datos.
for p=1 :100
    grados = randi([gradoMin,gradoMax],col,1);
    %Se vuelve a resetear la matriz.
    matrizCoeficientes= zeros(col,fil);
    for i=1 :fil
        matrizCoeficientes(:,i) = randi([inf(i,1),sup(i,1)],col,1);
    end
    if p>1
        for i=1 :porcentaje
            matrizCoeficientes(i,:)=mejor(i,:);
        end
    end
    
    %Se procede a calcular el error cuadrático medio.
    errorCuadraticoMedio2=zeros(col,1);
    integral=zeros(col,1);
    polinomio=zeros(col,limSup1);
    for j=1 :col
        k=1;
        for i=limInf1 :limSup1
            polinomio(j,k)=evaluarPolinomio(grados(j,1),matrizCoeficientes(j,:),i);
            k=k+1;
        end 
        FilaPolinomio=polinomio(j,:);
        errorCuadraticoMedio2(j,1)=mse(segundoTramo,FilaPolinomio);
        integral(j,1)=abs(sum(segundoTramo)-sum(FilaPolinomio));
        
    end
    selector = [errorCuadraticoMedio2 index];
    selector = sortrows(selector,1);
    porcentaje=100*0.1;
    mejor=zeros(porcentaje,fil);
    gradosElegidos= zeros(porcentaje,1);
    % Aplicación Fit para optimizar.
    for j=1 :fil
        colElegida= zeros(porcentaje,1);
        for i=1 :porcentaje
            if i<=porcentaje
                colElegida(i,1)=matrizCoeficientes(selector(i,2),j);
                mejor(i,:)=matrizCoeficientes(selector(i,2),:);
            end
            if i>porcentaje
               colElegida(i,1)=matrizCoeficientes(col-i,j);
            end
        end
        gradosElegidos(j,1)=grados(selector(j,2),1);
        inf(j,1)=min(colElegida);
        sup(j,1)=max(colElegida);
    end
    gradoMin=min(gradosElegidos);
    gradoMax=max(gradosElegidos);
    
end

%Se grafica el error
figure
plot(1:267,polinomio(selector(1,2),1:267));


%%%%%%%%%%%%%%%%% TRAMO N°3 %%%%%%%%%%%%%%%%%

%Acá hago el index
index=zeros(col,1);
for m=1 :col
    index(m,1)=m;
end
%Saco las cotas iniciales de randoms
inf=-10000*ones(fil,1);
sup=10000*ones(fil,1);

%Saco los grados iniciales para la iteración
gradoMin=3;
gradoMax=18;

for p=1 :100
    grados = randi([gradoMin,gradoMax],col,1);
    %Saco los primeros coeficientes
    matrizCoeficientes= zeros(col,fil);
    for i=1 :fil
        matrizCoeficientes(:,i) = randi([inf(i,1),sup(i,1)],col ,1);
    end
    %Saco los segundos coeficientes
%     matrizCoeficientes2= zeros(col,fil);
%     for i=1:fil 
%         matrizCoeficientes2(:,i) = ran3(col,inf(i,1),sup(i,1));
%     end
    
    
    %Se evalua el polinomio y su error
    errorCuadraticoMedio3=zeros(col,1);
    integral=zeros(col,1);
    polinomio=zeros(col,limSup1);
    for j=1 :col
        k=1;
        for i=limInf1 :limSup1
            polinomio(j,k)=evaluarPolinomio(grados(j,1),matrizCoeficientes(j,:),i);
            k=k+1;
        end 
        FilaPolinomio=polinomio(j,:);
        errorCuadraticoMedio3(j,1)=mse(tercerTramo,FilaPolinomio);
        integral(j,1)=abs(sum(tercerTramo)-sum(FilaPolinomio));
        
    end
    %Se ve el selector para escoger los mejores errores.
    selector = [errorCuadraticoMedio3 index];
    selector = sortrows(selector,1);
    
    porcentaje=100*0.1;
    %Eleccion de los limites nuevos
    gradosElegidos= zeros(porcentaje,1);
    for j=1 :fil
        colElegida= zeros(porcentaje,1);
        for i=1 :porcentaje
                colElegida(i,1)=matrizCoeficientes(selector(i,2),j);
        end
        gradosElegidos(j,1)=grados(selector(j,2),1);
        inf(j,1)=min(colElegida);
        sup(j,1)=max(colElegida);
    end
    gradoMin=min(gradosElegidos);
    gradoMax=max(gradosElegidos);
end

%Se grafica lo obtenido en el tercer tramo.
figure
plot(1:265,polinomio(selector(1,2),1:265));

tM = toc;

%%%%%%%%%%%%%%%%% APLICACIÓN GENERADOR LINEAL %%%%%%%%%%%%%%%%%%
%Se crea un generador a partir de lo visto en clase que a partir de una
%congruencia lineal se obtendrán valores aleatorios.

%Se aplica una semilla inicial que irá cambiando a medida que se itere el
%generador, además de un módulo controlador y otras variables para la
%aplicación del generador de congruencia lineral.
seed = 1000*limSup1;
modulo = 2^29-1;
amplificador = 8^4;
aumento = 10000;
cantidadNumeros= 100;
minimo1 = limInf1;
maximo1 = limSup1;

for p=1 :100
    grados = randi([gradoMin,gradoMax],col,1);
    [arreglosGenerador, seed] = generadorCongruencialLineal(seed,modulo,aumento,amplificador,cantidadNumeros,minimo1,maximo1);
    errorCuadraticoMedio1=zeros(col,1);
    integral=zeros(col,1);
    polinomio=zeros(col,limSup1);
    for j=1 :col
        k=1;
        for i=limInf1 :limSup1
            %%%%%%%%%%% ERROR %%%%%%%%%%%
            polinomio(j,k)=evaluarPolinomio(grados(j,1),arreglosGenerador(j,:),i);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            k=k+1;
        end 
        FilaPolinomio=polinomio(j,:);
        errorCuadraticoMedio1(j,1)=mse(primerTramo,FilaPolinomio);
        integral(j,1)=abs(sum(primerTramo)-sum(FilaPolinomio));
        
    end
    selector = [errorCuadraticoMedio1 index];
    selector = sortrows(selector,1);
    porcentaje=100*0.1;
    mejor=zeros(porcentaje,fil);
    %Eleccion de los limites nuevos
    gradosElegidos= zeros(porcentaje,1);
    %eleccionesRandom=randi([limInf1+1,limSup1+1],porcentaje,1);
    for j=1 :fil
        colElegida= zeros(porcentaje,1);
        for i=1 :porcentaje
            if i<=porcentaje
                colElegida(i,1)=arreglosGenerador(selector(i,2),j);
                mejor(i,:)=arreglosGenerador(selector(i,2),:);
            end
            if i>porcentaje
               colElegida(i,1)=arreglosGenerador(col-i,j);
            end
        end
        gradosElegidos(j,1)=grados(selector(j,2),1);
        inf(j,1)=min(colElegida);
        sup(j,1)=max(colElegida);
    end
    gradoMin=min(gradosElegidos);
    gradoMax=max(gradosElegidos);
end