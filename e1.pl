% Reglas difusas que relacionan estados de ánimo con géneros de películas de Studio Ghibli
% Utilizaremos reglas hechas a mano

% Si el usuario está muy triste, recomendar dramas
recomendacion(estado_animo(triste), genero_pelicula(drama)).

% Si el usuario está contento, recomendar películas de fantasía
recomendacion(estado_animo(contento), genero_pelicula(fantasia)).

% Si el usuario está emocionado, recomendar películas de aventura
recomendacion(estado_animo(emocionado), genero_pelicula(aventura)).

% Hechos que representan películas disponibles del Studio Ghibli
pelicula('El Viaje de Chihiro', fantasia).
pelicula('Mi Vecino Totoro', fantasia).
pelicula('La Princesa Mononoke', aventura).
pelicula('El Castillo Ambulante', fantasia).
pelicula('El Viento se Levanta', drama).
pelicula('Kiki: Entregas a Domicilio', aventura).

% Predicado para recomendar películas basadas en el estado de ánimo del usuario
recomendar_pelicula(AnimoUsuario, PeliculaRecomendada) :-
    recomendacion(estado_animo(AnimoUsuario), genero_pelicula(Genero)),
    pelicula(PeliculaRecomendada, Genero).


