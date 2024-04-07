
DROP TABLE PRODUCTO;
DROP TABLE MARCA;
DROP TABLE LISTA_PRODUCTO;
DROP TRIGGER DUPLICAR;


-- EJEMPLO 1:
-- CREAR LA SIGUIENTES TABLAS

CREATE TABLE MARCA (
    IDMARCA     INT NOT NULL,
    NOMBRE      VARCHAR2(50) NOT NULL,
    PRIMARY KEY (IDMARCA));

CREATE TABLE PRODUCTO (
    IDPRODUCTO  VARCHAR(5) NOT NULL,
    IDMARCA     INT NOT NULL,
    NOMBRE      VARCHAR2(50) NOT NULL,
    PRECIO      NUMBER(10,2) NOT NULL,
    STOCK       INT NOT NULL,
    ESTADO      VARCHAR2(20) NOT NULL,
    CONSTRAINT LLAVE_PRODUCTO PRIMARY KEY (IDPRODUCTO),
    CONSTRAINT RELACION FOREIGN KEY (IDMARCA) REFERENCES MARCA(IDMARCA));

CREATE TABLE LISTA_PRODUCTO (
    IDPRODUCTO  VARCHAR(5) NOT NULL,
    NOMBRE      VARCHAR2(50) NOT NULL);
   

INSERT INTO MARCA VALUES(1,'LG');
INSERT INTO MARCA VALUES(2,'SAMSUNG');
INSERT INTO MARCA VALUES(3,'SONY');
COMMIT;

SELECT * FROM MARCA;
SELECT * FROM PRODUCTO;
SELECT * FROM LISTA_PRODUCTO;

-- REQUERIMIENTO:
-- Se pide registrar productos (TABLA: PRODUCTO), con una copia
-- de los mismos (TABLA: LISTA_PRODUCTO). Para ello se debe crear
-- un disparador que realice dicha acción.

CREATE OR REPLACE TRIGGER DUPLICAR
AFTER INSERT ON PRODUCTO --> Después de insertar datos en Productos
FOR EACH ROW
DECLARE
    IDP VARCHAR2(5);
BEGIN
        INSERT INTO LISTA_PRODUCTO(IDPRODUCTO, NOMBRE)
        VALUES(:NEW.IDPRODUCTO, :NEW.NOMBRE);   
END;

--PRUEBA EL DISPARADOR INSERTANDO REGISTRO EN LA TABLA TRABAJADOR
INSERT INTO PRODUCTO VALUES ('P0001',3,'PLAY STATION 4',1800.99,10,'ACTIVO');
COMMIT;
INSERT INTO PRODUCTO VALUES ('P0002',1,'TV. LED 32P SMART',999.99,10,'ACTIVO');
COMMIT;
INSERT INTO PRODUCTO VALUES ('P0003',1,'COCINA A GAS 3 HORNILLAS',800.99,10,'ACTIVO');
COMMIT;
INSERT INTO PRODUCTO VALUES ('P0004',3,'PLAY STATION 3',1200.99,10,'ACTIVO');
COMMIT;
INSERT INTO PRODUCTO VALUES ('P0005',2,'REFRIGERADOR 14P3 FROZEN',1499.99,10,'ACTIVO');
COMMIT;

--VERIFICANDO EXISTENCIA DE DATOS EN LAS TABLAS EN MENCION.
SELECT * FROM PRODUCTO;
SELECT * FROM LISTA_PRODUCTO;





-- Ejemplo Casual:
Create Table Empleado(
  IdEmpleado int Not Null,
  Nombre     Varchar2(50) Not Null,
  Dni        Char(8) Not Null,
  Sueldo     Number(10, 2) Not Null,
  Primary Key (IdEmpleado));

Create Table Rescate(
  IdEmpleado int Not Null,
  Dni        Char(8) Not Null,
  Sueldo     Number(10, 2) Not Null);

SELECT * FROM EMPLEADO;
SELECT * FROM RESCATE;

-- REQUERIMIENTO:
-- Se pide crear un disparador similar al ejemplo anterior,
-- con la diferencia, de que cuando se inserte datos en la
-- tabla Empleado, se obtenga después una copia de los datos
-- IdEmpleado, Dni, Sueldo en la tabla Rescate.

-- Solución:
Create Or Replace Trigger TR_DUPLICAR2
After Insert On Empleado
For Each Row
BEGIN
    Insert Into Rescate (IdEmpleado, Dni, Sueldo)
    Values (:New.IdEmpleado, :New.Dni, :New.Sueldo);
END;

-- Prueba el disparador TR_Duplicar2
Insert Into Empleado Values (1, 'JUAN CARLOS', '74587898', 2000.00);
Commit;
Insert Into Empleado Values (2, 'ELIZABEH EUGENIA', '74587899', 2500.00);
Commit;

-- COMPROBAR
SELECT * FROM EMPLEADO;
SELECT * FROM RESCATE;




-- EJEMPLO 2:
-- REQUERIMIENTO
-- Una librería almacena los datos de sus libros en una tabla denominada
-- "LIBROS" y controla las actualizaciones del precio de los libros 
-- almacenando en la tabla "CONTROL" el nombre del usuario, la fecha,
-- el precio anterior y el nuevo precio.

Create table Libros (
    Codigo Number(6),
    Titulo Varchar2(40),
    Autor Varchar2(30),
    Editorial Varchar2(20),
    Precio Number(6,2)
 );

Create table Control (
    Usuario Varchar2(30),
    Fecha Date,
    Codigo Number(6),
    Precioanterior Number(6,2),
    Precionuevo Number(6,2)
 );

SELECT * FROM LIBROS;
SELECT * FROM CONTROL;

Insert into Libros Values(100,'Uno','Richard Bach','Planeta',25);
Insert into Libros Values(103,'El aleph','Borges','Emece',28);
Insert into Libros Values(105,'Matematica estas ahi','Paenza','Nuevo siglo',12);
Insert into Libros Values(120,'Aprenda PHP','Molina Mario','Nuevo siglo',55);
Insert into Libros Values(145,'Alicia en el pais de las maravillas','Carroll','Planeta',35);
Commit;

SELECT * FROM LIBROS;
SELECT * FROM CONTROL;

-- Ahora creamos un trigger a nivel de fila que se dispara "antes" que se ejecute un
-- "Update" sobre el campo "precio" de la tabla "LIBROS". En el cuerpo del disparador
-- se debe ingresar en la tabla "CONTROL", el nombre del usuario que realizó la 
-- actualización, la fecha, el código del libro que ha sido modificado,
-- el precio anterior y el nuevo precio:

Create or Replace trigger tr_actualizar_precio_libros
Before Update of precio On libros --<-- Antes de actualizar el precio en la tabla Libros
For Each Row
Begin
    Insert into control values (user, sysdate, :OLD.codigo, 
                                :old.precio, :new.precio);
End;

-- Cuando el trigger se dispare, antes de ingresar los valores a la tabla,
-- almacenará en "CONTROL", además del nombre del usuario y la fecha, el 
-- precio anterior del libro y el nuevo valor.

--Actualizamos el precio del libro con código 100:
SELECT * FROM LIBROS;
  
Update libros set precio=30 Where codigo=100;
Commit;
-- Comprobación:
SELECT * FROM LIBROS;
SELECT * FROM CONTROL;


Update libros set precio=50 Where codigo=100;
Commit;

-- Comprobación:
SELECT * FROM LIBROS;
SELECT * FROM CONTROL;


--Verificamos el contenido de la tabla antes de actualizar.
SELECT * FROM LIBROS;
SELECT * FROM CONTROL;



-- Actualizar el Precio de libro cuyo codigo es 120, el nuevo precio
-- será 100, como ejecutaria la sentencia Update y como comprobarlo.
UPDATE LIBROS SET PRECIO = 100 WHERE CODIGO = 120;
COMMIT;

SELECT * FROM LIBROS;
SELECT * FROM CONTROL;



-- Actualizar el Precio de libro cuyo codigo es 120, el nuevo precio
-- será 200, como ejecutaria la sentencia Update y como comprobarlo.
SELECT * FROM LIBROS;
SELECT * FROM CONTROL;

UPDATE LIBROS SET PRECIO = 200 WHERE CODIGO = 120;
COMMIT;

SELECT * FROM LIBROS;
SELECT * FROM CONTROL;



--EJEMPLO 3:
-- Creamos un disparador para múltiples eventos, que se dispare al ejecutar
-- "Insert", "Update" y "Delete" sobre "Libros". En el cuerpo del trigger
-- se realiza la siguiente acción: se almacena el nombre del usuario,
-- la fecha y los antiguos y viejos valores de "precio":

Create Or Replace Trigger tr_libros
Before Insert Or Update Or Delete On Libros
For Each Row
Begin
  INSERT INTO CONTROL VALUES (USER, SYSDATE, :new.CODIGO, :OLD.PRECIO, 
                                       :NEW.PRECIO);
End;



--PROBANDO EL DISPARADOR DE INSERCION
Insert Into Libros Values (150,'El gato con botas','Anonimo','Emece',21);
COMMIT;
--VERIFICANDO CONTENIDOS
SELECT * FROM LIBROS;
SELECT * FROM CONTROL;

--PROBANDO EL DISPARADOR DE ACTUALIZACION
UPDATE LIBROS SET PRECIO=12 WHERE CODIGO=103;
COMMIT;
--VERIFICANDO CONTENIDOS
SELECT * FROM LIBROS;
SELECT * FROM CONTROL;

--PROBANDO EL DISPARADOR DE ELIMINACION
DELETE FROM LIBROS WHERE CODIGO=100;
COMMIT;
--VERIFICANDO CONTENIDOS
SELECT * FROM LIBROS;
SELECT * FROM CONTROL;






--EJEMPLO 4:
--Se tiene el siguiente modelo de Base de Datos, se pide crear 3 triggers 
--(Inserción, Actualización y Eliminación), los cuales permitan almacenar
--en la tabla LEGENDA,  los valores equivalentes al de la tabla LIBROS, 
--cuyos estados serán, según la acción: “INSERTADO”, “ACTUALIZADO” y “ELIMINADO

--ELIMINANDO TABLAS SI EXSTIERAN
DROP TABLE LIBRO;
DROP TABLE LEGENDA;

--ELIMINANDO TRIGGERS SI EXISTIERAN
DROP TRIGGER T1;
DROP TRIGGER T2;
DROP TRIGGER T3;


--CREACION DE TABLAS
CREATE TABLE LIBRO(
    IDLIB   NUMBER NOT NULL,
    TITULO VARCHAR2(50) NOT NULL,
    PRECIO  NUMBER(10,2) NOT NULL,
    STOCK   NUMBER NOT NULL);

CREATE TABLE LEGENDA(
    IDLIB   NUMBER NOT NULL,
    TITULO VARCHAR2(50) NOT NULL,
    PRECIO  NUMBER(10,2) NOT NULL,
    ESTADO   VARCHAR2(20) NOT NULL);

--DISPARADOR DE INSERCION DE LIBRO
CREATE OR REPLACE TRIGGER T1
BEFORE INSERT ON LIBRO
FOR EACH ROW
BEGIN
   INSERT INTO LEGENDA VALUES (:NEW.IDLIB, :NEW.TITULO, :NEW.PRECIO,'INSERCION'); 
END;

--DISPARADOR DE ACTUALIZACION DE LIBRO.
CREATE OR REPLACE TRIGGER T2
BEFORE UPDATE ON LIBRO
FOR EACH ROW
BEGIN
   INSERT INTO LEGENDA VALUES (:NEW.IDLIB, :NEW.TITULO, :NEW.PRECIO,'ACTUALIZACION'); 
END;

--DIPARADOR DE ELIMINACION DE LIBRO.
CREATE OR REPLACE TRIGGER T3
AFTER DELETE ON LIBRO
FOR EACH ROW
BEGIN
   INSERT INTO LEGENDA VALUES (:OLD.IDLIB, :OLD.TITULO, :OLD.PRECIO,'ELIMINACION'); 
END;

--PRUEBA DE INSERCION.
INSERT INTO LIBRO VALUES(1,'EL MIO CID',150,10);
COMMIT;

SELECT * FROM LIBRO;
SELECT * FROM LEGENDA;

--PRUEBA DE ACTUALIZACION.
UPDATE LIBRO SET PRECIO=10, STOCK=0 WHERE IDLIB=1;
COMMIT;

SELECT * FROM LIBRO;
SELECT * FROM LEGENDA;

--PRUEBA DE ELIMINACION
DELETE FROM LIBRO WHERE IDLIB=1;
COMMIT;

SELECT * FROM LIBRO;
SELECT * FROM LEGENDA;





--EJEMPLO 5:
--Este modelo relacional consiste en registrar a clientes (CLIENTE) con sus respectivos
--prestamos (CREDITO y  REGISTRAR_CUOTAS), implementar un disparador el cual sea capaz 
--de almacenar las cuotas mensuales (REGISTRAR_CUOTAS) de un determinado crédito.
--Las condiciones son las siguientes:
--•	Registrar solo 3 Clientes
--•	Registre solo un crédito, con el primer cliente, con los siguientes elementos
--   o	Monto de 5000 soles.
--   o	Se pagara en 5 cuotas mensuales
--   o	Se aplicara a cada cuota el 5% adicional


DROP TABLE CREDITO;
DROP TABLE CLIENTE;
DROP TABLE REGISTRAR_CUOTAS;

DROP TRIGGER REGISTRO;

CREATE TABLE CLIENTE (
    IDCLIENTE   VARCHAR2(5) NOT NULL,
    NOMBRE      VARCHAR2(50) NOT NULL,
    F_REGISTRO  DATE NOT NULL,
    PRIMARY KEY (IDCLIENTE));

CREATE TABLE CREDITO (
    IDCREDITO   VARCHAR2(5) NOT NULL,
    IDCLIENTE   VARCHAR2(5) NOT NULL,
    MONTO       NUMBER(10, 2) NOT NULL,
    C_CUOTAS    INT NOT NULL,
    F_REGISTRO  DATE NOT NULL,
    CONSTRAINT PK_IDCREDITO PRIMARY KEY (IDCREDITO),
    CONSTRAINT FK_IDCLIENTE FOREIGN KEY (IDCLIENTE) REFERENCES CLIENTE);

CREATE TABLE REGISTRAR_CUOTAS (
    ITEM    INT NOT NULL,
    IDCREDITO   VARCHAR2(5) NOT NULL,
    N_CUOTA     INT NOT NULL,
    MONTO_CUOTA NUMBER(10, 2) NOT NULL,
    F_PAGO  DATE  NOT NULL,
    F_CANCELACION DATE NULL,
    MORA    NUMBER(10, 2) NULL,
    TOTAL   NUMBER(10, 2) NULL,
    PRIMARY KEY (ITEM, IDCREDITO));



    
INSERT INTO CLIENTE VALUES ('C0001','PEREZ GONZALES JUAN','05/05/2019');
INSERT INTO CLIENTE VALUES ('C0002','CESPEDES LOPEZ ELIZABETH','10/05/2019');
INSERT INTO CLIENTE VALUES ('C0003','FERNANDEZ CARRION JULIA','08/09/2019');
COMMIT;


CREATE OR REPLACE TRIGGER REGISTRO
AFTER INSERT ON CREDITO
FOR EACH ROW
DECLARE
    CONTEO INT:=0;
    NUEVA_FECHA DATE;
    COSTO_CUOTA NUMBER(10, 2):=0;
BEGIN
    COSTO_CUOTA:=(:NEW.MONTO / :NEW.C_CUOTAS) +
                 ((:NEW.MONTO / :NEW.C_CUOTAS) * 0.05);
    FOR CONTEO IN 1..:NEW.C_CUOTAS LOOP
        NUEVA_FECHA:= add_months(:NEW.F_REGISTRO,CONTEO);
        INSERT INTO REGISTRAR_CUOTAS VALUES (CONTEO, :NEW.IDCREDITO,
               CONTEO, COSTO_CUOTA, NUEVA_FECHA, NULL, NULL, NULL);
    END LOOP;
END;


--PROBANDO EL DISPARADOR
INSERT INTO CREDITO VALUES ('00001','C0001',1000.00,5,SYSDATE);
COMMIT;

--ELIMINANDO LOS CREDITOS U SUS CUOTAS
DELETE FROM CREDITO;
DELETE FROM REGISTRAR_CUOTAS;
COMMIT;

--VERIFICANDO EL CONTENIDO
SELECT * FROM CLIENTE;
SELECT * FROM CREDITO;
SELECT * FROM REGISTRAR_CUOTAS;



--EJEMPLO 6: 
--EJEMPLO DE TABLA MUTANTE

CREATE TABLE EMPLEADOS(
    IDEMPLEADO  INT NOT NULL,
    NOMBRE      VARCHAR2(50) NOT NULL,
    SUELDO      NUMBER(10, 2) NOT NULL,
    SEXO        VARCHAR2(20) NOT NULL,
    ESTADO      VARCHAR2(20) NOT NULL,
    PRIMARY KEY (IDEMPLEADO));

INSERT INTO EMPLEADOS VALUES (1,'JUAN PEREZ', 2000, 'MASCULINO','ACTIVO');
INSERT INTO EMPLEADOS VALUES (2,'ELENA SANCHEZ',1600,'FEMENINO','ACTIVO');
INSERT INTO EMPLEADOS VALUES (3,'CARMEN SALAS', 2500, 'FEMENINO','ACTIVO');
INSERT INTO EMPLEADOS VALUES (4,'CARLOS PONTE', 2000, 'MASCULINO','ACTIVO');
INSERT INTO EMPLEADOS VALUES (5,'JULIA RODAS', 2000, 'FEMENINO','ACTIVO');
COMMIT;

--VERIFICANDO EL CONTENDO DE LA TABLA EMPLEADOS
SELECT * FROM EMPLEADOS;

--CREANDO EL DISPARADOR
CREATE OR REPLACE TRIGGER MUTANTE
AFTER INSERT ON EMPLEADOS
FOR EACH ROW
DECLARE
    CONTADOR NUMBER:=0;
BEGIN
    SELECT COUNT(NOMBRE) INTO CONTADOR FROM EMPLEADOS;
END;    

--PROBANDO EL DISPARADOR, VOLVIENDO A INGRESAR REGISTROS
--AQUI SE OBSERVARA EL ERROR DE TABLA MUTANTE.
INSERT INTO EMPLEADOS VALUES (6,'LUIS ALCANTARA', 2000, 'MASCULINO','ACTIVO');
COMMIT;




















