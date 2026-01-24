create table clientes (
    dni char(9)         constraint pk_clie1 primary key,
    nombre varchar(20)  not null,
    apel1 varchar(20)   not null,
    apel2 varchar(20)   not null,
    dir varchar(20)     not null
);

create table sucursales (
    cod_suc char(4)     constraint pk_suc1 primary key,
    nombre_suc          varchar(25)
);

create table cuentas (
    cod_cta char(20)    constraint pk_cta1 primary key,
    saldo number(10,2),
    cod_suc char(4)     not null constraint fk_cta1 references sucursales(cod_suc)
);

create table titulares (
    cod_titu char(10)   constraint pk_titu1 primary key,
    dni char(9)         not null constraint fk_titu1 references clientes(dni),
    cod_cta char(20)    not null constraint fk_titu2 references cuentas(cod_cta)
); 

create unique index sk_clie1
    on clientes(apel1,apel2,nombre);

create index sk_clie2
    on clientes(apel1,apel2,nombre desc);

create index sk_clie3
    on clientes(apel1);

create unique index sk_titu1
    on titulares(dni,cod_cta);

create index sk_cta1
    on cuentas(cod_suc);

create unique index sk_suc1
    on sucursales(nombre_suc);

alter index sk_titu1 rebuild;

alter index sk_clie1 deallocate unused;

drop table titulares    cascade constraints;
drop table cuentas      cascade constraints;
drop table clientes     cascade constraints;
drop table sucursales   cascade constraints;