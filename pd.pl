%%hechos
numero_par(2).
numero_par(4).
numero_par(6).
numero_impar(1).
numero_impar(3).
numero_impar(5).

%%reglas
es_par(X) :- numero_par(X). 
es_impar(X) :- numero_impar(X).