const sqlite3 = require('sqlite3').verbose();
const path = require('path');

const db = new sqlite3.Database(path.join(__dirname, 'challenges.db'), (err) => {
    if (err) {
        console.error('Error al conectar a la BD:', err);
        process.exit(1);
    }
    console.log('Conectado a SQLite');
});

const challenges = [
    // LISTAS
    { nombre: "Crear Tu Primera Lista", descripcion: "Crea una lista con 5 números y imprime cada elemento", lenguaje: "Python", complejidad: "Fácil", nivel: "Básico", solucion: "numeros = [1, 2, 3, 4, 5]\nfor num in numeros:\n    print(num)", code_schema: "lista = [valores]\nfor item in lista:\n    print(item)", tags: "lista,bucle,básico" },
    { nombre: "Sumar Elementos", descripcion: "Suma todos los elementos de una lista de números", lenguaje: "Python", complejidad: "Fácil", nivel: "Básico", solucion: "numeros = [10, 20, 30, 40]\nsuma = sum(numeros)\nprint(suma)", code_schema: "lista = [números]\ntotal = sum(lista)", tags: "suma,función,básico" },
    { nombre: "Encontrar el Mayor", descripcion: "Encuentra el número más grande en una lista", lenguaje: "Python", complejidad: "Fácil", nivel: "Básico", solucion: "numeros = [15, 8, 42, 23, 5]\nmayor = max(numeros)\nprint(mayor)", code_schema: "lista = [números]\nmayor = max(lista)", tags: "máximo,comparación" },
    { nombre: "Contar Elementos", descripcion: "Cuenta cuántos elementos hay en una lista", lenguaje: "Python", complejidad: "Fácil", nivel: "Básico", solucion: "frutas = [\"manzana\", \"plátano\", \"naranja\"]\ncantidad = len(frutas)\nprint(cantidad)", code_schema: "lista = [elementos]\ncantidad = len(lista)", tags: "longitud,len" },
    { nombre: "Agregar Elementos", descripcion: "Agrega nuevos elementos a una lista existente", lenguaje: "Python", complejidad: "Fácil", nivel: "Básico", solucion: "colores = [\"rojo\", \"azul\"]\ncolores.append(\"verde\")\nprint(colores)", code_schema: "lista = [elementos]\nlista.append(elemento_nuevo)", tags: "append,mutabilidad" },
    { nombre: "Filtrar Pares", descripcion: "Crea una nueva lista solo con los números pares", lenguaje: "Python", complejidad: "Media", nivel: "Medio", solucion: "numeros = [1, 2, 3, 4, 5, 6, 7, 8]\npares = [n for n in numeros if n % 2 == 0]\nprint(pares)", code_schema: "lista = [números]\nresultado = [x for x in lista if x % 2 == 0]", tags: "comprensión,filtrado" },
    { nombre: "Invertir Lista", descripcion: "Invierte el orden de los elementos de una lista", lenguaje: "Python", complejidad: "Media", nivel: "Medio", solucion: "numeros = [1, 2, 3, 4, 5]\ninvertida = numeros[::-1]\nprint(invertida)", code_schema: "lista = [elementos]\ninvertida = lista[::-1]", tags: "slicing,orden" },
    { nombre: "Duplicar Elementos", descripcion: "Crea una lista que contenga cada elemento duplicado", lenguaje: "Python", complejidad: "Media", nivel: "Medio", solucion: "numeros = [1, 2, 3]\nduplicados = [x * 2 for x in numeros]\nprint(duplicados)", code_schema: "lista = [números]\nresultado = [x * 2 for x in lista]", tags: "transformación,map" },
    { nombre: "Eliminar Duplicados", descripcion: "Elimina elementos duplicados de una lista manteniendo el orden", lenguaje: "Python", complejidad: "Alta", nivel: "Avanzado", solucion: "numeros = [1, 2, 2, 3, 3, 3, 4]\nunicos = list(dict.fromkeys(numeros))\nprint(unicos)", code_schema: "lista = [elementos_con_duplicados]\nresultado = list(dict.fromkeys(lista))", tags: "deduplicación,diccionario" },
    { nombre: "Ordenar y Agrupar", descripcion: "Ordena una lista de números y agrupa impares y pares", lenguaje: "Python", complejidad: "Alta", nivel: "Avanzado", solucion: "numeros = [5, 2, 8, 1, 9, 3]\nimpares = [x for x in numeros if x % 2 != 0]\npares = [x for x in numeros if x % 2 == 0]\nprint(sorted(pares), sorted(impares))", code_schema: "lista = [números]\npares = [x for x in lista if x % 2 == 0]\nimpares = [x for x in lista if x % 2 != 0]", tags: "clasificación,ordenamiento" },

    // TUPLAS
    { nombre: "Crear Tu Primera Tupla", descripcion: "Crea una tupla con 3 elementos y accede al primero", lenguaje: "Python", complejidad: "Fácil", nivel: "Básico", solucion: "mi_tupla = (10, 20, 30)\nprint(mi_tupla[0])", code_schema: "tupla = (elemento1, elemento2, elemento3)\nprint(tupla[índice])", tags: "tupla,índice" },
    { nombre: "Desempaquetado de Tupla", descripcion: "Desempaqueta una tupla en variables individuales", lenguaje: "Python", complejidad: "Fácil", nivel: "Básico", solucion: "datos = (\"Juan\", 15, \"México\")\nnombre, edad, país = datos\nprint(nombre, edad)", code_schema: "tupla = (valor1, valor2, valor3)\nvar1, var2, var3 = tupla", tags: "unpacking,variables" },
    { nombre: "Contar en Tupla", descripcion: "Cuenta cuántos elementos hay en una tupla", lenguaje: "Python", complejidad: "Fácil", nivel: "Básico", solucion: "tupla = (2, 4, 6, 8, 10)\ncantidad = len(tupla)\nprint(cantidad)", code_schema: "tupla = (elementos)\ncantidad = len(tupla)", tags: "longitud,len" },
    { nombre: "Buscar en Tupla", descripcion: "Busca si un elemento existe en una tupla", lenguaje: "Python", complejidad: "Fácil", nivel: "Básico", solucion: "frutas = (\"manzana\", \"plátano\", \"naranja\")\nif \"plátano\" in frutas:\n    print(\"Encontrado\")", code_schema: "tupla = (elementos)\nif elemento in tupla:", tags: "búsqueda,in" },
    { nombre: "Tupla de Tuplas", descripcion: "Crea una tupla que contiene otras tuplas (matriz)", lenguaje: "Python", complejidad: "Fácil", nivel: "Básico", solucion: "matriz = ((1, 2), (3, 4), (5, 6))\nprint(matriz[0][1])", code_schema: "tupla = ((a, b), (c, d))\nprint(tupla[fila][columna])", tags: "anidada,matriz" },
    { nombre: "Convertir Lista a Tupla", descripcion: "Convierte una lista en tupla para hacerla inmutable", lenguaje: "Python", complejidad: "Media", nivel: "Medio", solucion: "lista = [1, 2, 3, 4]\ntupla = tuple(lista)\nprint(type(tupla))", code_schema: "lista = [elementos]\ntupla = tuple(lista)", tags: "conversión,tipo" },
    { nombre: "Contar Ocurrencias", descripcion: "Cuenta cuántas veces aparece un elemento en una tupla", lenguaje: "Python", complejidad: "Media", nivel: "Medio", solucion: "numeros = (1, 2, 2, 3, 2, 4, 2)\ncantidad = numeros.count(2)\nprint(cantidad)", code_schema: "tupla = (elementos)\ncantidad = tupla.count(elemento)", tags: "count,frecuencia" },
    { nombre: "Encontrar Índice", descripcion: "Encuentra el índice de un elemento en una tupla", lenguaje: "Python", complejidad: "Media", nivel: "Medio", solucion: "colores = (\"rojo\", \"verde\", \"azul\")\nindice = colores.index(\"verde\")\nprint(indice)", code_schema: "tupla = (elementos)\nindice = tupla.index(elemento)", tags: "index,búsqueda" },
    { nombre: "Fusionar Tuplas", descripcion: "Combine dos tuplas en una sola", lenguaje: "Python", complejidad: "Alta", nivel: "Avanzado", solucion: "tupla1 = (1, 2, 3)\ntupla2 = (4, 5, 6)\nfusionada = tupla1 + tupla2\nprint(fusionada)", code_schema: "tupla1 = (elementos1)\ntupla2 = (elementos2)\nresultado = tupla1 + tupla2", tags: "concatenación,operadores" },
    { nombre: "Tupla como Clave", descripcion: "Usa una tupla como clave en un diccionario", lenguaje: "Python", complejidad: "Alta", nivel: "Avanzado", solucion: "coordenadas = {(0, 0): \"origen\", (1, 1): \"diagonal\"}\nprint(coordenadas[(0, 0)])", code_schema: "diccionario = {(tupla_clave): valor}\nprint(diccionario[tupla_clave])", tags: "diccionario,clave" },

    // DICCIONARIOS
    { nombre: "Crear Tu Primer Diccionario", descripcion: "Crea un diccionario con información de una persona", lenguaje: "Python", complejidad: "Fácil", nivel: "Básico", solucion: "persona = {\"nombre\": \"Ana\", \"edad\": 16}\nprint(persona[\"nombre\"])", code_schema: "diccionario = {\"clave\": valor}\nprint(diccionario[\"clave\"])", tags: "diccionario,acceso" },
    { nombre: "Agregar Elemento", descripcion: "Agrega un nuevo par clave-valor a un diccionario", lenguaje: "Python", complejidad: "Fácil", nivel: "Básico", solucion: "estudiante = {\"nombre\": \"Carlos\"}\nestudiante[\"edad\"] = 17\nprint(estudiante)", code_schema: "diccionario = {}\ndiccionario[\"clave\"] = valor", tags: "mutabilidad,agregar" },
    { nombre: "Obtener Todas las Claves", descripcion: "Obtén todas las claves de un diccionario", lenguaje: "Python", complejidad: "Fácil", nivel: "Básico", solucion: "libro = {\"título\": \"Python\", \"autor\": \"Guido\", \"año\": 1991}\nprint(libro.keys())", code_schema: "diccionario = {...}\nclaves = diccionario.keys()", tags: "keys,iteración" },
    { nombre: "Obtener Todos los Valores", descripcion: "Obtén todos los valores de un diccionario", lenguaje: "Python", complejidad: "Fácil", nivel: "Básico", solucion: "calificaciones = {\"Matemáticas\": 85, \"Español\": 90}\nprint(list(calificaciones.values()))", code_schema: "diccionario = {...}\nvalores = diccionario.values()", tags: "values,extracción" },
    { nombre: "Verificar Clave", descripcion: "Verifica si una clave existe en un diccionario", lenguaje: "Python", complejidad: "Fácil", nivel: "Básico", solucion: "producto = {\"nombre\": \"Laptop\", \"precio\": 500}\nif \"precio\" in producto:\n    print(\"La clave existe\")", code_schema: "diccionario = {...}\nif \"clave\" in diccionario:", tags: "in,búsqueda" },
    { nombre: "Eliminar Elemento", descripcion: "Elimina un par clave-valor de un diccionario", lenguaje: "Python", complejidad: "Media", nivel: "Medio", solucion: "configuración = {\"idioma\": \"es\", \"tema\": \"oscuro\"}\ndel configuración[\"tema\"]\nprint(configuración)", code_schema: "diccionario = {...}\ndel diccionario[\"clave\"]", tags: "del,eliminación" },
    { nombre: "Iterar Diccionario", descripcion: "Recorre todos los pares clave-valor de un diccionario", lenguaje: "Python", complejidad: "Media", nivel: "Medio", solucion: "notas = {\"Ana\": 95, \"Luis\": 87, \"María\": 92}\nfor nombre, nota in notas.items():\n    print(f\"{nombre}: {nota}\")", code_schema: "diccionario = {...}\nfor clave, valor in diccionario.items():", tags: "items,bucle" },
    { nombre: "Diccionario Anidado", descripcion: "Crea un diccionario que contiene otros diccionarios", lenguaje: "Python", complejidad: "Media", nivel: "Medio", solucion: "escuela = {\"clase1\": {\"profesor\": \"Juan\", \"alumnos\": 30}}\nprint(escuela[\"clase1\"][\"profesor\"])", code_schema: "diccionario = {\"clave\": {\"subclave\": valor}}\nprint(diccionario[\"clave\"][\"subclave\"])", tags: "anidado,estructura" },
    { nombre: "Actualizar Diccionario", descripcion: "Actualiza un diccionario con valores de otro diccionario", lenguaje: "Python", complejidad: "Alta", nivel: "Avanzado", solucion: "diccionario1 = {\"a\": 1, \"b\": 2}\ndiccionario2 = {\"b\": 20, \"c\": 30}\ndiccionario1.update(diccionario2)\nprint(diccionario1)", code_schema: "diccionario1.update(diccionario2)", tags: "update,fusión" },
    { nombre: "Contar Frecuencias", descripcion: "Cuenta la frecuencia de cada elemento en una lista usando diccionario", lenguaje: "Python", complejidad: "Alta", nivel: "Avanzado", solucion: "letras = \"python\"\nfrecuencia = {}\nfor letra in letras:\n    frecuencia[letra] = frecuencia.get(letra, 0) + 1\nprint(frecuencia)", code_schema: "diccionario = {}\nfor item in lista:\n    diccionario[item] = diccionario.get(item, 0) + 1", tags: "get,conteo" },

    // CONJUNTOS
    { nombre: "Crear Tu Primer Conjunto", descripcion: "Crea un conjunto con 5 números únicos", lenguaje: "Python", complejidad: "Fácil", nivel: "Básico", solucion: "numeros = {1, 2, 3, 4, 5}\nprint(numeros)", code_schema: "conjunto = {elemento1, elemento2, elemento3}", tags: "conjunto,únicos" },
    { nombre: "Eliminar Duplicados", descripcion: "Convierte una lista con duplicados a un conjunto", lenguaje: "Python", complejidad: "Fácil", nivel: "Básico", solucion: "lista = [1, 2, 2, 3, 3, 3, 4]\nunicos = set(lista)\nprint(unicos)", code_schema: "lista = [elementos_con_repetición]\nconjunto = set(lista)", tags: "set,deduplicación" },
    { nombre: "Agregar Elemento", descripcion: "Agrega un nuevo elemento a un conjunto", lenguaje: "Python", complejidad: "Fácil", nivel: "Básico", solucion: "frutas = {\"manzana\", \"naranja\"}\nfrutas.add(\"plátano\")\nprint(frutas)", code_schema: "conjunto = {elementos}\nconjunto.add(elemento)", tags: "add,mutabilidad" },
    { nombre: "Verificar Pertenencia", descripcion: "Verifica si un elemento pertenece a un conjunto", lenguaje: "Python", complejidad: "Fácil", nivel: "Básico", solucion: "numeros = {10, 20, 30, 40}\nif 20 in numeros:\n    print(\"Está en el conjunto\")", code_schema: "conjunto = {elementos}\nif elemento in conjunto:", tags: "in,búsqueda" },
    { nombre: "Contar Elementos", descripcion: "Cuenta cuántos elementos hay en un conjunto", lenguaje: "Python", complejidad: "Fácil", nivel: "Básico", solucion: "colores = {\"rojo\", \"azul\", \"verde\", \"amarillo\"}\ncantidad = len(colores)\nprint(cantidad)", code_schema: "conjunto = {elementos}\ncantidad = len(conjunto)", tags: "len,tamaño" },
    { nombre: "Unión de Conjuntos", descripcion: "Combina dos conjuntos en uno (todos los elementos únicos)", lenguaje: "Python", complejidad: "Media", nivel: "Medio", solucion: "set1 = {1, 2, 3}\nset2 = {3, 4, 5}\nunion = set1 | set2\nprint(union)", code_schema: "conjunto1 = {elementos}\nconjunto2 = {elementos}\nunion = conjunto1 | conjunto2", tags: "unión,operador" },
    { nombre: "Intersección", descripcion: "Encuentra elementos comunes entre dos conjuntos", lenguaje: "Python", complejidad: "Media", nivel: "Medio", solucion: "set1 = {1, 2, 3, 4}\nset2 = {3, 4, 5, 6}\ncomun = set1 & set2\nprint(comun)", code_schema: "conjunto1 = {elementos}\nconjunto2 = {elementos}\nintersección = conjunto1 & conjunto2", tags: "intersección,común" },
    { nombre: "Diferencia", descripcion: "Encuentra elementos que están en un conjunto pero no en otro", lenguaje: "Python", complejidad: "Media", nivel: "Medio", solucion: "set1 = {1, 2, 3, 4}\nset2 = {3, 4, 5, 6}\ndiferencia = set1 - set2\nprint(diferencia)", code_schema: "conjunto1 = {elementos}\nconjunto2 = {elementos}\ndiferencia = conjunto1 - conjunto2", tags: "diferencia,exclusión" },
    { nombre: "Subconjunto y Superconjunto", descripcion: "Verifica si un conjunto es subconjunto de otro", lenguaje: "Python", complejidad: "Alta", nivel: "Avanzado", solucion: "set1 = {1, 2}\nset2 = {1, 2, 3, 4}\nprint(set1 <= set2)\nprint(set2 >= set1)", code_schema: "conjunto1 <= conjunto2  # subconjunto\nconjunto1 >= conjunto2  # superconjunto", tags: "subconjunto,relación" },
    { nombre: "Diferencia Simétrica", descripcion: "Elementos que están en un conjunto u otro pero no en ambos", lenguaje: "Python", complejidad: "Alta", nivel: "Avanzado", solucion: "set1 = {1, 2, 3, 4}\nset2 = {3, 4, 5, 6}\ndiferencia_simetrica = set1 ^ set2\nprint(diferencia_simetrica)", code_schema: "conjunto1 = {elementos}\nconjunto2 = {elementos}\ndiferencia_simetrica = conjunto1 ^ conjunto2", tags: "simétrica,xor" },

    // STRINGS
    { nombre: "Tu Primer String", descripcion: "Crea un string y accede a un carácter específico", lenguaje: "Python", complejidad: "Fácil", nivel: "Básico", solucion: "mensaje = \"Hola Mundo\"\nprint(mensaje[0])", code_schema: "string = \"texto\"\nprint(string[índice])", tags: "string,índice" },
    { nombre: "Longitud de String", descripcion: "Calcula la longitud de un string", lenguaje: "Python", complejidad: "Fácil", nivel: "Básico", solucion: "palabra = \"Python\"\nlongitud = len(palabra)\nprint(longitud)", code_schema: "string = \"texto\"\nlongitud = len(string)", tags: "len,longitud" },
    { nombre: "Convertir a Mayúsculas", descripcion: "Convierte un string a mayúsculas", lenguaje: "Python", complejidad: "Fácil", nivel: "Básico", solucion: "texto = \"python\"\nmayuscula = texto.upper()\nprint(mayuscula)", code_schema: "string = \"texto\"\nmayuscula = string.upper()", tags: "upper,mayúsculas" },
    { nombre: "Convertir a Minúsculas", descripcion: "Convierte un string a minúsculas", lenguaje: "Python", complejidad: "Fácil", nivel: "Básico", solucion: "texto = \"PYTHON\"\nminuscula = texto.lower()\nprint(minuscula)", code_schema: "string = \"TEXTO\"\nminuscula = string.lower()", tags: "lower,minúsculas" },
    { nombre: "Buscar Subcadena", descripcion: "Busca si una palabra existe dentro de un string", lenguaje: "Python", complejidad: "Fácil", nivel: "Básico", solucion: "frase = \"Me encanta programar\"\nif \"programar\" in frase:\n    print(\"Encontrado\")", code_schema: "string = \"texto\"\nif \"búsqueda\" in string:", tags: "in,búsqueda" },
    { nombre: "Dividir String", descripcion: "Divide un string en partes usando un separador", lenguaje: "Python", complejidad: "Media", nivel: "Medio", solucion: "texto = \"rojo,verde,azul\"\ncolores = texto.split(\",\")\nprint(colores)", code_schema: "string = \"texto\"\npartes = string.split(separador)", tags: "split,división" },
    { nombre: "Reemplazar Texto", descripcion: "Reemplaza una palabra por otra en un string", lenguaje: "Python", complejidad: "Media", nivel: "Medio", solucion: "frase = \"Amo Java\"\nnueva = frase.replace(\"Java\", \"Python\")\nprint(nueva)", code_schema: "string = \"texto\"\nnuevo = string.replace(\"viejo\", \"nuevo\")", tags: "replace,sustitución" },
    { nombre: "Concatenar Strings", descripcion: "Une varios strings en uno solo", lenguaje: "Python", complejidad: "Media", nivel: "Medio", solucion: "nombre = \"Juan\"\napellido = \"Pérez\"\ncompleto = nombre + \" \" + apellido\nprint(completo)", code_schema: "string1 = \"texto1\"\nstring2 = \"texto2\"\nresultado = string1 + string2", tags: "concatenación,+" },
    { nombre: "Slicing de String", descripcion: "Extrae una parte específica de un string", lenguaje: "Python", complejidad: "Alta", nivel: "Avanzado", solucion: "palabra = \"Python\"\ninicio = palabra[0:3]\nfinal = palabra[-3:]\ninvertida = palabra[::-1]\nprint(inicio, final, invertida)", code_schema: "string = \"texto\"\nparte = string[inicio:fin:paso]", tags: "slicing,índices" },
    { nombre: "F-strings (Formateo)", descripcion: "Formatea strings con variables de manera legible", lenguaje: "Python", complejidad: "Alta", nivel: "Avanzado", solucion: "nombre = \"Ana\"\nedad = 16\nmensaje = f\"Mi nombre es {nombre} y tengo {edad} años\"\nprint(mensaje)", code_schema: "variable = valor\nf\"texto {variable} más texto\"", tags: "f-string,formateo" }
];

function insertChallenges() {
    db.serialize(() => {
        const stmt = db.prepare(`
            INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        `);

        challenges.forEach(challenge => {
            stmt.run(
                challenge.nombre,
                challenge.descripcion,
                challenge.lenguaje,
                challenge.complejidad,
                challenge.nivel,
                challenge.solucion,
                challenge.code_schema,
                challenge.tags,
                (err) => {
                    if (err) {
                        console.error('Error al insertar:', err);
                    }
                }
            );
        });

        stmt.finalize(() => {
            console.log(`✅ Se insertaron ${challenges.length} challenges exitosamente`);
            db.close(() => {
                console.log('BD cerrada');
                process.exit(0);
            });
        });
    });
}

insertChallenges();
