% Datos del mapa: tramo(Localidad1, Localidad2, Costo)
tramo('Córdoba Capital', 'Carlos Paz', 1000).
tramo('Carlos Paz', 'Bialet Massé', 1200).
tramo('Bialet Massé', 'Valle Hermoso', 800).
tramo('Valle Hermoso', 'La Falda', 1000).
tramo('La Falda', 'Huerta Grande', 900).
tramo('Huerta Grande', 'La Cumbre', 700).
tramo('La Cumbre', 'Capilla del Monte', 1000).

% Datos de recorridos: recorrido(Persona, LocalidadInicio, LocalidadFin)
recorrido(jorge, 'Córdoba Capital', 'La Falda').
recorrido(adriana, 'Valle Hermoso', 'La Cumbre').
recorrido(gabriela, 'Carlos Paz', 'Capilla del Monte').
recorrido(roberto, 'Bialet Massé', 'Huerta Grande').
recorrido(jose, 'Córdoba Capital', 'Capilla del Monte').

% Camino completo entre todas las localidades (ordenadas)
camino(['Córdoba Capital', 'Carlos Paz', 'Bialet Massé', 'Valle Hermoso',
        'La Falda', 'Huerta Grande', 'La Cumbre', 'Capilla del Monte']).

% Sublista desde Origen hasta Destino (sin predicados predefinidos)
subcamino([X|_], X, X, [X]).
subcamino([X|Xs], X, Y, [X|Resto]) :- subcamino(Xs, XsH, Y, Resto), XsH = Y.
subcamino([_|Xs], Origen, Destino, R) :- subcamino(Xs, Origen, Destino, R).

% Obtener tramos a partir de lista de localidades
tramos([_], []).
tramos([A,B|Resto], [[A,B]|R]) :- tramos([B|Resto], R).

% Verifica si un elemento está en una lista
pertenece(X, [X|_]).
pertenece(X, [_|R]) :- pertenece(X, R).

% Cuenta cuántas personas usan un tramo
contar_uso_tramo(_, [], 0).
contar_uso_tramo([A,B], [[_, Tramos, _]|R], Total) :-
    contar_uso_tramo([A,B], R, Parcial),
    (contiene_tramo([A,B], Tramos) -> Total is Parcial + 1 ; Total is Parcial).

% Verifica si un tramo está en una lista de tramos
contiene_tramo([A,B], [[A,B]|_]).
contiene_tramo([A,B], [_|R]) :- contiene_tramo([A,B], R).

% Suma parcial de tramos divididos por cantidad de usuarios
suma_costos([], _, 0).
suma_costos([[A,B]|R], Personas, Total) :-
    suma_costos(R, Personas, SubTotal),
    tramo(A, B, Costo),
    contar_uso_tramo([A,B], Personas, Cant),
    CostoPorPersona is Costo // Cant,
    Total is SubTotal + CostoPorPersona.

% Construye la lista de datos por persona
procesar_personas([], _, []).
procesar_personas([P|R], PersonasDatos, [[P, Camino, Costo]|Resto]) :-
    recorrido(P, O, D),
    camino(C),
    subcamino(C, O, D, Camino),
    tramos(Camino, Tramos),
    procesar_personas(R, PersonasDatos, Resto),
    suma_costos(Tramos, [[P, Tramos, _]|Resto], Costo).

% Predicado principal
repartir_costos(Personas, Resultado) :- procesar_personas(Personas, Resultado, Resultado).
