%%hechos
pais_continente(alemania, europa).
pais_continente(francia, europa).
pais_continente(italia, europa).
pais_continente(espana, europa).
pais_continente(reino_unido, europa).

pais_continente(estados_unidos, america).
pais_continente(canada, america).
pais_continente(mexico, america).
pais_continente(brasil, america).
pais_continente(argentina, america).

pais_continente(china, asia).
pais_continente(india, asia).
pais_continente(japon, asia).
pais_continente(corea_del_sur, asia).
pais_continente(rusia, asia).

pais_continente(sudafrica, africa).
pais_continente(nigeria, africa).
pais_continente(egipto, africa).
pais_continente(kenia, africa).
pais_continente(congo, africa).

pais_continente(australia,oceania).
pais_continente(nueva_zelanda,oceania).
pais_continente(fiyi,oceania).
pais_continente(marshall,oceania).

%%Reglas
pertenece_a_continente(Pais, Continente) :- pais_continente(Pais, Continente).


