% Definición de conjuntos difusos para la temperatura actual del horno
temperatura_actual(baja, 0, 50).
temperatura_actual(media, 40, 80).
temperatura_actual(alta, 70, 100).

% Definición de conjuntos difusos para la temperatura objetivo
temperatura_objetivo(baja, 0, 50).
temperatura_objetivo(media, 40, 80).
temperatura_objetivo(alta, 70, 100).

% Reglas difusas para el ajuste del quemador del horno
ajuste_quemador(aumentar) :-
    temperatura_actual(baja, _, _),
    temperatura_objetivo(alta, _, _).
    
ajuste_quemador(disminuir) :-
    temperatura_actual(alta, _, _),
    temperatura_objetivo(baja, _, _).
    
ajuste_quemador(mantener) :-
    temperatura_actual(media, _, _),
    temperatura_objetivo(media, _, _).

