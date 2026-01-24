create table ej11_empleados (
dni char(9) constraint pk_ej11_empleados primary key,
nombre varchar(20) not null,
ape1 varchar(20) not null,
ape2 varchar(20) not null,
calle varchar(40),
cp number(5),
Poblancion number(3),
Provincia number(2),
Tlfno number(15),
fecha_con date
)
;

create table ej11_articulos (
ref_articulos varchar(10) constraint pk_ej11_articulos primary key,
descripcion varchar(20) not null,
pvp number(5,2) not null,
dni char(9)
)
;

create table ej11_ventas (
id_venta number(3) constraint pk_ej11_ventas primary key,
fecha date not null,
hora varchar(5),
dni char(9) constraint fk_ej11_ventas references ej11_empleados (dni)
)
;

create table ej11_detalles_ventas (
id_detalle number(5) constraint pk_ej11_detalles_ventas primary key,
id_venta number(3) constraint fk_ej11_detalles_ventas references ej11_ventas (id_venta),
ref_articulos varchar(10) constraint fk_ej11_detalles_ventas_2 references ej11_articulos (ref_articulos),
unidades number(4) not null,
pvp number(8,2)
)
;

-- 2. modificaciones en empleados
alter table ej11_empleados modify ape2 null;
alter table ej11_empleados modify ape2 not null;
alter table ej11_empleados add sexo varchar2(1);
alter table ej11_articulos add nom_proveedor char(20);
alter table ej11_detalles_ventas drop column pvp;
alter table ej11_detalles_ventas add pvp number(8,2);
alter table ej11_empleados add constraint ck_sexo check (sexo in ('h','m'));

-- 3. restricción única en artículos
alter table ej11_articulos 
add constraint uk_desc_pvp unique (descripcion, pvp);

-- 4. relaciones
alter table ej11_detalles_ventas
add constraint fk_ej11_detalles_ventas
foreign key (id_venta) references ej11_ventas(id_venta);

alter table ej11_detalles_ventas
add constraint fk_ej11_detalles_ventas_2
foreign key (ref_articulos) references ej11_articulos(ref_articulos);


-- 5. índice por nombre
create index ix_emp_nombre on ej11_empleados(nombre);

-- 6. índice por fecha en ventas
create index ix_ventas_fecha on ej11_ventas(fecha);

-- 7. borrar índices
drop index ix_emp_nombre;
drop index ix_ventas_fecha;

-- 8. borrar restricciones
alter table ej11_articulos drop constraint uk_desc_pvp;
alter table ej11_empleados drop constraint ck_sexo;

-- 9. deshabilitar / habilitar relaciones
alter table ej11_detalles_ventas disable constraint fk_ej11_detalles_ventas;
alter table ej11_detalles_ventas enable constraint fk_ej11_detalles_ventas;

alter table ej11_detalles_ventas disable constraint fk_ej11_detalles_ventas_2;
alter table ej11_detalles_ventas enable constraint fk_ej11_detalles_ventas_2;

alter table ej11_ventas disable constraint fk_ej11_ventas;
alter table ej11_ventas enable constraint fk_ej11_ventas;

-- 10. borrar relación entre empleados y ventas
alter table ej11_ventas drop constraint fk_ej11_ventas;

-- 11. borrar tablas
drop table ej11_detalles_ventas cascade constraints;
drop table ej11_ventas cascade constraints;
drop table ej11_articulos cascade constraints;
drop table ej11_empleados cascade constraints;


