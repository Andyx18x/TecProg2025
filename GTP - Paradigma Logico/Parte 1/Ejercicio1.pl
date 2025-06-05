% Hechos

f(a, 2).
f(a, 3).
f(b, 2).
f(b, 4).
f(c, 1).
f(c, 2).

% Consultas

/*
?- f(X,1).
X = c.

?- f(X).
ERROR: Unknown procedure: f/1
ERROR:     However, there are definitions for:
ERROR:         f/2
false.

?- f(a,X).
X = 2 ;
X = 3.

?- f(c,1).
true .

?- f(X,Y).
X = a,
Y = 2 ;
X = a,
Y = 3 ;
X = b,
Y = 2 ;
X = b,
Y = 4 ;
X = c,
Y = 1 ;
X = c,
Y = 2.

?- f(2,a).
false.

?- f(X,Y), f(X,4).
X = b,
Y = 2 ;
X = b,
Y = 4 ;
false.
*/