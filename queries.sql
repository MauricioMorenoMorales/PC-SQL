-- La estructura básica de las queries

SELECT city, count(*) AS total
FROM people
WHERE active = true
GROUP BY city
ORDER BY total DESC
HAVING total >= 2;

SELECT * FROM posts
WHERE fecha_publicacion > '2024';

SELECT * FROM

-- SELECT proyecta información

SELECT * FROM posts;

SELECT titulo AS encabezado, fecha_publicacion, estatus
FROM posts;

SELECT titulo AS encabezado
FROM posts;

-- Cuenta todos los registros
SELECT COUNT(*)
FROM posts;

SELECT COUNT(*) AS numero_de_posts
FROM posts;

-- FROM & JOIN

-- diferencia

--? Muestra los usuarios que tengan o no tengan posts
SELECT *
FROM usuarios
LEFT JOIN posts ON usuarios.id = posts.usuario_id;

--? deja fuera a los usuarios que sí tienen posts muestra solo los que no
SELECT *
FROM usuarios
LEFT JOIN posts ON usuarios.id = posts.usuario_id
WHERE posts.usuario_id IS NULL;

--? Muestra los posts sin importar tengan o no usuario
SELECT *
FROM usuarios
RIGHT JOIN posts ON usuarios.id = posts.usuario_id;

--? deja fuera a los posts que sí tienen usuario muestra solo los que no
SELECT *
FROM usuarios
RIGHT JOIN posts ON usuarios.id = posts.usuario_id
WHERE posts.usuario_id IS NULL;

--? Solo trae los posts que tengan usuarios y a la inversa usuarios que tengan posts

SELECT *
FROM usuarios
INNER JOIN posts ON usuarios.id = posts.id;

--? Muestra la diferencia

SELECT *
FROM usuarios
FULL OUTER JOIN posts ON usuarios.id = posts.id;
-- OR
SELECT *
FROM usuarios
LEFT JOIN posts ON usuarios.id = posts.id
UNION
SELECT *
FROM usuarios
RIGHT JOIN posts ON usuarios.id = posts.usuarios.id;

--? Muestra la diferencia simetrica
SELECT *
FROM usuarios
LEFT JOIN posts ON usuarios.id = posts.id
WHERE posts.usuario_id IS NULL
UNION
SELECT *
FROM usuarios
RIGHT JOIN posts ON usuarios.id = posts.usuarios.id
WHERE posts.usuario_id IS NULL;

-- ! WHERE

SELECT *
FROM posts
WHERE id < 50;

SELECT *
FROM posts
WHERE estatus = 'activo';

SELECT *
FROM posts
WHERE estatus != 'activo';

-- ? Muestra los elementos que tengan una palabra similar a escandalo
SELECT *
FROM posts
WHERE titulo LIKE '%escandalo%';


SELECT *
FROM posts
WHERE frecha_publicacion > '2025-01-01'

SELECT *
FROM posts
WHERE fecha_publicacion BETWEEN '2023-01-01' AND '2025-12-31'

SELECT *
FROM posts
WHERE YEAR(fecha_publicacion) BETWEEN '2023' AND '2024'

SELECT *
FROM posts
WHERE MONTH(fecha_publicacion) BETWEEN '01' AND '02'

SELECT *
FROM posts
WHERE MONTH(fecha_publicacion) = '04'