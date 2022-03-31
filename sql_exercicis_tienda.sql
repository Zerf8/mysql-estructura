SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, precio, round((precio * 1.11),2) AS dolares FROM producto;
SELECT nombre AS nom, precio AS euros, ROUND((precio * 1.11),2) AS "dolars nord-americans" FROM producto;
SELECT UPPER(nombre), precio FROM producto;
SELECT LOWER(nombre), precio FROM producto;
SELECT nombre, UPPER(SUBSTR(nombre,1,2)) AS dim FROM fabricante;
SELECT nombre, ROUND(precio) FROM producto;
SELECT nombre, TRUNCATE(precio,0) FROM producto;
SELECT codigo_fabricante FROM producto;
SELECT DISTINCT(codigo_fabricante) FROM producto;
SELECT nombre FROM fabricante ORDER BY nombre asc;
SELECT nombre FROM fabricante ORDER BY nombre desc;
SELECT nombre FROM producto ORDER BY nombre asc, precio desc;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 3,2;
SELECT nombre, precio FROM producto  ORDER BY precio ASC  LIMIT 1;
SELECT nombre, precio FROM producto  ORDER BY precio DESC  LIMIT 1;
SELECT nombre FROM producto WHERE codigo_fabricante=2;
SELECT P.nombre, precio, F.nombre  FROM producto P INNER JOIN fabricante F ON P.codigo_fabricante = F.codigo;
SELECT P.nombre, precio, F.nombre  FROM producto P INNER JOIN fabricante F ON P.codigo_fabricante = F.codigo ORDER BY F.nombre ASC;
SELECT P.codigo, P.nombre, P.codigo_fabricante, F.nombre  FROM producto P INNER JOIN fabricante F ON P.codigo_fabricante = F.codigo;
SELECT P.nombre, MIN(precio), F.nombre  FROM producto P INNER JOIN fabricante F ON P.codigo_fabricante = F.codigo;
SELECT P.nombre, MAX(precio), F.nombre  FROM producto P INNER JOIN fabricante F ON P.codigo_fabricante = F.codigo;
SELECT * FROM producto WHERE codigo_fabricante=2;
SELECT * FROM producto WHERE codigo_fabricante=6 and precio > 200;
SELECT * FROM producto WHERE (codigo_fabricante=1 or codigo_fabricante=3 or codigo_fabricante=5);
SELECT * FROM producto WHERE codigo_fabricante IN (1,2,5);
SELECT P.nombre, precio FROM producto P INNER JOIN fabricante F ON P.codigo_fabricante = F.codigo WHERE substring(F.nombre, -1)="e" ;
SELECT P.nombre, precio FROM producto P INNER JOIN fabricante F ON P.codigo_fabricante = F.codigo WHERE LOCATE("w", F.nombre);
SELECT P.nombre, precio, F.nombre  FROM producto P INNER JOIN fabricante F ON P.codigo_fabricante = F.codigo WHERE precio >=180 ORDER BY precio DESC, P.nombre ASC;
SELECT DISTINCT(codigo_fabricante), F.nombre FROM producto P INNER JOIN fabricante F ON P.codigo_fabricante = F.codigo;
SELECT * FROM fabricante F LEFT JOIN producto P on P.codigo_fabricante = F.codigo;
SELECT F.codigo, F.nombre FROM fabricante F LEFT JOIN producto P on P.codigo_fabricante = F.codigo WHERE codigo_fabricante IS NULL;
SELECT * FROM producto where codigo_fabricante = (select codigo from fabricante where nombre  like "%Lenovo%");
SELECT * FROM producto WHERE precio = (SELECT MAX(precio) FROM producto where codigo_fabricante = (select codigo from fabricante where nombre  like "%Lenovo%"));
SELECT nombre FROM producto WHERE precio = (SELECT MAX(precio) FROM producto where codigo_fabricante = (select codigo from fabricante where nombre  like "%Lenovo%"));
SELECT nombre FROM producto WHERE precio = (SELECT MIN(precio) FROM producto where codigo_fabricante = (select codigo from fabricante where nombre  like "%Hewlett-Packard%"));
SELECT * FROM producto WHERE precio >= (SELECT MAX(precio) FROM producto where codigo_fabricante = (select codigo from fabricante where nombre  like "%Lenovo%"));
SELECT * FROM producto WHERE precio >= (SELECT AVG(precio) FROM producto where codigo_fabricante = (select codigo from fabricante where nombre  like "%Asus%"));









