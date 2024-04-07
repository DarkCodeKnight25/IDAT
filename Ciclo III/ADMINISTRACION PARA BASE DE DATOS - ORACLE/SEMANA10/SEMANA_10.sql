-- Si en caso algo sale mal, ejecute todos los DROPS
-- y vuelva a crear todo de nuevo
DROP TABLE NOTAS;
DROP TABLE ALUMNO;
DROP TABLE CURSOS;
DROP TABLE PROFESOR;
DROP TABLE STAFF;
DROP TABLE LIBRO;
DROP TABLE TRABAJADOR2;
DROP TABLE TRABAJADOR;
DROP TABLE CARGO;

DROP TABLE COMPROBANTE;
DROP TABLE DETALLE_PEDIDO;
DROP TABLE PEDIDO;
DROP TABLE CLIENTE;
DROP TABLE EMPLEADO;
DROP TABLE PRODUCTO;

----------------------------------------------------------------------------------------------------------
-- MODELO RELACIONAL COLEGIO
----------------------------------------------------------------------------------------------------------

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
 
 Create Table Cursos(
     Cod_Curso    Varchar2(5) Not Null,
     Descripcion  Varchar2(30) Not Null,
     Credito      Integer Not Null,
     Estado       Varchar2(20) Not Null,
     Constraint Pk_Codigo_Curso Primary Key (Cod_Curso),
     Constraint Chk_Descripcion_Curso Check (Descripcion = Nls_Upper(Descripcion)),
     Constraint Chk_Credito_Curso Check (Credito In (2, 3, 4, 6)),
     Constraint Chk_Estado_Curso Check (Estado In ('ACTIVO','BLOQUEADO'))
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
     CONSTRAINT PK_ALUMNO_CURSO_PROFESOR PRIMARY KEY (Cod_Alu,Cod_Curso,Cod_Prof),
     CONSTRAINT CHK_NOTA1 CHECK (NOTA1>=0 AND NOTA1<=20),
     CONSTRAINT CHK_NOTA2 CHECK (NOTA2>=0 AND NOTA2<=20),
     CONSTRAINT CHK_NOTA3 CHECK (NOTA3>=0 AND NOTA3<=20),
     CONSTRAINT CHK_NOTA4 CHECK (NOTA4>=0 AND NOTA4<=20),
     CONSTRAINT FK_REL_NOTAS_ALUMNO FOREIGN KEY (COD_ALU) REFERENCES ALUMNO(COD_ALU),
     CONSTRAINT FK_REL_NOTAS_CURSO FOREIGN KEY (COD_CURSO) REFERENCES CURSOS(COD_CURSO),
     CONSTRAINT FK_REL_NOTAS_PROFESOR FOREIGN KEY (COD_PROF) REFERENCES PROFESOR(COD_PROF)
 );



----------------------------------------------------------------------------------------------------------
-- MODELO RELACIONAL TABLAS LIBRES
----------------------------------------------------------------------------------------------------------

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



----------------------------------------------------------------------------------------------------------
-- MODELO RELACIONAL CARGO - TRABAJADOR
----------------------------------------------------------------------------------------------------------

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
  
----------------------------------------------------------------------------------------------------------
-- MODELO RELACIONAL COMPROBANTE DE PAGO
----------------------------------------------------------------------------------------------------------
CREATE TABLE CLIENTE
(
	IdCli                VARCHAR2(5) NOT NULL ,
	Nombre               VARCHAR2(50) NOT NULL ,
	Ruc                  VARCHAR2(11) NOT NULL ,
	Direccion            VARCHAR2(50) NOT NULL ,
	Estado               VARCHAR2(20) NOT NULL ,
    PRIMARY KEY (IdCli)
);

CREATE TABLE EMPLEADO
(
	IdEmp                VARCHAR2(5) NOT NULL ,
	Nombre               VARCHAR2(50) NOT NULL ,
	Ruc                  VARCHAR2(11) NOT NULL ,
	Direccion            VARCHAR2(50) NOT NULL ,
	Estado               VARCHAR2(20) NOT NULL ,
    PRIMARY KEY (IdEmp)
);

CREATE TABLE PEDIDO
(
	IdPedido             VARCHAR2(5) NOT NULL ,
	IdCli                VARCHAR2(5) NULL ,
	IdEmp                VARCHAR2(5) NULL ,
	Estado               VARCHAR2(20) NOT NULL ,
    PRIMARY KEY (IdPedido),
    FOREIGN KEY (IdCli) REFERENCES CLIENTE (IdCli),
    FOREIGN KEY (IdEmp) REFERENCES EMPLEADO (IdEmp)
);

CREATE TABLE COMPROBANTE
(
	TipCom               VARCHAR2(20) NOT NULL ,
	NComp                VARCHAR2(5) NOT NULL ,
	IdPedido             VARCHAR2(5) NULL ,
	Estado               VARCHAR2(20) NOT NULL ,
    PRIMARY KEY (TipCom,NComp),
    FOREIGN KEY (IdPedido) REFERENCES PEDIDO (IdPedido)
);

CREATE TABLE PRODUCTO
(
	IdProd               VARCHAR2(5) NOT NULL ,
	Nombre               VARCHAR2(50) NOT NULL ,
	Precio               NUMBER(10, 2) NOT NULL ,
	Stock                INTEGER NOT NULL ,
	Estado               VARCHAR2(20) NOT NULL ,
    PRIMARY KEY (IdProd)
);

CREATE TABLE DETALLE_PEDIDO
(
	Item                 INTEGER NOT NULL ,
	IdPedido             VARCHAR2(5) NOT NULL ,
	IdProd               VARCHAR2(5) NULL ,
	Cant                 INTEGER NOT NULL ,
    PRIMARY KEY (Item,IdPedido),
    FOREIGN KEY (IdProd) REFERENCES PRODUCTO (IdProd),
    FOREIGN KEY (IdPedido) REFERENCES PEDIDO (IdPedido)
);

----------------------------------------------------------------------------------------------------------
-- INSERCION DE DATOS
----------------------------------------------------------------------------------------------------------

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
INSERT INTO LIBRO VALUES('1002','ANALISIS Y DISEÑO DE SIST.','KENDALL Y KENDALL','PRINTICE HALL','ANALISIS',100,913,1997);
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
Insert Into PROFESOR Values ('P0002', 'SALAS ORMEÑO ELIZABETH','CONTADORA PUBLICA','16/04/1900','05878545','Femenino',29,'ACTIVO');
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

Insert Into Trabajador Values ('T0003',2,'Ortega Sánchez Liliana','07536569','Soltero',
                               'Femenino','Rojas Peralta Ernesto','12/04/1975','Activo');

Insert Into Trabajador Values ('T0004',3,'Rodriguez Salas Lilian ','45212369','Soltero',
                               'Femenino','Jr. huaraz 556 Breña','08/10/1979','Activo');

Insert Into Trabajador Values ('T0005',3,'Valenzuela Carpio Selene','45878985','Soltero',
                               'Femenino','Calle los Naranjos 555 SJL','05/12/1980','Activo');

Insert Into Trabajador Values ('T0006',4,'Bustamante Ramos Cesar','08555474','Soltero',
                               'Masculino','Jr. Huancayo 123 Cercado','12/05/1988','Activo');

Insert Into Trabajador Values ('T0007',4,'Valencia Flores Hernan','08585450','Soltero',
                               'Masculino','Av. Peru 2344 SMP','11/05/1970','Activo');

Insert Into Trabajador Values ('T0008',5,'Perez Cisneros Pedro','45566998','Soltero',
                               'Masculino','Av. Peru 1600 SMP','03/03/1985','Activo');

Insert Into Trabajador Values ('T0009',5,'Ramirez Sánchez Julian','45644477','Soltero',
                               'Masculino','Calle los Naranjos 545 SJL','10/10/1985','Activo');

Insert Into Trabajador Values ('T0010',5,'Sanchez López Elizabeth','42221178','Soltero',
                               'Femenino','Calle los Amparados 233 Independencia','11/10/1985','Activo');
COMMIT;


INSERT INTO CLIENTE VALUES('C0001','PEREZ CASTRO JORGE','10545878987','AV. PERU 1234 SMP','ACTIVO');
INSERT INTO CLIENTE VALUES('C0002','SANCHEZ SALAS CARMEN','10254587897','AV. SAENZ PEÑA 120 CALLAO','BLOQUEADO');
INSERT INTO CLIENTE VALUES('C0003','CAMPOS LOPEZ EDUARDO','10547848757','JR. HUASCAR 323 SJL','ACTIVO');
INSERT INTO CLIENTE VALUES('C0004','VERASTEGUI VARGAS JULIAN','10125458787','AV. LOS TULIPANES 928 SJM','BLOQUEADO');
INSERT INTO CLIENTE VALUES('C0005','FERNANDEZ PEREZ ELIZABETH','10545878987','AV. NICOLAS DE PIEROLA 245 LIMA CERCADO','ACTIVO');
COMMIT;

INSERT INTO EMPLEADO VALUES('E0001','RODRIGUEZ CARPIO ALEXANDRA','10546996567','AV. LOS HEROES 2545 SJM','ACTIVO'); 
INSERT INTO EMPLEADO VALUES('E0002','CARPIO LORENZO JUAN','10456321547','JR. HUARAZ 654 BREÑA','ACTIVO');
INSERT INTO EMPLEADO VALUES('E0003','GAMARRA SANCHEZ ANA','10555989877','JR. LAS ALMENDRAS 323 LOS OLIVOS','BLOQUEADO');
INSERT INTO EMPLEADO VALUES('E0004','JAUREGUI DALTANO JULY','10223235697','AV. PERU 3223 SMP','ACTIVO');
INSERT INTO EMPLEADO VALUES('E0005','PEREZ ARBIETO JUAN','10525656587','JR. LAS CAMPANITAS SAN BORJA','BLOQUEADO');
COMMIT;

INSERT INTO PRODUCTO VALUES('P0001','TV. COLOR LED 42P SMART',1599.99,47,'ACTIVO');
INSERT INTO PRODUCTO VALUES('P0002','TV. COLOR LED 55P SMART',2499.99,0,'BLOQUEADO');
INSERT INTO PRODUCTO VALUES('P0003','REFRIGERADOR 14P3 FROZEN',1299.99,47,'ACTIVO');
INSERT INTO PRODUCTO VALUES('P0004','REFRIGERADOR 16P3 FROZEN',1899.99,0,'BLOQUEADO');
INSERT INTO PRODUCTO VALUES('P0005','LAVADORA 8KG CENTRIFUGADORA LAVA-SECA',2599.99,43,'ACTIVO');
INSERT INTO PRODUCTO VALUES('P0006','LAVADORA 10KG CENTRIFUGADORA LAVA-SECA',2899.99,47,'ACTIVO');
INSERT INTO PRODUCTO VALUES('P0007','HORNO MICROONDAS SMART-COOLER',259.99,0,'BLOQUEADO');
INSERT INTO PRODUCTO VALUES('P0008','BLU-RAY - DVD ',249.99,0,'BLOQUEADO');
INSERT INTO PRODUCTO VALUES('P0009','TV. COLOR LED 32P SMART',999.99,22,'ACTIVO');
INSERT INTO PRODUCTO VALUES('P0010','CPU 3.2GB HD 1T DDR3 4GB PLACA BASE INTEL G8748B',1500.00,45,'ACTIVO');
COMMIT;

--3 PEDIDOS
INSERT INTO PEDIDO VALUES('00001','C0001','E0001','EMITIDO');
INSERT INTO PEDIDO VALUES('00002','C0003','E0002','EMITIDO');
INSERT INTO PEDIDO VALUES('00003','C0005','E0004','EMITIDO');
COMMIT;

--3 DETALLES DE PEDIDO
INSERT INTO DETALLE_PEDIDO VALUES(1,'00001','P0001',3);
INSERT INTO DETALLE_PEDIDO VALUES(2,'00001','P0003',3);
INSERT INTO DETALLE_PEDIDO VALUES(3,'00001','P0005',3);
COMMIT;

INSERT INTO DETALLE_PEDIDO VALUES(1,'00002','P0006',3);
INSERT INTO DETALLE_PEDIDO VALUES(2,'00002','P0009',3);
INSERT INTO DETALLE_PEDIDO VALUES(3,'00002','P0010',3);
COMMIT;

INSERT INTO DETALLE_PEDIDO VALUES(1,'00003','P0009',5);
INSERT INTO DETALLE_PEDIDO VALUES(2,'00003','P0010',2);
INSERT INTO DETALLE_PEDIDO VALUES(3,'00003','P0005',4);
COMMIT;

--REALIZANDO LA VENTA
INSERT INTO COMPROBANTE VALUES('BOLETA','B0001','00001','PAGADO');
INSERT INTO COMPROBANTE VALUES('FACTURA','F0001','00002','PAGADO');
INSERT INTO COMPROBANTE VALUES('BOLETA','B0002','00003','EMITIDA');
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

SELECT * FROM CLIENTE;
SELECT * FROM EMPLEADO;
SELECT * FROM PRODUCTO;
SELECT * FROM PEDIDO;
SELECT * FROM DETALLE_PEDIDO;
SELECT * FROM COMPROBANTE;


----------------------------------------------------------------------------------------------------------
-- CASOS BASADOS EN PAQUETES ALMACENADOS
----------------------------------------------------------------------------------------------------------
--  EJEMPLO 1: SIN USAR PARAMETROS
--  Implementar un PAQUETE MI_PAQUETE1, el cual debe contener lo siguiente:
--•	procedimiento1: Mostrara el siguiente mensaje: «PRIMER PROCEDIMIENTO».
--•	procedimiento2: Mostrara el siguiente mensaje: «SEGUNDO PROCEDIMIENTO».

--SOLUCION PASO A PASO

--PASO 1: REALIZAR LA ESPECIFICACION (ZONA DECLARATIVA).
CREATE OR REPLACE PACKAGE MI_PAQUETE1
IS
    PROCEDURE P1;
    PROCEDURE P2;
END;

--PASO 2: CUERPO DEL PAQUETE. (AQUI SE DIGITA LA LOGICA DE CADA PROCEDIMIENTO)
CREATE OR REPLACE PACKAGE BODY MI_PAQUETE1
IS
    PROCEDURE P1
    IS 
    BEGIN
            DBMS_OUTPUT.PUT_LINE ('PRIMER PROCEDIMIENTO');
    END P1;

    PROCEDURE P2
    IS  
    BEGIN
        DBMS_OUTPUT.PUT_LINE ('SEGUNDO PROCEDIMIENTO');
    END P2;
    
END MI_PAQUETE1;

--EJECUCIÓN (PONER A PRUEBA AL PAQUETE)
SET SERVEROUTPUT ON;
EXEC MI_PAQUETE1.p1;
EXEC MI_PAQUETE1.p2;





-- EJEMPLO 2: CON USO DE PARAMETROS
-- Implementar un PAQUETE MI_PAQUETE2  el cual debe contener lo siguiente:
--•	procedimiento1: Mostrara la sumatoria de dos números.
--•	procedimiento2: Mostrara la multiplicación de dos números.

--SOLUCION PASO A PASO

--PASO 1: REALIZAR LA ESPECIFICACION. (ZONA DECLARATIVA)
CREATE OR REPLACE PACKAGE MI_PAQUETE2
IS
    PROCEDURE P1 (A NUMBER, B NUMBER);
    PROCEDURE P2 (X NUMBER, Y NUMBER);
END;

--PASO 2: CUERPO DEL PAQUETE
CREATE OR REPLACE PACKAGE BODY MI_PAQUETE2
IS
    PROCEDURE P1 (A NUMBER, B NUMBER)
    IS
        C NUMBER (5);
    BEGIN
        C:=A+B;
        DBMS_OUTPUT.PUT_LINE ('LA SUMATORIA ES: ' || C);
    END P1;

    PROCEDURE P2 (X NUMBER, Y NUMBER)
    IS 
        Z NUMBER (5);
    BEGIN
        Z:=X*Y;
        DBMS_OUTPUT.PUT_LINE ('LA MULTIPLICACION ES: ' ||  Z);
    END P2;

END MI_PAQUETE2;

--PASO 3: EJECUCION (PONER A PRUEBA AL PAQUETE)
SET SERVEROUTPUT ON;
EXEC MI_PAQUETE2.P1(10, 20);
EXEC MI_PAQUETE2.P2(10, 20);



-- EJEMPLO 3: PROCEDURE Y FUNCTION COMBINADOS.
--  Implementar un PAQUETE MI_PAQUETE3  el cual debe contener lo siguiente:
--•	Procedimiento1: Mostrara la sumatoria de dos números.
--•	Funcion1: Calcular la sumatoria de dos números.

---PASO 1: REALIZAR LA ESPECIFICACION.
CREATE OR REPLACE PACKAGE MI_PAQUETE3
IS
    PROCEDURE P1(A NUMBER, B NUMBER);
    FUNCTION F1(X NUMBER, Y NUMBER) RETURN NUMBER;
END;

--PASO 2: CUERPO DEL PAQUETE.
CREATE OR REPLACE PACKAGE BODY MI_PAQUETE3
IS
    PROCEDURE P1(A NUMBER, B NUMBER)
    IS
        C NUMBER(5);
    BEGIN
        C:=A+B;
        DBMS_OUTPUT.PUT_LINE('LA SUMATORIA ES: ' || C);
    END P1;
    
    FUNCTION F1(X NUMBER, Y NUMBER) RETURN NUMBER
    IS 
        Z NUMBER(5);
    BEGIN
        Z:=X*Y;
        RETURN Z;
    END F1;
    
END MI_PAQUETE3;

--PASO 3: EJECUCION (PONER A PRUEBA EL PAQUETE)

--PROCEDIMIENTO
SET SERVEROUTPUT ON;
EXEC MI_PAQUETE3.P1(10, 20);

--FUNCTION (FORMA 1)
SET SERVEROUTPUT ON;
SELECT MI_PAQUETE3.F1(10, 20) MULTIPLICA FROM DUAL;

-- OTRA FORMA DE LLAMAR A UNA FUNCION (BLOQUE ANONIMO)
SET SERVEROUTPUT ON;
DECLARE 
    RES NUMBER;
BEGIN
    RES := MI_PAQUETE3.F1(10,20);
    DBMS_OUTPUT.PUT_LINE ('La Multiplicación es: ' || RES);
END;


-- EJEMPLO 4: USANDO DATOS DE TABLAS.
-- Implemente un paquete llamado MI_PAQUETE4, el cual contenga los siguientes procedimientos y funciones:
--•	Obtener el conteo de libros
--•	Totalización de libros
--•	El libro más caro
--•	El libro más barato

---PASO 1: REALIZAR LA ESPECIFICACION.
CREATE OR REPLACE PACKAGE MI_PAQUETE4
IS
    FUNCTION FCONTEO_LIBROS RETURN NUMBER;
    FUNCTION FTOTALIZAR_LIBROS RETURN NUMBER;
    FUNCTION FLIBRO_CARO RETURN VARCHAR2;
    FUNCTION FLIBRO_BARATO RETURN VARCHAR2;
    PROCEDURE SP_LLAMADA;
END;

--PASO 2: CUERPO DEL PAQUETE.
CREATE OR REPLACE PACKAGE BODY MI_PAQUETE4
IS
    FUNCTION FCONTEO_LIBROS RETURN NUMBER
    IS 
        CONTAR NUMBER:=0;
    BEGIN
        SELECT COUNT(CODLIB) INTO CONTAR FROM LIBRO;
        RETURN CONTAR;
    END FCONTEO_LIBROS;
    
    FUNCTION FTOTALIZAR_LIBROS RETURN NUMBER
    IS 
        TOTAL NUMBER:=0;
    BEGIN
        SELECT SUM(PRECIOLIB) INTO TOTAL FROM LIBRO;
        RETURN TOTAL;
    END FTOTALIZAR_LIBROS;    

    FUNCTION FLIBRO_CARO
    RETURN Varchar2
    IS
       Precio Number;
       Nombre VARCHAR2(200);
    BEGIN
        SELECT TITULOLIB,PRECIOLIB INTO Nombre, Precio 
        FROM (SELECT TITULOLIB,PRECIOLIB 
              FROM LIBRO ORDER BY PRECIOLIB DESC) WHERE ROWNUM<=1;
        Nombre:= Nombre || ' ' || TO_CHAR(Precio);
    RETURN Nombre;
    END FLIBRO_CARO;

    FUNCTION FLIBRO_BARATO
    RETURN Varchar2
    IS
       Precio Number;
       Nombre VARCHAR2(200);
    BEGIN
        SELECT TITULOLIB,PRECIOLIB INTO Nombre, Precio 
        FROM (SELECT TITULOLIB,PRECIOLIB 
              FROM LIBRO ORDER BY PRECIOLIB) WHERE ROWNUM<=1;
        Nombre:= Nombre || TO_CHAR(Precio);
    RETURN Nombre;
    END FLIBRO_BARATO;
    
    PROCEDURE SP_LLAMADA
    IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('======================================');
        DBMS_OUTPUT.PUT_LINE('DETALLE DE LIBROS:');
        DBMS_OUTPUT.PUT_LINE('======================================');
        DBMS_OUTPUT.PUT_LINE('CONTEO        : ' || FCONTEO_LIBROS);
        DBMS_OUTPUT.PUT_LINE('TOTALIZACION  : ' || FTOTALIZAR_LIBROS);
        DBMS_OUTPUT.PUT_LINE('EL MAS CARO   : ' || FLIBRO_CARO);
        DBMS_OUTPUT.PUT_LINE('EL MAS BARATO : ' || FLIBRO_BARATO);

    END SP_LLAMADA;
    
END MI_PAQUETE4;

--PASO 3: EJECUCION (PRUEBA DEL PAQUETE)
SET SERVEROUTPUT ON;
EXEC MI_PAQUETE4.SP_LLAMADA;


--------------------------------------------------------------------------
-- CASOS ESPECIALES.
--------------------------------------------------------------------------

-- Crear un Procedimiento almacenado, el cual permita grabar nuevos alumnos

-- Primero observaremos los datos de la tabla alumno.
SELECT * FROM ALUMNO;

-- PASO 1: CREAR PROMCEDIMIENTO ALMACENADOs
--> ESTE PROCEDMIENTO ESTARÁ RESERVADO PARA UN PAQUETE.

CREATE OR REPLACE PROCEDURE SP_GRABAR_ALUMNO
(Cod Alumno.Cod_Alu%Type, Nom Alumno.Nombre%Type,
 Sex Alumno.Sexo%Type, Gr Alumno.Grado%Type,
 Fnac Alumno.F_Nacimiento%Type, Ed Alumno.Edad%Type,
 Est Alumno.Estado%Type)
IS
BEGIN
      INSERT INTO ALUMNO VALUES (Cod, Nom, Sex, Gr, Fnac, Ed, Est);
      COMMIT;
END;

-- PRUEBA O EJECUCION (PONER A PRUEBA AL PROCEDMIENTO ALMACENADO)
SET SERVEROUTPUT ON;
BEGIN
    SP_GRABAR_ALUMNO ('A0011','PIKACHU','Masculino',1,'15/12/2010', 12, 'ACTIVO');
    SP_GRABAR_ALUMNO ('A0012','BOMBOM','Femenino',1,'15/12/2010', 12, 'ACTIVO');
    SP_GRABAR_ALUMNO ('A0013','RAYCHU','Masculino',1,'15/12/2002', 20, 'ACTIVO');
    DBMS_OUTPUT.PUT_LINE('REGISTROS ALMACENADOS CON EXITO');
END;

-- VERIFICAMOS
SELECT * FROM ALUMNO;



-- Crear un Procedimiento Almacenado el cual permita consultar los datos de
-- un alumno.  debe usar el campo codigo de alumno para tal búsqueda.

-- PROCEDIMIENTO ALMACENADO RESERVADO PARA UN PAQUETE.
CREATE OR REPLACE PROCEDURE SP_CONSULTAR_ALUMNO
(Cod Alumno.Cod_Alu%Type)
IS
   Nom Alumno.Nombre%Type;
   Sex Alumno.Sexo%Type; Gr Alumno.Grado%Type;
   Fnac Alumno.F_Nacimiento%Type; Ed Alumno.Edad%Type;
   Est Alumno.Estado%Type;
BEGIN
     SELECT Nombre, Sexo, Grado, F_Nacimiento, Edad, Estado 
     INTO Nom, Sex, Gr, Fnac, Ed, Est FROM ALUMNO
     WHERE Cod_Alu = Cod;
     DBMS_OUTPUT.PUT_LINE('================================');
     DBMS_OUTPUT.PUT_LINE('Datos del Alumno: ');
     DBMS_OUTPUT.PUT_LINE('Codigo           : ' || Cod);
     DBMS_OUTPUT.PUT_LINE('Nombre           : ' || Nom);
     DBMS_OUTPUT.PUT_LINE('Género           : ' || Sex);
     DBMS_OUTPUT.PUT_LINE('Grado            : ' || Gr);
     DBMS_OUTPUT.PUT_LINE('Fecha Nacimiento : ' || Fnac);
     DBMS_OUTPUT.PUT_LINE('Edad             : ' || Ed);
     DBMS_OUTPUT.PUT_LINE('Estado           : ' || Est);
     DBMS_OUTPUT.PUT_LINE('');
EXCEPTION
     WHEN NO_DATA_FOUND THEN
         DBMS_OUTPUT.PUT_LINE('EL ALUMNO NO ESTA REGISTRADO');
END;

-- PRUEBA
SET SERVEROUTPUT ON;
BEGIN
    SP_CONSULTAR_ALUMNO('A0001');
END;

-- Crear un Procedmiento Almacenado el cual permita, Eliminar
-- el registro que corresponda a cualquier alumno, como campo
-- referencial o busqueda use al codigo del alumno.

SELECT * FROM ALUMNO;

-- ESTE PROCEMIENTO ALMACENADO ESTA RESERVADO PARA UN PAQUETE
CREATE OR REPLACE PROCEDURE SP_ELIMINAR_ALUMNO
(Cod Alumno.Cod_Alu%Type)
IS
BEGIN
     DELETE FROM ALUMNO WHERE COD_ALU = Cod;
     COMMIT;
END;

-- PRUEBA (ELIMINAR AL ALUMNO CUYO CODIGO ES A0012)
SELECT * FROM ALUMNO;

SET SERVEROUTPUT ON;
BEGIN
     SP_ELIMINAR_ALUMNO ('A0012');
     DBMS_OUTPUT.PUT_LINE('REGISTRO ELIMINADO');
END;

-- VERIFICAR
SELECT * FROM ALUMNO;


-- Crear un Procedmiento almacenado el cual pueda actualizar
-- los datos de un alumno.

-- procedmiento Almacenado reservado para un paquete
CREATE OR REPLACE PROCEDURE SP_ACTUALIZAR_ALUMNO
(Cod Alumno.Cod_Alu%Type, Nom Alumno.Nombre%Type,
 Sex Alumno.Sexo%Type, Gr Alumno.Grado%Type,
 Fnac Alumno.F_Nacimiento%Type, Ed Alumno.Edad%Type, 
 Est Alumno.Estado%Type)
IS
BEGIN
     UPDATE ALUMNO SET Nombre = Nom, Sexo = Sex,
                       Grado = Gr, F_Nacimiento = Fnac,
                       Edad = Ed, Estado = Est
                       WHERE Cod_Alu = Cod;
     COMMIT;
END;

                      
-- PRUEBA:
-- LOS DATOS ANTES DE ACTUALIZAR
SELECT * FROM ALUMNO;
-- En este caso vamos a actualizar los datos del alumno PIKACHU
-- Datos Antiguos: A0011	PIKACHU	Masculino	1	15/12/10	12	ACTIVO
-- Datos Nuevos  : 'A0011', 'CARLOS SARAVIA', 'Masculino', 4, '03/05/2010', 12, 'BLOQUEADO'

-- PRUEBA
SET SERVEROUTPUT ON;
BEGIN
     SP_ACTUALIZAR_ALUMNO ('A0011', 'CARLOS SARAVIA', 'Masculino', 4, '03/05/2010', 12, 'BLOQUEADO');
     DBMS_OUTPUT.PUT_LINE('REGISTRO ACTUALIZADO');
END;

-- LOS DATOS DESPUÉS DE ACTUALIZAR
SELECT * FROM ALUMNO;


--> idea principal: colocar todos estos procedmientos en un paquete

-- IMPLEMENTACIÓN DEL PAQUETE ALMACENADO

-- IMPLEMENTAR LA DEFINICION - ESPECIFICACION
CREATE OR REPLACE PACKAGE MANTEMIENTO_ALUMNO
IS
      PROCEDURE SP_GRABAR_ALUMNO
                (Cod Alumno.Cod_Alu%Type, Nom Alumno.Nombre%Type,
                 Sex Alumno.Sexo%Type, Gr Alumno.Grado%Type,
                 Fnac Alumno.F_Nacimiento%Type, Ed Alumno.Edad%Type,
                 Est Alumno.Estado%Type);
                 
      PROCEDURE SP_CONSULTAR_ALUMNO (Cod Alumno.Cod_Alu%Type);
      
      PROCEDURE SP_ELIMINAR_ALUMNO (Cod Alumno.Cod_Alu%Type);
      
      PROCEDURE SP_ACTUALIZAR_ALUMNO
                (Cod Alumno.Cod_Alu%Type, Nom Alumno.Nombre%Type,
                 Sex Alumno.Sexo%Type, Gr Alumno.Grado%Type,
                 Fnac Alumno.F_Nacimiento%Type, Ed Alumno.Edad%Type, 
                 Est Alumno.Estado%Type);
END;


CREATE OR REPLACE PACKAGE BODY MANTEMIENTO_ALUMNO
IS
    PROCEDURE SP_GRABAR_ALUMNO
              (Cod Alumno.Cod_Alu%Type, Nom Alumno.Nombre%Type,
               Sex Alumno.Sexo%Type, Gr Alumno.Grado%Type,
               Fnac Alumno.F_Nacimiento%Type, Ed Alumno.Edad%Type,
               Est Alumno.Estado%Type)
     IS
     BEGIN
        INSERT INTO ALUMNO VALUES (Cod, Nom, Sex, Gr, Fnac, Ed, Est);
        COMMIT;
     END;
    
    PROCEDURE SP_CONSULTAR_ALUMNO (Cod Alumno.Cod_Alu%Type)
    IS
       Nom Alumno.Nombre%Type;
       Sex Alumno.Sexo%Type; Gr Alumno.Grado%Type;
       Fnac Alumno.F_Nacimiento%Type; Ed Alumno.Edad%Type;
       Est Alumno.Estado%Type;
    BEGIN
       SELECT Nombre, Sexo, Grado, F_Nacimiento, Edad, Estado 
       INTO Nom, Sex, Gr, Fnac, Ed, Est FROM ALUMNO
       WHERE Cod_Alu = Cod;
       DBMS_OUTPUT.PUT_LINE('================================');
       DBMS_OUTPUT.PUT_LINE('Datos del Alumno: ');
       DBMS_OUTPUT.PUT_LINE('Codigo           : ' || Cod);
       DBMS_OUTPUT.PUT_LINE('Nombre           : ' || Nom);
       DBMS_OUTPUT.PUT_LINE('Género           : ' || Sex);
       DBMS_OUTPUT.PUT_LINE('Grado            : ' || Gr);
       DBMS_OUTPUT.PUT_LINE('Fecha Nacimiento : ' || Fnac);
       DBMS_OUTPUT.PUT_LINE('Edad             : ' || Ed);
       DBMS_OUTPUT.PUT_LINE('Estado           : ' || Est);
       DBMS_OUTPUT.PUT_LINE('');
    EXCEPTION
       WHEN NO_DATA_FOUND THEN
           DBMS_OUTPUT.PUT_LINE('EL ALUMNO NO ESTA REGISTRADO');
    END; 
    
    PROCEDURE SP_ELIMINAR_ALUMNO (Cod Alumno.Cod_Alu%Type)
    IS
    BEGIN
       DELETE FROM ALUMNO WHERE COD_ALU = Cod;
       COMMIT;
    END;
    
    
    PROCEDURE SP_ACTUALIZAR_ALUMNO
              (Cod Alumno.Cod_Alu%Type, Nom Alumno.Nombre%Type,
               Sex Alumno.Sexo%Type, Gr Alumno.Grado%Type,
               Fnac Alumno.F_Nacimiento%Type, Ed Alumno.Edad%Type, 
               Est Alumno.Estado%Type)
    IS
    BEGIN
         UPDATE ALUMNO SET Nombre = Nom, Sexo = Sex,
                Grado = Gr, F_Nacimiento = Fnac,
                Edad = Ed, Estado = Est
         WHERE Cod_Alu = Cod;
         COMMIT;
    END;

END MANTEMIENTO_ALUMNO;

SELECT * FROM ALUMNO;

-- PRUEBA DE GRABAR ALUMNO
SET SERVEROUTPUT ON;
EXEC MANTEMIENTO_ALUMNO.SP_GRABAR_ALUMNO ('A0014','SUPERMAN','Masculino',3,'01/01/2001', 21, 'BLOQUEADO');
--COMPROBAR
SELECT * FROM ALUMNO;

-- PRUEBA DE CONSULTA ALUMNO (vamos a llamar a superman)
SET SERVEROUTPUT ON;
EXEC MANTEMIENTO_ALUMNO.SP_CONSULTAR_ALUMNO('A0014');

-- PRUEBA DE ELIMINACION (PROBAR CON EL CODIGO A0013 --> RAYCHU)
SELECT * FROM ALUMNO;

SET SERVEROUTPUT ON;
EXEC MANTEMIENTO_ALUMNO.SP_ELIMINAR_ALUMNO('A0013');
--COMPROBAR
SELECT * FROM ALUMNO;

-- PRUEBA DE MODIFICACION DE DATOS
-- ESTOS SON LOS DATOS DE SUPERMAN:
-- A0014	SUPERMAN	Masculino	3	01/01/01	21	BLOQUEADO
-- NUEVOS DATOS:
-- 'A0014',	'CLARK KEN', 'Masculino',1, '01/01/01',21, 'ACTIVO'
SET SERVEROUTPUT ON;
EXEC MANTEMIENTO_ALUMNO.SP_ACTUALIZAR_ALUMNO('A0014',	'CLARK KEN', 'Masculino',1, '01/01/01',21, 'ACTIVO');

--COMPROBAR
SELECT * FROM ALUMNO;

-- FIN DE PAQUETES ALMACENADOS




















































































































































----------------------------------------------------------------------------------------------------------
--EJEMPLO 1:
----------------------------------------------------------------------------------------------------------
-- Crear una función el cual reciba 3 valores A, B y OP las variables A y B
-- recibirán valores, los cuales serán sometidos a las operaciones básicas
-- conocidas, la variable OP decidirá el tipo de operación a realizar, 
-- estas pueden ser: 1=Suma, 2=Resta, 3=Multiplicación y 4=División. 
-- La función deberá devolver un resultado (RETURN).

CREATE OR REPLACE FUNCTION OPERACION
                  (A NUMBER, B NUMBER, OP NUMBER)
RETURN NUMBER
IS
     C NUMBER:=0;
BEGIN
     CASE  
        WHEN OP=1 THEN C:=A + B;
        WHEN OP=2 THEN C:=A - B;
        WHEN OP=3 THEN C:=A * B;
        WHEN OP=4 THEN C:=A / B;
        WHEN OP=5 THEN C:= POWER(A,B);
        ELSE 
        DBMS_OUTPUT.PUT_LINE('UD. NO HA SELECCIONADO UNA OPERACIÓN CORRECTA');
     END CASE;                              
     RETURN C;
END;



--LAS FUNCIONES SE PUEDEN PROBAR DE DOS MANERAS:
-- TABLA DUAL: es una tabla que siempre esta presente en el
--             manejador de base de datos de oracle.
--             ¿que puedo hacer con la tabla dual?
--             Respuesta: se puede realizar operaciones variadas
--             en tiempo real.
--             ¿Quien creo la tabla dual?
--             YO NO FUI, esta se creó en el momento de instalar Oracle.
--             y aparece siempre cuando se realiza una conexión.



--FORMA 1: DESDE LA TABLA DUAL
SELECT 'HOLA' FROM DUAL;
SELECT 10+5 FROM DUAL;
SELECT SYSDATE FROM DUAL;

SELECT OPERACION (10, 20, 1)  "SUMA" FROM DUAL;
SELECT OPERACION (10, 20, 2)  "RESTA" FROM DUAL;
SELECT OPERACION (10, 20, 3)  "MULTIPLICACION" FROM DUAL;
SELECT OPERACION (10, 20, 4)  "DIVISION" FROM DUAL;
SELECT OPERACION (10, 2, 5)  "POTENCIA A Y B" FROM DUAL;
SELECT OPERACION (10, 2, 6)  "?" FROM DUAL;

-- **PREGUNTA POCO USUAL**

-- ¿SE PODRÁ SUMAR, LA RESTA Y LA MULTIPLICACIÓN?
SELECT  OPERACION (10, 20, 2) + OPERACION (10, 20, 3) 
        "SUMA DE RESTA Y MULTIPLICACION"
        FROM DUAL;



--FORMA 2: USANDO BLOQUE ANONIMO
SET SERVEROUTPUT ON;
DECLARE
  Valor NUMBER;
BEGIN
    Valor := OPERACION(10, 10,1);
    DBMS_OUTPUT.PUT_LINE('LA SUMA ES: ' || Valor);
    Valor := OPERACION(10, 10,2);
    DBMS_OUTPUT.PUT_LINE('LA RESTA ES: ' || Valor);
    Valor := OPERACION(10, 10,3);
    DBMS_OUTPUT.PUT_LINE('LA MULTIPLICACION ES: ' || Valor);
    Valor := OPERACION(10, 10,4);
    DBMS_OUTPUT.PUT_LINE('LA DIVISION ES: ' || Valor);
    Valor := OPERACION(10, 10,5);
    DBMS_OUTPUT.PUT_LINE('LA POTENCIA ES: ' || Valor);
END;




----------------------------------------------------------------------------------------------------------
-- EJEMPLO 2:
----------------------------------------------------------------------------------------------------------
-- Se pide crear una función, que permita contabilizar los libros
-- según el área del libro.
-- SOLUCION:

-- ANALISIS
SELECT * FROM LIBRO;

--SOLLUCIÓN
CREATE OR REPLACE FUNCTION Contar_Libros_Por_Area
       (Area Varchar2) -->'LPROG', 'ANALISIS', 'CAD', 'ARTE','PROYECTOS', 'LIDERAZGO'
RETURN INT
IS
    CONTEO INT:=0;
BEGIN
        SELECT COUNT(AREALIB) INTO CONTEO FROM LIBRO WHERE AREALIB = Area;
        RETURN CONTEO;
END;

--FORMA 1: usando la tabla DUAL
SELECT * FROM LIBRO;
SELECT Contar_Libros_Por_Area('LPROG') "Conteo de Libros LPROG" FROM DUAL;
SELECT Contar_Libros_Por_Area('ANALISIS') "Conteo de Libros ANALISIS" FROM DUAL;
SELECT Contar_Libros_Por_Area('CAD') "Conteo de Libros CAD" FROM DUAL;
SELECT Contar_Libros_Por_Area('ARTE') "Conteo de Libros ARTE" FROM DUAL;
SELECT Contar_Libros_Por_Area('LIDERAZGO') "Conteo de Libros LIDERAZGO" FROM DUAL;
SELECT Contar_Libros_Por_Area('PROYECTOS') "Conteo de Libros PROYECTOS" FROM DUAL;

--FORMA 2: DESDE UN BLOQUE ANONIMO.
SET SERVEROUTPUT ON;
DECLARE
  Ar Varchar2(20):='';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Area: LPROG Son     : ' || Contar_Libros_Por_Area('LPROG'));
    DBMS_OUTPUT.PUT_LINE('Area: ANALISIS Son  : ' || Contar_Libros_Por_Area('ANALISIS'));
    DBMS_OUTPUT.PUT_LINE('Area: CAD Son       : ' || Contar_Libros_Por_Area('CAD'));
    DBMS_OUTPUT.PUT_LINE('Area: ARTE Son      : ' || Contar_Libros_Por_Area('ARTE'));
    DBMS_OUTPUT.PUT_LINE('Area: LIDERAZGO Son : ' || Contar_Libros_Por_Area('LIDERAZGO'));
    DBMS_OUTPUT.PUT_LINE('Area: PROYECTOS Son : ' || Contar_Libros_Por_Area('PROYECTOS'));
END;

-- EJERCICIO CASUAL.
-- SE DESEA VENDER TODOS LOS LIBROS, PERO EL CLIENTE DESEA SABER
-- CUANTO SUMAN LOS LIBROS POR CADA AREA.

Create Or Replace Function Totalizar_Libros_Area
(Area Varchar2)
RETURN NUMBER
IS
  TOTAL NUMBER:=0.0;
BEGIN
      SELECT SUM(PRECIOLIB) INTO TOTAL
      FROM LIBRO
      WHERE AREALIB = Area;
      Return TOTAL;
END;


-- PRUEBA USANDO LA TABLA DUAL
SELECT Totalizar_Libros_Area('LPROG') "TOTAL LPROG" FROM DUAL;
SELECT Totalizar_Libros_Area('CAD') "TOTAL CAD" FROM DUAL;
SELECT Totalizar_Libros_Area('ARTE') "TOTAL ARTE" FROM DUAL;
SELECT Totalizar_Libros_Area('ANALISIS') "TOTAL ANALISIS" FROM DUAL;
SELECT Totalizar_Libros_Area('PROYECTOS') "TOTAL PROYECTOS" FROM DUAL;
SELECT Totalizar_Libros_Area('LIDERAZGO') "TOTAL LIDERAZGO" FROM DUAL;

-- PRUEBA DESDE UN BLOQUE ANÓNIMO
SET SERVEROUTPUT ON;
DECLARE
      TOTAL_LPROG NUMBER:=0; TOTAL_CAD NUMBER:=0; TOTAL_ARTE NUMBER:=0;
      TOTAL_ANALISIS NUMBER:=0; TOTAL_PROYECTOS NUMBER:=0;
      TOTAL_LIDERAZGO NUMBER:=0;
      TOTAL_IMPORTE NUMBER; IGV NUMBER:=0; TOTAL_PAGAR NUMBER:=0;
BEGIN
      TOTAL_LPROG := Totalizar_Libros_Area('LPROG');
      TOTAL_CAD := Totalizar_Libros_Area('CAD');
      TOTAL_ARTE := Totalizar_Libros_Area('ARTE');
      TOTAL_ANALISIS := Totalizar_Libros_Area('ANALISIS');
      TOTAL_PROYECTOS := Totalizar_Libros_Area('PROYECTOS');
      TOTAL_LIDERAZGO := Totalizar_Libros_Area('LIDERAZGO');
      DBMS_OUTPUT.PUT_LINE('--------------------------------------------');
      DBMS_OUTPUT.PUT_LINE('TOTAL LPROG      : ' || TOTAL_LPROG);
      DBMS_OUTPUT.PUT_LINE('TOTAL CAD        : ' || TOTAL_CAD);
      DBMS_OUTPUT.PUT_LINE('TOTAL ARTE       : ' || TOTAL_ARTE);
      DBMS_OUTPUT.PUT_LINE('TOTAL ANALISIS   : ' || TOTAL_ANALISIS);
      DBMS_OUTPUT.PUT_LINE('TOTAL PROYECTOS  : ' || TOTAL_PROYECTOS);
      DBMS_OUTPUT.PUT_LINE('TOTAL LIDERAZGO  : ' || TOTAL_LIDERAZGO);
      DBMS_OUTPUT.PUT_LINE('--------------------------------------------');
      TOTAL_IMPORTE := TOTAL_LPROG + TOTAL_CAD + TOTAL_ARTE + TOTAL_ANALISIS +
                       TOTAL_PROYECTOS + TOTAL_LIDERAZGO;
      IGV := TOTAL_IMPORTE * 0.18;
      TOTAL_PAGAR := TOTAL_IMPORTE + IGV;
      DBMS_OUTPUT.PUT_LINE('TOTAL IMPORTE    : ' || TOTAL_IMPORTE);
      DBMS_OUTPUT.PUT_LINE('IGV              : ' || IGV);
      DBMS_OUTPUT.PUT_LINE('TOTAL PAGAR      : ' || TOTAL_PAGAR);
END;



----------------------------------------------------------------------------------------------------------
--EJEMPLO 3:
----------------------------------------------------------------------------------------------------------
-- Se pide crear una función que permita obtener la totalización de los libros 
-- según el área del libro.

CREATE OR REPLACE FUNCTION Total_Lib
       (Area Varchar2)
RETURN INT
IS
    TOTAL INT:=0;
BEGIN
    SELECT SUM (PRECIOLIB) INTO TOTAL FROM LIBRO WHERE AREALIB = Area;
    RETURN TOTAL;
END;

--FORMA 1: USANDO LA TABLA DUAL
SELECT Total_Lib ('LPROG') "Total de Libros" FROM DUAL;
SELECT Total_Lib ('ANALISIS') "Total de Libros" FROM DUAL;
SELECT Total_Lib ('CAD') "Total de Libros" FROM DUAL;
SELECT Total_Lib ('ARTE') "Total de Libros" FROM DUAL;
SELECT Total_Lib ('LIDERAZGO') "Total de Libros" FROM DUAL;
SELECT Total_Lib ('PROYECTOS') "Total de Libros" FROM DUAL;

--FORMA 2: DESDE UN BLOQUE ANONIMO
SET SERVEROUTPUT ON;
DECLARE
  Ar Varchar2 (20):='LPROG';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Area: LPROG Son     : ' || Total_Lib('LPROG'));
    DBMS_OUTPUT.PUT_LINE('Area: ANALISIS Son  : ' || Total_Lib('ANALISIS'));
    DBMS_OUTPUT.PUT_LINE('Area: CAD Son       : ' || Total_Lib('CAD'));
    DBMS_OUTPUT.PUT_LINE('Area: ARTE Son      : ' || Total_Lib('ARTE'));
    DBMS_OUTPUT.PUT_LINE('Area: LIDERAZGO Son : ' || Total_Lib('LIDERAZGO'));
    DBMS_OUTPUT.PUT_LINE('Area: PROYECTOS Son : ' || Total_Lib('PROYECTOS'));
END;


----------------------------------------------------------------------------------------------------------
--EJEMPLO 4:
----------------------------------------------------------------------------------------------------------
--Crear las funciones necesarias, el cual devuelva el precio de un determinado libro,
--para ello deberá usar como campo de búsqueda al código de libro, a continuación 
--calcular el importe según cantidad de pedido, y se pide calcular adicional mente
--el IGV y el Total a Pagar por dicho libro.

CREATE OR REPLACE FUNCTION BuscarLibro
       (Codigo LIBRO.CODLIB%TYPE)
RETURN VARCHAR2
IS
    Nombre LIBRO.TITULOLIB%TYPE:='';
BEGIN
    SELECT TITULOLIB INTO Nombre FROM LIBRO WHERE CODLIB = Codigo;
    RETURN Nombre;
END;

CREATE OR REPLACE FUNCTION BuscarPrecio
       (Codigo LIBRO.CODLIB%TYPE)
RETURN NUMBER
IS
    PRECIO LIBRO.PRECIOLIB%TYPE:=0;
BEGIN
    SELECT PRECIOLIB INTO PRECIO FROM LIBRO WHERE CODLIB = Codigo;
    RETURN PRECIO;
END;

--FORMA 1 USANDO LA TABLA DUAL
SELECT BuscarPrecio(1000) "PRECIO" FROM DUAL;
SELECT BuscarLibro(1000)  "LIBRO" FROM DUAL;
SELECT BuscarPrecio(1000) * 4 "IMPORTE" FROM DUAL;
SELECT BuscarPrecio(1000) * 4 * 0.18 "IGV" FROM DUAL;
SELECT BuscarPrecio(1000) + (BuscarPrecio(1000) * 4 * 0.18)
       "TOTAL PAGAR" FROM DUAL;


--FORMA 2: DESDE UN BLOQUE ANONIMO
SET SERVEROUTPUT ON;
DECLARE
  CANTIDAD NUMBER:= &CANTIDAD;
  C LIBRO.CODLIB%TYPE:=1000;
  IMPORTE NUMBER(10, 2);
  PRECIO LIBRO.PRECIOLIB%TYPE;
  IGV NUMBER(10,2):=0.0;
  TOTAL_PAGAR NUMBER(10, 2):=0.0;
BEGIN
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('Pedidos:');
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('Libro         : ' || BuscarLibro(C));
    DBMS_OUTPUT.PUT_LINE('Precio        : ' || BuscarPrecio(C));
    DBMS_OUTPUT.PUT_LINE('Cantidad      : ' || CANTIDAD);
    PRECIO:=BuscarPrecio(C);
    IMPORTE:= CANTIDAD * PRECIO;
    IGV:=IMPORTE*0.18;
    TOTAL_PAGAR:=PRECIO + IGV;
    DBMS_OUTPUT.PUT_LINE('Importe       : ' || IMPORTE);
    DBMS_OUTPUT.PUT_LINE('IGV           : ' || IGV);
    DBMS_OUTPUT.PUT_LINE('Total a Pagar : ' || TOTAL_PAGAR);
END;

----------------------------------------------------------------------------------------------------------
--EJEMPLO 5:
----------------------------------------------------------------------------------------------------------
--Crear una función el cual sea capaz de contar alumnos y alumnas por separado

CREATE OR REPLACE FUNCTION Conteo_Generos
      (Gen Varchar2)
RETURN INT
IS
    V_CONTEO INT:=0;
BEGIN
     SELECT COUNT(*) INTO V_CONTEO FROM ALUMNO WHERE SEXO=Gen;
     RETURN V_CONTEO;
END;

--PROBANDO LA FUNCION

--FORMA 1: USANDO LA TABLA DUAL.
SELECT Conteo_Generos ('M') "VARONES" From Dual;
SELECT Conteo_Generos ('F') "DAMAS" From Dual;


--FORMA 2: DESDE UN BLOQUE ANONIMO.
SET SERVEROUTPUT ON;
DECLARE
     V_CONTEO INT;
     F_CONTEO INT;
BEGIN
     V_CONTEO:=Conteo_Generos('M');
     F_CONTEO:=Conteo_Generos('F');
     DBMS_OUTPUT.PUT_LINE('CONTEO DE DAMAS   : ' || F_CONTEO);
     DBMS_OUTPUT.PUT_LINE('CONTEO DE VARONES : ' || V_CONTEO);
END;


----------------------------------------------------------------------------------------------------------
--EJEMPLO 6:
----------------------------------------------------------------------------------------------------------

--OBTENER EL TOTAL DE UN DETERMINADO PEDIDO, ENTRE ELLOS TENEMOS: '00001', '00002' y '00003'
--CADA PEDIDO TIENE 3 PRODUCTOS.

SELECT D.ITEM, P.NOMBRE, D.CANT,
                       P.PRECIO, (D.CANT* P.PRECIO) IMPORTE
                       FROM DETALLE_PEDIDO D, PRODUCTO P
                       WHERE D.IDPROD = P.IDPROD AND
                             D.IDPEDIDO = '00003';


SELECT SUM(D.CANT* P.PRECIO) IMPORTE
                       FROM DETALLE_PEDIDO D, PRODUCTO P
                       WHERE D.IDPROD = P.IDPROD AND
                             D.IDPEDIDO = '00003';


CREATE OR REPLACE FUNCTION TOTALIZAR_PEDIDOS
      (CodigoP Varchar2)
RETURN NUMBER
IS
    TOTAL NUMBER:=0;
BEGIN
     SELECT SUM(D.CANT* P.PRECIO) INTO TOTAL
                       FROM DETALLE_PEDIDO D, PRODUCTO P
                       WHERE D.IDPROD = P.IDPROD AND
                             D.IDPEDIDO = CodigoP;
     RETURN TOTAL;
END;

--FORMA 1: USANDO LA TABLA DUAL
SELECT TOTALIZAR_PEDIDOS('00001') "TOTAL PEDIDO" FROM DUAL;
SELECT TOTALIZAR_PEDIDOS('00002') "TOTAL PEDIDO" FROM DUAL;
SELECT TOTALIZAR_PEDIDOS('00003') "TOTAL PEDIDO" FROM DUAL;

--FORMA 2: DESDE UN BLOQUE ANONIMO
SET SERVEROUTPUT ON;
DECLARE
    CodPed Varchar2(5);
    TotalPed Number:=0;
BEGIN
     DBMS_OUTPUT.PUT_LINE('=============================================');
     DBMS_OUTPUT.PUT_LINE('TOTALIZACION DE PEDIDOS REALIZADOS');
     DBMS_OUTPUT.PUT_LINE('=============================================');
     CodPed:='00001';
     TotalPed:=TOTALIZAR_PEDIDOS(CodPed);
     DBMS_OUTPUT.PUT_LINE('Pedido: ' || CodPed || ', Total: ' || TotalPed);
     CodPed:='00002';
     TotalPed:=TOTALIZAR_PEDIDOS(CodPed);
     DBMS_OUTPUT.PUT_LINE('Pedido: ' || CodPed || ', Total: ' || TotalPed);
     CodPed:='00003';
     TotalPed:=TOTALIZAR_PEDIDOS(CodPed);
     DBMS_OUTPUT.PUT_LINE('Pedido: ' || CodPed || ', Total: ' || TotalPed);
END;

----------------------------------------------------------------------------------------------------------
--EJEMPLO 7:
----------------------------------------------------------------------------------------------------------
--CREAR UNA FUNCION QUE PERMITA MULTIPLICAR UNA CADENA UNA CIERTA CANTIDAD DE VECES.

CREATE OR REPLACE FUNCTION REPLICATE(Cadena VARCHAR2, N NUMBER)
 RETURN VARCHAR2
 IS
       REPETIDOR VARCHAR2(4000);
BEGIN
       REPETIDOR := '';
       FOR I IN 1..N LOOP
             REPETIDOR := REPETIDOR || Cadena;
       END LOOP;
   RETURN REPETIDOR;
END;

--FORMA 1: USANDO LA TABLA DUAL
SELECT REPLICATE ('0', 5) FROM DUAL;

--FORMA 2: DESDE UN BLOQUE ANONIMO

SET SERVEROUTPUT ON;
DECLARE
    TEXTO Varchar2(5):='0';
BEGIN
     DBMS_OUTPUT.PUT_LINE('=============================================');
     DBMS_OUTPUT.PUT_LINE('REPETIDOR DE TEXTOS');
     DBMS_OUTPUT.PUT_LINE('=============================================');
     DBMS_OUTPUT.PUT_LINE(REPLICATE(TEXTO, 10));
END;





































































-- Ejercicio 1:
-- Se pide crear un cursor que sea capaz de mostrar los pedidos realizados, 
-- según la tabla PEDIDO, esta tabla tiene 3 pedidos, 
-- estos son: ‘00001’, ‘00002’ y ‘00003’, para ello se debe ingresar
-- el número del pedido, por intermedio de variables de sustitución &, 
-- y brindar la información solicitada, tal como se muestran en las 
-- siguientes imágenes.


SET SERVEROUTPUT ON;
DECLARE
    It          DETALLE_PEDIDO.ITEM%TYPE;
    CodigoP     PEDIDO.IDPEDIDO%TYPE:= &CodigoP; --> '00001'
    CodigoC     PEDIDO.IDCLI%TYPE;
    CodigoE     PEDIDO.IDEMP%TYPE;
    Est         PEDIDO.ESTADO%TYPE;
    NombreCli   CLIENTE.NOMBRE%TYPE;
    NombreEmp   EMPLEADO.NOMBRE%TYPE;
    NombreProd  PRODUCTO.NOMBRE%TYPE;
    CantProd    DETALLE_PEDIDO.CANT%TYPE;
    PreProd     PRODUCTO.PRECIO%TYPE;
    ImpCompra   NUMBER (10,2);
    TOTAL_IMPORTE NUMBER (10,2):=0;
    CURSOR DETALLE IS (SELECT D.ITEM, P.NOMBRE, D.CANT,
                       P.PRECIO, (D.CANT* P.PRECIO) IMPORTE
                       FROM DETALLE_PEDIDO D, PRODUCTO P
                       WHERE D.IDPROD = P.IDPROD AND
                             D.IDPEDIDO = CodigoP);
BEGIN
    SELECT IDPEDIDO,IDCLI, IDEMP, ESTADO
    INTO CodigoP, CodigoC, CodigoE, Est 
    FROM PEDIDO WHERE IDPEDIDO=CodigoP;
      
    SELECT NOMBRE INTO NombreCli FROM CLIENTE WHERE IDCLI=CodigoC;
    SELECT NOMBRE INTO NombreEmp FROM EMPLEADO WHERE IDEMP=CodigoE;
    DBMS_OUTPUT.PUT_LINE('==================================================');
    DBMS_OUTPUT.PUT_LINE('IMPORTADORA - LAS CAMELIAS S.A');
    DBMS_OUTPUT.PUT_LINE('==================================================');
    DBMS_OUTPUT.PUT_LINE('PEDIDO Nº : ' || CodigoP);
    DBMS_OUTPUT.PUT_LINE('CLIENTE   : ' || NombreCli);
    DBMS_OUTPUT.PUT_LINE('EMPLEADO  : ' || NombreEmp);
    DBMS_OUTPUT.PUT_LINE('==================================================');
    OPEN DETALLE;
    FETCH DETALLE INTO It, NombreProd, CantProd, PreProd, ImpCompra;
    WHiLE DETALLE%Found -- > Si encontró fila
    LOOP
        DBMS_OUTPUT.PUT_LINE(It || CHR(9) || NombreProd || CHR(9));
        DBMS_OUTPUT.PUT_LINE(CHR(9) || 'Cantidad: ' ||CantProd || CHR(9) ||
                'Precio: ' ||PreProd || CHR(9) || 'Importe: ' ||ImpCompra);
        DBMS_OUTPUT.PUT_LINE('==================================================');
        FETCH DETALLE INTO It, NombreProd, CantProd, PreProd, ImpCompra;
    END LOOP;
    
    SELECT SUM(D.CANT* P.PRECIO) INTO TOTAL_IMPORTE 
    FROM DETALLE_PEDIDO D, PRODUCTO P
    WHERE D.IDPROD = P.IDPROD AND D.IDPEDIDO = CodigoP;
    
    DBMS_OUTPUT.PUT_LINE('TOTAL IMPORTE: ' || TOTAL_IMPORTE);
    DBMS_OUTPUT.PUT_LINE('==================================================');
    CLOSE DETALLE;
END;

SELECT * FROM ALUMNO;
SELECT * FROM PROFESOR;
SELECT * FROM CURSOS;
SELECT * FROM NOTAS;

SELECT P.NOMBRE, C.DESCRIPCION, N.Nota1, N.Nota2, N.Nota3, N.Nota4,
       (N.Nota1*0.04) + (N.Nota2*0.12) + (N.Nota3*0.24) + (N.Nota4*0.6) PROMEDIO,
       Case 
       When ((N.Nota1*0.04) + (N.Nota2*0.12) + (N.Nota3*0.24) + (N.Nota4*0.6))  > 13 THEN 'APROBADO'
       When ((N.Nota1*0.04) + (N.Nota2*0.12) + (N.Nota3*0.24) + (N.Nota4*0.6)) <=12.5 THEN 'DESAPROBADO' 
       END ESTADO
FROM NOTAS N INNER JOIN ALUMNO A ON A.COD_ALU = N.COD_ALU
             INNER JOIN CURSOS C ON C.COD_CURSO = N.COD_CURSO
             INNER JOIN PROFESOR P ON P.COD_PROF = N.COD_PROF
WHERE A.COD_ALU = &CodA;


-- Ejercicio 2:

SET SERVEROUTPUT ON;
DECLARE
    CodA       Alumno.Cod_Alu%TYPE := &CodA;
    Codigo     Alumno.Cod_Alu%TYPE;
    NombreAlu  Alumno.Nombre%TYPE;
    
    Profe      Profesor.Nombre%TYPE;
    Asignatura Cursos.Descripcion%TYPE;
    N1 NOTAS.Nota1%TYPE;
    N2 NOTAS.Nota2%TYPE;
    N3 NOTAS.Nota3%TYPE;
    N4 NOTAS.Nota4%TYPE;
    Prom Number(5,2);
    Estado Varchar2(20);
    
    --CURSOR EXPLICITO (GENERA VARIOS REGISTROS)
    CURSOR DETALLE_ALUMNO IS (SELECT P.NOMBRE, C.DESCRIPCION, N.Nota1, N.Nota2, N.Nota3, N.Nota4,
       (N.Nota1*0.04) + (N.Nota2*0.12) + (N.Nota3*0.24) + (N.Nota4*0.6) PROMEDIO,
       Case 
           When ((N.Nota1*0.04) + (N.Nota2*0.12) + (N.Nota3*0.24) + (N.Nota4*0.6))  > 13 THEN 'APROBADO'
           When ((N.Nota1*0.04) + (N.Nota2*0.12) + (N.Nota3*0.24) + (N.Nota4*0.6)) <=12.5 THEN 'DESAPROBADO' 
       END ESTADO
       FROM NOTAS N INNER JOIN ALUMNO A ON A.COD_ALU = N.COD_ALU
                    INNER JOIN CURSOS C ON C.COD_CURSO = N.COD_CURSO
                    INNER JOIN PROFESOR P ON P.COD_PROF = N.COD_PROF
       WHERE A.COD_ALU = CodA);
BEGIN
    --CURSOR IMPLICITO (POR QUE USA UN SOLO REGISTRO DE DATOS)
    SELECT Cod_Alu, Nombre Into Codigo, NombreAlu FROM ALUMNO WHERE COD_ALU = CodA;
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Reporte de Alumno:');
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Codigo           : ' || Codigo);
    DBMS_OUTPUT.PUT_LINE('Nombre Alumno    : ' || NombreAlu);
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------------');
    OPEN DETALLE_ALUMNO;
    FETCH DETALLE_ALUMNO INTO Profe, Asignatura,N1, N2, N3, N4, Prom, Estado;
    WHiLE DETALLE_ALUMNO%Found -- > Si encontró fila
    LOOP
        DBMS_OUTPUT.PUT_LINE('Profesor         : ' || Profe);
        DBMS_OUTPUT.PUT_LINE('Asignatura       : ' || Asignatura);
        DBMS_OUTPUT.PUT_LINE('Nota 1    : ' || N1 || ' Nota 2: ' || N2 || ' Nota3: ' || N3 || ' Nota 4: ' || N4);
        DBMS_OUTPUT.PUT_LINE('Promedio  : ' || Prom || ' Estado: ' || Estado);
        DBMS_OUTPUT.PUT_LINE('==================================================');
        FETCH DETALLE_ALUMNO INTO Profe, Asignatura,N1, N2, N3, N4, Prom, Estado;
    END LOOP;

    CLOSE DETALLE_ALUMNO;
END;
























































































