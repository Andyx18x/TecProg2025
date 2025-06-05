% Hechos 

libro(rayuela,novela,larga).
libro(octaedro,cuentos,corto).
libro(inventario,poemas,largo).
libro(leones,novela,corto).
mujer(haydee).
mujer(tania).
varon(livio).
varon(pedro).
abogado(haydee).
abogado(pedro).
ingeniero(haydee).
medico(tania).
contador(livio).

% Reglas

gusta(X,Y):-    % A los abogados les gustan las novelas largas
    abogado(X), libro(Y,novela,larga).

gusta(X,Y):-    % Tanto a los ingenieros como a los medicos les gustan las novelas
    (ingeniero(X); medico(X)), libro(Y,novela,_).

gusta(X,Y):-    % A las mujeres les gustan todos los libros largos.
    mujer(X), libro(Y,_,largo).

gusta(X,Y):-          
    contador(X),
    varon(X),
    libro(Y,cuentos,_).

gusta(X,Y):-          
    contador(X),
    varon(X),
    libro(Y,poemas,_).


gusta(livio,rayuela).   % A livio le gusta rayuela

gusta(pedro,Y):-    % A Pedro le gustan los libros de cuentos
    libro(Y,cuentos,_).



