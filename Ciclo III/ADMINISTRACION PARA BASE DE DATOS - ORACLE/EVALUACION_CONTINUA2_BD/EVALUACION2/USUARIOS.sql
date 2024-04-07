--BORRANDO EL TABLESPACE, USUARIO Y ROL, SI EXISTIERAN

DROP ROLE ROL_USER07X;
DROP USER USER07X CASCADE;
DROP TABLESPACE EC2 INCLUDING CONTENTS;

--1 Creando el TableSpace
Create TableSpace EC2 DataFile 'C:\IDAT\IDAT_EVC2.DBF' Size 150M;
--2 Verificando la creación del TableSpace
Select * From v$tablespace;
--3 Ahora crearemos al usuario USER07, cuya contraseña será: 123456
Create User USER07X Identified by "123456"
Default TableSpace EC2
Temporary TableSpace TEMP
Quota unlimited on EC2;
--4 Creamos un Rol el cual contendrá los permisos, en este caso
-- el Role tendrá el nombre ROL_07.
Create Role ROL_USER07X;
--5 Asignaremos los permisos (GRANT) al rol creado.
Grant CONNECT, CREATE TABLE, RESOURCE, 
      ALTER ANY INDEX, ALTER ANY SEQUENCE, ALTER ANY TABLE,
      ALTER ANY TRIGGER, CREATE ANY INDEX, CREATE ANY SEQUENCE,
      CREATE ANY SYNONYM, CREATE ANY TABLE, CREATE ANY TRIGGER,
      CREATE ANY VIEW, CREATE PROCEDURE, CREATE PUBLIC SYNONYM, 
      CREATE TRIGGER, CREATE VIEW, DROP ANY INDEX,
      DROP ANY SEQUENCE, DROP ANY TABLE, DROP ANY TRIGGER, DROP ANY VIEW,
      INSERT ANY TABLE, QUERY REWRITE, SELECT ANY TABLE,
      UNLIMITED TABLESPACE To ROL_USER07X;     
--6 Asociamos (GRANT) el Rol ROL_USER07X con el usuario USER07,
--de esta manera el usuario USER07X, podrá realizar las tareas
--i/o permisos que el Rol tiene.
Grant ROL_USER07X To USER07X;

--7. CERRAR TODO, DESCONECTAR E INICIAR NUEVAMENTE, EN ESTA OCASION USAR
--   AL USUARIO USER07X.

