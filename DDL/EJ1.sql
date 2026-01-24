CREATE TABLE Proveedores (
    cod_proveedor VARCHAR(10) PRIMARY KEY,
    nombre_proveedor VARCHAR(30) NOT NULL UNIQUE,
    ciudad_proveedor VARCHAR(25),
    fecha_fundacion DATE
);
   
CREATE TABLE Piezas (
    Cod_pieza VARCHAR(10) PRIMARY KEY,
    Descrip_pieza VARCHAR(30) NOT NULL,
    Color VARCHAR(30),
    Peso DECIMAL(5,2),
    cod_proveedor VARCHAR(10) NOT NULL,
    FOREIGN KEY (cod_proveedor) REFERENCES Proveedores(cod_proveedor)
);

CREATE TABLE Suministros (
    Num_suministro VARCHAR2(5) PRIMARY KEY,
    ref_suministro VARCHAR2(10) NOT NULL UNIQUE,
    cod_pieza VARCHAR2(10) NOT NULL,
    cod_proveedor VARCHAR2(10) NOT NULL,
    Unidades NUMBER(3), 
    FOREIGN KEY (cod_pieza) REFERENCES Piezas(Cod_pieza),
    FOREIGN KEY (cod_proveedor) REFERENCES Proveedores(cod_proveedor)
);

CREATE TABLE clientes (
    dni VARCHAR2(9) PRIMARY KEY,
    nombre VARCHAR2(20) NOT NULL,
    apel1 VARCHAR2(20) NOT NULL,
    apel2 VARCHAR2(20) NOT NULL,
    dir VARCHAR2(20) NOT NULL,
    CONSTRAINT uk_clientes_nombre_completo UNIQUE (apel1, apel2, nombre)
);

CREATE TABLE sucursales (
    cod_suc VARCHAR2(4) PRIMARY KEY,
    nom_suc VARCHAR2(25) UNIQUE
);

CREATE TABLE cuentas (
    cod_cta VARCHAR2(20) PRIMARY KEY,
    saldo NUMBER(10,2), 
    cod_suc VARCHAR2(4) NOT NULL,
    FOREIGN KEY (cod_suc) REFERENCES sucursales(cod_suc)
);

CREATE TABLE titulares (
    dni VARCHAR2(9) NOT NULL,
    cod_cta VARCHAR2(20) NOT NULL,
    PRIMARY KEY (dni, cod_cta),
    FOREIGN KEY (dni) REFERENCES clientes(dni),
    FOREIGN KEY (cod_cta) REFERENCES cuentas(cod_cta)
);

DROP TABLE TITULARES cascade constraint;
DROP TABLE SUMINISTROS cascade constraint;
DROP TABLE SUCURSALES cascade constraint;
DROP TABLE PROVEEDORES cascade constraint;
DROP TABLE PIEZAS cascade constraint;
DROP TABLE CUENTAS cascade constraint;
DROP TABLE CLIENTES cascade constraint;