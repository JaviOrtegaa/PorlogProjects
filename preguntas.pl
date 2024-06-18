% Definición de preguntas
% Cada pregunta tiene un identificador y el texto de la pregunta
pregunta(1, '¿Te gusta Prolog?').
pregunta(2, '¿Disfrutas resolviendo rompecabezas?').
pregunta(3, '¿Te parece interesante la inteligencia artificial?').
pregunta(4, '¿Prefieres la programación funcional?').
pregunta(5, '¿Te gusta aprender nuevos lenguajes?').

% Regla para pedir la respuesta a cada pregunta
% ask_question(Id, Respuesta) pide la respuesta del usuario y la almacena en Respuesta
preguntar(Id, Respuesta) :-
    pregunta(Id, Texto),
    format('~w (si/no): ', [Texto]),
    read(RespuestaUsuario),
    (RespuestaUsuario == si -> Respuesta = si ; Respuesta = no).

% Contar respuestas positivas
% count_yes(ListaRespuestas, Conteo) cuenta cuántas respuestas son "si"
contar_si([], 0).
contar_si([si | T], N) :-
    contar_si(T, N1),
    N is N1 + 1.
contar_si([no | T], N) :-
    contar_si(T, N).

% Ejecutar el test
% run_test ejecuta todas las preguntas, cuenta las respuestas "si" y determina el resultado
ejecutar_test :-
    findall(Respuesta, (between(1, 5, Id), preguntar(Id, Respuesta)), Respuestas),
    contar_si(Respuestas, ConteoSi),
    format('Respondiste "si" a ~w preguntas.~n', [ConteoSi]),
    determinar_resultado(ConteoSi).

% Determinar el resultado basado en la cantidad de respuestas "si"
% determine_result(ConteoSi) muestra el resultado final basado en las respuestas positivas
determinar_resultado(ConteoSi) :-
    ConteoSi >= 4, !,
    write('Resultado: ¡Eres un verdadero entusiasta!').
determinar_resultado(ConteoSi) :-
    ConteoSi >= 2, !,
    write('Resultado: Tienes algo de interés.').
determinar_resultado(_) :-
    write('Resultado: ¡Podrías explorar más!').