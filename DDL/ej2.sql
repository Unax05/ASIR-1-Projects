alter table clientes
add
(
email varchar (50) not null constraint sk_cltes2 unique
)
alter table clientes
drop constraint sk_cltes2

alter table clientes
add constraint sk_cltes2 unique(email)

alter table clientes
drop unique(ape11,apel2,nombre)

alter table cientes 
add constraint sk_cltes1 unique(apel1,apel2, nombre)


alter table clientes
add
(tfno1 char(9),
tfno2 char(9)
)

alter table clientes
modify
(email varchar(45),
dir varchar(45)
)

alter table clientes
modify
(email null)

alter table clientes
drop
(tfno2)

alter table piezas
add constraint sk_piezas_2 unique (descrip_pieza)

alter table piezas
drop constraint sk_piezas_2

alter table piezas
drop unique (decrip_pieza)

create table empleados
(
dni_empleado char(9),
nombre varchar(30) not null,
apel1 varchar (30) not null,
apel2 varchar(30) not null,
cod_suc char (4) not null)

alter table empleados
add constraint pk_emple1 primary key(dni_empleado)

alter table empleados
add constraint sk_emple_1 unique (cod_suc, dni_empleado)

alter tabl empleados
drop constraint sk_emple_1

alter table empleados 
add constraint fk_emple_1 foreign key(cod_suc) references sucursales(cod_suc)

alter table empleados
drop constraint fk_emple_1

alter table empleados
modify(cod_suc constraint fk_emple1 references sucursales(cod_suc))

alter table empleados
disable constraint fk_emple1

alter table empleados
enable constraint fk_emple1