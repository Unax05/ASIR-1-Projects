create table ej70_vendedores (
dni varchar(9) constraint pk_vendedores primary key,
nombre varchar(20) not null,
ape1 varchar(30) not null,
ape2 varchar(30),
direccion varchar(50),
fec_nac date,
movil number(9),
email varchar(40)
)
;

create table ej70_ventas (
id_venta number(4) constraint pk_ventas primary key,
fec_venta date not null,
hora varchar(9),
dni varchar(9) constraint fk_ventas references ej70_vendedores (dni)
)
;

create table ej70_productos (
cod_prod varchar(9) constraint pk_productos primary key,
descrip varchar(50) not null,
pc number(6)
)
;

create table ej70_det_ventas (
id_detalle number(4) constraint pk_det_ventas primary key,
cod_prod varchar(9) not null,
id_venta number(4) not null,
unidades number(5),
pvp number(6)
)
;

alter table ej70_det_ventas add constraint fk_detallesventas_productos foreign key (cod_prod) references ej70_productos (cod_prod);
alter table ej70_det_ventas add constraint fk_detallesventas_ventas foreign key (id_venta) references ej70_ventas (id_venta);

alter table ej70_productos add constraint uk_productos_pc_desc unique (descrip, pc);

create index sk_vendedores on ej70_vendedores (nombre);
create index sk_ventas on ej70_ventas (fecha);
drop index sk_vendedores;
drop index sk_ventas;

alter table ej70_productos add nom_proveedor varchar(40);
alter table ej70_vendedores add e_civil varchar(10);
alter table ej70_vendedores modify ape1 varchar(30);
alter table ej70_ventas modify hora varchar(20);
alter table ej70_vendedores add sexo varchar(1);
alter table ej70_vendedores add constraint ch_vendedores_sexo check (sexo in ('H', 'M'));
alter table ej70_det_ventas drop pvp number(6);
alter table ej70_det_ventas add pvp number(6);
alter table ej70_vendedores drop (ecivil, pvp, nom_proveedor);
alter table ej70_vendedores drop constraint ch_vendedores_sexo;

insert into ej70_vendedores values ('11111111A', 'Jon', 'Lopez', 'Sarrikobaso,2', '02/06/1998', '765563345', 'Jurreta@gmail.com');
insert into ej70_vendedores values ('22222222B', 'Pablo', 'Martin', 'Mendizabal,25', '04/11/1983', '678543234', 'Pmartin@gmail.com');
insert into ej70_vendedores values ('33333333C', 'Ana', 'Martinez', 'Santiago,2', '05/02/1997', '654323457', 'Auribe@gmail.com');
insert into ej70_vendedores values ('44444444D', 'Iosu', 'Garcia', 'Henao,32', '26/02/2000', '766565442', 'Josu787@gmail.com');

insert into ej70_productos values ('1111', 'Plumiferos', '10');
insert into ej70_productos values ('2222', 'Sudaderas', '28');
insert into ej70_productos values ('3333', 'Pantalones', '43');
insert into ej70_productos values ('4444', 'Deportivas', '12');

insert into ej70_ventas values ('111', '01/05/2022', '10:00', '11111111A');
insert into ej70_ventas values ('222', '02/04/2022', '09:00', '11111111A');
insert into ej70_ventas values ('333', '07/06/2020', '10:20', '22222222B');
insert into ej70_ventas values ('444', '24/08/2021', '12:20', '22222222B');
insert into ej70_ventas values ('555', '05/02/2010', '12:12', '33333333C');

insert into ej70_det_ventas values ('11', '111', '1111', '20', '200');
insert into ej70_det_ventas values ('22', '111', '2222', '400', '567');
insert into ej70_det_ventas values ('33', '222', '3333', '55', '345');
insert into ej70_det_ventas values ('44', '333', '4444', '24', '689');

update ej70_vendedores 
set movil ='676543456' where (ape1='Martín');

update ej70_vendedores
set direccion='Gran vía,24', email='Jurreta674@gmail.com' where (dni='11111111A');

update ej70_vendedores
set ape2='Etxebarria' where (nombre='Pablo');

--PREGUNTA 6A:No se puede borrar la venta con id_venta = 111 porque existen filas en detalles_ventas que la referencian. 
--La restricción de clave foránea (FOREIGN KEY) impide eliminar una fila que tenga dependencias para mantener la integridad de la base de datos.

--PREGUNTA 6B:
alter table ej70_ventas drop constraint fk_ventas; --Borramos la constraint
update table ej70_ventas delete where (dni='33333333C') --Ya no hay relacion entonces si borramos las ventas del dni=333333333C no romperemeos la identidad referencial

alter table ej70_det_ventas disable constraint fk_detallesventas_productos;
alter table ej70_det_ventas enable constraint fk_detallesventas_productos;

alter table ej70_ventas drop constraint fk_ventas(dni);

drop table ej70_det_ventas cascade constraints;
drop table ej70_productos cascade constraints;
drop table ej70_vendedores cascade constraints;
drop table ej70_ventas cascade constraints;

--PREGUNTA 9: Si no utilizariamos cascade constraints, tendriamos que borrar las tablas, primeor las hijas y depues las tablas padre:
--ej70_det_ventas
--ej70_productos
--ej70_ventas
--ej70_vendedores


