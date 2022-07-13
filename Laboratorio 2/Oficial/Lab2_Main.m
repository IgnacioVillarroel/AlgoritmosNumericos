%%%%%%%%%%%%%%%%%%%% LABORATORIO 2 - PEP 2 %%%%%%%%%%%%%%%%%%%%
% Alumno: Ignacio Villarroel 
% Profesor: Oscar Rojas
% Asignatura: Algoritmos Avanzados
% El programa obtendrá la interpolación de los Hospitalizados UCI por edad 
data = importfile("HospitalizadosUCIEtario.csv", [2, inf]);

hospitalizados = data(:,2:end);
hospitalizados = hospitalizados{:,:};
% Se ordenan los datos a un modo cómodo.

% Se toma el tramo de personas menores o iguales a 39 años.
hospitalizadosHasta39 = hospitalizados(1,:);

% Se realiza el suavizado de datos.
ajusteHospitalizados = movmean(hospitalizadosHasta39, 15);

% Se muestra el comparativo mediante un gráfico de los datos subidos
% contrapuestos a los datos ayustados (suavizados).
figure();
hold on
plot(hospitalizadosHasta39);
plot(ajusteHospitalizados);
title('Gráfico comparativo: Datos - Datos Suavizados');
legend({'No Suavizados', 'Suavizado'}, 'Location','northwest');
hold off

%Se obtiene el tamaño del arreglo como tal tanto en filas como en
%columnas.
[fila, columna] = size(hospitalizadosHasta39);

intervalo = 29;

[A, B] = makeArrayInter(intervalo, columna);

%%%%%%%%%%%%%%%%%%%% INTERPOLACIÓN LINEAR %%%%%%%%%%%%%%%%%%%%
interpolacionLinear = [];
interpolacion1 = interp1(A, ajusteHospitalizados(A), B,  "linear");
interpolacionLinear = vertcat(interpolacionLinear, interpolacion1);

figure
plot(A,ajusteHospitalizados(A),'o',B,interpolacion1,':.');

% Gráfico 
figure
hold on
plot(interpolacionLinear);
plot(ajusteHospitalizados(B));
title('Gráfico de Interpolación linear vs Datos Ajustados');
legend({'Interpolación Lineal', 'Datos Ajustados'});
hold off

%%%%%%%%%%%%%%%%%%%% INTERPOLACIÓN MAKIMA %%%%%%%%%%%%%%%%%%%%
interpolacionMakima = [];
interpolacion2 = interp1(A, ajusteHospitalizados(A), B, "makima");
interpolacionMakima = vertcat(interpolacionMakima, interpolacion2);

% Gráfico 
figure
hold on
plot(interpolacionMakima);
plot(ajusteHospitalizados(B));
title('Gráfico de Interpolación Makima vs Datos Ajustados');
legend({'Interpolación Makima', 'Datos Ajustados'});
hold off

figure
plot(A,ajusteHospitalizados(A),'o',B,interpolacion2,':.');

%%%%%%%%%%%%%%%%%%%% INTERPOLACIÓN CUBICA %%%%%%%%%%%%%%%%%%%%
interpolacionCubica = [];
interpolacion3 = interp1(A, ajusteHospitalizados(A), B, "cubic");
interpolacionCubica = vertcat(interpolacionCubica, interpolacion3);

% Gráfico 
figure
hold on
plot(interpolacionCubica);
plot(ajusteHospitalizados(B));
title('Gráfico de Interpolación Cubica vs Datos Ajustados');
legend({'Interpolación Cubica', 'Datos Ajustados'});
hold off

figure
plot(A,ajusteHospitalizados(A),'o',B,interpolacion3,':.');
% Se muestra un gráfico comparativo de las interpolaciones.
figure();
hold on
plot(interpolacionLinear');
plot(interpolacionMakima');
plot(interpolacionCubica');
title('Gráfico comparativo: Linear vs Makima vs Cubica');
legend({'Linear', 'Makima', 'Cubica'}, 'Location','northwest');
hold off

%%%%%%%%%%%%%%%%%%%% INTEGRACIÓN %%%%%%%%%%%%%%%%%%%%
% A partir de la integración de lasd técnicas dec interpolación, se
% comprueba la eficacia de las interpolaciones.
cantidadData = 0;
cantidadDataAjust = 0;
interpolacionIntegrada1 = 0;
interpolacionIntegrada2 = 0;
interpolacionIntegrada3 = 0;

% Se obtienen los datos numéricos.
interpolacionLinear = interpolacionLinear(~isnan(interpolacionLinear));
interpolacionMakima = interpolacionMakima(~isnan(interpolacionMakima));
interpolacionCubica = interpolacionCubica(~isnan(interpolacionCubica));

% Se ve la cantidad de persona usadas para la interpolación
cantidadData = cantidadData + ceil(trapz(hospitalizadosHasta39));
cantidadDataAjust = cantidadDataAjust + ceil(trapz(ajusteHospitalizados));

%Se calcula la cantidad de personas usadas en la interpolación
interpolacionIntegrada1 = interpolacionIntegrada1 + ceil(trapz(interpolacionLinear));
interpolacionIntegrada2 = interpolacionIntegrada2 + ceil(trapz(interpolacionMakima));
interpolacionIntegrada3 = interpolacionIntegrada3 + ceil(trapz(interpolacionCubica));

% Se obtiene la diferencia
diferenciaInterLineal = abs(cantidadDataAjust - interpolacionIntegrada1);
diferenciaInterMakima = abs(cantidadDataAjust - interpolacionIntegrada2);
diferenciaInterCubica = abs(cantidadDataAjust - interpolacionIntegrada3);

% Se obtiene la cantidad total de hospitalizados
sumatotal = sum(hospitalizadosHasta39);

% Se obtiene el porcentaje de error.
porcentajeErrorInter1 = (100 * diferenciaInterLineal)/sumatotal;
porcentajeErrorInter2 = (100 * diferenciaInterMakima)/sumatotal;
porcentajeErrorInter3 = (100 * diferenciaInterCubica)/sumatotal;