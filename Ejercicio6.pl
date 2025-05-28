% Ejercicio6.pl

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

lunaDe(mercurio, ['No tiene']).
lunaDe(venus, ['No tiene']).
lunaDe(tierra,luna).
lunaDe(marte,[deimos,phobos]).

orbita(sol,[mercurio,venus,tierra,marte,jupiter,saturno,urano,neptuno,pluton])

