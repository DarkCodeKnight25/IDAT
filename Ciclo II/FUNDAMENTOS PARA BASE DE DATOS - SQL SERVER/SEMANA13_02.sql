--ELIMINANDO LAS TABLAS SI EN CASOS EXISTIERAN.
USE LIBRERIA
Go

DROP TABLE COMPROBANTE 
DROP TABLE DETALLE_PEDIDO 
DROP TABLE CABECERA_PEDIDO 
DROP TABLE CLIENTE 
DROP TABLE EMPLEADO 
DROP TABLE PRODUCTO 
Go

SET DATEFORMAT DMY
Go

CREATE TABLE CLIENTE
(
	IdCli                VARCHAR(5) NOT NULL ,
	Nombre               VARCHAR(50) NOT NULL ,
	Ruc                  VARCHAR(11) NOT NULL ,
	Direccion            VARCHAR(50) NOT NULL ,
	Estado               VARCHAR(20) NOT NULL ,
    PRIMARY KEY (IdCli)
) 

CREATE TABLE EMPLEADO
(
	IdEmp                VARCHAR(5) NOT NULL ,
	Nombre               VARCHAR(50) NOT NULL ,
	Ruc                  VARCHAR(11) NOT NULL ,
	Direccion            VARCHAR(50) NOT NULL ,
	Estado               VARCHAR(20) NOT NULL ,
    PRIMARY KEY (IdEmp)
) 

CREATE TABLE CABECERA_PEDIDO
(
	IdPedido             VARCHAR(5) NOT NULL ,
	IdCli                VARCHAR(5) NULL ,
	IdEmp                VARCHAR(5) NULL ,
	Estado               VARCHAR(20) NOT NULL ,
    PRIMARY KEY (IdPedido),
    FOREIGN KEY (IdCli) REFERENCES CLIENTE (IdCli),
    FOREIGN KEY (IdEmp) REFERENCES EMPLEADO (IdEmp)
) 

CREATE TABLE COMPROBANTE
(
	TipCom               VARCHAR(20) NOT NULL ,
	NComp                VARCHAR(5) NOT NULL ,
	IdPedido             VARCHAR(5) NULL ,
	Estado               VARCHAR(20) NOT NULL ,
    PRIMARY KEY (TipCom,NComp),
    FOREIGN KEY (IdPedido) REFERENCES CABECERA_PEDIDO (IdPedido)
) 

CREATE TABLE PRODUCTO
(
	IdProd               VARCHAR(5) NOT NULL ,
	Nombre               VARCHAR(50) NOT NULL ,
	Precio               NUMERIC(10, 2) NOT NULL ,
	Stock                INTEGER NOT NULL ,
	Estado               VARCHAR(20) NOT NULL ,
    PRIMARY KEY (IdProd)
) 

CREATE TABLE DETALLE_PEDIDO
(
	Item                 INTEGER NOT NULL ,
	IdPedido             VARCHAR(5) NOT NULL ,
	IdProd               VARCHAR(5) NULL ,
	Cant                 INTEGER NOT NULL ,
    PRIMARY KEY (Item,IdPedido),
    FOREIGN KEY (IdProd) REFERENCES PRODUCTO (IdProd),
    FOREIGN KEY (IdPedido) REFERENCES CABECERA_PEDIDO (IdPedido)
) 

INSERT INTO CLIENTE VALUES('C0001','PEREZ CASTRO JORGE','10545878987','AV. PERU 1234 SMP','ACTIVO') 
INSERT INTO CLIENTE VALUES('C0002','SANCHEZ SALAS CARMEN','10254587897','AV. SAENZ PEÑA 120 CALLAO','BLOQUEADO') 
INSERT INTO CLIENTE VALUES('C0003','CAMPOS LOPEZ EDUARDO','10547848757','JR. HUASCAR 323 SJL','ACTIVO') 
INSERT INTO CLIENTE VALUES('C0004','VERASTEGUI VARGAS JULIAN','10125458787','AV. LOS TULIPANES 928 SJM','BLOQUEADO') 
INSERT INTO CLIENTE VALUES('C0005','FERNANDEZ PEREZ ELIZABETH','10545878987','AV. NICOLAS DE PIEROLA 245 LIMA CERCADO','ACTIVO') 
GO

INSERT INTO EMPLEADO VALUES('E0001','RODRIGUEZ CARPIO ALEXANDRA','10546996567','AV. LOS HEROES 2545 SJM','ACTIVO')  
INSERT INTO EMPLEADO VALUES('E0002','CARPIO LORENZO JUAN','10456321547','JR. HUARAZ 654 BREÑA','ACTIVO') 
INSERT INTO EMPLEADO VALUES('E0003','GAMARRA SANCHEZ ANA','10555989877','JR. LAS ALMENDRAS 323 LOS OLIVOS','BLOQUEADO') 
INSERT INTO EMPLEADO VALUES('E0004','JAUREGUI DALTANO JULY','10223235697','AV. PERU 3223 SMP','ACTIVO') 
INSERT INTO EMPLEADO VALUES('E0005','PEREZ ARBIETO JUAN','10525656587','JR. LAS CAMPANITAS SAN BORJA','BLOQUEADO') 
GO

INSERT INTO PRODUCTO VALUES('P0001','TV. COLOR LED 42P SMART',1599.99,47,'ACTIVO') 
INSERT INTO PRODUCTO VALUES('P0002','TV. COLOR LED 55P SMART',2499.99,0,'BLOQUEADO') 
INSERT INTO PRODUCTO VALUES('P0003','REFRIGERADOR 14P3 FROZEN',1299.99,47,'ACTIVO') 
INSERT INTO PRODUCTO VALUES('P0004','REFRIGERADOR 16P3 FROZEN',1899.99,0,'BLOQUEADO') 
INSERT INTO PRODUCTO VALUES('P0005','LAVADORA 8KG CENTRIFUGADORA LAVA-SECA',2599.99,43,'ACTIVO') 
INSERT INTO PRODUCTO VALUES('P0006','LAVADORA 10KG CENTRIFUGADORA LAVA-SECA',2899.99,47,'ACTIVO') 
INSERT INTO PRODUCTO VALUES('P0007','HORNO MICROONDAS SMART-COOLER',259.99,0,'BLOQUEADO') 
INSERT INTO PRODUCTO VALUES('P0008','BLU-RAY - DVD ',249.99,0,'BLOQUEADO') 
INSERT INTO PRODUCTO VALUES('P0009','TV. COLOR LED 32P SMART',999.99,22,'ACTIVO') 
INSERT INTO PRODUCTO VALUES('P0010','CPU 3.2GB HD 1T DDR3 4GB PLACA BASE INTEL G8748B',1500.00,45,'ACTIVO') 
GO

--3 PEDIDOS
INSERT INTO CABECERA_PEDIDO VALUES('00001','C0001','E0001','EMITIDO') 
INSERT INTO CABECERA_PEDIDO VALUES('00002','C0003','E0002','EMITIDO') 
INSERT INTO CABECERA_PEDIDO VALUES('00003','C0005','E0004','EMITIDO') 
GO 

--3 DETALLES DE PEDIDO
INSERT INTO DETALLE_PEDIDO VALUES(1,'00001','P0001',3) 
INSERT INTO DETALLE_PEDIDO VALUES(2,'00001','P0003',3) 
INSERT INTO DETALLE_PEDIDO VALUES(3,'00001','P0005',3) 
GO 

INSERT INTO DETALLE_PEDIDO VALUES(1,'00002','P0006',3) 
INSERT INTO DETALLE_PEDIDO VALUES(2,'00002','P0009',3) 
INSERT INTO DETALLE_PEDIDO VALUES(3,'00002','P0010',3) 
GO

INSERT INTO DETALLE_PEDIDO VALUES(1,'00003','P0009',5) 
INSERT INTO DETALLE_PEDIDO VALUES(2,'00003','P0010',2) 
INSERT INTO DETALLE_PEDIDO VALUES(3,'00003','P0005',4) 
GO

--REALIZANDO LA VENTA
INSERT INTO COMPROBANTE VALUES('BOLETA','B0001','00001','PAGADO') 
INSERT INTO COMPROBANTE VALUES('FACTURA','F0001','00002','PAGADO') 
INSERT INTO COMPROBANTE VALUES('BOLETA','B0002','00003','EMITIDA') 
GO 

SELECT * FROM CLIENTE 
SELECT * FROM EMPLEADO 
SELECT * FROM PRODUCTO 
SELECT * FROM CABECERA_PEDIDO 
SELECT * FROM DETALLE_PEDIDO 
SELECT * FROM COMPROBANTE 


--EJERCICIO 1:
--Se pide crear un cursor que sea capaz de mostrar los pedidos realizados,
--según la tabla CABECERA_PEDIDO esta tiene 3 pedidos estos son: ‘00001’,
--‘00002’ y ‘00003’, para ello se debe ingresar el número del pedido (ALMARCENAR EN VARIABLE), 
--por intermedio de variables, y brindar la información 
--solicitada, tal como se muestran en las siguientes imágenes

--SOLUCION:


Declare @Ped Varchar(5) = '00001'
DECLARE PEDIDOS CURSOR FOR 
      SELECT D.ITEM, P.NOMBRE, D.CANT,
			 P.PRECIO, (D.CANT* P.PRECIO) IMPORTE
	  FROM   DETALLE_PEDIDO D, PRODUCTO P
      WHERE  D.IDPROD = P.IDPROD AND
			 D.IDPEDIDO = @Ped

	  DECLARE
		@It      int, 
        @CodigoP     Varchar(5)=@Ped,
        @CodigoC     Varchar(5), 
        @CodigoE     Varchar(5),
        @Est         Varchar(20),
        @NombreCli   Varchar(50),
        @NombreEmp   Varchar(50),
        @NombreProd  Varchar(50), 
        @CantProd    int,
        @PreProd     Numeric(10,2),
        @ImpCompra   NUMERIC(10,2), 
        @TOTAL_IMPORTE NUMERIC(10,2)
BEGIN
		SELECT @CodigoP=IDPEDIDO, @CodigoC=IDCLI,@CodigoE=IDEMP,@Est=ESTADO
        FROM CABECERA_PEDIDO WHERE IDPEDIDO=@CodigoP 

		SELECT @NombreCli= NOMBRE FROM CLIENTE WHERE IDCLI = @CodigoC 
        SELECT @NombreEmp = NOMBRE FROM EMPLEADO WHERE IDEMP= @CodigoE 
		PRINT '=================================================='
        PRINT 'IMPORTADORA - LAS CAMELIAS S.A'
        PRINT '=================================================='
        PRINT 'PEDIDO Nº : ' + @CodigoP
        PRINT 'CLIENTE   : ' + @NombreCli
        PRINT 'EMPLEADO  : ' + @NombreEmp 
        PRINT '=================================================='
        OPEN PEDIDOS
		FETCH PEDIDOS INTO @It, @NombreProd, @CantProd, @PreProd, @ImpCompra 
		WHiLE @@fetch_status = 0
         BEGIN
      			PRINT Convert(Varchar,@It) + '    ' + @NombreProd + '    '
                PRINT '   ' + 'Cantidad: '  + Convert(Varchar,@CantProd) + '   ' +
                      'Precio: ' + Convert(Varchar,@PreProd) + '   ' + 'Importe: ' + Convert(Varchar,@ImpCompra)
                PRINT '=================================================='
                FETCH PEDIDOS INTO @It, @NombreProd, @CantProd, @PreProd, @ImpCompra 
         END

		 SELECT @TOTAL_IMPORTE = SUM(D.CANT* P.PRECIO) FROM DETALLE_PEDIDO D, PRODUCTO P
         WHERE D.IDPROD = P.IDPROD AND D.IDPEDIDO = @CodigoP 
         PRINT 'TOTAL IMPORTE: ' + CONVERT(VARCHAR,@TOTAL_IMPORTE) 
         PRINT '=================================================='

         CLOSE PEDIDOS
		 DEALLOCATE PEDIDOS
END
 





--EJERCICIO 2:
--Se pide crear un cursor que sea capaz de mostrar datos de las facturas que han
--sido realizadas como PAGADAS, según la tabla COMPROBANTE, esta tiene 3 documentos
--(1 factura y 2 boletas) estos son: ‘F0001’, ‘B0001’ y ‘B0002’

--SOLUCION:




























































































































--**************************************************************************************************************************
--CODIGOS EJEMPLOS DE ORACLE
--**************************************************************************************************************************
--EJERCICIO 1
--Muestre los datos de un Libro determinado, ingresando mediante una variable de sustitución & 
--el código del libro, por ejemplo ‘1000’, los datos de dicho libro deben ser mostrados.
--SOLUCION: redacte este código desde el editor de Oracle PL/SQL.

SET SERVEROUTPUT ON 
DECLARE
    Codigo LIBRO.CODLIB%TYPE  Titulo LIBRO.TITULOLIB%TYPE  
    Autor  LIBRO.AUTORLIB%TYPE  Editorial LIBRO.EDITOLIB%TYPE 
    Area   LIBRO.AREALIB%TYPE  Precio LIBRO.PRECIOLIB%TYPE 
    CantidadHojas LIBRO.NHOJASLIB%TYPE  AnnoLibro LIBRO.ANOLIB%TYPE 
BEGIN
    SELECT CODLIB, TITULOLIB, AUTORLIB, EDITOLIB, AREALIB,
           PRECIOLIB, NHOJASLIB, ANOLIB
           INTO Codigo, Titulo, Autor, Editorial, Area,
                Precio, CantidadHojas, AnnoLibro
    FROM LIBRO WHERE CODLIB = &Codigo 
    DBMS_OUTPUT.PUT_LINE('DATOS DEL LIBRO     :   ' || Codigo) 
    DBMS_OUTPUT.PUT_LINE('==================================================') 
    DBMS_OUTPUT.PUT_LINE('Codigo del Libro    :   ' || Codigo) 
    DBMS_OUTPUT.PUT_LINE('Título del Libro    :   ' || Titulo) 
    DBMS_OUTPUT.PUT_LINE('Autor del Libro     :   ' || Autor) 
    DBMS_OUTPUT.PUT_LINE('Editorial del Libro :   ' || Editorial) 
    DBMS_OUTPUT.PUT_LINE('Area del Libro      :   ' || Area) 
    DBMS_OUTPUT.PUT_LINE('Precio del Libro    :   ' || Precio) 
    DBMS_OUTPUT.PUT_LINE('Cantidad de Hojas   :   ' || CantidadHojas) 
    DBMS_OUTPUT.PUT_LINE('Año del Libro       :   ' || AnnoLibro) 
    DBMS_OUTPUT.PUT_LINE('==================================================') 
EXCEPTION
	WHEN NO_DATA_FOUND THEN
	   DBMS_OUTPUT.put_line ('Libro No Existe!!!!') 
END 



--EJERCICIO 2:
--Se pide crear un cursor que sea capaz de mostrar los pedidos realizados,
--según la tabla CABECERA_PEDIDO esta tiene 3 pedidos estos son: ‘00001’,
--‘00002’ y ‘00003’, para ello se debe ingresar el número del pedido, 
--por intermedio de variables de sustitución &, y brindar la información 
--solicitada, tal como se muestran en las siguientes imágenes

--SOLUCION:
SET SERVEROUTPUT ON 
DECLARE
    It          DETALLE_PEDIDO.ITEM%TYPE 
    CodigoP     CABECERA_PEDIDO.IDPEDIDO%TYPE:=&CodigoP 
    CodigoC     CABECERA_PEDIDO.IDCLI%TYPE 
    CodigoE     CABECERA_PEDIDO.IDEMP%TYPE 
    Est         CABECERA_PEDIDO.ESTADO%TYPE 
    NombreCli   CLIENTE.NOMBRE%TYPE 
    NombreEmp   EMPLEADO.NOMBRE%TYPE 
    NombreProd  PRODUCTO.NOMBRE%TYPE 
    CantProd    DETALLE_PEDIDO.CANT%TYPE 
    PreProd     PRODUCTO.PRECIO%TYPE 
    ImpCompra   NUMERIC(10,2) 
    TOTAL_IMPORTE NUMERIC(10,2):=0 
    CURSOR DETALLE IS (SELECT D.ITEM, P.NOMBRE, D.CANT,
                       P.PRECIO, (D.CANT* P.PRECIO) IMPORTE
                       FROM DETALLE_PEDIDO D, PRODUCTO P
                       WHERE D.IDPROD = P.IDPROD AND
                             D.IDPEDIDO = CodigoP) 
BEGIN
       SELECT IDPEDIDO,IDCLI, IDEMP, ESTADO
       INTO CodigoP, CodigoC,CodigoE, Est 
       FROM CABECERA_PEDIDO WHERE IDPEDIDO=CodigoP 
       
       SELECT NOMBRE INTO NombreCli FROM CLIENTE WHERE IDCLI=CodigoC 
       SELECT NOMBRE INTO NombreEmp FROM EMPLEADO WHERE IDEMP=CodigoE 
       DBMS_OUTPUT.PUT_LINE('==================================================') 
       DBMS_OUTPUT.PUT_LINE('IMPORTADORA - LAS CAMELIAS S.A') 
       DBMS_OUTPUT.PUT_LINE('==================================================') 
       DBMS_OUTPUT.PUT_LINE('PEDIDO Nº : ' || CodigoP) 
       DBMS_OUTPUT.PUT_LINE('CLIENTE   : ' || NombreCli) 
       DBMS_OUTPUT.PUT_LINE('EMPLEADO  : ' || NombreEmp) 
       DBMS_OUTPUT.PUT_LINE('==================================================') 
       OPEN DETALLE 
       FETCH DETALLE INTO It, NombreProd, CantProd, PreProd, ImpCompra 
       WHiLE DETALLE%Found
       LOOP
           DBMS_OUTPUT.PUT_LINE(It || CHR(9) || NombreProd || CHR(9)) 
           DBMS_OUTPUT.PUT_LINE(CHR(9) || 'Cantidad: ' ||CantProd || CHR(9) ||
           'Precio: ' ||PreProd || CHR(9) || 'Importe: ' ||ImpCompra) 
           DBMS_OUTPUT.PUT_LINE('==================================================') 
           FETCH DETALLE INTO It, NombreProd, CantProd, PreProd, ImpCompra 
       END LOOP 
       SELECT SUM(D.CANT* P.PRECIO) INTO TOTAL_IMPORTE FROM DETALLE_PEDIDO D, PRODUCTO P
       WHERE D.IDPROD = P.IDPROD AND D.IDPEDIDO = CodigoP 
       DBMS_OUTPUT.PUT_LINE('TOTAL IMPORTE: ' || TOTAL_IMPORTE) 
       DBMS_OUTPUT.PUT_LINE('==================================================') 
     CLOSE DETALLE 
EXCEPTION
  WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('EL PEDIDO NO EXIXTE!!') 
END 




--EJERCICIO 3:
--Se pide crear un cursor que sea capaz de mostrar datos de las facturas que han
--sido realizadas como PAGADAS, según la tabla COMPROBANTE, esta tiene 3 documentos
--(1 factura y 2 boletas) estos son: ‘F0001’, ‘B0001’ y ‘B0002’

--SOLUCION:
SET SERVEROUTPUT ON 
DECLARE
    It          DETALLE_PEDIDO.ITEM%TYPE 
    CodigoF     COMPROBANTE.NCOMP%TYPE:=&CodigoF 
    CodigoP     CABECERA_PEDIDO.IDPEDIDO%TYPE 
    CodigoC     CABECERA_PEDIDO.IDCLI%TYPE 
    CodigoE     CABECERA_PEDIDO.IDEMP%TYPE 
    Est         CABECERA_PEDIDO.ESTADO%TYPE 
    NombreCli   CLIENTE.NOMBRE%TYPE 
    NombreEmp   EMPLEADO.NOMBRE%TYPE 
    NombreProd  PRODUCTO.NOMBRE%TYPE 
    CantProd    DETALLE_PEDIDO.CANT%TYPE 
    PreProd     PRODUCTO.PRECIO%TYPE 
    ImpCompra   NUMERIC(10,2) 
    TOTAL_IMPORTE NUMERIC(10,2):=0 
    IGV NUMERIC(10,2):=0 
    TOTAL_GENERAL NUMERIC(10,2):=0 
    CURSOR DETALLE IS (SELECT D.ITEM, P.NOMBRE, D.CANT,
                       P.PRECIO, (D.CANT* P.PRECIO) IMPORTE
                       FROM DETALLE_PEDIDO D, PRODUCTO P, COMPROBANTE C
                       WHERE D.IDPROD = P.IDPROD AND
                             D.IDPEDIDO = C.IDPEDIDO AND
                             C.TIPCOM ='FACTURA' AND
                             C.NCOMP = CodigoF AND
                             C.ESTADO ='PAGADO') 
BEGIN
        SELECT CABECERA_PEDIDO.IDPEDIDO,CABECERA_PEDIDO.IDCLI,
               CABECERA_PEDIDO.IDEMP,COMPROBANTE.ESTADO
        INTO CodigoP, CodigoC,CodigoE, Est 
        FROM CABECERA_PEDIDO, COMPROBANTE
        WHERE CABECERA_PEDIDO.IDPEDIDO = COMPROBANTE.IDPEDIDO AND
              COMPROBANTE.TIPCOM='FACTURA' AND
              COMPROBANTE.NCOMP = CodigoF  
       
       SELECT NOMBRE INTO NombreCli FROM CLIENTE WHERE IDCLI=CodigoC 
       SELECT NOMBRE INTO NombreEmp FROM EMPLEADO WHERE IDEMP=CodigoE 
       DBMS_OUTPUT.PUT_LINE('==================================================') 
       DBMS_OUTPUT.PUT_LINE('IMPORTADORA - LAS CAMELIAS S.A') 
       DBMS_OUTPUT.PUT_LINE('==================================================') 
       DBMS_OUTPUT.PUT_LINE('FACTURA Nº  : ' || CodigoF) 
       DBMS_OUTPUT.PUT_LINE('PEDIDO  Nº  : ' || CodigoP) 
       DBMS_OUTPUT.PUT_LINE('CLIENTE     : ' || NombreCli) 
       DBMS_OUTPUT.PUT_LINE('EMPLEADO    : ' || NombreEmp) 
       DBMS_OUTPUT.PUT_LINE('==================================================') 
       OPEN DETALLE 
       FETCH DETALLE INTO It, NombreProd, CantProd, PreProd, ImpCompra 
       WHiLE DETALLE%Found
       LOOP
           DBMS_OUTPUT.PUT_LINE(It || CHR(9) || NombreProd || CHR(9)) 
           DBMS_OUTPUT.PUT_LINE(CHR(9) || 'Cantidad: ' ||CantProd || CHR(9) ||
           'Precio: ' ||PreProd || CHR(9) || 'Importe: ' ||ImpCompra) 
           DBMS_OUTPUT.PUT_LINE('==================================================') 
           FETCH DETALLE INTO It, NombreProd, CantProd, PreProd, ImpCompra 
       END LOOP 
       SELECT SUM(D.CANT* P.PRECIO) INTO TOTAL_IMPORTE FROM DETALLE_PEDIDO D, PRODUCTO P
       WHERE D.IDPROD = P.IDPROD AND D.IDPEDIDO = CodigoP 
       IGV := TOTAL_IMPORTE * 0.18 
       TOTAL_GENERAL := TOTAL_IMPORTE + IGV 
       DBMS_OUTPUT.PUT_LINE('TOTAL IMPORTE: ' || TOTAL_IMPORTE) 
       DBMS_OUTPUT.PUT_LINE('IGV (18%)    : ' || IGV) 
       DBMS_OUTPUT.PUT_LINE('TOTAL IMPORTE: ' || TOTAL_GENERAL) 
       DBMS_OUTPUT.PUT_LINE('==================================================') 
     CLOSE DETALLE 
EXCEPTION
  WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('EL PEDIDO NO EXIXTE!!') 
END 


