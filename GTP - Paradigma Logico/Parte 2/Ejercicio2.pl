% Hechos

progenitor(maria,nanci).
progenitor(lidia,norma).
progenitor(leticia,eligio).
progenitor(segundo,eligio).
progenitor(norma,ariel).
progenitor(norma,daniel).
progenitor(eligio,ariel).
progenitor(eligio,daniel).
progenitor(nanci,fabiana).
progenitor(jose,fabiana).
progenitor(rene,marifi).
progenitor(olga,marifi).
progenitor(ariel,andy).
progenitor(ariel,bruno).
progenitor(fabiana,andy).
progenitor(fabiana,bruno).
progenitor(daniel,matias).
progenitor(daniel,carola).
progenitor(marifi,matias).
progenitor(marifi,carola).
hombre(segundo).
hombre(eligio).
hombre(jose).
hombre(rene).
hombre(ariel).
hombre(daniel).
hombre(andy).
hombre(bruno).
hombre(matias).
mujer(maria).
mujer(nanci).
mujer(lidia).
mujer(norma).
mujer(leticia).
mujer(fabiana).
mujer(marifi).
mujer(olga).
mujer(carola).

% Reglas

padreDe(X,Y):-
    hombre(X),
    progenitor(X,Y).

madreDe(X,Y):-
    mujer(X),
    progenitor(X,Y).

abueloDe(X,Y):-
    padreDe(X,Z), progenitor(Z,Y).

abuelaDe(X,Y):-
    madreDe(X,Z), progenitor(Z,Y).

hermano(X,Y):-
    padreDe(Z,X), padreDe(Z,Y), X \= Y.

hermanoVaron(X,Y):-
    hombre(X),  padreDe(Z,X), padreDe(Z,Y), X \= Y.

hermanaMujer(X,Y):-
    mujer(X),  padreDe(Z,X), padreDe(Z,Y), X \= Y.

sucesor(X,Y) :- progenitor(Y,X).

sucesor(X,Y) :- progenitor(Y,Z), sucesor(X,Z).

es_madre(X) :- madreDe(X,_).

es_padre(X) :- padreDe(X,_).

tia(X,Y) :-  mujer(X),  progenitor(Z,Y),  hermano(X,Z).  

tio(X,Y) :-  hombre(X),  progenitor(Z,Y),  hermano(X,Z).

% Consultas

/*
?- abueloDe(eligio,andy).
true ;
false.

?- abueloDe(rene,carola).
true.

?- abueloDe(rene,X).
X = matias ;
X = carola.

?- abueloDe(eligio,X).
X = andy ;
X = bruno ;
X = matias ;
X = carola.

?- abuelaDe(maria,X).
X = fabiana.

?- abuelaDe(nanci,X).
X = andy ;
X = bruno.

?- hermano(carola,X).
X = matias ;
false.

?- hermanoVaron(X,Y).
X = ariel,
Y = daniel ;
X = daniel,
Y = ariel ;
X = andy,
Y = bruno ;
X = bruno,
Y = andy ;
X = matias,
Y = carola ;
false.

?- hermanaMujer(X,Y).
X = carola,
Y = matias ;
false.

?- sucesor(fabiana,maria).
true ;
false.

?- sucesor(bruno,olga).
false.

?- sucesor(X,Y).
X = nanci,
Y = maria ;
X = norma,
Y = lidia ;
X = eligio,
Y = leticia ;
X = eligio,
Y = segundo ;
X = ariel,
Y = norma ;
X = daniel,
Y = norma ;
X = ariel,
Y = eligio ;
X = daniel,
Y = eligio ;
X = fabiana,
Y = nanci ;
X = fabiana,
Y = jose ;
X = marifi,
Y = rene ;
X = marifi,
Y = olga ;
X = andy,
Y = ariel ;
X = bruno,
Y = ariel ;
X = andy,
Y = fabiana ;
X = bruno,
Y = fabiana ;
X = matias,
Y = daniel ;
X = carola,
Y = daniel ;
X = matias,
Y = marifi ;
X = carola,
Y = marifi ;
X = fabiana,
Y = maria ;
X = andy,
Y = maria ;
X = bruno,
Y = maria ;
X = ariel,
Y = lidia ;
X = daniel,
Y = lidia ;
X = andy,
Y = lidia ;
X = bruno,
Y = lidia ;
X = matias,
Y = lidia ;
X = carola,
Y = lidia ;
X = ariel,
Y = leticia ;
X = daniel,
Y = leticia ;
X = andy,
Y = leticia ;
X = bruno,
Y = leticia ;
X = matias,
Y = leticia ;
X = carola,
Y = leticia ;
X = ariel,
Y = segundo ;
X = daniel,
Y = segundo ;
X = andy,
Y = segundo ;
X = bruno,
Y = segundo ;
X = matias,
Y = segundo ;
X = carola,
Y = segundo ;
X = andy,
Y = norma ;
X = bruno,
Y = norma ;
X = matias,
Y = norma ;
X = carola,
Y = norma ;
X = andy,
Y = eligio ;
X = bruno,
Y = eligio ;
X = matias,
Y = eligio ;
X = carola,
Y = eligio ;
X = andy,
Y = nanci ;
X = bruno,
Y = nanci ;
X = andy,
Y = jose ;
X = bruno,
Y = jose ;
X = matias,
Y = rene ;
X = carola,
Y = rene ;
X = matias,
Y = olga ;
X = carola,
Y = olga ;
false.
*/

