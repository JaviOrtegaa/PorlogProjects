%%hechos
compra(frutas, manzanas).
compra(frutas, platanos).
compra(lacteos, leche).
compra(panaderia, pan).

%%regla 
lista_compras(Categoria, Lista) :- findall(Producto, compra(Categoria, Producto), Lista).