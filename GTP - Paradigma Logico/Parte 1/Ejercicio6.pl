% Hechos

estrella(sol).
planeta(mercurio).
planeta(venus).
planeta(tierra).
planeta(marte).
planeta(jupiter).
planeta(saturno).
planeta(urano).
planeta(neptuno).
planeta(pluton).
luna(luna).
luna(deimos).
luna(phobos).
luna(adrastea).
luna(carpo).
luna(metis).
luna(sinope).
luna(s2000j11).
luna(aegir).
luna(calypso).
luna(surtur).
luna(s2004s07).
luna(belinda).
luna(cordelia).
luna(mab).
luna(s1986u10).
luna(despina).
luna(neso).
luna(triton).
luna(nix).
luna(hydra).
orbita(tierra,luna).
orbita(marte,deimos).
orbita(jupiter,adrastea).
orbita(saturno,aegir).
orbita(urano,belinda).
orbita(neptuno,triton).
orbita(pluton,nix).

% Reglas

lunaDe(X,Y):-
    planeta(X),
    luna(Y),
    orbita(X,Y).

% Consultas

/*
?- lunaDe(tierra,luna).
true.

?- lunaDe(saturno,nix).
false.

?- lunaDe(urano,X).
X = belinda ;
false.

?- lunaDe(pluton,_).
true ;
false.

?- planeta(X).
X = mercurio ;
X = venus ;
X = tierra ;
X = marte ;
X = jupiter ;
X = saturno ;
X = urano ;
X = neptuno ;
X = pluton.
*/