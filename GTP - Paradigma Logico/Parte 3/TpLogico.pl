% Base de datos de localidades y costos
localidad('Córdoba Capital', 1500).
localidad('Carlos Paz', 1500).
localidad('Bialet Massé', 1000).
localidad('Valle Hermoso', 1200).
localidad('La Falda', 1000).
localidad('Huerta Grande', 1200).
localidad('La Cumbre', 1600).
localidad('Capilla del Monte', 0).

% Recorridos de las personas
recorrido(jorge, 'Córdoba Capital', 'La Falda').
recorrido(adriana, 'Valle Hermoso', 'La Cumbre').
recorrido(gabriela, 'Carlos Paz', 'Capilla del Monte').
recorrido(roberto, 'Bialet Massé', 'Huerta Grande').
recorrido(jose, 'Córdoba Capital', 'Capilla del Monte').

% Camino entre dos localidades en orden
camino(Desde, Hasta, [Desde|Resto]) :-
    localidad(Desde, _),
    localidad(Hasta, _),
    Desde \= Hasta,
    camino_aux(Desde, Hasta, Resto).

camino_aux(Desde, Hasta, [Siguiente|Resto]) :-
    localidad_siguiente(Desde, Siguiente),
    camino_aux(Siguiente, Hasta, Resto).

camino_aux(Hasta, Hasta, []) :- localidad(Hasta, _).

% Orden de localidades
localidad_siguiente('Córdoba Capital', 'Carlos Paz').
localidad_siguiente('Carlos Paz', 'Bialet Massé').
localidad_siguiente('Bialet Massé', 'Valle Hermoso').
localidad_siguiente('Valle Hermoso', 'La Falda').
localidad_siguiente('La Falda', 'Huerta Grande').
localidad_siguiente('Huerta Grande', 'La Cumbre').
localidad_siguiente('La Cumbre', 'Capilla del Monte').

% Obtener tramos desde una lista de localidades
tramos([_], []).
tramos([A,B|Resto], [[A,B]|Tramos]) :-
    tramos([B|Resto], Tramos).

% Calcular suma de costos por tramos divididos entre quienes los usan
sumar_costos([], _, 0).
sumar_costos([[A,B]|Resto], Caminos, Total) :-
    localidad(A, Costo),
    cuenta_uso([A,B], Caminos, N),
    sumar_costos(Resto, Caminos, Subtotal),
    Total is Subtotal + Costo // N.

% Cantidad de personas que usaron un tramo
cuenta_uso(_, [], 0).
cuenta_uso([A,B], [[_, Camino]|Resto], N) :-
    tramos(Camino, Tramos),
    cuenta_uso([A,B], Resto, N1),
    ( member([A,B], Tramos) -> N is N1 + 1 ; N = N1 ).

% Armar camino de cada persona
camino_personas([], []).
camino_personas([Persona|Resto], [[Persona, Camino]|Caminos]) :-
    recorrido(Persona, Desde, Hasta),
    camino(Desde, Hasta, Camino),
    camino_personas(Resto, Caminos).

% Agregar el costo correspondiente a cada persona
agregar_costos([], _, []).
agregar_costos([[Persona, Camino]|Resto], Caminos, [[Persona, Camino, Costo]|RestoConCosto]) :-
    tramos(Camino, Tramos),
    sumar_costos(Tramos, Caminos, Costo),
    agregar_costos(Resto, Caminos, RestoConCosto).

% Predicado principal
repartir_costos(Personas, Resultado) :-
    camino_personas(Personas, Caminos),
    agregar_costos(Caminos, Caminos, Resultado).