--BORRANDO EL TABLESPACE, USUARIO Y ROL, SI EXISTIERAN

DROP ROLE ROL_11;
DROP USER USER11 CASCADE;
DROP TABLESPACE SEMANA_11 INCLUDING CONTENTS;

--1 Creando el TableSpace
Create TableSpace SEMANA_11 DataFile 'C:\IDAT\IDAT_11.DBF' Size 150M;

--2 Verificando la creación del TableSpace
Select * From v$tablespace;

--3 Ahora crearemos al usuario USER11, cuya contraseña será: 123456
Create User USER11 Identified by "123456"
Default TableSpace SEMANA_11
Temporary TableSpace TEMP
Quota unlimited on SEMANA_11;

--4 Creamos un Rol el cual contendrá los permisos, en este caso
-- el Role tendrá el nombre ROL_11
Create Role ROL_11;

--5 Asignaremos los permisos (GRANT) al rol creado.
Grant CONNECT, CREATE TABLE, RESOURCE, 
      ALTER ANY INDEX, ALTER ANY SEQUENCE, ALTER ANY TABLE,
      ALTER ANY TRIGGER, CREATE ANY INDEX, CREATE ANY SEQUENCE,
      CREATE ANY SYNONYM, CREATE ANY TABLE, CREATE ANY TRIGGER,
      CREATE ANY VIEW, CREATE PROCEDURE, CREATE PUBLIC SYNONYM, 
      CREATE TRIGGER, CREATE VIEW, DROP ANY INDEX,
      DROP ANY SEQUENCE, DROP ANY TABLE, DROP ANY TRIGGER, DROP ANY VIEW,
      INSERT ANY TABLE, QUERY REWRITE, SELECT ANY TABLE,
      UNLIMITED TABLESPACE To ROL_11;
      
--6 Asociamos (GRANT) el Rol: ROL_11 con el usuario USER11,
--  de esta manera el usuario USER11, podrá realizar las tareas
--  i/o permisos que el ROL_11 tiene.
Grant ROL_11 To USER11;

--7. CERRAR TODO, DESCONECTAR E INICIAR NUEVAMENTE, EN ESTA OCASION USAR
--   AL USUARIO USER11.

