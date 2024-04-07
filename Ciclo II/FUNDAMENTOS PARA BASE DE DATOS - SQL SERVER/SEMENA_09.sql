
CREATE DATABASE PRUEBA
Go

USE PRUEBA
Go

Create Table Alumno(
           Cod_Alu      VARCHAR(5) Not Null,
           Nombre       VARCHAR(50) Not Null,
           Sexo         VARCHAR(1) Not Null Default 'F',
		   Dni			CHAR(8) Not Null,
           Grado        Int Not Null Default 1,
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

-- Cambia el forma de fecha del sistema
-- al forma dia/ mes / año
Set Dateformat DMY
Go


-- Tabla Padre Alumno:
INSERT INTO ALUMNO VALUES ('A0001','Alcantara Lopez Juan Carlos','M','45856589',1,15)
INSERT INTO ALUMNO VALUES ('A0002','Becerra Campos Alberto ','M','40054784',3,19)
INSERT INTO ALUMNO VALUES ('A0003','Chavez Salas Esther','F','75569854',2,17)
INSERT INTO ALUMNO VALUES ('A0004','Sanchez Peralta Elizabeth','F','41236545',1,12)
INSERT INTO ALUMNO VALUES ('A0005','Reyes Carpio Susana','F','44569852',2,19)
INSERT INTO ALUMNO VALUES ('A0006','Camacho Salas Eliana','F','45211123',2,19)
INSERT INTO ALUMNO VALUES ('A0007','Cespedes Lujan Violeta','F','48789658',4,19)
INSERT INTO ALUMNO VALUES ('A0008','Vilca Contreras Edgard','M','45566332',4,18)
INSERT INTO ALUMNO VALUES ('A0009','Huaman Centeno Arturo','M','44645214',4,18)
INSERT INTO ALUMNO VALUES ('A0010','Cespedes Altamirano Alejandra','F','45223369',2,15)
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
INSERT INTO NOTAS VALUES ('A0003','C0001','P0001',15,15,15,15,GETDATE())
INSERT INTO NOTAS VALUES ('A0003','C0002','P0002',19,19,19,19,GETDATE())
INSERT INTO NOTAS VALUES ('A0003','C0003','P0002',11,16,14,16,GETDATE())
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

Insert Into Trabajador Values ('T0007',4,'Celestino Perez Julian','08585450','Soltero',
                               'Masculino','Av. Peru 2344 SMP','13/05/1970','Activo')

Insert Into Trabajador Values ('T0008',5,'Perez Cisneros Pedro','45566998','Soltero',
                               'Masculino','Av. Peru 1600 SMP','29/03/1985','Activo')

Insert Into Trabajador Values ('T0009',5,'Ramirez Sánchez Julian','45644477','Soltero',
                               'Masculino','Calle los Naranjos 545 SJL','20/10/1985','Activo')

Insert Into Trabajador Values ('T0010',5,'Ortega Snchez Elizabeth','42221178','Soltero',
                               'Femenino','Calle los Amparados 233 Independencia','18/10/1985','Activo')
Go

-- Comprobar los datos recientemente grabados en las tablas.
Select * From Alumno
Select * From Cursos
Select * From Profesor
Select * From Notas
Select * From Cargo
Select * From  Trabajador
Go

-- Examinando las estructuras de las tablas que se han creado.
EXEC sp_help Alumno
EXEC sp_help Cursos
EXEC sp_help Profesor
EXEC sp_help Notas
Go

-- Comprobando la creación de Constructores
Select * From Sys.key_constraints
Select * From Sys.check_constraints
Select * From Sys.default_constraints
Select * From Sys.foreign_keys
Go


-- COMBINACION DE TABLAS
-- JOIN


SELECT T.IdTrabajador, T.Nombre, T.Dni, T.Direccion, C.Descripcion
FROM TRABAJADOR T
     JOIN CARGO C ON T.IdCargo = C.IdCargo
WHERE C.Descripcion = 'SERVICIOS'
Go

SELECT C.Descripcion, N.Nota1, N.Nota2, N.Nota3, N.Nota4
FROM NOTAS N JOIN ALUMNO A ON A.Cod_Alu = N.Cod_Alu
             JOIN CURSOS C ON C.Cod_Curso = N.Cod_Curso
			 JOIN PROFESOR P ON P.Cod_Prof = N.Cod_Prof
WHERE A.Nombre = 'Alcantara Lopez Juan Carlos'
Go

Select * From Alumno
Select * From Notas


SELECT * FROM CARGO
Go

SELECT * FROM TRABAJADOR
Go

-- Muestra los que coinciden como los que no coinciden
-- En la comparación, con la tabla del lado izquierdo.
SELECT CAR.*,
       TRA.*
FROM CARGO CAR LEFT JOIN TRABAJADOR TRA ON TRA.IdCargo = CAR.IdCargo
Go


-- Muestra los que coinciden como los que no coinciden
-- En la comparación, con la tabla del lado derecho.
SELECT TRA.*,
       CAR.*
FROM TRABAJADOR TRA RIGHT JOIN CARGO CAR ON CAR.IdCargo = TRA.IdCargo
Go

-- Muestra los que coinciden como los que no coinciden
-- En la comparación, con la tabla del lado derecho.
SELECT TRA.*,
       CAR.*
FROM TRABAJADOR TRA FULL JOIN CARGO CAR ON CAR.IdCargo = TRA.IdCargo
Go