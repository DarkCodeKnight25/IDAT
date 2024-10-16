
-- BORRANDO TABLAS
DROP TABLE NOTAS;
DROP TABLE ALUMNO;
DROP TABLE CURSOS;
DROP TABLE PROFESOR;
DROP TABLE STAFF;
DROP TABLE LIBRO;
DROP TABLE TRABAJADOR2;
DROP TABLE CARGO;
DROP TABLE TRABAJADOR;

-- CREANDO TABLAS
Create Table ALUMNO(
     Cod_Alu      VARCHAR2(5) Not Null,
     Nombre       VARCHAR2(50) Not Null,
     Sexo         VARCHAR2(20) Not Null,
     Grado        Int Not Null,
     F_Nacimiento Date Not Null,
     Edad         Int Not Null,
     Estado       Varchar2(20) Not Null,
     CONSTRAINT PK_CODIGO_ALUMNO PRIMARY KEY (Cod_Alu),
     CONSTRAINT CHK_NOMBRE_ALUMNO CHECK (Nombre = NLS_UPPER(Nombre)),
     CONSTRAINT CHK_SEXO_ALUMNO CHECK (SEXO IN ('Masculino','Femenino')),
     CONSTRAINT CHK_GRADO_ALUMNO CHECK (GRADO IN (1,2,3,4,5,6)),
     CONSTRAINT CHK_EDAD_ALUMNO CHECK (EDAD>=10 AND EDAD<=22),
     CONSTRAINT CHK_ESTADO_ALUMNO CHECK (Estado IN ('ACTIVO','BLOQUEADO','SUSPENDIDO','RETIRADO'))
 );
 
 Create Table CURSOS(
     Cod_Curso    VARCHAR2(5) Not Null,
     Descripcion  VARCHAR2(30) Not Null,
     Credito      Integer Not Null,
     Estado       VARCHAR2(20) Not Null,
     CONSTRAINT PK_CODIGO_CURSO PRIMARY KEY (Cod_Curso),
     CONSTRAINT CHK_DESCRIPCION_CURSO CHECK (Descripcion = NLS_UPPER(Descripcion)),
     CONSTRAINT CHK_CREDITO_CURSO CHECK (Credito IN (2, 3, 4, 6)),
     CONSTRAINT CHK_ESTADO_CURSO CHECK (Estado IN ('ACTIVO','BLOQUEADO'))
 );

Create Table PROFESOR(
     Cod_Prof     VARCHAR2(5) Not Null,
     Nombre       VARCHAR2(50) Not Null,
     Profesion    Varchar2(50) Not Null,
     F_Nac        Date Not Null,
     Dni          Char(8) Not Null,
     Sexo         VARCHAR2(20) Not Null,
     Edad         Int Not Null,
     Estado       Varchar2(20) Not Null,
     CONSTRAINT PK_CODIGO_PROFESOR PRIMARY KEY (Cod_Prof),
     CONSTRAINT CHK_NOMBRE_PROFESOR CHECK (Nombre = NLS_UPPER(Nombre)),
     CONSTRAINT CHK_PROFESION_PROFESOR CHECK (Profesion = NLS_UPPER(Profesion)),
     CONSTRAINT CHK_SEXO_PROFESOR CHECK (SEXO IN ('Masculino','Femenino')),
     CONSTRAINT CHK_EDAD_PROFESOR CHECK (EDAD>=25 AND EDAD<=60),
     CONSTRAINT CHK_ESTADO_PROFESOR CHECK (Estado IN ('ACTIVO','BLOQUEADO','SUSPENDIDO','RETIRADO'))
 );
 
 Create Table NOTAS (
     Cod_Alu      VARCHAR2(5) Not Null,
     Cod_Curso    VARCHAR2(5) Not Null,
     Cod_Prof     VARCHAR2(5) Not Null,
     Nota1        Int Not Null,
     Nota2        Int Not Null,
     Nota3        Int Not Null,
     Nota4        Int Not Null,
     Fecha        Date Not Null,
     CONSTRAINT CHK_NOTA1 CHECK (NOTA1>=0 AND NOTA1<=20),
     CONSTRAINT CHK_NOTA2 CHECK (NOTA2>=0 AND NOTA2<=20),
     CONSTRAINT CHK_NOTA3 CHECK (NOTA3>=0 AND NOTA3<=20),
     CONSTRAINT CHK_NOTA4 CHECK (NOTA4>=0 AND NOTA4<=20),
     CONSTRAINT FK_REL_NOTAS_ALUMNO FOREIGN KEY (COD_ALU) REFERENCES ALUMNO(COD_ALU),
     CONSTRAINT FK_REL_NOTAS_CURSO FOREIGN KEY (COD_CURSO) REFERENCES CURSOS(COD_CURSO),
     CONSTRAINT FK_REL_NOTAS_PROFESOR FOREIGN KEY (COD_PROF) REFERENCES PROFESOR(COD_PROF)
 );

CREATE TABLE STAFF(
	ID Numeric (5, 0) PRIMARY KEY NOT NULL ,
	NAME Varchar2 (10) NOT NULL ,
	DEPT Numeric (5, 0) NOT NULL ,
	JOB Varchar2 (6) NOT NULL ,
	YEARS Numeric (5, 0) NULL ,
	SALARY Numeric (8, 2) NOT NULL ,
	COMM Numeric (8, 2) NULL 
);

CREATE TABLE LIBRO(
            CODLIB VARCHAR2(5) PRIMARY KEY NOT NULL,        
            TITULOLIB  VARCHAR2(32),        
            AUTORLIB   VARCHAR2(24),        
            EDITOLIB    VARCHAR2(13),        
            AREALIB     VARCHAR2(9),        
            PRECIOLIB  NUMERIC(8,2),    
            NHOJASLIB INT,            
            ANOLIB    INT);

CREATE TABLE TRABAJADOR2( 
             COD_TRA VARCHAR2(5) PRIMARY KEY NOT NULL,
             AP_TRA VARCHAR2(15) NULL,
             AM_TRA VARCHAR2(15) NULL,
             NOM_TRA VARCHAR2(15) NULL,
             FECHA_NA DATE NULL,
             SUELDO NUMERIC(8,2) NULL,
             GENERO_TRA VARCHAR2(1) NULL,
             AREA_TRA VARCHAR2(30) NULL);

Create Table Cargo(
	IdCargo     int Not Null,
	Descripcion Varchar(50) Not Null,
	Sueldo      Numeric(10, 2) Not Null,
	CONSTRAINT Llave_Cargo PRIMARY KEY (IdCargo));

Create Table Trabajador(
	IdTrabajador Char(5) Not Null,
	IdCargo      int Not Null,
	Nombre       Varchar(50) Not Null,
	Dni          Char(8) Not Null,
	Ecivil       Varchar(20) DEFAULT 'Soltero' Null,
	Sexo         Varchar(20) Not Null,
	Direccion    Varchar(50) Not Null,
	F_Nac        Date Not Null,
	Estado       Varchar(20) DEFAULT 'Activo' Null,
	CONSTRAINT Llave_Trabajador PRIMARY KEY (IdTrabajador),
	CONSTRAINT Llave_Foranea_Relacion FOREIGN KEY (IdCargo) REFERENCES Cargo(IdCargo),
	CONSTRAINT CHK_SEXO CHECK (SEXO IN ('Masculino','Femenino')),
	CONSTRAINT CHK_ECIVIL CHECK (Ecivil IN ('Soltero','Casado','Viudo','Divorciado')),
	CONSTRAINT U_Identidad UNIQUE(Dni),
	CONSTRAINT CHK_ESTADO CHECK (Estado IN ('Activo','Bloqueado','Cesado','Despedido')));




INSERT INTO STAFF VALUES (10,'SANDERS',20,'MGR',7,18357.50,NULL);
INSERT INTO STAFF VALUES (20,'PERNAL',20,'SALES',8,18171.25,612.45);
INSERT INTO STAFF VALUES (30,'MARENGHI',38,'MGR',5,17506.75,NULL);
INSERT INTO STAFF VALUES (40,'O BRIEN',38,'SALES',6,18006.00,846.55);
INSERT INTO STAFF VALUES (50,'HANES',15,'MGR',10,20659.80,NULL);
INSERT INTO STAFF VALUES (60,'QUIGLEY',38,'SALES',NULL,16808.30,650.25);
INSERT INTO STAFF VALUES (70,'ROTHMAN',15,'SALES',7,16502.83,1152.00);
INSERT INTO STAFF VALUES (80,'JAMES',20,'CLERK',NULL,13504.60,128.20);
INSERT INTO STAFF VALUES (90,'KOONITZ',42,'SALES',6,18001.75,1386.70);
INSERT INTO STAFF VALUES (100,'PLOTZ',42,'MGR',7,18352.80,NULL);
INSERT INTO STAFF VALUES (110,'NGAN',15,'CLERK',5,12508.20,206.60);
INSERT INTO STAFF VALUES (120,'NAUGHTON',38,'CLERK',NULL,12954.75,180.00);
INSERT INTO STAFF VALUES (130,'YAMAGUCHI',42,'CLERK',6,10505.90,75.60);
INSERT INTO STAFF VALUES (140,'FRAYE',51,'MGR',6,21150.00,NULL);
INSERT INTO STAFF VALUES (150,'WILLIAMS',51,'SALES',6,19456.50,637.50);
INSERT INTO STAFF VALUES (160,'MCLINARE',10,'MGR',7,22959.20,NULL);
INSERT INTO STAFF VALUES (170,'KERMISCH',15,'CLERK',4,12258.50,110.10);
INSERT INTO STAFF VALUES (180,'ABRAHAMS',38,'CLERK',3,12009.75,236.50);
INSERT INTO STAFF VALUES (190,'SNEIDER',20,'CLERK',8,14252.75,126.50);
INSERT INTO STAFF VALUES (200,'SCOUTTEN',42,'CLERK',NULL,11508.60,84.20);
INSERT INTO STAFF VALUES (210,'LU',10,'MGR',10,20010.00,NULL);
INSERT INTO STAFF VALUES (220,'SMITH',51,'SALES',7,17564.50,992.80);
INSERT INTO STAFF VALUES (230,'LUNDQUIST',51,'CLERK',3,13369.80,189.65);
INSERT INTO STAFF VALUES (240,'DANIELS',10,'MGR',5,19260.25,NULL);
INSERT INTO STAFF VALUES (250,'WHEELER',51,'CLERK',6,14460.00,513.30);
INSERT INTO STAFF VALUES (260,'JONES',10,'MGR',12,21234.00,NULL);
INSERT INTO STAFF VALUES (270,'LEA',66,'MGR',9,18555.50,NULL);
INSERT INTO STAFF VALUES (280,'WILSON',66,'SALES',9,18674.50,811.50);
INSERT INTO STAFF VALUES (290,'QUILL',84,'MGR',10,19818.00,NULL);
INSERT INTO STAFF VALUES (300,'DAVIS',84,'SALES',5,15454.50,806.10);
INSERT INTO STAFF VALUES (310,'GRAHAM',66,'SALES',13,21000.00,200.30);
INSERT INTO STAFF VALUES (320,'GONZALES',66,'SALES',4,16858.20,844.00);
INSERT INTO STAFF VALUES (330,'BURKE',66,'CLERK',1,10988.00,55.50);
INSERT INTO STAFF VALUES (340,'EDWARDS',84,'SALES',7,17844.00,1285.00);
INSERT INTO STAFF VALUES (350,'GAFNEY',84,'CLERK',5,13030.00,188.00);
COMMIT;

INSERT INTO LIBRO VALUES('1000','VISUAL FOX','RUBEN IGLESIAS','RAMA','LPROG',60,489,1997);
INSERT INTO LIBRO VALUES('1001','POWER BUILDER 6.','RAMIRO HOOL','UNI','LPROG',80,410,1999);
INSERT INTO LIBRO VALUES('1002','ANALISIS Y DISE�O DE SIST.','KENDALL Y KENDALL','PRINTICE HALL','ANALISIS',100,913,1997);
INSERT INTO LIBRO VALUES('1003','POWER BUILDER 6.','WILLIAM B. HEYS','QUE','LPROG',150,843,1999);
INSERT INTO LIBRO VALUES('1004','VISUAL BASIC','CESAR BUSTAMANTE','GRAPPERU','LPROG',35,390,1997);
INSERT INTO LIBRO VALUES('1005','VISUAL FOX PRO','LES Y JHON PINTER','MC GRAWHILL','LPROG',25,567,1997);
INSERT INTO LIBRO VALUES('1006','GUIA C++','JULIO VASQUEZ PARAGULLAS','UPSMP','LPROG',50,780,1997);
INSERT INTO LIBRO VALUES('1007','MS C++','BECK ZARATIAN','MICROSOFT','LPROG',80,600,1999);
INSERT INTO LIBRO VALUES('1008','VISUAL FOX PRO 6.00','CESAR BUSTAMANTE','UNI','LPROG',35,450,1999);
INSERT INTO LIBRO VALUES('1009','AUTOCAD 2000','J.A. TAJADURA J. LOPEZ','MC GRAW HILL','CAD',40,480,1998);
INSERT INTO LIBRO VALUES('1010','EFECTOS COREL','ANOMINO','MACRO','ARTE',50,400,1998);
INSERT INTO LIBRO VALUES('1011','EL VENDEDOR MAS GRANDE DEL MUNDO','OG MANDINO','DIANA','LIDERAZGO',15,121,1968);
INSERT INTO LIBRO VALUES('1012','EL PODER DEL CARISMA','MIGUEL ANGEL CORNEJO','ESTRELLA','LIDERAZGO',15,123,1992);
INSERT INTO LIBRO VALUES('1013','7 HABITOS DE LA GENTE EFECTIVA','STEPHEN  R. COVER','PAIDOS','LIDERAZGO',50,460,1989);
INSERT INTO LIBRO VALUES('1014','CRITERIOS EVA. PROY.','NASSIR SAPAG CHAIN','MC GRAW HILL','PROYECTOS',10,144,1997);
INSERT INTO LIBRO VALUES('1015','COMO DIRIGIR MICRO EMP.','VICTOR ABAD G.','IPEDE','PROYECTOS',10,110,1995);
INSERT INTO LIBRO VALUES('1016','LA MAGIA DE PENSAR EN GRANDE','DAVID JASEPH SCHWRTZ','HERREROS MEX','LIDERAZGO',10,258,1960);
INSERT INTO LIBRO VALUES('1017','SQL SERVER VB','WILLIAM R. VAUGHN','MICROSOFT','LPROG',60,1000,1999);
INSERT INTO LIBRO VALUES('1018','VISUAL FOX 6.00','MENACHEN BAZIAN','QUE','LPROG',55,1000,1999);
INSERT INTO LIBRO VALUES('1019','INTELIGENCIA EMOCIONAL','DANIEL GOLEMAN','ZETA','LIDERAZGO',48,396,1996);
INSERT INTO LIBRO VALUES('1020','LA TERCERA OLA','ALVIN TOFFLER','MC GRAW HILL','LIDERAZGO',50,250,1998);
COMMIT;

INSERT INTO TRABAJADOR2 VALUES ('00001','DE LA MADRID','GUTIERREZ' , 'MARICIELO', '01/11/1980',980,'F','CONTABILIDAD');
INSERT INTO TRABAJADOR2 VALUES ('00002','HURTADO','CORONEL', 'NILDA', '10/10/1976',980.50,'F','CONTABILIDAD');
INSERT INTO TRABAJADOR2 VALUES ('00003','PAREDES','MARTINEZ','EDITH', '10/10/1976',1500.50,'F','SISTEMAS');
INSERT INTO TRABAJADOR2 VALUES ('00004','CARDOSO','VALLADARES','HENRY', '10/10/1980',1200.5,'M','SISTEMAS');
INSERT INTO TRABAJADOR2 VALUES ('00005','UBILLUS','MARQUEZ','MIGUEL ANGEL', '05/01/1976',980.60,'M','CONTABILIDAD');
INSERT INTO TRABAJADOR2 VALUES ('00006','LIZARRAGA','DEL OLMO','NUPCIA MASSIEL','05/10/1980',1300.70,'F','SISTEMAS');
INSERT INTO TRABAJADOR2 VALUES ('00007','AGUIRRE','RIVADENEIRA','VANNIA', '05/10/1975',1200.10,'F','SISTEMAS');
INSERT INTO TRABAJADOR2 VALUES ('00008','JUAREZ','LAZO','GINO','05/10/1969',1200.30,'M','LOGISTICA');
INSERT INTO TRABAJADOR2 VALUES ('00009','PINTADO','ROBLES','JUAN ABEL', '28/08/1984',1000.50,'M','LOGISTICA');
INSERT INTO TRABAJADOR2 VALUES ('00010','BARRANTES','MEDINA','LUIS ALBERTO','28/08/1975',1000.90,'M','LOGISTICA');
INSERT INTO TRABAJADOR2 VALUES ('00011','CAMPOS','GAMBO' , 'SONIA', '02/11/1980',NULL,'F','CONTABILIDAD');
INSERT INTO TRABAJADOR2 VALUES ('00012','HURTADO','SANCHEZ', 'SUSANA', '12/11/1976',980.50,'F','CONTABILIDAD');
INSERT INTO TRABAJADOR2 VALUES ('00013','CANTUR','GOMEZ','ELIZABETH', '12/10/1976',NULL,'F','SISTEMAS');
INSERT INTO TRABAJADOR2 VALUES ('00014','SALAS','CARPIO','ROBERT', '16/12/1982',1200.5,'M','SISTEMAS');
INSERT INTO TRABAJADOR2 VALUES ('00015','UBILLUS','CAMPOS','MIGUEL', '15/04/1976',NULL,'M','CONTABILIDAD');
INSERT INTO TRABAJADOR2 VALUES ('00016','SANCHEZ','DE LA CRUZ','LORENA','05/10/1980',1800.70,'F','SISTEMAS');
INSERT INTO TRABAJADOR2 VALUES ('00017','GUTIERREZ','NAVARRO','CECILIA', '15/11/1979',NULL,'F','SISTEMAS');
INSERT INTO TRABAJADOR2 VALUES ('00018','JUAREZ','SANTOS','MAGNO','15/12/1969',1600.50,'M','LOGISTICA');
INSERT INTO TRABAJADOR2 VALUES ('00019','OROPEZA','ESTRADA','CARLOSL', '28/09/1985',NULL,'M','LOGISTICA');
INSERT INTO TRABAJADOR2 VALUES ('00020','ESTRADA','CAMPOS','JUAN JOSE','18/05/1979',NULL,'M','LOGISTICA');
COMMIT;

Insert Into ALUMNO Values ('A0001', 'PEREZ SANCHEZ JUAN','Masculino', 1,'22/07/2000', 19, 'ACTIVO');
Insert Into ALUMNO Values ('A0002', 'SARMIENTO CESPEDES CARMEN','Femenino', 1,'20/08/2005', 15, 'ACTIVO');
Insert Into ALUMNO Values ('A0003', 'ALCANTARA VARGAS CARLOS','Masculino', 2,'05/06/2004', 16, 'ACTIVO');
Insert Into ALUMNO Values ('A0004', 'SANCHEZ CAMPOS LUIS','Masculino', 1,'10/04/2000', 19, 'ACTIVO');
Insert Into ALUMNO Values ('A0005', 'VALDIVIA SALCEDO ELIZABETH','Femenino', 1,'05/04/2005', 15, 'ACTIVO');
Insert Into ALUMNO Values ('A0006', 'ESPINOZA VARGAS CELINA','Femenino', 2,'22/03/2004', 16, 'ACTIVO');
Insert Into ALUMNO Values ('A0007', 'CAMPOS FLORES EDUARDO','Masculino', 3,'02/06/1999', 20, 'ACTIVO');
Insert Into ALUMNO Values ('A0008', 'NAVARRO RODRIGUEZ CELESTE','Femenino', 3,'10/02/2000', 19, 'ACTIVO');
Insert Into ALUMNO Values ('A0009', 'RAMIREZ OCHOA ALEJANDRA','Femenino', 2,'01/03/2002', 17, 'ACTIVO');
Insert Into ALUMNO Values ('A0010', 'SALAS FERNANDEZ JULIAN','Masculino', 2,'05/03/2002', 17, 'ACTIVO');
COMMIT;

Insert Into CURSOS Values ('C0001', 'MATEMATICA',4,'ACTIVO');
Insert Into CURSOS Values ('C0002', 'LENGUAJE',6,'ACTIVO');
Insert Into CURSOS Values ('C0003', 'QUIMICA',4,'ACTIVO');
Insert Into CURSOS Values ('C0004', 'HISTORIA',3,'ACTIVO');
Insert Into CURSOS Values ('C0005', 'GEOGRAFIA',3,'ACTIVO');
COMMIT;

Insert Into PROFESOR Values ('P0001', 'ALVAREZ SANCHEZ JULIA','ING DE SISTEMAS','13/02/1980','02145874','Femenino',39,'ACTIVO');
Insert Into PROFESOR Values ('P0002', 'SALAS ORME�O ELIZABETH','CONTADORA PUBLICA','16/04/1900','05878545','Femenino',29,'ACTIVO');
Insert Into PROFESOR Values ('P0003', 'SANCHEZ VERASTEGUI JULIAN','DR. EN MEDICINA GEN..','10/05/1970','03685985','Masculino',49,'ACTIVO');
Insert Into PROFESOR Values ('P0004', 'LOPEZ ALCANTARA CLARA','DR. GINECOLOGIA','05/07/1985','02547845','Femenino',34,'ACTIVO');
Insert Into PROFESOR Values ('P0005', 'SANDOVAL PEREZ MELISSA','SECRETARIA EJECUTIVA','25/04/1990','05478458','Femenino',29,'ACTIVO');
COMMIT;

Insert Into NOTAS Values ('A0001', 'C0001', 'P0001', 14, 16, 17, 18,'07/01/2019');
Insert Into NOTAS Values ('A0001', 'C0002', 'P0001', 13, 15, 14, 17,'07/01/2019');
Insert Into NOTAS Values ('A0001', 'C0003', 'P0002', 10, 10, 10, 10,'07/01/2019');
Insert Into NOTAS Values ('A0001', 'C0004', 'P0003', 17, 18, 16, 17,'07/01/2019');
Insert Into NOTAS Values ('A0001', 'C0005', 'P0004', 7, 7, 8, 8,'07/01/2019');

Insert Into NOTAS Values ('A0002', 'C0001', 'P0004', 15, 12, 11, 10,'07/01/2019');
Insert Into NOTAS Values ('A0002', 'C0002', 'P0003', 12, 10, 10, 11,'07/01/2019');
Insert Into NOTAS Values ('A0002', 'C0003', 'P0005', 14, 14, 14, 17,'07/01/2019');
Insert Into NOTAS Values ('A0002', 'C0004', 'P0004', 17, 11, 13, 11,'07/01/2019');
Insert Into NOTAS Values ('A0002', 'C0005', 'P0003', 12, 12, 9, 9,'07/01/2019');

Insert Into NOTAS Values ('A0003', 'C0001', 'P0004', 14, 12, 15, 10,'07/01/2019');
Insert Into NOTAS Values ('A0003', 'C0002', 'P0003', 15, 10, 9, 9,'07/01/2019');
Insert Into NOTAS Values ('A0003', 'C0003', 'P0005', 11, 15, 15, 11,'07/01/2019');
Insert Into NOTAS Values ('A0003', 'C0004', 'P0004', 10, 10, 10, 10,'07/01/2019');
Insert Into NOTAS Values ('A0003', 'C0005', 'P0003', 12, 10, 9, 9,'07/01/2019');

Insert Into NOTAS Values ('A0004', 'C0001', 'P0002', 11, 11, 11, 10,'07/01/2019');
Insert Into NOTAS Values ('A0004', 'C0002', 'P0002', 15, 10, 19, 19,'07/01/2019');
Insert Into NOTAS Values ('A0004', 'C0003', 'P0004', 12, 12, 15, 12,'07/01/2019');
Insert Into NOTAS Values ('A0004', 'C0004', 'P0005', 14, 14, 13, 13,'07/01/2019');
Insert Into NOTAS Values ('A0004', 'C0005', 'P0005', 12, 10, 9, 12,'07/01/2019');

Insert Into NOTAS Values ('A0005', 'C0001', 'P0005', 12, 11, 18, 20,'07/01/2019');
Insert Into NOTAS Values ('A0005', 'C0002', 'P0002', 20, 20, 19, 19,'07/01/2019');
Insert Into NOTAS Values ('A0005', 'C0003', 'P0003', 13, 8, 8, 8,'07/01/2019');
Insert Into NOTAS Values ('A0005', 'C0004', 'P0003', 8, 7, 7, 7,'07/01/2019');
Insert Into NOTAS Values ('A0005', 'C0005', 'P0004', 15, 16, 19, 19,'07/01/2019');

Insert Into NOTAS Values ('A0006', 'C0001', 'P0005', 16, 16, 18, 20,'07/01/2019');
Insert Into NOTAS Values ('A0006', 'C0002', 'P0004', 9, 9, 10, 10,'07/01/2019');
Insert Into NOTAS Values ('A0006', 'C0003', 'P0003', 13, 8, 8, 8,'07/01/2019');

Insert Into NOTAS Values ('A0007', 'C0003', 'P0003', 11, 11, 10, 14,'07/01/2019');
Insert Into NOTAS Values ('A0007', 'C0004', 'P0005', 11, 17, 17, 17,'07/01/2019');
Insert Into NOTAS Values ('A0007', 'C0005', 'P0004', 12, 13, 14, 14,'07/01/2019');

Insert Into NOTAS Values ('A0008', 'C0002', 'P0001', 12, 12, 19, 19,'07/01/2019');
Insert Into NOTAS Values ('A0008', 'C0003', 'P0004', 11, 18, 18, 12,'07/01/2019');
Insert Into NOTAS Values ('A0008', 'C0004', 'P0005', 8, 7, 7, 7,'07/01/2019');

Insert Into NOTAS Values ('A0009', 'C0001', 'P0005', 11, 11, 18, 20,'07/01/2019');
Insert Into NOTAS Values ('A0009', 'C0002', 'P0002', 12, 10, 15, 15,'07/01/2019');

Insert Into NOTAS Values ('A0010', 'C0002', 'P0002', 12, 12, 19, 19,'07/01/2019');
Insert Into NOTAS Values ('A0010', 'C0003', 'P0003', 13, 18, 18, 18,'07/01/2019');
COMMIT;

Insert Into Cargo Values (1,'Gerente', 5000);
Insert Into Cargo Values (2,'Administrador', 4000);
Insert Into Cargo Values (3,'Secretaria', 2000);
Insert Into Cargo Values (4,'Contador', 3500);
Insert Into Cargo Values (5,'Servicios', 920);
Insert Into Cargo Values (6,'Soporte', 1920);
Insert Into Cargo Values (7,'Delivery', 920);
Insert Into Cargo Values (8,'Almacenero', 920);
COMMIT;

Insert Into Trabajador Values ('T0001',1,'Celestino Perez Julian','08585457','Soltero',
                               'Masculino','Av. Peru 2344 SMP','12/05/1970','Activo');

Insert Into Trabajador Values ('T0002',2,'Ramos Castro Cecilia','45878981','Soltero',
                               'Femenino','Calle Los Tulipanes Cercado','10/03/1980','Activo');

Insert Into Trabajador Values ('T0003',2,'Ortega S�nchez Liliana','07536569','Soltero',
                               'Femenino','Rojas Peralta Ernesto','12/04/1975','Activo');

Insert Into Trabajador Values ('T0004',3,'Rodriguez Salas Lilian ','45212369','Soltero',
                               'Femenino','Jr. huaraz 556 Bre�a','08/10/1979','Activo');

Insert Into Trabajador Values ('T0005',3,'Valenzuela Carpio Selene','45878985','Soltero',
                               'Femenino','Calle los Naranjos 555 SJL','05/12/1980','Activo');

Insert Into Trabajador Values ('T0006',4,'Bustamante Ramos Cesar','08555474','Soltero',
                               'Masculino','Jr. Huancayo 123 Cercado','12/05/1988','Activo');

Insert Into Trabajador Values ('T0007',4,'Valencia Flores Hernan','08585450','Soltero',
                               'Masculino','Av. Peru 2344 SMP','11/05/1970','Activo');

Insert Into Trabajador Values ('T0008',5,'Perez Cisneros Pedro','45566998','Soltero',
                               'Masculino','Av. Peru 1600 SMP','03/03/1985','Activo');

Insert Into Trabajador Values ('T0009',5,'Ramirez S�nchez Julian','45644477','Soltero',
                               'Masculino','Calle los Naranjos 545 SJL','10/10/1985','Activo');

Insert Into Trabajador Values ('T0010',5,'Sanchez L�pez Elizabeth','42221178','Soltero',
                               'Femenino','Calle los Amparados 233 Independencia','11/10/1985','Activo');
COMMIT;





--CONSULTAS
SELECT * FROM ALUMNO;
SELECT * FROM CURSOS;
SELECT * FROM PROFESOR;
SELECT * FROM NOTAS;
SELECT * FROM STAFF;
SELECT * FROM LIBRO;
SELECT * FROM TRABAJADOR2;
SELECT * FROM CARGO;
SELECT * FROM TRABAJADOR;

----------------------------------------------------------------
-- CURSORES IMPLICITOS y EXPLICITOS
----------------------------------------------------------------


-- EJEMPLOS DE CURSORES IMPLICITOS
-- SON AQUELLOS QUE DEVUELVEN COMO RESULTADO DE UNA CONSULTA
-- UN SOLO REGISTRO (UNA FILA DE DATOS).


-- EJEMPLO 1:
-- Muestre los datos de un Libro determinado, ingresando mediante una variable
-- de sustituci�n "&" el c�digo del libro, por ejemplo �1000�, los datos de dicho 
-- libro deben ser mostrados.

-- CONSULTA SIMPLE
    SELECT CODLIB, TITULOLIB, AUTORLIB, EDITOLIB, AREALIB,
           PRECIOLIB, NHOJASLIB, ANOLIB
    FROM LIBRO WHERE CODLIB = &Codigo;


-- ANALIZANDO LA TABLA LIBRO
SELECT * FROM LIBRO;

-- VISUALIZAMOS LA ESTRUCTURA DE LA TABLA LIBRO
-- CUYO OBJETIVO ES: SABER CUANTAS COLUMNAS TIENEN Y LOS
-- TIPOS DE DATOS.
DESCRIBE LIBRO

-- SOLUCI�N:
SET SERVEROUTPUT ON;
DECLARE
    Codigo LIBRO.CODLIB%TYPE; Titulo LIBRO.TITULOLIB%TYPE;
    Autor  LIBRO.AUTORLIB%TYPE; Editorial LIBRO.EDITOLIB%TYPE;
    Area   LIBRO.AREALIB%TYPE; Precio LIBRO.PRECIOLIB%TYPE;
    CantidadHojas LIBRO.NHOJASLIB%TYPE; AnnoLibro LIBRO.ANOLIB%TYPE;
BEGIN
    SELECT CODLIB, TITULOLIB, AUTORLIB, EDITOLIB, AREALIB,
           PRECIOLIB, NHOJASLIB, ANOLIB
           INTO Codigo, Titulo, Autor, Editorial, Area,
                Precio, CantidadHojas, AnnoLibro
    FROM LIBRO WHERE CODLIB = &Codigo;
    --> Si en caso la consulta devueve 0 registros
        --> se genera una excepci�n llamada NO_DATA_FOUND(No encontro datos)
        --> ya no continua la ejecuci�n, salta a la linea de EXCEPTION
    --> Si en caso la consulta devulve 1(deseado) o m�s REGISTROS,
        --> Entonces la ejecucion termina normal 
    DBMS_OUTPUT.PUT_LINE('DATOS DEL LIBRO     :   ' || Codigo);
    DBMS_OUTPUT.PUT_LINE('============================================');
    DBMS_OUTPUT.PUT_LINE('C�digo del Libro    :   ' || Codigo);
    DBMS_OUTPUT.PUT_LINE('T�tulo del Libro    :   ' || Titulo);
    DBMS_OUTPUT.PUT_LINE('Autor del Libro     :   ' || Autor);
    DBMS_OUTPUT.PUT_LINE('Editorial del Libro :   ' || Editorial);
    DBMS_OUTPUT.PUT_LINE('Area del Libro      :   ' || Area);
    DBMS_OUTPUT.PUT_LINE('Precio del Libro    :   ' || Precio);
    DBMS_OUTPUT.PUT_LINE('Cantidad de Hojas   :   ' || CantidadHojas);
    DBMS_OUTPUT.PUT_LINE('A�o del Libro       :   ' || AnnoLibro);
    DBMS_OUTPUT.PUT_LINE('=============================================');
EXCEPTION --try except
	WHEN NO_DATA_FOUND THEN
	     DBMS_OUTPUT.put_line ('Libro No Existe!!!!');
END;

-- Ejercicio:
-- Elabore un cursor el cual pueda visualizar a estilo reporte
-- los datos de un determinado alumno, use el codigo del alumno
-- para buscarlo.

Select * From Alumno;

Describe Alumno;

-- SOLUCI�N:
SET SERVEROUTPUT ON;
DECLARE
    Codigo ALUMNO.COD_ALU%TYPE; Nom ALUMNO.NOMBRE%TYPE; Sex ALUMNO.SEXO%TYPE;
    Gr ALUMNO.GRADO%TYPE; Fn ALUMNO.F_NACIMIENTO%TYPE; Ed ALUMNO.EDAD%TYPE;
    Est ALUMNO.ESTADO%TYPE;
BEGIN
    SELECT COD_ALU, NOMBRE, SEXO, GRADO, F_NACIMIENTO, EDAD, ESTADO
    INTO Codigo, Nom, Sex, Gr, Fn, Ed, Est FROM ALUMNO
    WHERE COD_ALU = &Codigo;
    
    DBMS_OUTPUT.PUT_LINE('Datos del Alumno:');
    DBMS_OUTPUT.PUT_LINE('=====================================');
    DBMS_OUTPUT.PUT_LINE('Codigo           : ' || Codigo);
    DBMS_OUTPUT.PUT_LINE('Nombre           : ' || Nom);
    DBMS_OUTPUT.PUT_LINE('Sexo             : ' || Sex);
    DBMS_OUTPUT.PUT_LINE('Grado            : ' || Gr);
    DBMS_OUTPUT.PUT_LINE('Fecha Nacimiento : ' || Fn);
    DBMS_OUTPUT.PUT_LINE('Edad             : ' || Ed);
    DBMS_OUTPUT.PUT_LINE('Estado           : ' || Est);
EXCEPTION
	WHEN NO_DATA_FOUND THEN
	     DBMS_OUTPUT.put_line ('El Alumno No Fue Registrado!!!!');
END;



--LA EXCEPCION NO_DATA_FOUND, SE APLICA:
-- SELECT
-- UPDATE
-- DELETE

-- EJERCICIO ADICIONAL (10 MINUTOS)
-- CONSULTAR A UN ALUMNO CON SUS DATOS COMPLETOS.
-- CONTROLE SU EXITENCIA CON LA EXCEPCION "NO_DATA_FOUND"

SELECT * FROM ALUMNO;


-- EJEMPLO 2:
-- Se desea vender todos los libros de la librer�a, clasificados por �rea del
-- libro (ANALISIS, ARTE, PROYECTOS, LPROG, LIDEREZGO y CAD), genere un c�digo 
-- PL/SQL que realice dicha acci�n, con totalizaciones incluidas.  Redacte el
-- c�digo desde el editor de Oracle PL/SQL.
SELECT * FROM LIBRO;

-- SOLUCI�N:
SET SERVEROUTPUT ON;
DECLARE
    TOTAL_ANALISIS NUMBER:=0;
    TOTAL_ARTE NUMBER:=0;
    TOTAL_PROYECTOS NUMBER:=0;
    TOTAL_LPROG NUMBER:=0;
    TOTAL_LIDERAZGO NUMBER:=0;
    TOTAL_CAD NUMBER:=0;
    TOTAL_IMPORTE NUMBER:=0; IGV NUMBER:=0; TOTAL_GENERAL NUMBER:=0;
BEGIN
    SELECT SUM (PRECIOLIB) INTO TOTAL_ANALISIS 
           FROM LIBRO WHERE AREALIB='ANALISIS';
    SELECT SUM (PRECIOLIB) INTO TOTAL_ARTE 
           FROM LIBRO WHERE AREALIB='ARTE';
    SELECT SUM (PRECIOLIB) INTO TOTAL_PROYECTOS
           FROM LIBRO WHERE AREALIB='PROYECTOS';
    SELECT SUM (PRECIOLIB) INTO TOTAL_LPROG
           FROM LIBRO WHERE AREALIB='LPROG';
    SELECT SUM (PRECIOLIB) INTO TOTAL_LIDERAZGO
           FROM LIBRO WHERE AREALIB='LIDERAZGO';
    SELECT SUM (PRECIOLIB) INTO TOTAL_CAD
           FROM LIBRO WHERE AREALIB='CAD';
     TOTAL_IMPORTE:=TOTAL_ANALISIS + TOTAL_ARTE + TOTAL_PROYECTOS + 
                   TOTAL_LPROG + TOTAL_LIDERAZGO + TOTAL_CAD;
    IGV:= TOTAL_IMPORTE * 0.18;
    TOTAL_GENERAL:= TOTAL_IMPORTE + IGV;
    DBMS_OUTPUT.PUT_LINE('VENTA DE LA LIBRERIA POR AREA DEL LIBRO');
    DBMS_OUTPUT.PUT_LINE('=================================================');
    DBMS_OUTPUT.PUT_LINE('TOTAL LIBROS DE ANALISIS    : ' || TOTAL_ANALISIS);
    DBMS_OUTPUT.PUT_LINE('TOTAL DE LIBROS DE ARTE     : ' || TOTAL_ARTE);
    DBMS_OUTPUT.PUT_LINE('TOTAL DE LIBRO DE PROYECTOS : ' || TOTAL_PROYECTOS);
    DBMS_OUTPUT.PUT_LINE('TOTAL DE LIBRO DE LPROG     : ' || TOTAL_LPROG);
    DBMS_OUTPUT.PUT_LINE('TOTAL LIBRO DE LIDERAZGO    : ' || TOTAL_LIDERAZGO);
    DBMS_OUTPUT.PUT_LINE('TOTAL LIBRO DE CAD          : ' || TOTAL_CAD);
    DBMS_OUTPUT.PUT_LINE('==================================================');
    DBMS_OUTPUT.PUT_LINE('TOTAL IMPORTE               : ' || TOTAL_IMPORTE);
    DBMS_OUTPUT.PUT_LINE('IGV                         : ' || IGV);
    DBMS_OUTPUT.PUT_LINE('TOTAL GENERAL               : ' || TOTAL_GENERAL);
    DBMS_OUTPUT.PUT_LINE('==================================================');
END;


-- FIN DE CURSORES IMPLICITOS






-- EJEMPLOS DE CURSORES EXPLICITO
-- SON AQUELLOS QUE DEVUELVEN COMO RESULTADO DE UNA CONSULTA
-- VARIOS REGISTROS (MAS DE UNA FILA DE DATOS).
-- Y TIENE UN NOMBRE PROPIO

-- Ejemplo 1:
-- La tabla STAFF posee elementos nulos en la columna COMM (comisiones),
-- crear un cursor de actualizaci�n el cual modifique estos elementos
-- nulos por cero.

-- Consulta las comisiones nulas
SELECT * FROM STAFF WHERE COMM IS NULL; 

-- CURSOR EXPLICITO: OPEN, FETCH, WHILE, CLOSE
-- Cursor que acualiza las comisiones nulas por el valor cero.
SET SERVEROUTPUT ON;
DECLARE 
    CURSOR ASIGNAR_CEROS IS SELECT ID, COMM FROM STAFF WHERE COMM IS NULL;
    Codigo STAFF.ID%TYPE;   
    Comision STAFF.COMM%TYPE;
BEGIN
     OPEN ASIGNAR_CEROS;
     FETCH ASIGNAR_CEROS INTO Codigo, Comision;
     WHiLE ASIGNAR_CEROS%Found --> �Encontro Fila de datos? V(11 veces) F(1)
     LOOP
         IF (Comision IS NULL) THEN 
            UPDATE STAFF SET COMM = 0 WHERE ID=Codigo;
            COMMIT;
         END IF;
         FETCH ASIGNAR_CEROS INTO Codigo, Comision;
     END LOOP;
     CLOSE ASIGNAR_CEROS;
     DBMS_OUTPUT.PUT_LINE('Comisiones en Staff Actualizadas');
END;

-- Volvemos a consultar por las comisiones nulas
SELECT * FROM STAFF WHERE COMM IS NULL; 
SELECT * FROM STAFF;
-- EJEMPLO 2:
-- En la tabla STAFF, existen a�os nulos en la columna YEARS, se pide crear
-- una copia de seguridad de aquellas filas, pasar esos registros a la
-- tabla BACKUP_STAFF.

-- Primero, verificamos la existencia de a�os nulos:
SELECT * FROM STAFF WHERE YEARS IS NULL;

-- Segundo, Creamos la tabla BACKUP_STAFF que tiene la misma
-- estructura de la tabla STAFF.
CREATE TABLE BACKUP_STAFF(
    ID Numeric (5, 0) PRIMARY KEY NOT NULL ,
    NAME Varchar2 (10) NOT NULL ,
    DEPT Numeric (5, 0) NOT NULL ,
    JOB Varchar2 (6) NOT NULL ,
    YEARS Numeric (5, 0) NULL ,
    SALARY Numeric (8, 2) NOT NULL ,
    COMM Numeric (8, 2) NULL 
);

SELECT * FROM BACKUP_STAFF;

-- Tercero, Creamos el cursor expl�cito de Inserci�n de datos,
-- en editor de ORACLE PL/SQL.
SET SERVEROUTPUT ON;
DECLARE 
    CURSOR RESPALDO IS 
    SELECT ID, NAME, DEPT, JOB, YEARS, SALARY, COMM FROM STAFF
           WHERE YEARS IS NULL;

    Codigo       STAFF.ID%TYPE;
    Nombre       STAFF.NAME%TYPE;
    Departamento STAFF.DEPT%TYPE;
    Trabajo      STAFF.JOB%TYPE;
    Annos        STAFF.YEARS%TYPE;
    Salario      STAFF.SALARY%TYPE;
    Comision     STAFF.COMM%TYPE;
BEGIN
     OPEN RESPALDO;
     FETCH RESPALDO INTO Codigo, Nombre, Departamento, Trabajo,
           Annos, Salario, Comision;
     WHiLE RESPALDO%Found -- V(4)  F(1)
     LOOP
         IF (Annos IS NULL) THEN 
            INSERT INTO BACKUP_STAFF 
            VALUES (Codigo, Nombre, Departamento, Trabajo, 
                    Annos, Salario, Comision);
             COMMIT;
         END IF;
         FETCH RESPALDO INTO Codigo, Nombre, Departamento, Trabajo,
               Annos, Salario, Comision;
      END LOOP;
      CLOSE RESPALDO;
END;

-- Despu�s de la ejecuci�n del c�digo, verificamos en la tabla
-- BACKUP_STAFF la copia de los registros.

SELECT * FROM BACKUP_STAFF; 
-- �Exito!


-- EJEMPLO 3:
-- En la tabla TRABAJADOR, existe personal sin sueldo (null),
-- crear un cursor que asigne 500 soles a aquellas personas que no tienen sueldo.

-- Primero realizamos una consulta sobre la tabla TRABAJADOR
-- para ver quienes no tienen sueldo.
SELECT * FROM TRABAJADOR WHERE SUELDO IS NULL;

-- Como ya sabemos qui�nes son, procedemos a crear el cursor de actualizaci�n
-- de sueldos, en la tabla TRABAJADOR, desde el editor de Oracle PL/SQL.
SET SERVEROUTPUT ON;
DECLARE 
    CURSOR ASIGNAR_500 IS SELECT COD_TRA, SUELDO 
           FROM TRABAJADOR WHERE SUELDO IS NULL;

    Codigo TRABAJADOR.COD_TRA%TYPE;
    Paga   TRABAJADOR.SUELDO%TYPE;

BEGIN
     OPEN ASIGNAR_500;
     FETCH ASIGNAR_500 INTO Codigo, Paga;
     WHiLE ASIGNAR_500%Found -- V(6)  F(1)
     LOOP
         IF (Paga IS NULL) THEN 
            UPDATE TRABAJADOR SET SUELDO=500 WHERE COD_TRA=Codigo;
            COMMIT;
         END IF;
         FETCH ASIGNAR_500 INTO Codigo, Paga;
     END LOOP;
     CLOSE ASIGNAR_500;
     DBMS_OUTPUT.PUT_LINE ('SUELDOS ACTUALIZADOS');
END;

-- Por �ltimo, se debe verificar su hay sueldos nulos.
SELECT * FROM TRABAJADOR WHERE SUELDO IS NULL;
SELECT * FROM TRABAJADOR;

-- CURSORES -->  IMPLICITOS (1REG) 
            -->  EXPLICITOS (VARIOS REG --> WHILE FETCH)
            
            
























