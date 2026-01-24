-- Primero identificamos el ID_PIEZA correspondiente al código 101
SELECT ID_PIEZA FROM PIEZAS WHERE COD_PIEZA = '101'; --Comprobamos el id_pieza cuyo cod_pieza sea 101

-- Suponiendo que el ID_PIEZA es 22 (según tus datos INSERT)
DELETE FROM PIEZAS WHERE ID_PIEZA = 22; --Borra de la tabla piezas siempre y cuando su id_pieza sea 22

-- Ver el primer suministro
SELECT * FROM SUMINISTROS ORDER BY ID_SUMINISTRO FETCH FIRST 1 ROW ONLY;

-- Si el ID_PIEZA es 22 (pieza 101), eliminar ese registro
-- Suponiendo que el primer suministro tiene ID_SUMINISTRO = 1
DELETE FROM SUMINISTROS WHERE ID_SUMINISTRO = 1; --Borra de la tabla suministros siempre y cuando su id_suminsitro sea 1

-- Eliminar usando el código de pieza directamente
DELETE FROM SUMINISTROS  --Borrar de la tabla suminsitros
WHERE ID_PIEZA = (SELECT ID_PIEZA FROM PIEZAS WHERE COD_PIEZA = '101'); --Siempr ey cuando su id_pieza sea la consultada por "select" 
--cuyo codigo de la tabla piezas sea 101
-- Ahora eliminar la pieza 101
DELETE FROM PIEZAS WHERE COD_PIEZA = '101'; --Ahora eliminamos de la tabla piezas siempre y cuando tenga codigo pieza 101

-- Eliminar la restricción actual
ALTER TABLE SUMINISTROS DROP CONSTRAINT FK_SUMINISTROS_1; --Eliminamos la restriccion de fk_suminstros_1

-- Crear nueva restricción con CASCADE
ALTER TABLE SUMINISTROS  --Alteramos la tabla suminstro
ADD CONSTRAINT FK_SUMINISTROS_1  --Añadimos una nueva restricciom
FOREIGN KEY (ID_PIEZA)  --Cuya foreign key sea id_pieza
REFERENCES PIEZAS (ID_PIEZA) --haciendo referencia a la tabla pieza, el atributo id_pieza
ON DELETE CASCADE; --Sirve para borrar atributos ligados a una foreign key, por ejemplo borramos seccion 40, hay 30 empleados en seccion 40
-- de normal hariamos un delete con where=40 y luego borramos la restriccion "foreign key" para tener todo borrado, al borrar de manera normal, 
--borramos unicamente la constraint y no sus empleadois ligados, dejando asi datos sueltos

-- Comprobar suministros de la pieza 102
SELECT * FROM SUMINISTROS  --Comprobar de suminstros el atributo cuya condicion sea...
WHERE ID_PIEZA = (SELECT ID_PIEZA FROM PIEZAS WHERE COD_PIEZA = '102'); --el id_pieza cuyo cod_pieza=102

-- Eliminar pieza 102 (eliminará automáticamente sus suministros)
DELETE FROM PIEZAS WHERE COD_PIEZA = '102'; --eliminar los datos de piezas ligados al cod_pieza=102