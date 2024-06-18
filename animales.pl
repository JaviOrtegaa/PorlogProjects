%%hechos
animal_oviparo(cangrejos).
animal_oviparo(torgutas).
animal_oviparo(guacamaya).
animal_viviparo(caballo).
animal_viviparo(elefantes).
animal_viviparo(gato).

%%reglas
es_oviparo(X) :- animal_oviparo(X).
es_viviparo(X) :- animal_viviparo(X). 


