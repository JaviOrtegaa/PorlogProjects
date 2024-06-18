% Definición de preguntas
% Cada pregunta tiene un identificador y el texto de la pregunta
pregunta(1, '¿Aparecen pantallazos azules a la hora de abrir tus aplicaciones o juegos, más conocidas como las pantallas de la muerte?').
pregunta(2, '¿El PC o portátil tarda bastante tiempo en arrancar, incluso contando con sistemas de almacenamiento de alta velocidad?').
pregunta(3, '¿El equipo hace pitidos cuando se enciende?').
pregunta(4, '¿Pueden producirse errores o fallos en el momento de instalar nuevos programas en tu equipo?').
pregunta(5, '¿Cuanto mayor sea el tiempo que tu PC o portátil se encuentra encendido, mucho más lento va todo, lo que termina obligando a reiniciar al equipo?').
pregunta(6, '¿El sistema impide acceder a determinados archivos del disco duro, avisando de que los mismos se encuentran corrompidos?').
pregunta(7, '¿Bloqueos repentinos de tu ratón o teclado, dejando de responder inesperadamente?').
pregunta(8, '¿La memoria RAM no es reconocida por tu dispositivo o equipo?').
pregunta(9, '¿Tu sistema operativo mostrará una falta de memoria RAM?').

% Regla para pedir la respuesta a cada pregunta
% preguntar(Id, Respuesta) pide la respuesta del usuario y la almacena en Respuesta
preguntar(Id, Respuesta) :-
    pregunta(Id, Texto),
    format('~w (si/no): ', [Texto]),
    read(RespuestaUsuario),
    (RespuestaUsuario == si -> Respuesta = si ; Respuesta = no).

% Contar respuestas positivas
% contar_si(ListaRespuestas, Conteo) cuenta cuántas respuestas son "si"
contar_si([], 0).
contar_si([si | T], N) :-
    contar_si(T, N1),
    N is N1 + 1.
contar_si([no | T], N) :-
    contar_si(T, N).

% Ejecutar el test
% ejecutar_test ejecuta todas las preguntas, cuenta las respuestas "si" y determina el resultado
ejecutar_test :-
    findall(Respuesta, (between(1, 9, Id), preguntar(Id, Respuesta)), Respuestas),
    contar_si(Respuestas, ConteoSi),
    format('Respondiste "si" a ~w preguntas.~n', [ConteoSi]),
    determinar_resultado(ConteoSi).

% Determinar el resultado basado en la cantidad de respuestas "si"
% determinar_resultado(ConteoSi) muestra el resultado final basado en las respuestas positivas
determinar_resultado(ConteoSi) :-
    ConteoSi >= 7, !,
    write('Resultado: Tu memoria RAM parece estar en mal estado. Considera reemplazarla.').
determinar_resultado(ConteoSi) :-
    ConteoSi >= 4, !,
    write('Resultado: Podrías tener problemas con tu memoria RAM. Revisa y prueba tu RAM.').
determinar_resultado(_) :-
    write('Resultado: Tu memoria RAM parece estar en buen estado.').