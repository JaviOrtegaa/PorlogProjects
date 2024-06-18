// Definimos una función para calcular el mínimo de dos números.
function min(X, Y) {
    return (X <= Y) ? X : Y;
}

// Definimos las características de algunas frutas en términos de "dulzura" y "acidez".
// Las características están en una escala de 0 a 10.
// Puedes añadir más frutas y ajustar los valores según tu criterio.
const frutas = [
    { nombre: 'naranja', dulzura: 6, acidez: 8 },
    { nombre: 'plátano', dulzura: 8, acidez: 2 },
    { nombre: 'fresa', dulzura: 7, acidez: 3 },
    { nombre: 'manzana', dulzura: 5, acidez: 6 },
    { nombre: 'uva', dulzura: 7, acidez: 7 }
];

// Función de pertenencia triangular
// Devuelve 0 si x <= low, (x - low)/(mid - low) si low < x < mid, (high - x)/(high - mid) si mid < x < high, y 0 si x >= high.
function triangular_membership(X, Low, Mid, High) {
    if (X <= Low) {
        return 0;  // Si X es menor o igual que Low, la pertenencia es 0.
    } else if (X < Mid) {
        return (X - Low) / (Mid - Low);  // Si X está entre Low y Mid, calculamos la pertenencia utilizando una función lineal creciente.
    } else if (X <= High) {
        return (High - X) / (High - Mid);  // Si X está entre Mid y High, calculamos la pertenencia utilizando una función lineal decreciente.
    } else {
        return 0;  // Si X es mayor o igual que High, la pertenencia es 0.
    }
}

// Calcula la similitud entre las características de una fruta y las respuestas del usuario
function similitud_caracteristicas(Dulzura, Acidez, Fruta) {
    const fruta = frutas.find(f => f.nombre === Fruta); // Buscamos la fruta en el arreglo de frutas.
    const DulzuraF = fruta.dulzura;
    const AcidezF = fruta.acidez;
    const SimDulzura = triangular_membership(Dulzura, DulzuraF - 2, DulzuraF, DulzuraF + 2);  // Calculamos la pertenencia de la dulzura del usuario respecto a la fruta.
    const SimAcidez = triangular_membership(Acidez, AcidezF - 2, AcidezF, AcidezF + 2);  // Calculamos la pertenencia de la acidez del usuario respecto a la fruta.
    return min(SimDulzura, SimAcidez);  // La similitud entre las características de la fruta y las respuestas del usuario es el mínimo entre la pertenencia de la dulzura y la acidez.
}

// Encuentra la fruta más similar a las respuestas del usuario
function fruta_similar(Dulzura, Acidez) {
    let maxSimilitud = -1;
    let frutaSimilar = '';
    for (const fruta of frutas) {
        const similitud = similitud_caracteristicas(Dulzura, Acidez, fruta.nombre);
        if (similitud > maxSimilitud) {
            maxSimilitud = similitud;
            frutaSimilar = fruta.nombre;
        }
    }
    return frutaSimilar;
}

// Predicado para preguntar y determinar qué tipo de fruta eres.
function test_fruta() {
    const readline = require('readline');
    const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });

    rl.question('¿Cuán dulce te consideras? (0-10) ', (dulzura) => {
        rl.question('¿Cuán ácido te consideras? (0-10) ', (acidez) => {
            const fruta = fruta_similar(parseInt(dulzura), parseInt(acidez));
            console.log(`¡Eres como una ${fruta}!`);
            rl.close();
        });
    });
}

test_fruta();
