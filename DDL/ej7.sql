create table ej8_dptos (
codigo_dpto number(3) constraint pk_dptos primary key,
nombre varchar (20) not null
)
;

create table ej8_extensiones
cod_extension number(2) constraint pk_extensiones primary key,
piso number(2) not null,
codigo_dpto number(3) constraint fk_extensiones references ej8_dptos (codigo_dpto)
)
;

create table ej8_empleados
dni char(9) constraint pk_empleados primary key,
nombre varchar(30) not null,
ape1 varchar(30) not null,
tfno number(12),
cod_extension number(2) fk_empleados references ej8_extensiones (cod_extension)
)
;

2---
alter table ej8_empleados modify (nombre null)

alter table ej8_empleados modify (nombre varchar(25))

alter table ej8_empleados add (ape2 varchar(30))

alter table ej8_extensiones add (ubicacion varchar(30))

4--
create unique index sk_empleados on ej8_empleados(nombre, ape1)
create unique index sk_extensiones on ej8_extensiones(piso)
5--
drop index sk_empleados
drop index sk_extensiones
6--
alter table ej8_extensiones add constraint chk1 check (piso in (1,2,3))
alter table ej8_extensiones drop constraint chk1
7--
alter table ej8_empleados disable constraint fk_empleados
alter table ej8_empleados enable constraint fk_empleados
8--
alter table ej8_empleados drop constraint fk_empleados
alter table ej8_extensiones drop constraint fk_extensiones
9--
drop table ej8_empleados cascade constraints
drop table ej8_extensiones cascade constraints
drop table ej8_dptos cascade constraints

