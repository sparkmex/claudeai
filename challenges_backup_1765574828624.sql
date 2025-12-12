-- Respaldo de Challenge Manager Academy
-- Generado el: 12/12/2025, 15:27:08
-- Total de challenges: 99

-- ===== DDL (Estructura) =====

DROP TABLE IF EXISTS challenges;
CREATE TABLE challenges (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nombre_challenge TEXT NOT NULL,
      descripcion_challenge TEXT,
      lenguaje TEXT,
      complejidad TEXT,
      nivel TEXT,
      solucion_challenge TEXT,
      code_schema TEXT,
      tags TEXT,
      imagen_url TEXT,
      video_demostracion TEXT DEFAULT 'No disponible',
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
    );

-- ===== INSERTS (Datos) =====

INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Crear Tu Primera Lista', 'Crea una lista con 5 números y imprime cada elemento', 'Python', 'Fácil', 'Básico', 'numeros = [1, 2, 3, 4, 5]
for num in numeros:
    print(num)', 'lista = [valores]
for item in lista:
    print(item)', 'lista,bucle,básico', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Sumar Elementos', 'Suma todos los elementos de una lista de números', 'Python', 'Fácil', 'Básico', 'numeros = [10, 20, 30, 40]
suma = sum(numeros)
print(suma)', 'lista = [números]
total = sum(lista)', 'suma,función,básico', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Encontrar el Mayor', 'Encuentra el número más grande en una lista', 'Python', 'Fácil', 'Básico', 'numeros = [15, 8, 42, 23, 5]
mayor = max(numeros)
print(mayor)', 'lista = [números]
mayor = max(lista)', 'máximo,comparación', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Contar Elementos', 'Cuenta cuántos elementos hay en una lista', 'Python', 'Fácil', 'Básico', 'frutas = ["manzana", "plátano", "naranja"]
cantidad = len(frutas)
print(cantidad)', 'lista = [elementos]
cantidad = len(lista)', 'longitud,len', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Agregar Elementos', 'Agrega nuevos elementos a una lista existente', 'Python', 'Fácil', 'Básico', 'colores = ["rojo", "azul"]
colores.append("verde")
print(colores)', 'lista = [elementos]
lista.append(elemento_nuevo)', 'append,mutabilidad', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Filtrar Pares', 'Crea una nueva lista solo con los números pares', 'Python', 'Media', 'Medio', 'numeros = [1, 2, 3, 4, 5, 6, 7, 8]
pares = [n for n in numeros if n % 2 == 0]
print(pares)', 'lista = [números]
resultado = [x for x in lista if x % 2 == 0]', 'comprensión,filtrado', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Invertir Lista', 'Invierte el orden de los elementos de una lista', 'Python', 'Media', 'Medio', 'numeros = [1, 2, 3, 4, 5]
invertida = numeros[::-1]
print(invertida)', 'lista = [elementos]
invertida = lista[::-1]', 'slicing,orden', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Duplicar Elementos', 'Crea una lista que contenga cada elemento duplicado', 'Python', 'Media', 'Medio', 'numeros = [1, 2, 3]
duplicados = [x * 2 for x in numeros]
print(duplicados)', 'lista = [números]
resultado = [x * 2 for x in lista]', 'transformación,map', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Eliminar Duplicados', 'Elimina elementos duplicados de una lista manteniendo el orden', 'Python', 'Alta', 'Avanzado', 'numeros = [1, 2, 2, 3, 3, 3, 4]
unicos = list(dict.fromkeys(numeros))
print(unicos)', 'lista = [elementos_con_duplicados]
resultado = list(dict.fromkeys(lista))', 'deduplicación,diccionario', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Ordenar y Agrupar', 'Ordena una lista de números y agrupa impares y pares', 'Python', 'Alta', 'Avanzado', 'numeros = [5, 2, 8, 1, 9, 3]
impares = [x for x in numeros if x % 2 != 0]
pares = [x for x in numeros if x % 2 == 0]
print(sorted(pares), sorted(impares))', 'lista = [números]
pares = [x for x in lista if x % 2 == 0]
impares = [x for x in lista if x % 2 != 0]', 'clasificación,ordenamiento', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Crear Tu Primera Tupla', 'Crea una tupla con 3 elementos y accede al primero', 'Python', 'Fácil', 'Básico', 'mi_tupla = (10, 20, 30)
print(mi_tupla[0])', 'tupla = (elemento1, elemento2, elemento3)
print(tupla[índice])', 'tupla,índice', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Desempaquetado de Tupla', 'Desempaqueta una tupla en variables individuales', 'Python', 'Fácil', 'Básico', 'datos = ("Juan", 15, "México")
nombre, edad, país = datos
print(nombre, edad)', 'tupla = (valor1, valor2, valor3)
var1, var2, var3 = tupla', 'unpacking,variables', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Contar en Tupla', 'Cuenta cuántos elementos hay en una tupla', 'Python', 'Fácil', 'Básico', 'tupla = (2, 4, 6, 8, 10)
cantidad = len(tupla)
print(cantidad)', 'tupla = (elementos)
cantidad = len(tupla)', 'longitud,len', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Buscar en Tupla', 'Busca si un elemento existe en una tupla', 'Python', 'Fácil', 'Básico', 'frutas = ("manzana", "plátano", "naranja")
if "plátano" in frutas:
    print("Encontrado")', 'tupla = (elementos)
if elemento in tupla:', 'búsqueda,in', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Tupla de Tuplas', 'Crea una tupla que contiene otras tuplas (matriz)', 'Python', 'Fácil', 'Básico', 'matriz = ((1, 2), (3, 4), (5, 6))
print(matriz[0][1])', 'tupla = ((a, b), (c, d))
print(tupla[fila][columna])', 'anidada,matriz', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Convertir Lista a Tupla', 'Convierte una lista en tupla para hacerla inmutable', 'Python', 'Media', 'Medio', 'lista = [1, 2, 3, 4]
tupla = tuple(lista)
print(type(tupla))', 'lista = [elementos]
tupla = tuple(lista)', 'conversión,tipo', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Contar Ocurrencias', 'Cuenta cuántas veces aparece un elemento en una tupla', 'Python', 'Media', 'Medio', 'numeros = (1, 2, 2, 3, 2, 4, 2)
cantidad = numeros.count(2)
print(cantidad)', 'tupla = (elementos)
cantidad = tupla.count(elemento)', 'count,frecuencia', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Encontrar Índice', 'Encuentra el índice de un elemento en una tupla', 'Python', 'Media', 'Medio', 'colores = ("rojo", "verde", "azul")
indice = colores.index("verde")
print(indice)', 'tupla = (elementos)
indice = tupla.index(elemento)', 'index,búsqueda', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Fusionar Tuplas', 'Combine dos tuplas en una sola', 'Python', 'Alta', 'Avanzado', 'tupla1 = (1, 2, 3)
tupla2 = (4, 5, 6)
fusionada = tupla1 + tupla2
print(fusionada)', 'tupla1 = (elementos1)
tupla2 = (elementos2)
resultado = tupla1 + tupla2', 'concatenación,operadores', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Tupla como Clave', 'Usa una tupla como clave en un diccionario', 'Python', 'Alta', 'Avanzado', 'coordenadas = {(0, 0): "origen", (1, 1): "diagonal"}
print(coordenadas[(0, 0)])', 'diccionario = {(tupla_clave): valor}
print(diccionario[tupla_clave])', 'diccionario,clave', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Crear Tu Primer Diccionario', 'Crea un diccionario con información de una persona', 'Python', 'Fácil', 'Básico', 'persona = {"nombre": "Ana", "edad": 16}
print(persona["nombre"])', 'diccionario = {"clave": valor}
print(diccionario["clave"])', 'diccionario,acceso', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Agregar Elemento', 'Agrega un nuevo par clave-valor a un diccionario', 'Python', 'Fácil', 'Básico', 'estudiante = {"nombre": "Carlos"}
estudiante["edad"] = 17
print(estudiante)', 'diccionario = {}
diccionario["clave"] = valor', 'mutabilidad,agregar', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Obtener Todas las Claves', 'Obtén todas las claves de un diccionario', 'Python', 'Fácil', 'Básico', 'libro = {"título": "Python", "autor": "Guido", "año": 1991}
print(libro.keys())', 'diccionario = {...}
claves = diccionario.keys()', 'keys,iteración', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Obtener Todos los Valores', 'Obtén todos los valores de un diccionario', 'Python', 'Fácil', 'Básico', 'calificaciones = {"Matemáticas": 85, "Español": 90}
print(list(calificaciones.values()))', 'diccionario = {...}
valores = diccionario.values()', 'values,extracción', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Verificar Clave', 'Verifica si una clave existe en un diccionario', 'Python', 'Fácil', 'Básico', 'producto = {"nombre": "Laptop", "precio": 500}
if "precio" in producto:
    print("La clave existe")', 'diccionario = {...}
if "clave" in diccionario:', 'in,búsqueda', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Eliminar Elemento', 'Elimina un par clave-valor de un diccionario', 'Python', 'Media', 'Medio', 'configuración = {"idioma": "es", "tema": "oscuro"}
del configuración["tema"]
print(configuración)', 'diccionario = {...}
del diccionario["clave"]', 'del,eliminación', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Iterar Diccionario', 'Recorre todos los pares clave-valor de un diccionario', 'Python', 'Media', 'Medio', 'notas = {"Ana": 95, "Luis": 87, "María": 92}
for nombre, nota in notas.items():
    print(f"{nombre}: {nota}")', 'diccionario = {...}
for clave, valor in diccionario.items():', 'items,bucle', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Diccionario Anidado', 'Crea un diccionario que contiene otros diccionarios', 'Python', 'Media', 'Medio', 'escuela = {"clase1": {"profesor": "Juan", "alumnos": 30}}
print(escuela["clase1"]["profesor"])', 'diccionario = {"clave": {"subclave": valor}}
print(diccionario["clave"]["subclave"])', 'anidado,estructura', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Actualizar Diccionario', 'Actualiza un diccionario con valores de otro diccionario', 'Python', 'Alta', 'Avanzado', 'diccionario1 = {"a": 1, "b": 2}
diccionario2 = {"b": 20, "c": 30}
diccionario1.update(diccionario2)
print(diccionario1)', 'diccionario1.update(diccionario2)', 'update,fusión', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Contar Frecuencias', 'Cuenta la frecuencia de cada elemento en una lista usando diccionario', 'Python', 'Alta', 'Avanzado', 'letras = "python"
frecuencia = {}
for letra in letras:
    frecuencia[letra] = frecuencia.get(letra, 0) + 1
print(frecuencia)', 'diccionario = {}
for item in lista:
    diccionario[item] = diccionario.get(item, 0) + 1', 'get,conteo', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Crear Tu Primer Conjunto', 'Crea un conjunto con 5 números únicos', 'Python', 'Fácil', 'Básico', 'numeros = {1, 2, 3, 4, 5}
print(numeros)', 'conjunto = {elemento1, elemento2, elemento3}', 'conjunto,únicos', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Eliminar Duplicados', 'Convierte una lista con duplicados a un conjunto', 'Python', 'Fácil', 'Básico', 'lista = [1, 2, 2, 3, 3, 3, 4]
unicos = set(lista)
print(unicos)', 'lista = [elementos_con_repetición]
conjunto = set(lista)', 'set,deduplicación', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Agregar Elemento', 'Agrega un nuevo elemento a un conjunto', 'Python', 'Fácil', 'Básico', 'frutas = {"manzana", "naranja"}
frutas.add("plátano")
print(frutas)', 'conjunto = {elementos}
conjunto.add(elemento)', 'add,mutabilidad', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Verificar Pertenencia', 'Verifica si un elemento pertenece a un conjunto', 'Python', 'Fácil', 'Básico', 'numeros = {10, 20, 30, 40}
if 20 in numeros:
    print("Está en el conjunto")', 'conjunto = {elementos}
if elemento in conjunto:', 'in,búsqueda', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Contar Elementos', 'Cuenta cuántos elementos hay en un conjunto', 'Python', 'Fácil', 'Básico', 'colores = {"rojo", "azul", "verde", "amarillo"}
cantidad = len(colores)
print(cantidad)', 'conjunto = {elementos}
cantidad = len(conjunto)', 'len,tamaño', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Unión de Conjuntos', 'Combina dos conjuntos en uno (todos los elementos únicos)', 'Python', 'Media', 'Medio', 'set1 = {1, 2, 3}
set2 = {3, 4, 5}
union = set1 | set2
print(union)', 'conjunto1 = {elementos}
conjunto2 = {elementos}
union = conjunto1 | conjunto2', 'unión,operador', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Intersección', 'Encuentra elementos comunes entre dos conjuntos', 'Python', 'Media', 'Medio', 'set1 = {1, 2, 3, 4}
set2 = {3, 4, 5, 6}
comun = set1 & set2
print(comun)', 'conjunto1 = {elementos}
conjunto2 = {elementos}
intersección = conjunto1 & conjunto2', 'intersección,común', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Diferencia', 'Encuentra elementos que están en un conjunto pero no en otro', 'Python', 'Media', 'Medio', 'set1 = {1, 2, 3, 4}
set2 = {3, 4, 5, 6}
diferencia = set1 - set2
print(diferencia)', 'conjunto1 = {elementos}
conjunto2 = {elementos}
diferencia = conjunto1 - conjunto2', 'diferencia,exclusión', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Subconjunto y Superconjunto', 'Verifica si un conjunto es subconjunto de otro', 'Python', 'Alta', 'Avanzado', 'set1 = {1, 2}
set2 = {1, 2, 3, 4}
print(set1 <= set2)
print(set2 >= set1)', 'conjunto1 <= conjunto2  # subconjunto
conjunto1 >= conjunto2  # superconjunto', 'subconjunto,relación', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Diferencia Simétrica', 'Elementos que están en un conjunto u otro pero no en ambos', 'Python', 'Alta', 'Avanzado', 'set1 = {1, 2, 3, 4}
set2 = {3, 4, 5, 6}
diferencia_simetrica = set1 ^ set2
print(diferencia_simetrica)', 'conjunto1 = {elementos}
conjunto2 = {elementos}
diferencia_simetrica = conjunto1 ^ conjunto2', 'simétrica,xor', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Tu Primer String', 'Crea un string y accede a un carácter específico', 'Python', 'Fácil', 'Básico', 'mensaje = "Hola Mundo"
print(mensaje[0])', 'string = "texto"
print(string[índice])', 'string,índice', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Longitud de String', 'Calcula la longitud de un string', 'Python', 'Fácil', 'Básico', 'palabra = "Python"
longitud = len(palabra)
print(longitud)', 'string = "texto"
longitud = len(string)', 'len,longitud', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Convertir a Mayúsculas', 'Convierte un string a mayúsculas', 'Python', 'Fácil', 'Básico', 'texto = "python"
mayuscula = texto.upper()
print(mayuscula)', 'string = "texto"
mayuscula = string.upper()', 'upper,mayúsculas', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Convertir a Minúsculas', 'Convierte un string a minúsculas', 'Python', 'Fácil', 'Básico', 'texto = "PYTHON"
minuscula = texto.lower()
print(minuscula)', 'string = "TEXTO"
minuscula = string.lower()', 'lower,minúsculas', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Buscar Subcadena', 'Busca si una palabra existe dentro de un string', 'Python', 'Fácil', 'Básico', 'frase = "Me encanta programar"
if "programar" in frase:
    print("Encontrado")', 'string = "texto"
if "búsqueda" in string:', 'in,búsqueda', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Dividir String', 'Divide un string en partes usando un separador', 'Python', 'Media', 'Medio', 'texto = "rojo,verde,azul"
colores = texto.split(",")
print(colores)', 'string = "texto"
partes = string.split(separador)', 'split,división', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Reemplazar Texto', 'Reemplaza una palabra por otra en un string', 'Python', 'Media', 'Medio', 'frase = "Amo Java"
nueva = frase.replace("Java", "Python")
print(nueva)', 'string = "texto"
nuevo = string.replace("viejo", "nuevo")', 'replace,sustitución', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Concatenar Strings', 'Une varios strings en uno solo', 'Python', 'Media', 'Medio', 'nombre = "Juan"
apellido = "Pérez"
completo = nombre + " " + apellido
print(completo)', 'string1 = "texto1"
string2 = "texto2"
resultado = string1 + string2', 'concatenación,+', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Slicing de String', 'Extrae una parte específica de un string', 'Python', 'Alta', 'Avanzado', 'palabra = "Python"
inicio = palabra[0:3]
final = palabra[-3:]
invertida = palabra[::-1]
print(inicio, final, invertida)', 'string = "texto"
parte = string[inicio:fin:paso]', 'slicing,índices', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('F-strings (Formateo)', 'Formatea strings con variables de manera legible', 'Python', 'Alta', 'Avanzado', 'nombre = "Ana"
edad = 16
mensaje = f"Mi nombre es {nombre} y tengo {edad} años"
print(mensaje)', 'variable = valor
f"texto {variable} más texto"', 'f-string,formateo', NULL, 'No disponible', datetime('2025-12-12 21:23:28'), datetime('2025-12-12 21:23:28'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Seleccionar Todas las Columnas', 'Obtén todos los datos de la tabla estudiantes | Output: Todos los registros con todas las columnas', 'SQL', 'Fácil', 'Básico', 'SELECT * FROM estudiantes;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT,
  ciudad VARCHAR(100)
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT,
  ciudad VARCHAR(100)
);

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT,
  ciudad VARCHAR(100)
);', 'SELECT,básico,*', NULL, 'https://www.youtube.com/watch?v=11myFhHEpKg&list=RDGMEM2VCIgaiSqOfVzBAjPJm-agVMmFcI_fzEQSU&index=3', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:25:01'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Seleccionar Columna Específica', 'Obtén solo los nombres de todos los estudiantes | Output: Columna nombre de todos los registros', 'SQL', 'Fácil', 'Básico', 'SELECT nombre FROM estudiantes;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);', 'SELECT,columna,específica', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Seleccionar Dos Columnas', 'Obtén nombre y edad de todos los estudiantes | Output: Dos columnas (nombre, edad)', 'SQL', 'Fácil', 'Básico', 'SELECT nombre, edad FROM estudiantes;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT,
  ciudad VARCHAR(100)
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT,
  ciudad VARCHAR(100)
);

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT,
  ciudad VARCHAR(100)
);', 'SELECT,múltiples,columnas', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Alias de Columna', 'Obtén edad renombrada como ''años'' | Output: Columna edad con alias ''años''', 'SQL', 'Fácil', 'Básico', 'SELECT nombre, edad AS años FROM estudiantes;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);', 'alias,AS,SELECT', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Valores Únicos', 'Obtén todas las ciudades sin duplicados | Output: Lista de ciudades únicas', 'SQL', 'Fácil', 'Básico', 'SELECT DISTINCT ciudad FROM estudiantes;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  ciudad VARCHAR(100)
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  ciudad VARCHAR(100)
);

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  ciudad VARCHAR(100)
);', 'DISTINCT,único,eliminación', NULL, 'https://www.youtube.com/watch?v=11myFhHEpKg&list=RDGMEM2VCIgaiSqOfVzBAjPJm-agVMmFcI_fzEQSU&index=3', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:46'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Contar Registros', '¿Cuántos estudiantes hay en total? | Output: Un número: cantidad total de estudiantes', 'SQL', 'Fácil', 'Básico', 'SELECT COUNT(*) FROM estudiantes;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100)
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100)
);

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100)
);', 'COUNT,agregado,total', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Contar Columna Específica', '¿Cuántos estudiantes tienen edad registrada? | Output: Cantidad de registros con edad no nula', 'SQL', 'Fácil', 'Básico', 'SELECT COUNT(edad) FROM estudiantes;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);', 'COUNT,nulo,columna', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Promedio de Valores', '¿Cuál es la edad promedio de los estudiantes? | Output: Un número: promedio de edades', 'SQL', 'Fácil', 'Básico', 'SELECT AVG(edad) FROM estudiantes;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);', 'AVG,promedio,agregado', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Valor Máximo', '¿Cuál es la edad máxima registrada? | Output: Un número: edad máxima', 'SQL', 'Fácil', 'Básico', 'SELECT MAX(edad) FROM estudiantes;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);', 'MAX,máximo,agregado', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Valor Mínimo', '¿Cuál es la edad mínima registrada? | Output: Un número: edad mínima', 'SQL', 'Fácil', 'Básico', 'SELECT MIN(edad) FROM estudiantes;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);', 'MIN,mínimo,agregado', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Filtrar por Igualdad', 'Obtén todos los estudiantes de Madrid | Output: Registros donde ciudad es Madrid', 'SQL', 'Fácil', 'Básico', 'SELECT * FROM estudiantes WHERE ciudad = ''Madrid'';', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  ciudad VARCHAR(100)
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  ciudad VARCHAR(100)
);

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  ciudad VARCHAR(100)
);', 'WHERE,igualdad,filtro', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Filtrar Mayor que', 'Obtén estudiantes mayores de 18 años | Output: Registros con edad > 18', 'SQL', 'Fácil', 'Básico', 'SELECT * FROM estudiantes WHERE edad > 18;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);', 'WHERE,comparación,>', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Filtrar Menor que', 'Obtén estudiantes menores de 16 años | Output: Registros con edad < 16', 'SQL', 'Fácil', 'Básico', 'SELECT * FROM estudiantes WHERE edad < 16;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);', 'WHERE,comparación,<', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Filtrar Diferente', 'Obtén estudiantes que no sean de Barcelona | Output: Registros donde ciudad no es Barcelona', 'SQL', 'Fácil', 'Básico', 'SELECT * FROM estudiantes WHERE ciudad != ''Barcelona'';', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  ciudad VARCHAR(100)
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  ciudad VARCHAR(100)
);

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  ciudad VARCHAR(100)
);', 'WHERE,!=,diferente', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('AND Lógico', 'Obtén estudiantes de Madrid mayores de 20 años | Output: Registros de Madrid con edad > 20', 'SQL', 'Media', 'Medio', 'SELECT * FROM estudiantes WHERE ciudad = ''Madrid'' AND edad > 20;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT,
  ciudad VARCHAR(100)
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT,
  ciudad VARCHAR(100)
);

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT,
  ciudad VARCHAR(100)
);', 'AND,lógico,WHERE', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('OR Lógico', 'Obtén estudiantes de Madrid o Barcelona | Output: Registros de Madrid o Barcelona', 'SQL', 'Media', 'Medio', 'SELECT * FROM estudiantes WHERE ciudad = ''Madrid'' OR ciudad = ''Barcelona'';', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  ciudad VARCHAR(100)
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  ciudad VARCHAR(100)
);

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  ciudad VARCHAR(100)
);', 'OR,lógico,WHERE', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('IN (Múltiples Valores)', 'Obtén estudiantes de Madrid, Barcelona o Valencia | Output: Registros de esas 3 ciudades', 'SQL', 'Media', 'Medio', 'SELECT * FROM estudiantes WHERE ciudad IN (''Madrid'', ''Barcelona'', ''Valencia'');', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  ciudad VARCHAR(100)
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  ciudad VARCHAR(100)
);

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  ciudad VARCHAR(100)
);', 'IN,múltiple,WHERE', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('BETWEEN (Rango)', 'Obtén estudiantes entre 18 y 25 años | Output: Registros con 18 ≤ edad ≤ 25', 'SQL', 'Media', 'Medio', 'SELECT * FROM estudiantes WHERE edad BETWEEN 18 AND 25;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);', 'BETWEEN,rango,WHERE', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('LIKE (Búsqueda Inicio)', 'Obtén estudiantes cuyo nombre empieza con ''A'' | Output: Registros con nombre que inicia con A', 'SQL', 'Media', 'Medio', 'SELECT * FROM estudiantes WHERE nombre LIKE ''A%'';', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100)
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100)
);

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100)
);', 'LIKE,patrón,búsqueda', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('LIKE (Terminación)', 'Obtén estudiantes cuyo nombre termina con ''o'' | Output: Registros con nombre que termina con o', 'SQL', 'Media', 'Medio', 'SELECT * FROM estudiantes WHERE nombre LIKE ''%o'';', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100)
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100)
);

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100)
);', 'LIKE,patrón,búsqueda', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Ordenar Ascendente', 'Obtén estudiantes ordenados por edad (menor a mayor) | Output: Registros ordenados por edad ascendente', 'SQL', 'Fácil', 'Básico', 'SELECT * FROM estudiantes ORDER BY edad ASC;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);', 'ORDER BY,ASC,ordenamiento', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Ordenar Descendente', 'Obtén estudiantes ordenados por edad (mayor a menor) | Output: Registros ordenados por edad descendente', 'SQL', 'Fácil', 'Básico', 'SELECT * FROM estudiantes ORDER BY edad DESC;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);', 'ORDER BY,DESC,ordenamiento', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Ordenar Alfabético', 'Obtén estudiantes ordenados por nombre alfabéticamente | Output: Registros ordenados por nombre A-Z', 'SQL', 'Fácil', 'Básico', 'SELECT * FROM estudiantes ORDER BY nombre ASC;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100)
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100)
);

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100)
);', 'ORDER BY,alfabético,ordenamiento', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('LIMIT (Primeros N)', 'Obtén solo los 5 primeros estudiantes | Output: Solo 5 registros', 'SQL', 'Fácil', 'Básico', 'SELECT * FROM estudiantes LIMIT 5;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100)
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100)
);

SQL Server:
SELECT TOP 5 * FROM estudiantes;', 'LIMIT,restricción,TOP', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('TOP N Estudiantes por Edad', 'Obtén los 3 estudiantes más jóvenes | Output: 3 registros con menor edad', 'SQL', 'Media', 'Medio', 'SELECT * FROM estudiantes ORDER BY edad ASC LIMIT 3;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);

SQL Server:
SELECT TOP 3 * FROM estudiantes ORDER BY edad ASC;', 'ORDER BY,LIMIT,TOP,ordenamiento', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Ordenar Múltiples Columnas', 'Ordenar por ciudad y luego por nombre | Output: Registros ordenados por ciudad y luego por nombre', 'SQL', 'Media', 'Medio', 'SELECT * FROM estudiantes ORDER BY ciudad ASC, nombre ASC;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  ciudad VARCHAR(100)
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  ciudad VARCHAR(100)
);

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  ciudad VARCHAR(100)
);', 'ORDER BY,múltiple,ordenamiento', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('OFFSET y LIMIT (Paginación)', 'Obtén registros 6-10 (segunda página) | Output: 5 registros saltando los 5 primeros', 'SQL', 'Media', 'Medio', 'SELECT * FROM estudiantes LIMIT 5 OFFSET 5;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100)
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100)
);

SQL Server:
SELECT * FROM estudiantes OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;', 'OFFSET,LIMIT,paginación', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Contar por Grupo', '¿Cuántos estudiantes hay en cada ciudad? | Output: Filas: ciudad | cantidad', 'SQL', 'Media', 'Medio', 'SELECT ciudad, COUNT(*) FROM estudiantes GROUP BY ciudad;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  ciudad VARCHAR(100)
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  ciudad VARCHAR(100)
);

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  ciudad VARCHAR(100)
);', 'GROUP BY,COUNT,agregado', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Promedio por Grupo', '¿Cuál es la edad promedio en cada ciudad? | Output: Filas: ciudad | promedio_edad', 'SQL', 'Media', 'Medio', 'SELECT ciudad, AVG(edad) FROM estudiantes GROUP BY ciudad;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  ciudad VARCHAR(100),
  edad INT
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  ciudad VARCHAR(100),
  edad INT
);

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  ciudad VARCHAR(100),
  edad INT
);', 'GROUP BY,AVG,agregado', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Máximo por Grupo', '¿Cuál es la edad máxima en cada ciudad? | Output: Filas: ciudad | edad_máxima', 'SQL', 'Media', 'Medio', 'SELECT ciudad, MAX(edad) FROM estudiantes GROUP BY ciudad;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  ciudad VARCHAR(100),
  edad INT
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  ciudad VARCHAR(100),
  edad INT
);

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  ciudad VARCHAR(100),
  edad INT
);', 'GROUP BY,MAX,agregado', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Mínimo por Grupo', '¿Cuál es la edad mínima en cada ciudad? | Output: Filas: ciudad | edad_mínima', 'SQL', 'Media', 'Medio', 'SELECT ciudad, MIN(edad) FROM estudiantes GROUP BY ciudad;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  ciudad VARCHAR(100),
  edad INT
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  ciudad VARCHAR(100),
  edad INT
);

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  ciudad VARCHAR(100),
  edad INT
);', 'GROUP BY,MIN,agregado', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Suma por Grupo', '¿Cuál es el total de edad en cada ciudad? | Output: Filas: ciudad | suma_edad', 'SQL', 'Media', 'Medio', 'SELECT ciudad, SUM(edad) FROM estudiantes GROUP BY ciudad;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  ciudad VARCHAR(100),
  edad INT
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  ciudad VARCHAR(100),
  edad INT
);

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  ciudad VARCHAR(100),
  edad INT
);', 'GROUP BY,SUM,agregado', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('GROUP BY Múltiples Columnas', 'Contar estudiantes por ciudad y edad | Output: Filas: ciudad | edad | cantidad', 'SQL', 'Media', 'Medio', 'SELECT ciudad, edad, COUNT(*) FROM estudiantes GROUP BY ciudad, edad;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  ciudad VARCHAR(100),
  edad INT
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  ciudad VARCHAR(100),
  edad INT
);

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  ciudad VARCHAR(100),
  edad INT
);', 'GROUP BY,múltiple,agregado', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('HAVING (Filtrar Grupos)', 'Ciudades con más de 5 estudiantes | Output: Solo ciudades con más de 5 estudiantes', 'SQL', 'Alta', 'Avanzado', 'SELECT ciudad, COUNT(*) FROM estudiantes GROUP BY ciudad HAVING COUNT(*) > 5;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  ciudad VARCHAR(100)
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  ciudad VARCHAR(100)
);

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  ciudad VARCHAR(100)
);', 'HAVING,GROUP BY,filtro', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('HAVING con AVG', 'Ciudades con edad promedio mayor a 25 | Output: Ciudades con promedio > 25', 'SQL', 'Alta', 'Avanzado', 'SELECT ciudad, AVG(edad) FROM estudiantes GROUP BY ciudad HAVING AVG(edad) > 25;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  ciudad VARCHAR(100),
  edad INT
);

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  ciudad VARCHAR(100),
  edad INT
);

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  ciudad VARCHAR(100),
  edad INT
);', 'HAVING,AVG,filtro', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Fecha Actual', 'Obtén la fecha de hoy | Output: La fecha de hoy en formato YYYY-MM-DD', 'SQL', 'Fácil', 'Básico', 'SELECT CURRENT_DATE;', 'PostgreSQL: SELECT CURRENT_DATE;
MySQL: SELECT CURDATE();
SQL Server: SELECT CAST(GETDATE() AS DATE);', 'FECHA,CURRENT_DATE,función', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Extrae Año', '¿En qué año nació cada estudiante? | Output: Filas: nombre | año', 'SQL', 'Media', 'Medio', 'SELECT nombre, EXTRACT(YEAR FROM fecha_nacimiento) FROM estudiantes;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  fecha_nacimiento DATE
);
SELECT nombre, EXTRACT(YEAR FROM fecha_nacimiento) FROM estudiantes;

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  fecha_nacimiento DATE
);
SELECT nombre, YEAR(fecha_nacimiento) FROM estudiantes;

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  fecha_nacimiento DATE
);
SELECT nombre, YEAR(fecha_nacimiento) FROM estudiantes;', 'EXTRACT,YEAR,fecha', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Extrae Mes', '¿En qué mes nació cada estudiante? | Output: Filas: nombre | mes', 'SQL', 'Media', 'Medio', 'SELECT nombre, EXTRACT(MONTH FROM fecha_nacimiento) FROM estudiantes;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  fecha_nacimiento DATE
);
SELECT nombre, EXTRACT(MONTH FROM fecha_nacimiento) FROM estudiantes;

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  fecha_nacimiento DATE
);
SELECT nombre, MONTH(fecha_nacimiento) FROM estudiantes;

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  fecha_nacimiento DATE
);
SELECT nombre, MONTH(fecha_nacimiento) FROM estudiantes;', 'EXTRACT,MONTH,fecha', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Diferencia de Años', '¿Cuántos años tiene cada estudiante hoy? | Output: Filas: nombre | edad', 'SQL', 'Media', 'Medio', 'SELECT nombre, EXTRACT(YEAR FROM age(fecha_nacimiento)) FROM estudiantes;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  fecha_nacimiento DATE
);
SELECT nombre, EXTRACT(YEAR FROM age(fecha_nacimiento)) FROM estudiantes;

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  fecha_nacimiento DATE
);
SELECT nombre, YEAR(CURDATE()) - YEAR(fecha_nacimiento) FROM estudiantes;

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  fecha_nacimiento DATE
);
SELECT nombre, DATEDIFF(YEAR, fecha_nacimiento, CAST(GETDATE() AS DATE)) FROM estudiantes;', 'AGE,DATEDIFF,diferencia', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Filtrar por Rango de Fechas', 'Estudiantes nacidos entre 2000 y 2010 | Output: Registros nacidos entre 2000-2010', 'SQL', 'Media', 'Medio', 'SELECT * FROM estudiantes WHERE fecha_nacimiento BETWEEN ''2000-01-01'' AND ''2010-12-31'';', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  fecha_nacimiento DATE
);
SELECT * FROM estudiantes WHERE fecha_nacimiento BETWEEN ''2000-01-01'' AND ''2010-12-31'';

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  fecha_nacimiento DATE
);
SELECT * FROM estudiantes WHERE fecha_nacimiento BETWEEN ''2000-01-01'' AND ''2010-12-31'';

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  fecha_nacimiento DATE
);
SELECT * FROM estudiantes WHERE fecha_nacimiento BETWEEN ''2000-01-01'' AND ''2010-12-31'';', 'BETWEEN,fecha,rango', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('Estudiantes Mayores de Edad', 'Estudiantes con 18 años o más (nacidos antes de 2006) | Output: Estudiantes con 18+ años', 'SQL', 'Alta', 'Avanzado', 'SELECT * FROM estudiantes WHERE EXTRACT(YEAR FROM age(fecha_nacimiento)) >= 18;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  fecha_nacimiento DATE
);
SELECT * FROM estudiantes WHERE EXTRACT(YEAR FROM age(fecha_nacimiento)) >= 18;

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  fecha_nacimiento DATE
);
SELECT * FROM estudiantes WHERE (YEAR(CURDATE()) - YEAR(fecha_nacimiento)) >= 18;

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  fecha_nacimiento DATE
);
SELECT * FROM estudiantes WHERE DATEDIFF(YEAR, fecha_nacimiento, CAST(GETDATE() AS DATE)) >= 18;', 'AGE,DATEDIFF,comparación', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('CASE WHEN', 'Clasificar estudiantes por rango de edad | Output: Filas: nombre | clasificación', 'SQL', 'Alta', 'Avanzado', 'SELECT nombre, CASE WHEN edad < 18 THEN ''Menor'' WHEN edad >= 18 THEN ''Mayor'' END FROM estudiantes;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);
SELECT nombre, CASE WHEN edad < 18 THEN ''Menor'' WHEN edad >= 18 THEN ''Mayor'' END FROM estudiantes;

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);
SELECT nombre, CASE WHEN edad < 18 THEN ''Menor'' WHEN edad >= 18 THEN ''Mayor'' END FROM estudiantes;

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);
SELECT nombre, CASE WHEN edad < 18 THEN ''Menor'' WHEN edad >= 18 THEN ''Mayor'' END FROM estudiantes;', 'CASE,condicional,lógica', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('CAST (Conversión)', 'Convertir edad a texto | Output: Edad como texto', 'SQL', 'Alta', 'Avanzado', 'SELECT nombre, CAST(edad AS VARCHAR) FROM estudiantes;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);
SELECT nombre, CAST(edad AS VARCHAR) FROM estudiantes;

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);
SELECT nombre, CAST(edad AS CHAR) FROM estudiantes;

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  edad INT
);
SELECT nombre, CAST(edad AS VARCHAR) FROM estudiantes;', 'CAST,conversión,tipo', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('CONCAT (Concatenación)', 'Combinar nombre y ciudad en una columna | Output: Filas combinadas: ''nombre - ciudad''', 'SQL', 'Alta', 'Avanzado', 'SELECT CONCAT(nombre, '' - '', ciudad) FROM estudiantes;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  ciudad VARCHAR(100)
);
SELECT CONCAT(nombre, '' - '', ciudad) FROM estudiantes;

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  ciudad VARCHAR(100)
);
SELECT CONCAT(nombre, '' - '', ciudad) FROM estudiantes;

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100),
  ciudad VARCHAR(100)
);
SELECT nombre + '' - '' + ciudad FROM estudiantes;', 'CONCAT,concatenación,string', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('UPPER (Mayúsculas)', 'Convertir todos los nombres a mayúsculas | Output: Nombres en mayúsculas', 'SQL', 'Media', 'Medio', 'SELECT UPPER(nombre) FROM estudiantes;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100)
);
SELECT UPPER(nombre) FROM estudiantes;

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100)
);
SELECT UPPER(nombre) FROM estudiantes;

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100)
);
SELECT UPPER(nombre) FROM estudiantes;', 'UPPER,mayúscula,string', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('LOWER (Minúsculas)', 'Convertir todos los nombres a minúsculas | Output: Nombres en minúsculas', 'SQL', 'Media', 'Medio', 'SELECT LOWER(nombre) FROM estudiantes;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100)
);
SELECT LOWER(nombre) FROM estudiantes;

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100)
);
SELECT LOWER(nombre) FROM estudiantes;

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100)
);
SELECT LOWER(nombre) FROM estudiantes;', 'LOWER,minúscula,string', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('LENGTH (Longitud)', '¿Cuántos caracteres tiene cada nombre? | Output: Filas: nombre | longitud', 'SQL', 'Media', 'Medio', 'SELECT nombre, LENGTH(nombre) FROM estudiantes;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100)
);
SELECT nombre, LENGTH(nombre) FROM estudiantes;

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100)
);
SELECT nombre, LENGTH(nombre) FROM estudiantes;

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100)
);
SELECT nombre, LEN(nombre) FROM estudiantes;', 'LENGTH,LEN,string', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('ROUND (Redondear)', 'Redondear promedio de edad a 2 decimales | Output: Un número redondeado a 2 decimales', 'SQL', 'Media', 'Medio', 'SELECT ROUND(AVG(edad), 2) FROM estudiantes;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  edad INT
);
SELECT ROUND(AVG(edad), 2) FROM estudiantes;

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  edad INT
);
SELECT ROUND(AVG(edad), 2) FROM estudiantes;

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  edad INT
);
SELECT ROUND(AVG(CAST(edad AS FLOAT)), 2) FROM estudiantes;', 'ROUND,redondeo,matemática', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
INSERT INTO challenges (nombre_challenge, descripcion_challenge, lenguaje, complejidad, nivel, solucion_challenge, code_schema, tags, imagen_url, video_demostracion, created_at, updated_at) VALUES ('COALESCE (NULL Handling)', 'Mostrar nombre o ''Sin asignar'' si es NULL | Output: Nombres o ''Sin asignar'' si NULL', 'SQL', 'Alta', 'Avanzado', 'SELECT COALESCE(nombre, ''Sin asignar'') FROM estudiantes;', 'PostgreSQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100)
);
SELECT COALESCE(nombre, ''Sin asignar'') FROM estudiantes;

MySQL:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100)
);
SELECT COALESCE(nombre, ''Sin asignar'') FROM estudiantes;

SQL Server:
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(100)
);
SELECT COALESCE(nombre, ''Sin asignar'') FROM estudiantes;', 'COALESCE,NULL,manejo', NULL, 'No disponible', datetime('2025-12-12 21:24:08'), datetime('2025-12-12 21:24:08'));
