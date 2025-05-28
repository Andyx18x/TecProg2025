% Ejercicio5.pl 

% Hechos
ruta(santafe, parana).
ruta(parana, corrientes).
ruta(santafe, cordoba).
ruta(santafe, coronda).
ruta(santafe, rosario).
ruta(rosario, capital).
ruta(rosario, mardelplata).
ruta(capital, cordoba).

/* ?- ruta(X,cordoba).
X = santafe ;
X = capital.

?- ruta(parana,X).
X = corrientes.

?- ruta(parana,cordoba),ruta(cordoba,parana).
false.

?- ruta(X,parana),ruta(parana,X).
false.

?- ruta(X,parana),ruta(parana,Y).
X = santafe,
Y = corrientes.


?- ruta(santafe,_),ruta(_,corrientes).
true 
*/
