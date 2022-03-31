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

/*
Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. 
El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.
*/

*** lo dejo aquí select * from grado g left join asignatura a on a.id_grado = g.id group by tipo;