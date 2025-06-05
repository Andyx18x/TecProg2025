% Hechos

entrada(empanada).
entrada(croquetas).
entrada(ensalada).
platoprincipal(lomo_a_la_mostaza).
platoprincipal(hamburguesa_completa).
platoprincipal(milanesa_con_pure).
postre(flan).
postre(budin_de_pan).
postre(helado).

% Reglas

carta(X,Y,Z):-
    entrada(X),
    platoprincipal(Y),
    postre(Z).


% Consultas

/*
?- entrada(X).
X = empanada ;
X = croquetas ;
X = ensalada.

?- postre(helado).
true.

?- postre(lomo_a_la_mostaza).
false.

?- platoprincipal(lomo_a_la_mostaza).
true.

?- carta(X,Y,Z).
X = empanada,
Y = lomo_a_la_mostaza,
Z = flan ;
X = empanada,
Y = lomo_a_la_mostaza,
Z = budin_de_pan ;
X = empanada,
Y = lomo_a_la_mostaza,
Z = helado ;
X = empanada,
Y = hamburguesa_completa,
Z = flan ;
X = empanada,
Y = hamburguesa_completa,
Z = budin_de_pan ;
X = empanada,
Y = hamburguesa_completa,
Z = helado ;
X = empanada,
Y = milanesa_con_pure,
Z = flan ;
X = empanada,
Y = milanesa_con_pure,
Z = budin_de_pan ;
X = empanada,
Y = milanesa_con_pure,
Z = helado ;
X = croquetas,
Y = lomo_a_la_mostaza,
Z = flan ;
X = croquetas,
Y = lomo_a_la_mostaza,
Z = budin_de_pan ;
X = croquetas,
Y = lomo_a_la_mostaza,
Z = helado ;
X = croquetas,
Y = hamburguesa_completa,
Z = flan ;
X = croquetas,
Y = hamburguesa_completa,
Z = budin_de_pan ;
X = croquetas,
Y = hamburguesa_completa,
Z = helado ;
X = croquetas,
Y = milanesa_con_pure,
Z = flan ;
X = croquetas,
Y = milanesa_con_pure,
Z = budin_de_pan ;
X = croquetas,
Y = milanesa_con_pure,
Z = helado ;
X = ensalada,
Y = lomo_a_la_mostaza,
Z = flan ;
X = ensalada,
Y = lomo_a_la_mostaza,
Z = budin_de_pan ;
X = ensalada,
Y = lomo_a_la_mostaza,
Z = helado ;
X = ensalada,
Y = hamburguesa_completa,
Z = flan ;
X = ensalada,
Y = hamburguesa_completa,
Z = budin_de_pan ;
X = ensalada,
Y = hamburguesa_completa,
Z = helado ;
X = ensalada,
Y = milanesa_con_pure,
Z = flan ;
X = ensalada,
Y = milanesa_con_pure,
Z = budin_de_pan ;
X = ensalada,
Y = milanesa_con_pure,
Z = helado.
*/
