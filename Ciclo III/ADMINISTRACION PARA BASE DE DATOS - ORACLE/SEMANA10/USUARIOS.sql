--BORRANDO EL TABLESPACE, USUARIO Y ROL, SI EXISTIERAN

DROP ROLE ROL_10;
DROP USER USER10 CASCADE;
DROP TABLESPACE SEMANA_10 INCLUDING CONTENTS;

--1 Creando el TableSpace
Create TableSpace SEMANA_10 DataFile 'C:\IDAT\IDAT_10.DBF' Size 150M;


--------------------TABLESPACE EC3----------------------------
Create TableSpace NETFINITY DataFile 'C:\IDAT\EC3.DBF' Size 150M;

Select*from v$tablespace;

Create User USER010X Identified by "123456"
Default TableSpace NETFINITY
Temporary TableSpace TEMP
Quota unlimited on NETFINITY;

Create Role ROL_USER10X;

Grant CONNECT, CREATE TABLE, RESOURCE, 
      ALTER ANY INDEX, ALTER ANY SEQUENCE, ALTER ANY TABLE,
      ALTER ANY TRIGGER, CREATE ANY INDEX, CREATE ANY SEQUENCE,
      CREATE ANY SYNONYM, CREATE ANY TABLE, CREATE ANY TRIGGER,
      CREATE ANY VIEW, CREATE PROCEDURE, CREATE PUBLIC SYNONYM, 
      CREATE TRIGGER, CREATE VIEW, DROP ANY INDEX,
      DROP ANY SEQUENCE, DROP ANY TABLE, DROP ANY TRIGGER, DROP ANY VIEW,
      INSERT ANY TABLE, QUERY REWRITE, SELECT ANY TABLE,
      UNLIMITED TABLESPACE To ROL_USER10X;

Grant ROL_USER10X To USER010X;
-------------------------------------------------------------------
--2 Verificando la creación del TableSpace
Select * From v$tablespace;

--3 Ahora crearemos al usuario USER10, cuya contraseña será: 123456
Create User USER10 Identified by "123456"
Default TableSpace SEMANA_10
Temporary TableSpace TEMP
Quota unlimited on SEMANA_10;

--4 Creamos un Rol el cual contendrá los permisos, en este caso
-- el Role tendrá el nombre ROL_10
Create Role ROL_10;

--5 Asignaremos los permisos (GRANT) al rol creado.
Grant CONNECT, CREATE TABLE, RESOURCE, 
      ALTER ANY INDEX, ALTER ANY SEQUENCE, ALTER ANY TABLE,
      ALTER ANY TRIGGER, CREATE ANY INDEX, CREATE ANY SEQUENCE,
      CREATE ANY SYNONYM, CREATE ANY TABLE, CREATE ANY TRIGGER,
      CREATE ANY VIEW, CREATE PROCEDURE, CREATE PUBLIC SYNONYM, 
      CREATE TRIGGER, CREATE VIEW, DROP ANY INDEX,
      DROP ANY SEQUENCE, DROP ANY TABLE, DROP ANY TRIGGER, DROP ANY VIEW,
      INSERT ANY TABLE, QUERY REWRITE, SELECT ANY TABLE,
      UNLIMITED TABLESPACE To ROL_10;
      
--6 Asociamos (GRANT) el Rol: ROL_10 con el usuario USER10,
--  de esta manera el usuario USER10, podrá realizar las tareas
--  i/o permisos que el ROL_10 tiene.
Grant ROL_10 To USER10;

--7. CERRAR TODO, DESCONECTAR E INICIAR NUEVAMENTE, EN ESTA OCASION USAR
--   AL USUARIO USER10.

