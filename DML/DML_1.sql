create table extensiones ( --creamos la tabla extensiones
extension char(3) constraint pk_extensiones primary key, --añadimos cual va a aser la pk de esta tabla
piso char(2), --Atributos
dpto char(20) --atributos
)
;

create table empleados ( --creamos la tabla empleados
tlfno char (9) constraint pk_empleados primary key,--añadirmos cual va a ser pk de esta tabla
nombre char (30), --atributos
apellido char (30) --atributos
)
;

create table conexiones ( --creamos la tabla conexiones
tlfno char (9) constraint fk_conexiones references empleados(tlfno), --añadimos cual va a ser la fk de esta tabla, en este caso apuntando a la pk de la tabla empleados
extension char(3) constraint fk_conexiones_2 references extensiones (extension), --añadimos cual va a ser la fk de esta tabla, en este caso apuntado a la pk de la tabla extesiones
constraint pk_conexiones primary key (tlfno, extension) añadimos cual va a ser la pk de esta tabla --añadimos cual va a ser la pk de esta tabla
)
;


INSERT INTO EXTENSIONES VALUES ('621', '1º','CONTABILIDAD')--añadimos datos a la tabla de extesniones, en este caso, extension, piso del que proviene y el sector
INSERT INTO EXTENSIONES VALUES ('632', '1º','INFORMÁTICA')--*
INSERT INTO EXTENSIONES VALUES ('046', '2º','PUBLICIDAD')--*
INSERT INTO EXTENSIONES VALUES ('207', '1º','MARKETING')--*
INSERT INTO EXTENSIONES VALUES ('208', '2º','PERSONAL')--*

INSERT INTO EMPLEADOS VALUES ('PEPE', 'GÓMEZ','912470799')--Añadimos datos a la tabla de empleados, en este caso, nombre, apellido y el numero de telefono
INSERT INTO EMPLEADOS VALUES ('ANTONIA', 'GONZÁLEZ','912312265')--*
INSERT INTO EMPLEADOS VALUES ('MARÍA', 'RUIZ','915427856')--*
INSERT INTO EMPLEADOS VALUES ('ERNESTO', 'PÉREZ','915534599')--*

INSERT INTO CONEXIONES VALUES ('912470799', '621') --añadimos datos a la tabla de conexiones, en este caso 
--los numeros de telefono y su debida extension, es decir estamos uniendo a Pepe Gomez con numero "912470799" lo une a la extension 621
--que a su vez esta extension esta unida al piso y al sector en este caso, 1º piso y sector de contabilidaf
--En resumen:
--Pepe Gomez
--Telefono:912470799
--Extension:621
--Piso=1º
--Sector=Contabilidad
INSERT INTO CONEXIONES VALUES ('912470799', '632')
INSERT INTO CONEXIONES VALUES ('912312265', '046')
INSERT INTO CONEXIONES VALUES ('915427856', '621')
INSERT INTO CONEXIONES VALUES ('915427856', '632')
INSERT INTO CONEXIONES VALUES ('915534599', '207')
INSERT INTO CONEXIONES VALUES ('915534599', '208')
