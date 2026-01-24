/* 1. Aumentar +1 día a proveedores creados antes del año 2000 */
UPDATE PROVEEDORES --Actualizamos la tabla de proveedores
SET FECHA_NAC_PROVEEDOR = FECHA_NAC_PROVEEDOR + 1 --añadimos una año mas a la fecha de nacimiento porveedor si cumple la siguiente condicion
WHERE EXTRACT(YEAR FROM FECHA_NAC_PROVEEDOR) < 2000; --siempre y cuando hayá nacido antes de los 2000

/* 2. Aumentar el peso un 1% */
UPDATE PIEZAS --Actualizamos la tabla piezas
SET PESO = PESO * 1.01; --Aumentamos el peso multiplicando por 1.01 es decir el 1%

/* 3. Deshacer el aumento anterior */
UPDATE PIEZAS --Actualizamos la tabla piezas
SET PESO = PESO / 1.01; -- Disminuimos ese 1%, es decir lo dividimos entre 1.01, aunque podria ser multiplicado por 0.99

/* 4. La extension 046 pasa del piso 2º al 3º */
UPDATE EXTENSIONES --actualizamos la tabla extensiones
SET PISO = '3º' --Ponemos que tengan el piso 3 siempre y cuando cumplan esta condicion
WHERE EXTENSION = '046'; --Que tengan la extension 46


/* 5. Maria Ruiz (tlf 915427856) cambia extension 621 por 208:
   Primero eliminamos la antigua... */
DELETE FROM CONEXIONES --Borramos de la tabla extension siempre y cuando cumpla esta funcion
WHERE TLFNO = '915427856' --Tenga este numero Y tenga la extension 621, tienen que ser las 2
AND EXTENSION = '621';

/* ...y luego asignamos la nueva 208 */
INSERT INTO CONEXIONES VALUES ('915427856', '208'); --Insertamos en la tabla de conexiones los nuevos valores


/* 6. Maria Ruiz tambien atiende la 046 */
INSERT INTO CONEXIONES VALUES ('915427856', '046'); --Insertamos en la tabla coneiones los  nuevos valores


/* 7. Añadir segundo apellido a la tabla empleados */
ALTER TABLE EMPLEADOS --Alteramos la tabla de empleados
ADD SEG_APELLIDO CHAR(30); --Nuevo atributo


/* Insertar los segundos apellidos proporcionados */
UPDATE EMPLEADOS SET SEG_APELLIDO = 'SANZ' --Añadimos los segundos apellidos de los empleados cumpliendo la siguiente condicion
WHERE TLFNO = '912470799'; --siemrpe y cuando tenga este numero (para que asi no se le ponga el segundo apellido "sanz" a otros empleados)

UPDATE EMPLEADOS SET SEG_APELLIDO = 'RUIZ' --*
WHERE TLFNO = '912312265';

UPDATE EMPLEADOS SET SEG_APELLIDO = 'SANZ'--*
WHERE TLFNO = '915427856';

UPDATE EMPLEADOS SET SEG_APELLIDO = 'RUIZ'--*
WHERE TLFNO = '915534599';