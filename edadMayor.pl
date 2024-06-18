%%hechos
edad(maria,17).
edad(javier,23).
edad(yoshi,22).

%%reglas
mayor_de_edad(Persona) :- edad(Persona, Edad), Edad >=18.