% Definición de los conjuntos difusos para la temperatura
temperatura_fria(X) :-
    X >= 0,
    X =< 15.
temperatura_templada(X) :-
    X >= 10,
    X =< 25.
temperatura_calida(X) :-
    X >= 20,
    X =< 40.

% Reglas difusas para determinar el grado de apertura de la ventana
grado_apertura(0, Frio, _, _) :- Frio >= 0.7.
grado_apertura(0, _, Templado, _) :- Templado >= 0.7.
grado_apertura(0, _, _, Calido) :- Calido >= 0.7.

grado_apertura(0.5, Frio, _, Templado) :- Frio >= 0.5, Frio < 0.7, Templado < 0.7.
grado_apertura(0.5, _, Templado, Calido) :- Templado >= 0.5, Templado < 0.7, Calido < 0.7.

grado_apertura(1, Frio, Templado, _) :- Frio < 0.5, Templado < 0.7.
grado_apertura(1, _, Templado, Calido) :- Templado < 0.5, Calido < 0.7.

% Ejemplo de hecho que representa la temperatura medida y la temperatura deseada
% La temperatura actual y la temperatura deseada pueden ser valores entre 0 y 40 grados Celsius.
temperatura_actual(20).
temperatura_deseada(25).

% Regla para determinar el grado de apertura de la ventana
controlar_temperatura :-
    temperatura_actual(TA),
    temperatura_deseada(TD),
    dif(TD, TA, Diferencia),
    temperatura_fria(TA), temperatura_fria(TD), grado_apertura(Grado, TA, TD, Diferencia),
    write('Abrir ventana en un grado de '), write(Grado), write(' para mantener la temperatura deseada.').
controlar_temperatura :-
    temperatura_actual(TA),
    temperatura_deseada(TD),
    dif(TD, TA, Diferencia),
    temperatura_templada(TA), temperatura_templada(TD), grado_apertura(Grado, TA, TD, Diferencia),
    write('Abrir ventana en un grado de '), write(Grado), write(' para mantener la temperatura deseada.').
controlar_temperatura :-
    temperatura_actual(TA),
    temperatura_deseada(TD),
    dif(TD, TA, Diferencia),
    temperatura_calida(TA), temperatura_calida(TD), grado_apertura(Grado, TA, TD, Diferencia),
    write('Abrir ventana en un grado de '), write(Grado), write(' para mantener la temperatura deseada.').

% Predicado para calcular la diferencia entre dos valores
dif(X, Y, Result) :- Result is X - Y, Result >= 0, !.
dif(X, Y, Result) :- Result is Y - X.




