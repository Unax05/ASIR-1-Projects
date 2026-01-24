create table empleados2 (
    dni char(9) constraint pk_empleados primary key,
    nombre varchar (10) not null,
    ape1 varchar (10) not null,
    ap2 varchar (10) not null,
    calle varchar (10) not null,
    poblacion varchar (10) not null,
    provincia varchar (10) not null,
    cp varchar (5) not null,
    tfno varchar (10) not null,
    fecha_contrato varchar (10) not null
)
;

create table articulos2 (
    ref_art varchar(9) constraint pk_articulos primary key,
    descrip varchar (10) not null,
    stock char (100) not null,
    pvp varchar (10) not null,
    pc varchar (10) not null
)
;

create table ventas2 (
    id_venta varchar(9) constraint pk_ventas primary key,
    dni char(9) constraint fk_venta references empleados2 (dni),
    hora varchar (10) not null,
    fecha varchar (10) not null
)
;

create table detalles2 (
    id_venta varchar(9) constraint fk_venta2 references ventas2 (id_venta),
    ref_art varchar(9) constraint fk_articulos2 references articulos2 (ref_art),
    unidades varchar(9) not null,
    PVP varchar (9) not null,
    constraint pk_detalles2 primary key (id_venta,ref_art)
)
;

alter table ventas2
add constraint sk_ej4_ventas unique(fecha,hora,dni)

alter table articulos2
modify
(stock default 100)

alter table detalles2
add constraint fk_detalles2 foreign key (id_venta) references ventas2(id_venta)

create unique index sk_empleados2 on empleados2(ape1,ap2,nombre)

alter table detalles2
add constraint fk_detalles2 foreign key (ref_art) references articulos2(ref_art)

drop index sk_empleados2

alter table ventas2
drop constraint sk_ventas2

alter table detalles2 disable constraint fk_detalles2

alter table detalles2 enable constraint fk_detalles2

alter table detalles2
drop constraint fk_detalles2

drop table empleados2 cascade constraints;
drop table articulos2 cascade constraints;
drop table detalles2 cascade constraints;
drop table ventas2 cascade constraints;

CREATE TABLE EJEMPLO
(
NOMBRE CHAR (20) CONSTRAINT CHK_1 CHECK (NOMBRE=UPPER(NOMBRE)),
SUELDO NUMBER NOT NULL CONSTRAINT CHK_2 CHECK (SUELDO BETWEEN 1000 AND 2000),
SECCION CHAR (2) CONSTRAINT REQ_1 NOT NULL CONSTRAINT CHK_3 CHECK (SECCION IN ('1','2','3')),
FECHA DATE DEFAULT SYSDATE
)

