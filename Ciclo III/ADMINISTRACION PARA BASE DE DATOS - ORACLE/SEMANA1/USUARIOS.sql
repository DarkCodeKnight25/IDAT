--BORRANDO EL TABLESPACE, USUARIO Y ROL, SI EXISTIERAN

DROP ROLE ROL_01;
DROP USER USER01 CASCADE;
DROP TABLESPACE SEMANA01 INCLUDING CONTENTS;

-- CREACION DE UNA CUENTA DE USUARIO
-----------------------------------------------------------------------

--1 Creando el TableSpace
Create TableSpace SEMANA01 DataFile 'C:\IDAT\IDAT_01.DBF' Size 150M;

--2 Verificando la creación del TableSpace
Select * From v$tablespace;

--3 Ahora crearemos al usuario USER01, cuya contraseña será: 123456
Create User USER01 Identified by "123456"
Default TableSpace SEMANA01
Temporary TableSpace TEMP
Quota unlimited on SEMANA01;

--4 Creamos un Rol el cual contendrá los permisos, en este caso
-- el Role tendrá el nombre ROL_01
Create Role ROL_01;

--5 Asignaremos los permisos (GRANT) al rol creado.
Grant CONNECT, CREATE TABLE, RESOURCE, 
      ALTER ANY INDEX, ALTER ANY SEQUENCE, ALTER ANY TABLE,
      ALTER ANY TRIGGER, CREATE ANY INDEX, CREATE ANY SEQUENCE,
      CREATE ANY SYNONYM, CREATE ANY TABLE, CREATE ANY TRIGGER,
      CREATE ANY VIEW, CREATE PROCEDURE, CREATE PUBLIC SYNONYM, 
      CREATE TRIGGER, CREATE VIEW, DROP ANY INDEX,
      DROP ANY SEQUENCE, DROP ANY TABLE, DROP ANY TRIGGER, DROP ANY VIEW,
      INSERT ANY TABLE, QUERY REWRITE, SELECT ANY TABLE,
      UNLIMITED TABLESPACE To ROL_01;
      
--6 Asociamos (GRANT) el Rol ROL_01 con el usuario USER01,
--de esta manera el usuario USER01, podrá realizar las tareas
--i/o permisos que el Rol_01 tiene.
Grant ROL_01 To USER01;

--7. CERRAR TODO, DESCONECTAR E INICIAR NUEVAMENTE, EN ESTA OCASION USAR
--   AL USUARIO USER01.

