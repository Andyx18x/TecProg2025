
factorial(0,1).
factorial(X,Factorial):-
    X>=0,
    X1 is X-1,
    factorial(X1,F1),
    Factorial is X*F1.

/*
factorial(3, F)
→ factorial(2, F1)
    → factorial(1, F2)
        → factorial(0, 1)  ← caso base
        ← F2 = 1 * 1 = 1
    ← F1 = 2 * 1 = 2
← F = 3 * 2 = 6
*/