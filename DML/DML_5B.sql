--Añade dos nuevas secciones
insert into secciones values(8,'Innovacion') --Insertamos unos nuevos atributos/filas a las tablas
insert into secciones values(9,'Investigacion') --Insertamos unos nuevos atributos/filas a las tablas
commit;

--Empleados asignacion unica con secuencias
alter table empleados --Empezamos a modificar la tabla empleados
add id_empleado number; --añadir una nuevo atributo llamado "id_empleado" que unicamente se pueda identificar con numeros
create sequence SEQ_EJER5B --creamos la secuencia en si
start with 1 --Hacemos que la secuencia empiece en 1(no necesario)
increment by 1 --Hacemos que la secuencia avance de 1 en 1(no necesario)
nocache --(no necesario)
nocycle; --cuando llegue al maximo no volverá empezar seguirá(no necesario)

update empleados --Actualizamos la tabla empleados
set id_empleado = SEQ_EJER5B.nextval; --El id_empleado irá en base a la secuencia que hemos creado aanteriormente
commit; --guardamos los cambios

alter table empleados --Modificamos la tabla (no necesario)
modify id_empleado not null; --Modificamos que el id empleado sea not null "requerido"(no necesario)
alter table empleados --modificar la tabla(no necesario)
add constraint UQ_empleados_id unique (id_empleado); --Añadir una restriccion en la que ponemos que el id_empleado sea unico(no necesario)

--Subida del 10% a los empleados de las secciones 1 y 2
--Incrementar en un 3% el suelo de los empleados los cuales tengan mas de un hijo
update empleados --Empezamos con un update para asi poder modificar la tabla de empleados
set sueldo = sueldo * 1.10 --Aqui estamos poniendole un nuevo valor a sueldo, es decir sueldo multiplicado por 1.10, el valor original es 1, queremos 10% +
where (seccion = 1 or seccion = 2); --Aqui estamos aplicando una condición, es decir solo se actualizará la tabla siempre y cuando pertenezca a la seccion 1 o 2

--Actualización hijo a Laura y Pablo
update empleados --Actualizamos la tabla empleado
set cantidadhijos = cantidadhijos + 1 --Que se cambie la cantidad de hijos a "cantidadhijos + 1" es decir, sumar 1 hijo con una condicion
where (nombre = 'Pablo' and apellido = 'Gomez'); or (nombre = 'Laura' and apellido= 'Perez'); --Se sumara un hijo siempre y cuando te llames Pablo Gomez o Laura Perez
commit; --confirmamos

--Establecemos un punto de salvaguardia llamado UNO
savepoint UNO; --Establecemos el punto de salvaguardia

--Seccion 1 desaparece 
--Sabemos que hay empleados ligados a la seccion 1 asi pues, tendremos que desligarlos eliminandolos
delete from empleados --eliminar de la tabla empleados
where seccion = 1; --los que estan en la seccion 1, este es el condicionante
delete from secciones --Borrar de la tabla secciones 
where codigo = 1; --la seccion cuyo codigo sea el numero 1
commit;
--en la tabla empleados se borrarian 2 filas, 2 trabajadores
--en la tabla secciones se borraria 1 fila, 1 seccion

--Establecemos un punto de salvaguardia llamado DOS
savepoint DOS; --Establecemos el punto de salvaguardia

--Seccion 2 desaparece
delete from empleados --Borrar de la tabla empleados
where seccion = 2; --Los que cumplan la condicion que estan en la seccion numero 2
delete from secciones --Borrar de la tabla secciones 
where codigo = 2; --La seccion cuyo codigo sea el numero 1
commit; --confirmar loc ambios

--Recuperar la seccion2
rollback to DOS; --Volvemos a la sirtuacion de la tabla al momento de sentenciar rollback 2

--Recuperar la seccion 1
rollback to UNO; --Volvemos a la situacion de la tabla al momento de sentenciar el rollback 1

--Estado de commit;
show autocommit
--Nos da "autocommit off", es decir para confirmar los cambios hechoos tendriamos que usar commit, al tenerlo off, podemos seguir usando rollback y los savepoints

--Recuperar con los rollback con el autocommit ON es posible?
--No ya que cada delete se haría automaticamente los savepoints no servirian y los rollback ni funcionarian