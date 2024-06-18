% Definición de hechos para los niveles de felicidad
nivel_felicidad(bajo, 0, 50).
nivel_felicidad(medio, 40, 80).
nivel_felicidad(alto, 70, 100).

% Definición de reglas para determinar el estado emocional
estado_emocional(triste, Nivel) :-
    nivel_felicidad(bajo, Min, Max),
    Nivel >= Min,
    Nivel =< Max.

estado_emocional(contento, Nivel) :-
    nivel_felicidad(medio, Min, Max),
    Nivel >= Min,
    Nivel =< Max.

estado_emocional(feliz, Nivel) :-
    nivel_felicidad(alto, Min, Max),
    Nivel >= Min,
    Nivel =< Max.
