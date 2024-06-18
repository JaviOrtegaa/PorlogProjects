% Conjuntos difusos para la dificultad de las asignaturas
dificultad(baja, D) :- D >= 0, D =< 3.
dificultad(media, D) :- D > 3, D =< 6.
dificultad(alta, D) :- D > 6, D =< 10.

% Reglas difusas para determinar el tiempo de estudio en función de la dificultad percibida
tiempo_estudio(D, Tiempo) :-
    dificultad(baja, D),
    Tiempo is 1.5 * D. % Tiempo de estudio para dificultad baja
tiempo_estudio(D, Tiempo) :-
    dificultad(media, D),
    Tiempo is 2 * D. % Tiempo de estudio para dificultad media
tiempo_estudio(D, Tiempo) :-
    dificultad(alta, D),
    Tiempo is 2.5 * D. % Tiempo de estudio para dificultad alta

% Ejemplo de hechos que representan las asignaturas y su dificultad percibida
asignatura_dificultad(matematicas, baja).
asignatura_dificultad(programacion, media).
asignatura_dificultad(fisica, alta).



