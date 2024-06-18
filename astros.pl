%%hechos
planeta(mercurio).
planeta(venus).
planeta(tierra).
planeta(marte).
planeta(jupiter).
planeta(saturno).
planeta(urano).
planeta(neptuno).
astro(sirius).
astro(alfa_centauri).
astro(vega).
astro(proxima_centauri).

%%reglas
pertenece_sistema_solar(Planeta) :- planeta(Planeta).


