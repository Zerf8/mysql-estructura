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
SELECT apellido1, apellido2, nombre FROM persona  WHERE tipo="alumno"  ORDER BY apellido1 asc, apellido2 asc, nombre asc;
SELECT apellido1, apellido2, nombre FROM persona  WHERE tipo="alumno" AND telefono is null  ORDER BY apellido1 asc, apellido2 asc, nombre asc;
SELECT apellido1, apellido2, nombre FROM persona  WHERE tipo="alumno"  AND YEAR(fecha_nacimiento) = 1999 ORDER BY apellido1 asc, apellido2 asc, nombre asc;
SELECT apellido1, apellido2, nombre, nif FROM persona  WHERE tipo="profesor" AND telefono is null  AND substring(nif, -1)="k" ORDER BY apellido1 asc, apellido2 asc, nombre asc;
SELECT nombre FROM asignatura WHERE (id_grado=7 and cuatrimestre=1 and curso=3);
SELECT apellido1, apellido2, nombre, (select nombre from departamento  D where D.id = PROF.id_departamento limit 1) as Departamento FROM persona PER   INNER JOIN  profesor PROF ON PROF.id_profesor = PER.id WHERE tipo="profesor" ORDER BY apellido1 asc, apellido2 asc, nombre asc;
SELECT A.nombre, anyo_inicio, anyo_fin FROM alumno_se_matricula_asignatura ASMA INNER JOIN persona P ON ASMA.id_alumno = P.id INNER JOIN curso_escolar CE ON CE.id = ASMA.id_curso_escolar INNER JOIN asignatura A ON A.id = ASMA.id_asignatura   WHERE nif = "26902806M";
select distinct(nombre) from profesor inner join departamento ON departamento.id = profesor.id_departamento where id_profesor IN (SELECT distinct(ASI.id_profesor) FROM asignatura ASI WHERE id_grado = (select id from grado where nombre like "%Grado en Ingeniería Informática (Plan 2015)%"));
SELECT distinct(persona.nombre) FROM alumno_se_matricula_asignatura asma inner join persona on  persona.id = asma.id_alumno where id_curso_escolar = (SELECT id FROM curso_escolar WHERE anyo_inicio = 2018);
select d.nombre, per.apellido1, per.apellido2, per.nombre FROM persona per left join profesor prof on  per.id = prof.id_profesor left join departamento d on d.id=prof.id_departamento where tipo="profesor" order by d.nombre asc, apellido1 asc, apellido2 asc, per.nombre asc;
SELECT per.nombre, per.apellido1, per.apellido2   FROM persona per   LEFT JOIN profesor prof ON per.id = prof.id_profesor   left join departamento d on d.id=prof.id_departamento   where tipo="profesor"   and id_departamento is null ;
select d.nombre from departamento d left join profesor prof on  d.id = prof.id_departamento where id_profesor is null;
select per.nombre, per.apellido1, per.apellido2 from profesor prof left join asignatura a on prof.id_profesor = a.id_profesor  join persona per on prof.id_profesor = per.id where a.id is null;
select *, a.nombre from asignatura a left join profesor prof on prof.id_profesor = a.id_profesor where prof.id_profesor is null; /*no haría falta cruzar tablas */
select d.nombre from asignatura a left join profesor prof on prof.id_profesor = a.id_profesor right join departamento d on prof.id_departamento = d.id where id_departamento is null;
select count(id) as "Número Alumnos" from persona where tipo="alumno";
select count(id) as "Número Alumnos" from persona where tipo="alumno" and YEAR(fecha_nacimiento) = 1999;
select nombre, count(id) as num_profesores from departamento d inner join profesor p on p.id_departamento = d.id   group by id_departamento order by num_profesores desc;
select id, nombre, count(p.id_departamento) as num_profesores from departamento d left join profesor p on p.id_departamento = d.id group by d.id order by num_profesores desc;
select g.id, g.nombre, count(a.id_grado) as num_asignaturas from grado g left join asignatura a on a.id_grado  = g.id group by g.id order by num_asignaturas desc;
select g.id, g.nombre, count(a.id_grado) as num_asignaturas from grado g left join asignatura a on a.id_grado  = g.id  group by g.id having num_asignaturas > 40  order by num_asignaturas desc;
select g.nombre, tipo, sum(creditos) from grado g left join asignatura a on a.id_grado = g.id where tipo is not null group by id_grado, tipo ;
select distinct(anyo_inicio), count(distinct(id_alumno)) from alumno_se_matricula_asignatura asma  left join curso_escolar ce on ce.id = asma.id_curso_escolar group by anyo_inicio;
select per.id, per.nombre, per.apellido1, per.apellido2, count(a.id) as num_asignaturas from persona per  left join asignatura a on a.id_profesor = per.id where per.tipo="profesor" group by per.id order by num_asignaturas desc;
select * from persona per where tipo="alumno" order by fecha_nacimiento desc limit 1;
SELECT prof.id_profesor, nombre, apellido1, apellido2   FROM profesor prof   inner join persona per on prof.id_profesor = per.id  WHERE NOT EXISTS (SELECT NULL FROM asignatura a WHERE a.id_profesor = prof.id_profesor);








