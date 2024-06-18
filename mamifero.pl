%%hechos
es_mamifero(leon).
es_mamifero(gato).
tipo_animal(oviparo,serpiente).
tipo_animal(oviparo,ave).
animal_tom(terrestre,elefante).
animal_tom(terrestre,tigre).
animal(marino,tortuga).
animal(marino,mantarraya).

%%reglas
es_animal(X) :- es_mamifero(X).
es_oviparo(X) :- tipo_animal(oviparo,Y).
es_terrestre(X) :- animal_tom(terrestre,Y).
es_marino(X) :- animal(marino,Y).