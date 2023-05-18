
-- tables
-- Table: AUTOR
CREATE TABLE AUTOR (
    AUTOR_ID int NOT NULL COMMENT 'Contiene el identificador de cada autor',
    NOMBRE varchar(200) NULL COMMENT 'Contiene el nombre de cada autor',
    APELLIDO varchar(200) NULL COMMENT 'Contiene el apellido de cada autor',
    PAIS varchar(100) NOT NULL COMMENT 'Contiene el país de cada autor',
    CONSTRAINT AUTOR_pk PRIMARY KEY (AUTOR_ID)
) COMMENT 'Contiene los datos del autor quien escribio el libro';

-- Table: DETALLE_PRESTAMO
CREATE TABLE DETALLE_PRESTAMO (
    ID int NOT NULL COMMENT 'Contiene el identificador de cada detalle del préstamos',
    LIBRO_ID int NOT NULL,
    PRESTAMO_ID int NOT NULL,
    FECHADESALIDA date NOT NULL,
    FECHADEENTREGA date NOT NULL,
    CANTIDAD int NOT NULL COMMENT 'Contiene la cantidad de libros por préstamo',
    CONSTRAINT DETALLE_PRESTAMO_pk PRIMARY KEY (ID)
) COMMENT 'Contiene las dependencias totales';

-- Table: DEVOLUCION
CREATE TABLE DEVOLUCION (
    IDDEVOLUCION int NOT NULL AUTO_INCREMENT COMMENT 'Contiene el identificador de cada devolución',
    FECHAPRESDEVOLUCION varchar(50) NULL COMMENT 'Contiene la fecha en que se realizó el préstamo.',
    FECHADEVDEVOLUCION date NULL COMMENT 'Contiene en la que se devuelve el libro.',
    LIBRODEVOLUCION varchar(70) NULL COMMENT 'Contiene el nombre de libro devuelto.',
    LECTURADEVOLUCION varchar(70) NULL COMMENT 'Contiene el nombre del lector del libro.',
    CONSTRAINT DEVOLUCION_pk PRIMARY KEY (IDDEVOLUCION)
) COMMENT 'Contiene los datos de devolución.';

-- Table: EDITORIAL
CREATE TABLE EDITORIAL (
    EDITORIAL_ID int NOT NULL COMMENT 'Contiene el identificador de cada editorial',
    NOMBRE varchar(200) NULL COMMENT 'Contiene el nombre de cada editorial',
    CONSTRAINT EDITORIAL_pk PRIMARY KEY (EDITORIAL_ID)
) COMMENT 'Contiene datos de la editorial';

-- Table: LECTOR
CREATE TABLE LECTOR (
    LECTOR_ID int NOT NULL COMMENT 'Contiene el identificador de cada usuario',
    NOMBRE varchar(100) NULL COMMENT 'Contiene el nombre de cada lector',
    APELLIDO varchar(200) NULL COMMENT 'Contiene el apellido de cada lector',
    SEXO char(1) NOT NULL,
    DNI char(8) NOT NULL,
    TELEFONO varchar(200) NULL COMMENT 'Contiene el teléfono de cada lector',
    NOMBREDEUSUARIO varchar(200) NULL COMMENT 'Contiene el nombre con el cual accederá al sistema',
    PASSWORD varchar(20) NULL COMMENT 'Contiene la contraseña con el cual accederá al sistema',
    ESTADO char(1) NOT NULL,
    PERFIL_IDPERFIL int NOT NULL,
    CONSTRAINT LECTOR_pk PRIMARY KEY (LECTOR_ID)
) COMMENT 'Contiene los datos del lector';

-- Table: LIBRO
CREATE TABLE LIBRO (
    LIBRO_ID int NOT NULL COMMENT 'Contiene el identificador del libro',
    TITULO varchar(200) NOT NULL,
    EDITORIAL_ID int NOT NULL,
    AUTOR_ID int NOT NULL,
    CONSTRAINT LIBRO_pk PRIMARY KEY (LIBRO_ID)
) COMMENT 'Contiene las propiedades del libro';

-- Table: PERFIL
CREATE TABLE PERFIL (
    IDPERFIL int NOT NULL AUTO_INCREMENT COMMENT 'Contiene el identificador de cada perfil.',
    NOMBREPERFIL char(1) NULL COMMENT 'Identifica el nombre del perfil',
    TIPOPERFIL varchar(20) NOT NULL,
    CONSTRAINT PERFIL_pk PRIMARY KEY (IDPERFIL)
) COMMENT 'Contiene al tipo de  usuario y administrador.';

-- Table: PRESTAMO
CREATE TABLE PRESTAMO (
    PRESTAMO_ID int NOT NULL COMMENT 'Contiene el identificador de cada préstamo',
    LECTOR_ID int NOT NULL COMMENT 'Contiene el identificador del Lector',
    FECHAACTUAL int NOT NULL COMMENT 'Contiene la fecha actual de préstamo',
    DEVOLUCION_IDDEVOLUCION int NOT NULL,
    CONSTRAINT PRESTAMO_pk PRIMARY KEY (PRESTAMO_ID)
) COMMENT 'Contiene el stock con la salida y entrega de cada libro';

-- foreign keys
-- Reference: DETALLE_PRESTAMO_LIBRO (table: DETALLE_PRESTAMO)
ALTER TABLE DETALLE_PRESTAMO ADD CONSTRAINT DETALLE_PRESTAMO_LIBRO FOREIGN KEY DETALLE_PRESTAMO_LIBRO (LIBRO_ID)
    REFERENCES LIBRO (LIBRO_ID);

-- Reference: DETALLE_PRESTAMO_PRESTAMO (table: DETALLE_PRESTAMO)
ALTER TABLE DETALLE_PRESTAMO ADD CONSTRAINT DETALLE_PRESTAMO_PRESTAMO FOREIGN KEY DETALLE_PRESTAMO_PRESTAMO (PRESTAMO_ID)
    REFERENCES PRESTAMO (PRESTAMO_ID);

-- Reference: LECTOR_PERFIL (table: LECTOR)
ALTER TABLE LECTOR ADD CONSTRAINT LECTOR_PERFIL FOREIGN KEY LECTOR_PERFIL (PERFIL_IDPERFIL)
    REFERENCES PERFIL (IDPERFIL);

-- Reference: LIBRO_AUTOR (table: LIBRO)
ALTER TABLE LIBRO ADD CONSTRAINT LIBRO_AUTOR FOREIGN KEY LIBRO_AUTOR (AUTOR_ID)
    REFERENCES AUTOR (AUTOR_ID);

-- Reference: LIBRO_EDITORIAL (table: LIBRO)
ALTER TABLE LIBRO ADD CONSTRAINT LIBRO_EDITORIAL FOREIGN KEY LIBRO_EDITORIAL (EDITORIAL_ID)
    REFERENCES EDITORIAL (EDITORIAL_ID);

-- Reference: PRESTAMO_DEVOLUCION (table: PRESTAMO)
ALTER TABLE PRESTAMO ADD CONSTRAINT PRESTAMO_DEVOLUCION FOREIGN KEY PRESTAMO_DEVOLUCION (DEVOLUCION_IDDEVOLUCION)
    REFERENCES DEVOLUCION (IDDEVOLUCION);

-- Reference: PRESTAMO_LECTOR (table: PRESTAMO)
ALTER TABLE PRESTAMO ADD CONSTRAINT PRESTAMO_LECTOR FOREIGN KEY PRESTAMO_LECTOR (LECTOR_ID)
    REFERENCES LECTOR (LECTOR_ID);

-- End of file.

