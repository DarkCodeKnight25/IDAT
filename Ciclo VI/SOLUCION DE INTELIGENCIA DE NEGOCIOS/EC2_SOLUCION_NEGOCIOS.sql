CREATE DATABASE EC2_SolucionNegocios
USE EC2_SolucionNegocios

/*TABLA PRINCIPAL*/
CREATE TABLE [DATA_PRINCIPAL] (
    [Pa�s id] float,
    [Unidades Vendidas] float,
    [Precio de Fabricaci�n] money,
    [IdPAIS] nvarchar(255),
    [Precio de Venta] money,
    [Ventas Brutas] money,
    [Descuentos] money,
    [Ventas] money,
    [CBV] money,
    [Profit] money,
    [Fecha] datetime,
    [N�mero de Mes] float,
    [Nombre del Mes] nvarchar(255),
    [A�o] nvarchar(255)
)

/*TABLA PAISES*/
CREATE TABLE [DATA_PAIS] (
    [Pa�s id] float,
    [PA�S] nvarchar(255),
    [CONTINENTE] nvarchar(255)
)

/*TABLA PRODUCTOS*/
CREATE TABLE [DATA_PRODUCTOS] (
    [IDPRODUCTO] nvarchar(255),
    [PRODUCTO] nvarchar(255),
    [Precio de Venta] money
)

/*TABLA DIMENSION PAIS*/
CREATE TABLE [DIMENSION_PAIS] (
    [Pa�s id] float,
    [PA�S] nvarchar(255),
    [CONTINENTE] nvarchar(255),
    [FechaCarga] datetime
)

/*TABLA DIMENSION PRODUCTOS*/
CREATE TABLE [DIMENSION_PRODUCTO] (
    [IdPAIS] nvarchar(255),
    [PRODUCTO] nvarchar(255),
    [Precio de Venta] money,
    [FechaCarga] datetime
)

/*TABLA DIMENSION TIEMPO*/
CREATE TABLE [DIMENSION_TIEMPO] (
    [A�o] nvarchar(255),
    [N�mero de Mes] float,
    [Nombre del Mes] nvarchar(255),
    [Fecha] datetime,
    [Ventas] money,
    [FechaCarga] datetime
)

/*SELECCION DE TABLAS*/
SELECT * FROM DATA_PRINCIPAL
SELECT * FROM DATA_PAIS
SELECT * FROM DATA_PRODUCTOS
SELECT * FROM DIMENSION_PAIS
SELECT * FROM DIMENSION_PRODUCTO
SELECT * FROM DIMENSION_TIEMPO

DROP TABLE DIMENSION_PAIS
DROP TABLE [Destino de OLE DB]
/*DIMENSION PAIS*/
SELECT [Pa�s id] FROM [DATA_PRINCIPAL]
ORDER BY [Pa�s id]

SELECT [Pa�s id], [PA�S], [CONTINENTE] FROM [DATA_PAIS]
ORDER BY [Pa�s id]

/*DIMENSION PRODUCTO*/
SELECT [IdPAIS] FROM [DATA_PRINCIPAL]
ORDER BY [IdPAIS]

SELECT [IDPRODUCTO], [PRODUCTO], [Precio de Venta] FROM [DATA_PRODUCTOS]
ORDER BY [IDPRODUCTO]

/*DIMENSION TIEMPO*/
SELECT [A�o], [N�mero de Mes], [Nombre del Mes], [Fecha], [Ventas] FROM [DATA_PRINCIPAL]
ORDER BY [A�o]