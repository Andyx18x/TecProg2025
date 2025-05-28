
% Ejercicio3.pl

% Hechos
menu(['Bombones de jamon', 'Locro', 'Dulce de batata']).
menu(['Bombones de jamon', 'Locro', 'Alfajor norteño']).
menu(['Tarta de Atun', 'Atados de repollo', 'Dulce de batata']).
menu(['Tarta de Atun', 'Pollo romano con hierbas y vino', 'Flan']).
menu(['Volovanes de atun', 'Matambre con espinacas y parmesano', 'Torta moka']).
menu(['Buñuelos de bacalao', 'Pollo romano con hierbas y vino', 'Alfajor norteño']).


/* 
?- menu([Y,X,'Dulce de batata']).
Y = 'Bombones de jamon',
X = 'Locro' ;
Y = 'Tarta de Atun',
X = 'Atados de repollo'.

?- menu(X).
X = ['Bombones de jamon', 'Locro', 'Dulce de batata'] ;
X = ['Bombones de jamon', 'Locro', 'Alfajor norteÃ±o'] ;
X = ['Tarta de Atun', 'Atados de repollo', 'Dulce de batata'] ;
X = ['Tarta de Atun', 'Pollo romano con hierbas y vino', 'Flan'] ;
X = ['Volovanes de atun', 'Matambre con espinacas y parmesano', 'Torta moka'] ;
X = ['BuÃ±uelos de bacalao', 'Pollo romano con hierbas y vino', 'Alfajor norteÃ±o'].

?- menu([X,'Locro',Y]).
X = 'Bombones de jamon',
Y = 'Dulce de batata' ;
X = 'Bombones de jamon',
Y = 'Alfajor norteÃ±o' ;
false.

?- menu([_,'Pato a la naranja',_]).
false.

?- menu(['Locro',_,_]).
false. */