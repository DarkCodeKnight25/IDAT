-- BORRANDO TABLAS
DROP TABLE NOTAS;
DROP TABLE ALUMNO;
DROP TABLE CURSOS;
DROP TABLE PROFESOR;

--BORRANDO EL TABLESPACE, USUARIO Y ROL, SI EXISTIERAN
DROP ROLE ROL_02;
DROP USER USER02 CASCADE;
DROP TABLESPACE SEMANA02 INCLUDING CONTENTS;







-- DICCIONARIO DE DATOS

-- RESTRICCIONES: REGLAS QUE SI O SI, SE DEBEN CUMPLIR.
-- DEFAULT, UNIQUE, PRIMARY KEY, FOREIGN KEY, CHECK, NOT NULL, NULL


Create Table ALUMNO(
     Cod_Alu      VARCHAR2(5) Not Null,
     Nombre       VARCHAR2(50) Not Null,
     Sexo         VARCHAR2(20) Not Null,
     Grado        Int Not Null,
     F_Registro   Date DEFAULT SYSDATE CONSTRAINT D_F_Registro_Alumno Not Null, 
     F_Nacimiento Date Not Null,
     Dni          Char(8) Not Null,
     Edad         Int Not Null,
     Estado       Varchar2(20) Not Null,
     CONSTRAINT PK_CODIGO_ALUMNO PRIMARY KEY (Cod_Alu),
     CONSTRAINT CHK_NOMBRE_ALUMNO CHECK (Nombre = NLS_UPPER(Nombre)),
     CONSTRAINT CHK_SEXO_ALUMNO CHECK (Sexo IN ('Masculino','Femenino')),
     CONSTRAINT CHK_GRADO_ALUMNO CHECK (Grado IN (1,2,3,4,5,6)),
     CONSTRAINT U_DNI_ALUMNO UNIQUE (Dni),
     CONSTRAINT CHK_EDAD_ALUMNO CHECK (EDAD>=10 AND EDAD<=22),
     CONSTRAINT CHK_ESTADO_ALUMNO CHECK (Estado IN ('ACTIVO','BLOQUEADO','SUSPENDIDO','RETIRADO'))
 );
 
 
 Create Table CURSOS(
     Cod_Curso    VARCHAR2(5) Not Null,
     Descripcion  VARCHAR2(30) Not Null,
     Credito      Integer DEFAULT 2 CONSTRAINT D_Credito  Not Null,
     Estado       VARCHAR2(20) DEFAULT 'ACTIVO' CONSTRAINT D_Estado Not Null,
     CONSTRAINT PK_CODIGO_CURSO PRIMARY KEY (Cod_Curso),
     CONSTRAINT CHK_DESCRIPCION_CURSO CHECK (Descripcion = NLS_UPPER(Descripcion)),
     CONSTRAINT CHK_CREDITO_CURSO CHECK (Credito IN (2, 3, 4, 6)),
     CONSTRAINT CHK_ESTADO_CURSO CHECK (Estado IN ('ACTIVO','BLOQUEADO'))
 );

Create Table PROFESOR(
     Cod_Prof     VARCHAR2(5) Not Null,
     Nombre       VARCHAR2(50) Not Null,
     Profesion    Varchar2(50) Not Null,
     F_Registro   Date DEFAULT SYSDATE CONSTRAINT D_F_Registro_Profesor Not Null,
     F_Nac        Date Not Null,
     Dni          Char(8) Not Null,
     Sexo         VARCHAR2(20) Not Null,
     Edad         Int Not Null,
     Estado       Varchar2(20) Not Null,
     CONSTRAINT PK_CODIGO_PROFESOR PRIMARY KEY (Cod_Prof),
     CONSTRAINT CHK_NOMBRE_PROFESOR CHECK (Nombre = NLS_UPPER(Nombre)),
     CONSTRAINT CHK_PROFESION_PROFESOR CHECK (Profesion = NLS_UPPER(Profesion)),
     CONSTRAINT U_DNI_PROFESOR UNIQUE (Dni),
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

-- OTRO MODELO RELACIONAL.
Create Table Cargo(
      IdCargo  int Not Null,
      Nombre   Varchar2(50) Not Null,
      Sueldo   Numeric(10,2) Not Null,
      CONSTRAINT PK_LLAVE_CARGO Primary Key(IdCargo),
      CONSTRAINT CHK_NOMBRE_CARGO CHECK (Nombre = NLS_UPPER(Nombre)),
      CONSTRAINT CHK_SUELDO_CARGO CHECK (Sueldo IN (5000, 3000, 2500, 1500, 1025)));

Create Table Empleado(
      IdEmpleado Char(5) Not Null,
      IdCargo  int Not Null,
      Nombre  Varchar2(50) Not Null,
      Dni      Char(8) Not Null,
      CONSTRAINT PK_LLAVE_EMPLEADO Primary Key (IdEmpleado),
      CONSTRAINT CHK_NOMBRE_EMPLEADO CHECK (Nombre = NLS_UPPER(Nombre)),
      CONSTRAINT U_DNI_EMPLEADO UNIQUE (Dni),
      CONSTRAINT FK_Relacion_Cargo Foreign Key(IdCargo) References Cargo(IdCargo));


-- INSERCIÓN DE REGISTROS
Insert Into Cargo Values(1, 'ADMINISTRADOR',5000.00);
Insert Into Cargo Values(2, 'GERENTE',3000.00);
Insert Into Cargo Values(3, 'SECRETARIA',2500.00);
Insert Into Cargo Values(4, 'SERVICIOS',1025.00);
COMMIT;

Insert Into Empleado Values ('E0001',1,'JUAN PEREZ','45857458');
Insert Into Empleado Values ('E0002',2,'CELESTE GAMARRA','45859865');
Insert Into Empleado Values ('E0003',3,'CECILIA CAMPOS','41212363');
Insert Into Empleado Values ('E0004',4,'CARLOS ROSALES','45212124');
COMMIT;

SELECT * FROM CARGO;
SELECT * FROM EMPLEADO;




-- IMPLEMENTAR
-- INDICE:


-- 1. Un índice para el campo nombre de la tabla Empleado.
SELECT * FROM CARGO;
SELECT * FROM EMPLEADO;

CREATE INDEX Nombre_Empleado_idx ON EMPLEADO (Nombre);
CREATE INDEX Nombre_Cargo_Idx ON Cargo(Nombre);

-- COMO USAR EL INDICE
Select * From Empleado Where Nombre = 'CELESTE GAMARRA';
Select * From Cargo Where Nombre = 'ADMINISTRADOR';

-- 2.	Genere una secuencia para la tabla Cargo, específicamente
--    sobre la columna IdCargo, dado que es una columna numérica,
--    este debe incrementarse 1 en 1, desde un valor mínimo de 100,
--    máximo 10000, dado que es una clave no puede volver a generar
--    los valores (NO USAR CYCLE).

-- SECUENCIA
-- => AUTO - GENERADOR DE VALORES NUMERICOS ENTEROS.
-- POR EJEMPLO, OBSERVE LOS DATOS DE LA TABLA CARGO
SELECT * FROM CARGO;

CREATE SEQUENCE ID_SEQ
	INCREMENT BY 1
	START WITH 100
	MINVALUE 1
	MAXVALUE 10000
	NOCACHE
	NOCYCLE;

-- PROBANDO LA SECUENCIA:
Insert into CARGO values (ID_SEQ.NEXTVAL,'ADMINISTRADOR 2', 5000);
Insert into CARGO values (ID_SEQ.NEXTVAL,'GERENTE 2', 3000);
Insert into CARGO values (ID_SEQ.NEXTVAL,'ASISTENCIAL 2', 2500);
Insert into CARGO values (ID_SEQ.NEXTVAL,'SECRETARIA 2', 2500);
Insert into CARGO values (ID_SEQ.NEXTVAL,'CONTADOR 2', 5000);
COMMIT;


Insert into CARGO values (ID_SEQ.NEXTVAL,'OBRERO', 5000);
COMMIT;


SELECT * FROM CARGO;

-- SINÓNIMOS
--> SOBRE NOMBRE O ALIAS
-- 3. Asigne sinónimos para las tablas CARGO--> CAR y EMPLEADO-->EMP.
CREATE SYNONYM CAR FOR CARGO;
CREATE SYNONYM EMP FOR EMPLEADO;
-- PROBANDO LOS SINONIMOS:
SELECT * FROM CAR;
SELECT * FROM EMP;
SELECT * FROM CARGO;
SELECT * FROM EMPLEADO;


--SABER EN QUE VALOR SE QUEDEO LA SECUENCIA:
--CURRVAL = VALOR ACTUAL DE LA SECUENCIA ==> CURR = CURRENT
SELECT ID_SEQ.CURRVAL FROM DUAL;


-- DICCIONARIO DE DATOS:

-- 1. VERIFICAR INDICES (DICCIONARIOS DE DATOS DONDE SE REGISTRAN LOS SUCESOS)
SELECT * FROM user_indexes;
-- 2. VERIFICAR SECUENCIAS
SELECT sequence_name, min_value, max_value, 
               increment_by, last_number
FROM user_sequences;
-- 3. VERIFICAR SINONIMOS.
SELECT * FROM user_synonyms;

--ELIMINANDO LOS COMPONENTE:
DROP INDEX Nombre_Empleado_idx;
DROP INDEX Nombre_Cargo_idx;
DROP SEQUENCE ID_SEQ;
DROP SYNONYM CAR;
DROP SYNONYM EMP;

-- FIN
