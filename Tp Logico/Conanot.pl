% localidad(Nro, Nombre, CostoHastaSiguiente)
localidad(1, 'Cordoba Capital', 1500).
localidad(2, 'Carlos Paz', 1500).
localidad(3, 'Bialet Masse', 1000).
localidad(4, 'Valle Hermoso', 1200).
localidad(5, 'La Falda', 1000).
localidad(6, 'Huerta Grande', 1200).
localidad(7, 'La Cumbre', 1600).
localidad(8, 'Capilla del Monte', 0).

% persona(Nombre, LocalidadInicio, LocalidadFin)
persona(jorge, 'Cordoba Capital', 'La Falda').
persona(adriana, 'Valle Hermoso', 'La Cumbre').
persona(gabriela, 'Carlos Paz', 'Capilla del Monte').
persona(roberto, 'Bialet Masse', 'Huerta Grande').
persona(jose, 'Cordoba Capital', 'Capilla del Monte').

% camino_persona(Persona, Camino)
camino_persona(Persona, Camino) :-   
    persona(Persona, Inicio, Fin),   % Dado un nombre de persona, busca su origen y destino en persona/3
    camino(Inicio, Fin, Camino), !.  % llama a camino/3 para generar el camino completo que hizo esa persona

% camino(Inicio, Fin, Camino)
camino(Inicio, Fin, Camino) :-
    localidad(N1, Inicio, _),   % Busca el número de localidad de Inicio
    localidad(N2, Fin, _),      % Busca el número de localidad de Fin
    N1 =< N2, % Solo de ida     % Verifica que el camino sea hacia adelante
    camino_aux(N1, N2, Camino). % Llama a camino_aux para obtener la lista de localidades

% camino_aux(N1, N2, Camino)
camino_aux(N, N, [Loc]) :-   % Caso base: si N1 = N2, ya estamos en la última localidad -> se devuelve esa sola
    localidad(N, Loc, _), !.
camino_aux(N1, N2, [Loc|Resto]) :-   % Vas construyendo la lista con [Loc | Resto]
    localidad(N1, Loc, _),   % Busca la localidad correspondiente al número N1
    N1 < N2,                 
    Nsig is N1 + 1,          % Avanza al siguiente número de localidad
    camino_aux(Nsig, N2, Resto).   % Llama recursivamente a camino_aux con el siguiente número


% tramos_camino([A,B,C], [[A,B],[B,C]])     % Convierte una lista de localidades en tramos
tramos_camino([_], []) :- !.
tramos_camino([A,B|Resto], [[A,B]|Tramos]) :-  % Toma los 2 primeros (A,B), forma el tramo [A,B]
    tramos_camino([B|Resto], Tramos).          % sigue con el resto

% Unir dos listas (sin append)
unir([], L, L) :- !.     % Caso base: unir lista vacía con L da L
unir([X|R], L, [X|R2]) :- unir(R, L, R2).    % Va agregando X al principio del resultado recursivo


% tramos_personas(ListaPersonas, ListaTramos)
tramos_personas([], []) :- !.
tramos_personas([P|Resto], TramosTotal) :-     % Para cada persona P en la lista
    camino_persona(P, Camino),                 % obtiene su camino
    tramos_camino(Camino, TramosP),            % convierte el camino en tramos
    tramos_personas(Resto, TramosResto),       % llama recursivamente para el resto de las personas
    unir(TramosP, TramosResto, TramosTotal).   % Une los tramos de P con los del resto para formar la lista total


% contar_usuarios_tramo(Tramo, ListaPersonas, Cantidad)
contar_usuarios_tramo(_, [], 0) :- !.
contar_usuarios_tramo([A,B], [P|Resto], Cant) :-     % Cuenta cuántas personas usan un tramo [A,B].
    camino_persona(P, Camino),                       % obtiene el camino de la persona P
    pertenece_tramo([A,B], Camino), !,               % verifica si el tramo [A,B] está en el camino
    contar_usuarios_tramo([A,B], Resto, CantR),      % cuenta en el resto de las personas
    Cant is CantR + 1.                               % Si la persona actual usa ese tramo suma 1
contar_usuarios_tramo([A,B], [_|Resto], Cant) :-     % Si no usa el tramo, sigue contando en el resto
    contar_usuarios_tramo([A,B], Resto, Cant).       
    

% pertenece_tramo([A,B], Camino)
pertenece_tramo([A,B], [A,B|_]) :- !.       % Verifica si el tramo [A,B] es el inicio del camino
pertenece_tramo([A,B], [_|R]) :- pertenece_tramo([A,B], R).    % Verifica si el tramo [A,B] está en el camino


% costo_tramo([A,B], Costo)
costo_tramo([A,B], Costo) :-     % Obtiene el costo del tramo [A,B]
    localidad(N1, A, Costo),     % Busca la localidad A y su costo hasta la siguiente
    localidad(N2, B, _),         % Busca la localidad B
    N2 is N1 + 1, !.             % Verifica que B sea la siguiente localidad de A

% costo_total_persona(Persona, ListaPersonas, CostoTotal)
costo_total_persona(Persona, ListaPersonas, CostoTotal) :-    % Calcula el costo total de una persona
    camino_persona(Persona, Camino),                          % obtiene su camino
    tramos_camino(Camino, Tramos),                            % convierte el camino en tramos
    costo_tramos_persona(Tramos, ListaPersonas, 0, CostoTotal).  % llama a costo_tramos_persona para calcular el costo total

% costo_tramos_persona(Tramos, ListaPersonas, Acum, Total)
costo_tramos_persona([], _, Acum, Acum) :- !.
costo_tramos_persona([Tramo|Resto], ListaPersonas, Acum, Total) :-    % Para cada tramo en la lista de tramos
    costo_tramo(Tramo, CostoTramo),                           % obtiene su costo
    contar_usuarios_tramo(Tramo, ListaPersonas, Cant),        % cuenta cuántas personas usan ese tramo
    CostoParcial is CostoTramo // Cant,                       % Divide el costo del tramo por la cantidad de personas que lo usan
    Acum1 is Acum + CostoParcial,                             % Acumula el costo parcial
    costo_tramos_persona(Resto, ListaPersonas, Acum1, Total). % Llama recursivamente para el resto de los tramos


% Nuevo predicado principal
repartir_costos(Personas, Resultado) :-
    repartir_costos_aux(Personas, Personas, Resultado).   

% Auxiliar que mantiene la lista completa
repartir_costos_aux([], _, []) :- !.
repartir_costos_aux([P|Resto], Todos, [[P, Camino, CostoTotal]|Resultado]) :-   % Para cada persona P en la lista
    camino_persona(P, Camino),                                 % obtiene su camino
    costo_total_persona(P, Todos, CostoTotal),                 % calcula su costo total
    repartir_costos_aux(Resto, Todos, Resultado).              % llama recursivamente para el resto de las personas

% ?- repartir_costos([jorge, adriana], Resultado).  