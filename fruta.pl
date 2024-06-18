% Definimos una regla para calcular el mínimo de dos números.
min(X, Y, Min) :-
    (X =< Y -> Min = X ; Min = Y).

% Definimos las características de algunas frutas en términos de "dulzura" y "acidez".
% Las características están en una escala de 0 a 10.
% Puedes añadir más frutas y ajustar los valores según tu criterio.
caracteristicas(naranja, 6, 8).  % La naranja tiene dulzura 6 y acidez 8.
caracteristicas(platano, 8, 2).  % El plátano tiene dulzura 8 y acidez 2.
caracteristicas(fresa, 7, 3).    % La fresa tiene dulzura 7 y acidez 3.
caracteristicas(manzana, 5, 6).   % La manzana tiene dulzura 5 y acidez 6.
caracteristicas(uva, 7, 7).       % La uva tiene dulzura 7 y acidez 7.

% Función de pertenencia triangular
% Devuelve 0 si x <= low, (x - low)/(mid - low) si low < x < mid, (high - x)/(high - mid) si mid < x < high, y 0 si x >= high.
triangular_membership(X, Low, Mid, High, Value) :-
    (X =< Low ->
        Value is 0  % Si X es menor o igual que Low, la pertenencia es 0.
    ; X < Mid ->
        Value is (X - Low) / (Mid - Low)  % Si X está entre Low y Mid, calculamos la pertenencia utilizando una función lineal creciente.
    ; X =< High ->
        Value is (High - X) / (High - Mid)  % Si X está entre Mid y High, calculamos la pertenencia utilizando una función lineal decreciente.
    ; 
        Value is 0  % Si X es mayor o igual que High, la pertenencia es 0.
    ).

% Calcula la similitud entre las características de una fruta y las respuestas del usuario
similitud_caracteristicas(Dulzura, Acidez, Fruta, Similitud) :-
    caracteristicas(Fruta, DulzuraF, AcidezF),  % Obtenemos las características de la fruta.
    triangular_membership(Dulzura, DulzuraF - 2, DulzuraF, DulzuraF + 2, SimDulzura),  % Calculamos la pertenencia de la dulzura del usuario respecto a la fruta.
    triangular_membership(Acidez, AcidezF - 2, AcidezF, AcidezF + 2, SimAcidez),  % Calculamos la pertenencia de la acidez del usuario respecto a la fruta.
    min(SimDulzura, SimAcidez, Similitud).  % La similitud entre las características de la fruta y las respuestas del usuario es el mínimo entre la pertenencia de la dulzura y la acidez.

% Encuentra la fruta más similar a las respuestas del usuario
fruta_similar(Dulzura, Acidez, Fruta) :-
    findall(Similitud-Fruta, similitud_caracteristicas(Dulzura, Acidez, Fruta, Similitud), Pares),  % Obtenemos una lista de pares (Similitud-Fruta) que representan la similitud de cada fruta con las respuestas del usuario.
    keysort(Pares, [_-Fruta|_]).  % Ordenamos la lista de pares por similitud y obtenemos la fruta con la mayor similitud.

% Predicado para preguntar y determinar qué tipo de fruta eres.
test_fruta :-
    write('¿Cuán dulce te consideras? (0-10) '),  % Solicitamos la entrada del usuario sobre su percepción de dulzura.
    read(Dulzura),  % Leemos la respuesta del usuario y la almacenamos en la variable Dulzura.
    write('¿Cuán ácido te consideras? (0-10) '),  % Solicitamos la entrada del usuario sobre su percepción de acidez.
    read(Acidez),  % Leemos la respuesta del usuario y la almacenamos en la variable Acidez.
    fruta_similar(Dulzura, Acidez, Fruta),  % Determinamos la fruta más similar a las respuestas del usuario.
    format('¡Eres como una ~w!', [Fruta]).  % Mostramos el resultado al usuario.