% Definimos las características de algunas frutas en términos de dulzura y acidez.
% Las características están en una escala de 0 a 10.
% Puedes añadir más frutas y ajustar los valores según tu criterio.
caracteristicas_simple(naranja, 6, 8).  % La naranja tiene dulzura 6 y acidez 8.
caracteristicas_simple(platano, 8, 2).  % El plátano tiene dulzura 8 y acidez 2.
caracteristicas_simple(fresa, 7, 3).    % La fresa tiene dulzura 7 y acidez 3.
caracteristicas_simple(manzana, 5, 6).   % La manzana tiene dulzura 5 y acidez 6.
caracteristicas_simple(uva, 7, 7).       % La uva tiene dulzura 7 y acidez 7.

% Encuentra la fruta más similar a las respuestas del usuario
fruta_similar_simple(Dulzura, Acidez, Fruta) -
    caracteristicas_simple(Fruta, DulzuraF, AcidezF),  % Obtenemos las características de la fruta.
    DiferenciaDulzura is abs(Dulzura - DulzuraF),  % Calculamos la diferencia absoluta entre la dulzura del usuario y la de la fruta.
    DiferenciaAcidez is abs(Acidez - AcidezF),  % Calculamos la diferencia absoluta entre la acidez del usuario y la de la fruta.
    Distancia is DiferenciaDulzura + DiferenciaAcidez,  % Calculamos la distancia total sumando las diferencias de dulzura y acidez.
    findall(Distancia-Fruta, caracteristicas_simple(Fruta, _, _), Distancias),  % Obtenemos una lista de todas las distancias a las frutas.
    sort(Distancias, [_-Fruta_]).  % Ordenamos la lista de distancias y obtenemos la fruta más cercana.

% Predicado para preguntar y determinar qué tipo de fruta eres.
test_fruta_simple -
    write('¿Cuán dulce te consideras (0-10) '),  % Solicitamos la entrada del usuario sobre su percepción de dulzura.
    read(Dulzura),  % Leemos la respuesta del usuario y la almacenamos en la variable Dulzura.
    write('¿Cuán ácido te consideras (0-10) '),  % Solicitamos la entrada del usuario sobre su percepción de acidez.
    read(Acidez),  % Leemos la respuesta del usuario y la almacenamos en la variable Acidez.
    fruta_similar_simple(Dulzura, Acidez, Fruta),  % Determinamos la fruta más similar a las respuestas del usuario.
    format('¡Eres como una ~w!', [Fruta]).  % Mostramos el resultado al usuario.