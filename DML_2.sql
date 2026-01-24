CREATE TABLE PIEZAS --Creamos la tabla piezas
(
ID_PIEZA NUMBER CONSTRAINT PK_PIEZAS PRIMARY KEY, --asignamos a primary key de esta tabla en este caso "id_pieza"
COD_PIEZA CHAR(3) NOT NULL CONSTRAINT SK_PIEZAS_1 UNIQUE, --Asignamos una restriccion para que el atributo cod_pieza sea unico y no pueda repetirse
DESCRIP_PIEZA VARCHAR (20) --Atributos
COLOR VARCHAR (15), --Atributos
PESO NUMBER (5,2) --Atributos
)
CREATE TABLE PROVEEDORES --Creas a la tabla
(
ID_PROVEEDOR NUMBER CONSTRAINT PK_PROVEEDORES PRIMARY KEY,  --asignamos a primary key de esta tabla en este caso "id_proveedor"
COD_PROVEEDOR CHAR (2) NOT NULL CONSTRAINT SK_PROVEEDORES_1 UNIQUE,--Asignamos una restriccion para que el atributo cod_proveedor sea unico y no pueda repetirse
NOMBRE_PROVEEDOR VARCHAR(25), --Atributos
CIUDAD_PROVEEDOR VARCHAR (25), --atributos
FECHA_NAC_PROVEEDOR DATE --atributos
)
CREATE TABLE SUMINISTROS
(
ID_SUMINISTRO NUMBER CONSTRAINT PK_SUMINISTROS PRIMARY KEY, --asignamos a primary key de esta tabla en este caso "id_suministro"
REF_SUMINISTRO CHAR (4) NOT NULL CONSTRAINT SK_SUMINISTROS_1 UNIQUE, --Asignamos una restriccion para que el atributo ref_suminstro sea unico y no pueda repetirse
ID_PIEZA NUMBER NOT NULL CONSTRAINT FK_SUMINISTROS_1 FOREIGN KEY (ID_PIEZA) REFERENCES PIEZAS (ID_PIEZA), --Asignamos una fk de la tabla piezas en este caso
--su primary key "id_pieza"
UNIDADES NUMBER (3), --atributos
ID_PROVEEDOR NUMBER NOT NULL, --atriubtus
CONSTRAINT FK_SUMINISTROS_2 FOREIGN KEY (ID_PROVEEDOR) REFERENCES PROVEEDORES (ID_PROVEEDOR) --Asignamos una fk de la tabla proveedores en este caso
--su primary key "id_proveedor"
)

CREATE SEQUENCE SEC_PIEZAS --creamos la secuencia que tendrá la tabla piezas
CREATE SEQUENCE SEC_PROVEEDORES --creamos la secuencia que tendrá la tabla proveedores
CREATE SEQUENCE SEC_SUMINISTROS --creamos la secuencia que tendrá la tabla suminsitros

INSERT INTO PIEZAS VALUES (SEC_PIEZAS.NEXTVAL, '101','TUERCA','NEGRO',3) --insertamos datos a las filas de la tabla piezas, la primera "primary key" estará
--en base a la secuencia anteriormente, el cod_proveedor, asignado, lo que es, el color y el peso
INSERT INTO PIEZAS VALUES (SEC_PIEZAS.NEXTVAL, '102','PISTÓN','AZUL',9)
INSERT INTO PIEZAS VALUES (SEC_PIEZAS.NEXTVAL, '103','PLETINA','ROJO',11)
INSERT INTO PIEZAS VALUES (SEC_PIEZAS.NEXTVAL, '106','TUERCA','NARANJA',21)
INSERT INTO PIEZAS VALUES (SEC_PIEZAS.NEXTVAL,'105','PISTÓN','ROJO',13)
--Es decir, el dato sería id_pieza=El automatico por secuencia, cod_proveedor=101, descrip=Tuerca, color=negro, peso=3

INSERT INTO PROVEEDORES VALUES (SEC_PROVEEDORES.NEXTVAL,'S1','PÉREZ S.A.','MADRID','1/12/2006') --Aqui es parecido al anterior, un id_proveedor asignado por una
--secuencia, un codigo asignado manualmente, el nombre, la ciudad y la fecha de nacimiento proveedor
INSERT INTO PROVEEDORES VALUES (SEC_PROVEEDORES.NEXTVAL,'S2','SÁEZ S.L.','ZARAGOZA','1/1/2000')
INSERT INTO PROVEEDORES VALUES (SEC_PROVEEDORES.NEXTVAL,'S3','METAL S.A.','BARCELONA','1/1/1995')
INSERT INTO PROVEEDORES VALUES (SEC_PROVEEDORES.NEXTVAL,'S4','TECNOSA','BILBAO','1/1/1985')
--Es decir,  el dato sería id_proveedor=automatico por secuencia, codigo_proveddor=S1, Nombre=Perez, ciudad=Madrid, fecha de nacimiento=1/12/2006
--Final:
--La pieza cuyo codigo es 101, es una tuerca de color negro y pesa 3kg es suministrada por PEREZ S.A de madrid cuyo codigo proveedor es S1 y nacio en 1/12/2006