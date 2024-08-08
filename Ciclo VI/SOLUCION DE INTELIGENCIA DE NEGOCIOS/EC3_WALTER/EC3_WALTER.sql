CREATE DATABASE EC3_WALTER
USE EC3_WALTER
GO

CREATE TABLE [VENTAS_PAIS] (
	[Country] nvarchar(255),
    [Sales] money
)

CREATE TABLE [DATA_PRINCIPAL] (
    [Segment] nvarchar(255),
    [Country] nvarchar(255),
    [Product] nvarchar(255),
    [Discount Band] nvarchar(255),
    [Units Sold] float,
    [Manufacturing Price] money,
    [Sale Price] money,
    [Gross Sales] money,
    [Discounts] money,
    [ Sales] money,
    [COGS] money,
    [Profit] money,
    [Date] datetime,
    [Month Number] float,
    [Month Name] nvarchar(255),
    [Year] nvarchar(255)
)
GO
CREATE TABLE [USA_FRANCIA] (
    [Segment] nvarchar(255),
    [Country] nvarchar(255),
    [Product] nvarchar(255),
    [Discount Band] nvarchar(255),
    [Units Sold] float,
    [Manufacturing Price] money,
    [Sale Price] money,
    [Gross Sales] money,
    [Discounts] money,
    [ Sales] money,
    [COGS] money,
    [Profit] money,
    [Date] datetime,
    [Month Number] float,
    [Month Name] nvarchar(255),
    [Year] nvarchar(255)
)
GO

GO
CREATE TABLE [USA] (
    [Segment] nvarchar(255),
    [Country] nvarchar(255),
    [Product] nvarchar(255),
    [Discount Band] nvarchar(255),
    [Units Sold] float,
    [Manufacturing Price] money,
    [Sale Price] money,
    [Gross Sales] money,
    [Discounts] money,
    [ Sales] money,
    [COGS] money,
    [Profit] money,
    [Date] datetime,
    [Month Number] float,
    [Month Name] nvarchar(255),
    [Year] nvarchar(255)
)
GO
CREATE TABLE [CHANNEL_PARTNERS] (
    [Segment] nvarchar(255),
    [Country] nvarchar(255),
    [Product] nvarchar(255),
    [Discount Band] nvarchar(255),
    [Units Sold] float,
    [Manufacturing Price] money,
    [Sale Price] money,
    [Gross Sales] money,
    [Discounts] money,
    [ Sales] money,
    [COGS] money,
    [Profit] money,
    [Date] datetime,
    [Month Number] float,
    [Month Name] nvarchar(255),
    [Year] nvarchar(255)
)
GO
CREATE TABLE [ENTERPRISE] (
    [Segment] nvarchar(255),
    [Country] nvarchar(255),
    [Product] nvarchar(255),
    [Discount Band] nvarchar(255),
    [Units Sold] float,
    [Manufacturing Price] money,
    [Sale Price] money,
    [Gross Sales] money,
    [Discounts] money,
    [ Sales] money,
    [COGS] money,
    [Profit] money,
    [Date] datetime,
    [Month Number] float,
    [Month Name] nvarchar(255),
    [Year] nvarchar(255)
)
GO
CREATE TABLE [GOVERNMENT] (
    [Segment] nvarchar(255),
    [Country] nvarchar(255),
    [Product] nvarchar(255),
    [Discount Band] nvarchar(255),
    [Units Sold] float,
    [Manufacturing Price] money,
    [Sale Price] money,
    [Gross Sales] money,
    [Discounts] money,
    [ Sales] money,
    [COGS] money,
    [Profit] money,
    [Date] datetime,
    [Month Number] float,
    [Month Name] nvarchar(255),
    [Year] nvarchar(255)
)
GO
CREATE TABLE [MIDMARKET] (
    [Segment] nvarchar(255),
    [Country] nvarchar(255),
    [Product] nvarchar(255),
    [Discount Band] nvarchar(255),
    [Units Sold] float,
    [Manufacturing Price] money,
    [Sale Price] money,
    [Gross Sales] money,
    [Discounts] money,
    [ Sales] money,
    [COGS] money,
    [Profit] money,
    [Date] datetime,
    [Month Number] float,
    [Month Name] nvarchar(255),
    [Year] nvarchar(255)
)
GO
CREATE TABLE [SMALL_BUSINESS] (
    [Segment] nvarchar(255),
    [Country] nvarchar(255),
    [Product] nvarchar(255),
    [Discount Band] nvarchar(255),
    [Units Sold] float,
    [Manufacturing Price] money,
    [Sale Price] money,
    [Gross Sales] money,
    [Discounts] money,
    [ Sales] money,
    [COGS] money,
    [Profit] money,
    [Date] datetime,
    [Month Number] float,
    [Month Name] nvarchar(255),
    [Year] nvarchar(255)
)
go
CREATE TABLE [PROM_USA] (
    [Profit] money,
    [Country] nvarchar(255)
)
go
CREATE TABLE [PROM_UE] (
    [Profit] money,
    [Country] nvarchar(255)
)
GO
CREATE TABLE [PRIMER_TRIMESTRE] (
    [Segment] nvarchar(255),
    [Country] nvarchar(255),
    [Product] nvarchar(255),
    [Discount Band] nvarchar(255),
    [Units Sold] float,
    [Manufacturing Price] money,
    [Sale Price] money,
    [Gross Sales] money,
    [Discounts] money,
    [ Sales] money,
    [COGS] money,
    [Profit] money,
    [Date] datetime,
    [Month Number] float,
    [Month Name] nvarchar(255),
    [Year] nvarchar(255),
	[FechaCarga] datetime
)
GO
CREATE TABLE [DESCUENTOS_PAIS] (
    [Discounts] money,
    [Country] nvarchar(255),
	[FechaCarga] datetime
)
GO
CREATE TABLE [VENTA_TRIMESTRE_ANUAL] (
    [Año] int,
    [Trimestre] int,
    [Sales] money,
	[FechaCarga] datetime
)
GO
CREATE TABLE [DESCUENTO_PAIS_FIJADO] (
    [Country] nvarchar(255),
    [Discounts] money,
	[FechaCarga] datetime
)
GO
CREATE TABLE [VENTAS_DIA_SEMANA] (
    [NombreDia] nvarchar(9),
    [Sales] money,
	[FechaCarga] datetime
)

SELECT * FROM DATA_PRINCIPAL
SELECT * FROM USA
SELECT * FROM USA_FRANCIA
SELECT * FROM PROM_USA
SELECT * FROM PROM_UE
SELECT * FROM VENTAS_PAIS
SELECT * FROM CHANNEL_PARTNERS
SELECT * FROM ENTERPRISE
SELECT * FROM SMALL_BUSINESS
SELECT * FROM GOVERNMENT
SELECT * FROM MIDMARKET
SELECT * FROM PRIMER_TRIMESTRE
SELECT * FROM DESCUENTOS_PAIS
SELECT * FROM VENTA_TRIMESTRE_ANUAL
SELECT * FROM DESCUENTO_PAIS_FIJADO
SELECT * FROM VENTAS_DIA_SEMANA