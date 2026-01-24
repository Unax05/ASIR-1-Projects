--Añade dos nuevas secciones
insert into secciones values(6,'Diseño') --Insertamos unos nuevos atributos/filas a las tablas
insert into secciones values(7,'Direccion') --Insertamos unos nuevos atributos/filas a las tablas
commit;
--Incrementar en un 3% el suelo de los empleados los cuales tengan mas de un hijo
update empleados --Empezamos con un update para asi poder modificar la tabla de empleados
set sueldo = sueldo * 1.03 --Aqui estamos poniendole un nuevo valor a sueldo, es decir sueldo multiplicado por 1.03, el valor original es 1, queremos 3% +
where (seccion = 3 and cantidadhijos > 1); --Aqui estamos aplicando una condición, es decir solo se actualizará la tabla siempre y cuando el empleado tenga como valor de atributo que tiene mas de un hijo
--Registro de en que piso se encuentra cada sección de la empresa
alter table secciones add ( --comando para poder empezar a modificar la tabla secciones
add piso char (2)); --Creamos la columna "piso" la cual se observará con numeros, en este caso numeros enteros de ahí que no haga falta comas, aunque (1,0) sería valido
--Incrementar en un 2% el sueldo de los empleados que cobran menos de 800 euros y también a los que están solteros.
update empleados --Empezamos con un update para asi poder modificar la tabla de empleados
set sueldo = sueldo * 1.02 --Aqui estamos poniendole un nuevo valor a sueldo, es decir sueldo multiplicado por 1.02, el valor original es 1, queremos 2% +
where (estadocivil = 'soltero' or sueldo < 800); --Aqui estamos aplicando una condición, es decir solo se actualizará la tabla siempre y cuando el empleado tenga como valor de atributo que es soltero o que cobre menos de 800€
--(Escribir la instrucción sin conocer cuál es el código de este empleado)
update empleados --Empezamos con un update para asi poder actualizar la tabla de empleados
set seccion = 7, sueldo = 1200 --Selecciona el codigo unico de la seccion de dirección de la tabla empleados
where (nombre = 'Marcos' and apellido = 'Garcia'); --Condiciones que se tenga llamar Marcos García y no Marcos Lopez o Ramiro Garcia, solo a Marcos Garcia
--Realizar los cambios necesarios para especificar los pisos de las secciones
update secciones --Actualizamos la tabla secciones
set piso='1º' --Se le pondran el piso 1 lo que cumplan la siguiente condicion
where codigo= 1 or codigo =2 --los que tengan codigo 1 o codigo 2
update secciones --*
set piso='2º' ---*
where codigo= 3 or codigo=5 or codigo =6 --*
update secciones--*
set piso='3º'--*
where codigo=4 or codigo=7--*
--Borrar la sección Diseño. ¿Se puede? ¿Por qué?
delete from secciones where codigo = 6
--Si, porque realmente no hay ningun empleado ligado a la sección dirseño asi que no romperiamos la integridad referencial

--Borrar la seccion administración ¿Se puede? ¿Que pasos seguimos para borrarla sin romper la estructura de nuestro modelo?
--Antes de ejecutar cualquier comando, no, no se puede borrar de forma regular porque hay empleados ligados a la seccionn adminsitracion
--asi pues tendremos que eliminar a los empleados y luego borrar la seccion
delete from empleados where seccion = 1 --Eliminamos los empleados de la seccio 1 (administracin)
delete from secciones where codigo = 1 --Eliminaos la seccion cuyo codigo es 1 (Administracion)

--Borrar la seccion Sistemas ¿Se puede? ¿Que pasos seguimos para borrarla sin romper la estructura de nuestro modelo?
--Aqui lo mismo que lo anterior, hay empleados de la tabla empleados ligados al apartado Sistemas de la tabla secciones
--Asi pues igual que anteriormente movemos los empleados de sistemas a otra seccion para asi finalmente poder borrar el apartado sistemas de la tabla secciones
update empleados --Actualizar la tabla empleados
delete from empleados where seccion = 3 --Eliminamos los empleados de la seccion 3 (Sistemas)
delete from secciones where codigo = 3 --Eliminamos la seccion cuyo codigo es 3 (Sistemas)

     
