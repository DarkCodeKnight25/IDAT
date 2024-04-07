--------------------------------------------------------
-- CREANDO UNA BASE DE DATOS (Definición por Defecto)
--------------------------------------------------------
CREATE DATABASE UBIGEO
PRINT 'Base de Datos UBIGEO creada satisfactoriamente'
Go

-- VERIFICANDO LA ESTRUCTURA DE UNA BASE DE DATOS.
EXEC sp_helpdb UBIGEO
GO

--------------------------------------------------------
-- CREANDO UNA BASE DE DATOS (Definición Personalizada)
--------------------------------------------------------
-- Recomendación:
-- En el proceso anterior ya se registró y creó a la base de datos
-- ubigeo, para volver a crearlo, debe eliminarlo.
DROP DATABASE UBIGEO
PRINT 'Base de datos UBIGEO Eliminada'
Go
-- Ahora si, vamos a volver crear la base de datos UBIGEO
-- con personalización incluida.

Create Database UBIGEO
On  ( /*Archivo Físico MDF */
    Name = Ubigeo_Data, Filename ='C:\Datos\Ubigeo_Data.MDF',
	Size = 5MB, MaxSize = 50MB, Filegrowth = 5MB
	)
log ON /*Archivo Lógico LDF */
    (
    Name = Ubigeo_Log, Filename ='C:\Datos\Ubigeo_log.LDF',
	Size = 5MB, MaxSize = 150MB, Filegrowth = 5MB
	)
PRINT 'Base de Datos UBIGEO Personalizada creada satisfactoriamente'
Go

-- VERIFICANDO LA ESTRUCTURA DE UNA BASE DE DATOS.
EXEC sp_helpdb UBIGEO
GO

--------------------------------------------------------
--APRENDER USAR LA BASE DE DATOS
--------------------------------------------------------
-- Sin importar como haya sido creada esta base de datos
-- esta debe ser usada. USE
Use UBIGEO
PRINT 'Base de Datos Ubigeo esta ahora ACTIVA'
Go


--------------------------------------------------------
-- APRENDER A MODIFICAR LA ESTRUCTURA DE UNA BASE DE DATOS
-- COMANDO: ALTER DATABASE
--------------------------------------------------------

-- En este ejemplo se observa que se esta modificando el
-- auto crecimiento del archivo a 10MB (FISICO)
EXEC sp_helpdb UBIGEO
Go

Alter Database UBIGEO Modify File (
	Name = Ubigeo_Data, Filegrowth = 10MB
	)
Go
--VERIFICAR
EXEC sp_helpdb UBIGEO
Go

-- En este ejemplo se modifica el tamaño maximo A 100 MB
-- de la base de datos UBIGEO (FISICO)
EXEC sp_helpdb UBIGEO
Go
--PROCEDER
Alter Database UBIGEO Modify File (
	Name = Ubigeo_Data, Maxsize = 100MB
	)
Go
--VERIFICAR
EXEC sp_helpdb UBIGEO
Go

-- En este ejemplo se modifica el tamaño original a 80 mb,
-- de la base de datos UBIGEO (FISICO)
EXEC sp_helpdb UBIGEO
Go
--PROCEDER
Alter Database UBIGEO Modify File (
	Name = Ubigeo_Data, size = 80MB
	)
Go
-- VERIFICANDO LA ESTRUCTURA DE UNA BASE DE DATOS.
EXEC sp_helpdb UBIGEO
GO



--------------------------------------------------------
-- APRENDER A CREAR ARCHIVOS DE GRUPO --> GRUP FILE
--------------------------------------------------------
-- AGREGANDO ARCHIVOS DE GRUPO A UNA BASE DE DATOS
-- Modificando la Base de Datos UBIGEO y Agregando 2 Filegroups.
-- [FG_ADMINISTRACION] y [FG_GERENCIA].

ALTER DATABASE UBIGEO ADD FILEGROUP [FG_ADMINISTRACION]
PRINT 'Archivo de Grupo [FG_ADMINISTRACION] creada'
GO

ALTER DATABASE UBIGEO ADD FILEGROUP [FG_GERENCIA]
PRINT 'Archivo de Grupo [FG_GERENCIA] creada'
GO


--PARA VERIFICAR LA CREACION DE LOS ARCHIVOS DE GRUPOS
--DEBE HACER CLICK DERECHO SOBRE LA BASE DE DATOS UBIGEO
--Y SELECCIONAR LAS OPCIONES:
-- "PROPIEDADES" --> "Grupos de Archivos" FileGroup


-- ADICIONAR UN NUEVO DATAFILE EN LA BASE DE DATOS CREADA
-- FILEGROUP FG_ADMINISTRACION.
ALTER DATABASE UBIGEO
ADD FILE
	(
		NAME = Ubigeo_Data_G1, FILENAME = 'C:\Datos\FG_Ubigeo_Data_ADMINISTRADOR.NDF'
	)	TO FILEGROUP [FG_ADMINISTRACION]
    PRINT 'ARCHIVO FG_Ubigeo_Data_ADMINISTRADOR.NDF creado'
GO

-- ADICIONAR UN NUEVO DATAFILE EN LA BASE DE DATOS CREADA
-- FILEGROUP FG_GERENCIA.
ALTER DATABASE UBIGEO
ADD FILE
	(
		NAME = Ubigeo_Data_G2, FILENAME = 'C:\Datos\FG_Ubigeo_Data_GERENCIA.NDF'
	)	TO FILEGROUP [FG_GERENCIA]
	PRINT 'ARCHIVO FG_Ubigeo_Data_GERENCIA.NDF creado'
GO

--VERIFICAR
EXEC sp_helpdb UBIGEO
GO

-------------------------------------------------------------------
-- APRENDER ELIMINAR UNA BASE DE DATOS.
-- COMANDO: DROP DATABASE.
-------------------------------------------------------------------
-- Se exige, eliminar la base de datos siempre y cuando deje de ser usada.
-- entonces cambiamos el uso, por otra base de datos.
USE MASTER
GO
--Ahora si puedes eliminar la base de datos UBIGEO
DROP DATABASE UBIGEO
PRINT 'Base de Datos UBIGEO eliminada'
GO



------------------------
AQUI ME QUEDE.
------------------------


--------------------------------------------------------------
-- APRENDER A CREAR TABLAS
--------------------------------------------------------------
-- COMANDO: Create Table

-- Sugerencia:
-- Para crear tablas, antes debe contar con una base de datos propia.


--Ejemplo:
-- Crear la Tabla Cliente y almacenarla en el archivo de grupo [FG_ADMINISTRACION]

--Antes se se deba activar la base de datos, para usarla.
Use UBIGEO
Go

Create Table Cliente(
	IdCliente Char(5) Not Null,
	Apellidos_Cli Varchar(50) Not Null,
	Nombres_Cli  Varchar(50) Not Null,
	Dni_Cli   Char(8) Not Null,
	FechaNac_Cli Date Not Null,
	Primary Key (IdCliente)
	) ON [FG_ADMINISTRACION]
	PRINT 'Table Cliente Creada en el grupo [FG_ADMINISTRACION]'
Go

-- Ver Estructura de la tabla
EXEC sp_help Cliente
GO


--APRENDER A MODIFICAR LA ESTRUCTURA DE LA TABLA CLIENTE

-- Por ejemplo, adicionar el campo teléfono a la tabla Cliente.
Alter Table Cliente Add Telefono Char(9) Not Null
Go
-- Ver Estructura de la tabla
EXEC sp_help Cliente
Go

-- Por ejemplo:
-- Modificar el tipo de campo del teléfono de la tabla Cliente
-- al tipo de dato entero
Alter Table Cliente ALTER COLUMN Telefono int Not Null
Go
-- Ver Estructura de la tabla
EXEC sp_help Cliente
Go

-- Por ejemplo:
-- Eliminar el campo teléfono de la tabla Cliente.
Alter Table Cliente DROP COLUMN Telefono
Go
-- Ver Estructura de la tabla
EXEC sp_help Cliente
Go
-- Por ejemplo:
-- Crear la tabla Empleado Sin llave Principal
-- y asignelo al grupo [FG_GERENCIA]
-- luego asignar la llave.
Use Ubigeo
Go

Create Table Empleado(
	IdEmpleado	Char(5) Not Null,
	Nombre_EMP  Varchar(50) Not Null,
	Apellidos_EMP Varchar(50) Not Null,
	Dni_EMP     Char(8) Not Null
) ON [FG_GERENCIA]
Go

-- Ver Estructura de la tabla
EXEC sp_help Empleado
Go

-- Agregar la llave principal en la tabla Empleado usando al campo
-- IdEmpleado.
Alter Table Empleado ADD PRIMARY KEY (IdEmpleado)
Go

-- Ver Estructura de la tabla
EXEC sp_help Empleado
Go


-- RELACIONANDO TABLAS.
-- Crear la tabla Cargo en el File Group [FG_GERENCIA] y relacionar
-- con la tabla Empleado, usar como campo foráneo y relacionante a IdCargo.
Create Table Cargo (
	IdCargo int Not Null,
	Descripcion Varchar(50) Not Null,
	Primary Key (IdCargo)) ON [FG_GERENCIA]

-- Agregar el Campo IdCargo en la Tabla Empleado
Alter Table Empleado Add IdCargo int Not Null
Go
-- Ver Estructura de la tabla
EXEC sp_help Cargo
EXEC sp_help Empleado
Go
-- Relacionando Cargo (Padre) y Empleado(Hijo):
Alter Table Empleado Add Foreign Key(IdCargo) References Cargo(IdCargo)
Go

-- para comprobar la relacion.
-- Favor de crear un diagrama de base de datos y verificar la relacion








-- ELIMINACION DE TABLAS
------------------------
-- Comando: DROP TABLE
--Por Ejemplo, Elimine la tabla Cliente.
Use UBIGEO
Go

Drop Table Cliente
Go









