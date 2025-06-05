% Hechos

ruta(santafe, parana).
ruta(parana, corrientes).
ruta(santafe, cordoba).
ruta(santafe, coronda).
ruta(santafe, rosario).
ruta(rosario, capital).
ruta(rosario, mardelplata).
ruta(capital, cordoba).

% Consultas
/*
?- ruta(X,cordoba).
X = santafe ;
X = capital.

?- ruta(parana,X).
X = corrientes.

?- ruta(parana,cordoba).
false.

?-  ruta(santafe,_), ruta(_,corrientes).
true 

?- ruta(santafe,X), ruta(X,corrientes).
X = parana ;
false.
*/