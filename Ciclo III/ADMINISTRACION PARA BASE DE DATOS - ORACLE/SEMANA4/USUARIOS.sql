--BORRANDO EL TABLESPACE, USUARIO Y ROL, SI EXISTIERAN

DROP ROLE ROL_04;
DROP USER USER04 CASCADE;
DROP TABLESPACE SEMANA_04 INCLUDING CONTENTS;

--1 Creando el TableSpace
Create TableSpace SEMANA_04 DataFile 'C:\IDAT\IDAT_04.DBF' Size 150M;

--2 Verificando la creación del TableSpace
Select * From v$tablespace;

--3 Ahora crearemos al usuario USER04, cuya contraseña será: 123456
Create User USER04 Identified by "123456"
Default TableSpace SEMANA_04
Temporary TableSpace TEMP
Quota unlimited on SEMANA_04;

--4 Creamos un Rol el cual contendrá los permisos, en este caso
-- el Role tendrá el nombre ROL_04.
Create Role ROL_04;

--5 Asignaremos los permisos (GRANT) al rol creado.
Grant CONNECT, CREATE TABLE, RESOURCE, 
      ALTER ANY INDEX, ALTER ANY SEQUENCE, ALTER ANY TABLE,
      ALTER ANY TRIGGER, CREATE ANY INDEX, CREATE ANY SEQUENCE,
      CREATE ANY SYNONYM, CREATE ANY TABLE, CREATE ANY TRIGGER,
      CREATE ANY VIEW, CREATE PROCEDURE, CREATE PUBLIC SYNONYM, 
      CREATE TRIGGER, CREATE VIEW, DROP ANY INDEX,
      DROP ANY SEQUENCE, DROP ANY TABLE, DROP ANY TRIGGER, DROP ANY VIEW,
      INSERT ANY TABLE, QUERY REWRITE, SELECT ANY TABLE,
      UNLIMITED TABLESPACE To ROL_04;
      
--6 Asociamos (GRANT) el Rol PERMITIR4 con el usuario USER04,
--de esta manera el usuario USER04, podrá realizar las tareas
--i/o permisos que el Rol tiene.
Grant ROL_04 To USER04;
--7. CERRAR TODO, DESCONECTAR E INICIAR NUEVAMENTE, EN ESTA OCASION USAR
--   AL USUARIO USER04.

