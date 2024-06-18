%%hechos
es_gaseoso(jupiter).
es_gaseoso(saturno).
es_gaseoso(urano).
es_gaseoso(neptuno).
es_rocoso(mercurio).
es_rocoso(venus).
es_rocoso(tierra).
es_rocoso(marte).

%%reglas
planeta_gaseoso(X) :- es_gaseoso(X).
planeta_rocoso(X) :- es_rocoso(X).