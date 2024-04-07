Create Database SEMANA10
On (
    Name = SEMANA10_DATA, Filename ='c:\IDAT\SEMANA10_DATA.MDF',
	Size = 5MB, MaxSize = 10MB, Filegrowth = 10MB
	)
log ON
    (
    Name = SEMANA10_LOG, Filename ='c:\IDAT\SEMANA10_LOG.LDF',
	Size = 5MB, MaxSize = 10MB, Filegrowth = 5MB
	)
Go

Use SEMANA10
Go



Create Table Alumno(
           Cod_Alu      VARCHAR(5) Not Null,
           Nombre       VARCHAR(50) Not Null,
           Sexo         VARCHAR(1) Not Null Default 'F',
		   Dni			CHAR(8) Not Null,
           Grado        Int Not Null Default 1,
		   Fecha_Nac    Date Not Null,
           Edad         Int Not Null Default 5,
           CONSTRAINT PK_COD_ALU PRIMARY KEY (Cod_Alu),
           CONSTRAINT CHK_SEXO_VALID CHECK (SEXO IN ('M','F')),
		   CONSTRAINT U_DNI UNIQUE(Dni),
           CONSTRAINT CHK_GRADO_VALID CHECK (Grado IN (1,2,3,4,5,6)),
           CONSTRAINT CHK_EDAD_VALID CHECK (Edad>=5 AND Edad<=22),
 )
 Print 'Tabla "Alumno" Creada Satisfactoriamente en el Grupo [FG_PRIVADO]'
Go

Create Table Cursos(
           Cod_Curso    VARCHAR(5) Not Null,
           Descripcion  VARCHAR(30) Not Null,
		   Creditos     int not Null Default 1,
           CONSTRAINT PK_COD_CURSO PRIMARY KEY (Cod_Curso),
		   CONSTRAINT CHK_CREDITOS CHECK (Creditos IN (1,2,3,4,5,6))
)
Print 'Tabla "Cursos" Creada Satisfactoriamente en el Grupo [FG_GERENCIA]'
Go

Create Table Profesor(
           Cod_Prof  VARCHAR(5) Not Null,
           Nombre    VARCHAR(100) Not Null,
           Titulo    VARCHAR(100) Not Null Default 'Sin Titulo',
           Edad      Int Not Null Default 25,
           CONSTRAINT PK_COD_PROF PRIMARY KEY (Cod_Prof),
           CONSTRAINT CHK_EDADPROF_VALID CHECK (Edad>=25 and Edad<=60),
		   CONSTRAINT CHK_EDAD_PROFESOR_VALID CHECK (Edad>=25 AND Edad<=64)
)
Print 'Tabla "Profesor" Creada Satisfactoriamente en el Grupo [FG_CONTABILIDAD]'
Go

Create Table Notas (
           Cod_Alu       VARCHAR(5) Not Null,
           Cod_Curso     VARCHAR(5) Not Null,
           Cod_Prof      VARCHAR(5) Not Null,
           Nota1         Int Null,
           Nota2         Int Null,
           Nota3         Int Null,
           Nota4         Int Null,
           Fecha         Date Not Null DEFAULT GETDATE(),
           --CONSTRAINT PK_COD_ALU_COD_CURSO_COD_PROF PRIMARY KEY (Cod_Alu,Cod_Curso,Cod_Prof),
           CONSTRAINT CHK_NOTA1_VALID CHECK (Nota1>=0 AND Nota1<=20),
           CONSTRAINT CHK_NOTA2_VALID CHECK (Nota2>=0 AND Nota2<=20),
           CONSTRAINT CHK_NOTA3_VALID CHECK (Nota3>=0 AND Nota3<=20),
           CONSTRAINT CHK_NOTA4_VALID CHECK (Nota4>=0 AND Nota4<=20),
           CONSTRAINT FK_COD_ALUMNO FOREIGN KEY (COD_ALU) REFERENCES ALUMNO,
           CONSTRAINT FK_COD_CURSO FOREIGN KEY (COD_CURSO) REFERENCES CURSOS,
           CONSTRAINT FK_COD_PROF FOREIGN KEY (COD_PROF) REFERENCES PROFESOR
)
Print 'Tabla "Notas" Creada Satisfactoriamente en el Grupo [FG_SISTEMAS]'
Go

Create Table Cargo(
	IdCargo     int Not Null,
	Descripcion Varchar(50) Not Null,
	Sueldo      Numeric(10, 2) Not Null,
	CONSTRAINT Llave_Cargo PRIMARY KEY (IdCargo)
)
PRINT('Tabla Cargo Creada')
Go

--Creacion de la Tabla Trabajador
Create Table Trabajador(
	IdTrabajador Char(5) Not Null,
	IdCargo      int Not Null,
	Nombre       Varchar(50) Not Null,
	Dni          Char(8) Not Null,
	Ecivil       Varchar(20) Null DEFAULT 'Soltero',
	Sexo         Varchar(20) Not Null,
	Direccion    Varchar(50) Not Null,
	F_Nac        Date Not Null,
	Estado       Varchar(20) Null DEFAULT 'Activo',
	CONSTRAINT Llave_Trabajador PRIMARY KEY (IdTrabajador),
	CONSTRAINT Llave_Foranea_Relacion FOREIGN KEY (IdCargo) REFERENCES Cargo(IdCargo),
	CONSTRAINT CHK_SEXO CHECK (SEXO IN ('Masculino','Femenino')),
	CONSTRAINT CHK_ECIVIL CHECK (Ecivil IN ('Soltero','Casado','Viudo','Divorciado')),
	CONSTRAINT U_Identidad UNIQUE(Dni),
	CONSTRAINT CHK_ESTADO CHECK (Estado IN ('Activo','Bloqueado','Cesado','Despedido'))
)
PRINT('Tabla Trabajador Creada')
Go

CREATE TABLE LIBRO(CODLIB VARCHAR(5) PRIMARY KEY NOT NULL,		
                   TITULOLIB VARCHAR(32),		
                   AUTORLIB  VARCHAR(24),		
                   EDITOLIB  VARCHAR(13),		
                   AREALIB   VARCHAR(9),		
                   PRECIOLIB NUMERIC(8,2),	
                   NHOJASLIB INT,			
                   ANOLIB    INT)
go

PRINT('Tabla Libro Creada')
Go


CREATE TABLE TRABAJADOR2 
                       (COD_TRA VARCHAR(5) PRIMARY KEY NOT NULL,
                        AP_TRA VARCHAR(15) NULL,
                        AM_TRA VARCHAR(15) NULL,
                        NOM_TRA VARCHAR(15) NULL,
                        FECHA_NA SMALLDATETIME NULL,
                        SUELDO DECIMAL(8,2) NULL,
                        GENERO_TRA CHAR NULL,
                        AREA_TRA VARCHAR(30) NULL)

GO
PRINT('Tabla Trabajador2 Creada')
Go


-- Cambia el formato de fecha del sistema
-- al formato dia/ mes / año
Set Dateformat DMY
Go


-- Tabla Padre Alumno:
INSERT INTO ALUMNO VALUES ('A0001','Alcantara Lopez Juan Carlos','M','45856589',1,'03/05/1970',15)
INSERT INTO ALUMNO VALUES ('A0002','Becerra Campos Alberto ','M','40054784',3,'22/05/1980',19)
INSERT INTO ALUMNO VALUES ('A0003','Chavez Salas Esther','F','75569854',2,'15/10/2000',17)
INSERT INTO ALUMNO VALUES ('A0004','Sanchez Peralta Elizabeth','F','41236545',1,'11/11/2001',12)
INSERT INTO ALUMNO VALUES ('A0005','Reyes Carpio Susana','F','44569852',2,'14/02/1987',19)
INSERT INTO ALUMNO VALUES ('A0006','Camacho Salas Eliana','F','45211123',2,'02/03/1980',19)
INSERT INTO ALUMNO VALUES ('A0007','Cespedes Lujan Violeta','F','48789658',4,'03/03/1980',19)
INSERT INTO ALUMNO VALUES ('A0008','Vilca Contreras Edgard','M','45566332',4,'05/03/1980',18)
INSERT INTO ALUMNO VALUES ('A0009','Huaman Centeno Arturo','M','44645214',4,'12/10/1970',18)
INSERT INTO ALUMNO VALUES ('A0010','Cespedes Altamirano Alejandra','F','45223369',2,'10/08/1970',15)
Go

-- Tabla Padre Cursos:
INSERT INTO CURSOS VALUES ('C0001','Matemática',4)
INSERT INTO CURSOS VALUES ('C0002','Lenguaje',2)
INSERT INTO CURSOS VALUES ('C0003','Historia',3)
INSERT INTO CURSOS VALUES ('C0004','Química',3)
INSERT INTO CURSOS VALUES ('C0005','Geografía',3)
Go

-- Tabla Padre Profesor:
INSERT INTO PROFESOR VALUES ('P0001','Rojas Crespin Cristina','Ing. de Sistemas',25)
INSERT INTO PROFESOR VALUES ('P0002','Salazar Silva Segio','Contador Público',35)
INSERT INTO PROFESOR VALUES ('P0003','Sanchez Salazar Cesar','Contador Público',29)
INSERT INTO PROFESOR VALUES ('P0004','Vasquez Prieto Helena','Ing. Matemático',25)
INSERT INTO PROFESOR VALUES ('P0005','Camacho Fernández Luigui','Ing. Agronomo',35)
INSERT INTO PROFESOR VALUES ('P0006','Verastegui Vargas Carmen','Lic. Lengua y Literatura',40)
Go

-- Tabla Hijo: Notas
INSERT INTO NOTAS VALUES ('A0001','C0001','P0001',10,10,10,10,GETDATE())
INSERT INTO NOTAS VALUES ('A0001','C0002','P0002',18,15,18,16,GETDATE())
INSERT INTO NOTAS VALUES ('A0001','C0003','P0002',12,15,16,17,GETDATE())
Go
INSERT INTO NOTAS VALUES ('A0002','C0001','P0001',12,13,15,17,GETDATE())
INSERT INTO NOTAS VALUES ('A0002','C0002','P0002',13,15,15,14,GETDATE())
INSERT INTO NOTAS VALUES ('A0002','C0003','P0002',16,16,18,16,GETDATE())
Go
INSERT INTO NOTAS VALUES ('A0003','C0001','P0001',15,15,15,15,GETDATE())
INSERT INTO NOTAS VALUES ('A0003','C0002','P0002',19,19,19,19,GETDATE())
INSERT INTO NOTAS VALUES ('A0003','C0003','P0002',11,16,14,16,GETDATE())
Go
INSERT INTO NOTAS VALUES ('A0004','C0001','P0001',15,15,15,15,GETDATE())
INSERT INTO NOTAS VALUES ('A0004','C0002','P0002',19,19,19,19,GETDATE())
INSERT INTO NOTAS VALUES ('A0004','C0003','P0002',11,16,14,16,GETDATE())
Go
INSERT INTO NOTAS VALUES ('A0005','C0001','P0001',15,15,15,15,GETDATE())
INSERT INTO NOTAS VALUES ('A0005','C0002','P0002',19,19,19,19,GETDATE())
INSERT INTO NOTAS VALUES ('A0005','C0003','P0002',11,16,14,16,GETDATE())
Go
INSERT INTO NOTAS VALUES ('A0006','C0001','P0001',15,15,15,15,GETDATE())
INSERT INTO NOTAS VALUES ('A0006','C0002','P0002',19,19,19,19,GETDATE())
INSERT INTO NOTAS VALUES ('A0006','C0003','P0002',11,16,14,16,GETDATE())
Go


Insert Into Cargo Values (1,'Gerente', 5000)
Insert Into Cargo Values (2,'Administrador', 4000)
Insert Into Cargo Values (3,'Secretaria', 2000)
Insert Into Cargo Values (4,'Contador', 3500)
Insert Into Cargo Values (5,'Servicios', 920)
Insert Into Cargo Values (6,'Soporte', 1920)
Insert Into Cargo Values (7,'Delivery', 920)
Insert Into Cargo Values (8,'Almacenero', 920)
Go

Insert Into Trabajador Values ('T0001',1,'Celestino Perez Julian','08585457','Soltero',
                               'Masculino','Av. Peru 2344 SMP','13/05/1970','Activo')

Insert Into Trabajador Values ('T0002',2,'Ramos Castro Cecilia','45878981','Soltero',
                               'Femenino','Calle Los Tulipanes Cercado','10/03/1980','Activo')

Insert Into Trabajador Values ('T0003',2,'Ortega Sánchez Liliana','07536569','Soltero',
                               'Femenino','Rojas Peralta Ernesto','15/04/1975','Activo')

Insert Into Trabajador Values ('T0004',3,'Rodriguez Salas Lilian ','45212369','Soltero',
                               'Femenino','Jr. huaraz 556 Breña','08/10/1979','Activo')

Insert Into Trabajador Values ('T0005',3,'Valenzuela Carpio Selene','45878985','Soltero',
                               'Femenino','Calle los Naranjos 555 SJL','05/12/1980','Activo')

Insert Into Trabajador Values ('T0006',4,'Bustamante Ramos Cesar','08555474','Soltero',
                               'Masculino','Jr. Huancayo 123 Cercado','25/05/1988','Activo')

Insert Into Trabajador Values ('T0007',4,'Valencia Flores Hernan','08585450','Soltero',
                               'Masculino','Av. Peru 2344 SMP','13/05/1970','Activo')

Insert Into Trabajador Values ('T0008',5,'Perez Cisneros Pedro','45566998','Soltero',
                               'Masculino','Av. Peru 1600 SMP','29/03/1985','Activo')

Insert Into Trabajador Values ('T0009',5,'Ramirez Sánchez Julian','45644477','Soltero',
                               'Masculino','Calle los Naranjos 545 SJL','20/10/1985','Activo')

Insert Into Trabajador Values ('T0010',5,'Sanchez López Elizabeth','42221178','Soltero',
                               'Femenino','Calle los Amparados 233 Independencia','18/10/1985','Activo')
Go

INSERT INTO LIBRO VALUES('1000','VISUAL FOX','RUBEN IGLESIAS','RAMA','LPROG',60,489,1997)
INSERT INTO LIBRO VALUES('1001','POWER BUILDER 6.','RAMIRO HOOL','UNI','LPROG',80,410,1999)
INSERT INTO LIBRO VALUES('1002','ANALISIS Y DISEÑO DE SIST.','KENDALL & KENDALL','PRINTICE HALL','ANALISIS',100,913,1997)
INSERT INTO LIBRO VALUES('1003','POWER BUILDER 6.','WILLIAM B. HEYS','QUE','LPROG',150,843,1999)
INSERT INTO LIBRO VALUES('1004','VISUAL BASIC','CESAR BUSTAMANTE','GRAPPERU','LPROG',35,390,1997)
INSERT INTO LIBRO VALUES('1005','VISUAL FOX PRO','LES & JHON PINTER','MC GRAWHILL','LPROG',25,567,1997)
INSERT INTO LIBRO VALUES('1006','GUIA C++','JULIO VASQUEZ PARAGULLAS','UPSMP','LPROG',50,780,1997)
INSERT INTO LIBRO VALUES('1007','MS C++','BECK ZARATIAN','MICROSOFT','LPROG',80,600,1999)
INSERT INTO LIBRO VALUES('1008','VISUAL FOX PRO 6.00','CESAR BUSTAMANTE','UNI','LPROG',35,450,1999)
INSERT INTO LIBRO VALUES('1009','AUTOCAD 2000','J.A. TAJADURA J. LOPEZ','MC GRAW HILL','CAD',40,480,1998)
INSERT INTO LIBRO VALUES('1010','EFECTOS COREL','ANOMINO','MACRO','ARTE',50,400,1998)
INSERT INTO LIBRO VALUES('1011','EL VENDEDOR MAS GRANDE DEL MUNDO','OG MANDINO','DIANA','LIDERAZGO',15,121,1968)
INSERT INTO LIBRO VALUES('1012','EL PODER DEL CARISMA','MIGUEL ANGEL CORNEJO','ESTRELLA','LIDERAZGO',15,123,1992)
INSERT INTO LIBRO VALUES('1013','7 HABITOS DE LA GENTE EFECTIVA','STEPHEN  R. COVER','PAIDOS','LIDERAZGO',50,460,1989)
INSERT INTO LIBRO VALUES('1014','CRITERIOS EVA. PROY.','NASSIR SAPAG CHAIN','MC GRAW HILL','PROYECTOS',10,144,1997)
INSERT INTO LIBRO VALUES('1015','COMO DIRIGIR MICRO EMP.','VICTOR ABAD G.','IPEDE','PROYECTOS',10,110,1995)
INSERT INTO LIBRO VALUES('1016','LA MAGIA DE PENSAR EN GRANDE','DAVID JASEPH SCHWRTZ','HERREROS MEX','LIDERAZGO',10,258,1960)
INSERT INTO LIBRO VALUES('1017','SQL SERVER VB','WILLIAM R. VAUGHN','MICROSOFT','LPROG',60,1000,1999)
INSERT INTO LIBRO VALUES('1018','VISUAL FOX 6.00','MENACHEN BAZIAN','QUE','LPROG',55,1000,1999)
INSERT INTO LIBRO VALUES('1019','INTELIGENCIA EMOCIONAL','DANIEL GOLEMAN','ZETA','LIDERAZGO',48,396,1996)
INSERT INTO LIBRO VALUES('1020','LA TERCERA OLA','ALVIN TOFFLER','MC GRAW HILL','LIDERAZGO',50,250,1998)
go

INSERT INTO TRABAJADOR2 VALUES ('00001','DE LA MADRID','GUTIERREZ' , 'MARICIELO', CONVERT(SMALLDATETIME,'01/11/1980'),980,'F','CONTABILIDAD')
INSERT INTO TRABAJADOR2 VALUES ('00002','HURTADO','CORONEL', 'NILDA', CONVERT(SMALLDATETIME,'10/10/1976'),980,'F','CONTABILIDAD')
INSERT INTO TRABAJADOR2 VALUES ('00003','PAREDES','MARTINEZ','EDITH', CONVERT(SMALLDATETIME,'10/10/1976'),1500,'F','SISTEMAS')
INSERT INTO TRABAJADOR2 VALUES ('00004','CARDOSO','VALLADARES','HENRY', CONVERT(SMALLDATETIME,'10/10/1980'),1200,'M','SISTEMAS')
INSERT INTO TRABAJADOR2 VALUES('00005','UBILLUS','MARQUEZ','MIGUEL ANGEL', CONVERT(SMALLDATETIME,'05/01/1976'),980,'M','CONTABILIDAD')
INSERT INTO TRABAJADOR2 VALUES('00006','LIZARRAGA','DEL OLMO','NUPCIA MASSIEL', CONVERT(SMALLDATETIME,'05/10/1980'),1300,'F','SISTEMAS')
INSERT INTO TRABAJADOR2 VALUES('00007','AGUIRRE','RIVADENEIRA','VANNIA', CONVERT(SMALLDATETIME,'05/10/1975'),1200,'F','SISTEMAS')
INSERT INTO TRABAJADOR2 VALUES('00008','JUAREZ','LAZO','GINO', CONVERT(SMALLDATETIME,'05/10/1969'),1200,'M','LOGISTICA')
INSERT INTO TRABAJADOR2 VALUES('00009','PINTADO','ROBLES','JUAN ABEL', CONVERT(SMALLDATETIME,'28/08/1984'),1000,'M','LOGISTICA')
INSERT INTO TRABAJADOR2 VALUES('00010','BARRANTES','MEDINA','LUIS ALBERTO',CONVERT(SMALLDATETIME,'28/08/1975'),1000,'M','LOGISTICA')
GO


-- Comprobar los datos recientemente grabados en las tablas.
Select * From Alumno
Select * From Cursos
Select * From Profesor
Select * From Notas
Select * From Cargo
Select * From  Trabajador
Select * From Libro
Go







