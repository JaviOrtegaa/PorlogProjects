%%hechos
hombre(juan).
hombre(pedro).
mujer(maria).
mujer(laura).
padre(juan, pedro).
padre(juan, laura).
madre(maria, pedro).
madre(maria, laura).

%%regla 
hijo(X, Y) :- padre(Y, X); madre(Y, X).