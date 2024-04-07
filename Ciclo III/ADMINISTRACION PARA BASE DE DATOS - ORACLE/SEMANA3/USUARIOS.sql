--BORRANDO EL TABLESPACE, USUARIO Y ROL, SI EXISTIERAN

DROP ROLE ROL_03;
DROP USER USER03 CASCADE;
DROP TABLESPACE SEMANA_03 INCLUDING CONTENTS;

--1 Creando el TableSpace
Create TableSpace SEMANA_03 DataFile 'C:\IDAT\IDAT_03.DBF' Size 150M;

--2 Verificando la creación del TableSpace
Select * From v$tablespace;

--3 Ahora crearemos al usuario USER03, cuya contraseña será: 123456
Create User USER03 Identified by "123456"
Default TableSpace SEMANA_03
Temporary TableSpace TEMP
Quota unlimited on SEMANA_03;

--4 Creamos un Rol el cual contendrá los permisos, en este caso
-- el Role tendrá el nombre ROL_03
Create Role ROL_03;

--5 Asignaremos los permisos (GRANT) al rol creado.
Grant CONNECT, CREATE TABLE, RESOURCE, 
      ALTER ANY INDEX, ALTER ANY SEQUENCE, ALTER ANY TABLE,
      ALTER ANY TRIGGER, CREATE ANY INDEX, CREATE ANY SEQUENCE,
      CREATE ANY SYNONYM, CREATE ANY TABLE, CREATE ANY TRIGGER,
      CREATE ANY VIEW, CREATE PROCEDURE, CREATE PUBLIC SYNONYM, 
      CREATE TRIGGER, CREATE VIEW, DROP ANY INDEX,
      DROP ANY SEQUENCE, DROP ANY TABLE, DROP ANY TRIGGER, DROP ANY VIEW,
      INSERT ANY TABLE, QUERY REWRITE, SELECT ANY TABLE,
      UNLIMITED TABLESPACE To ROL_03;
      
--6 Asociamos (GRANT) el Rol: ROL_03 con el usuario: USER03,
--de esta manera el usuario USER03, podrá realizar las tareas
--i/o permisos que el Rol tiene.
Grant ROL_03 To USER03;

--7. CERRAR TODO, DESCONECTAR E INICIAR NUEVAMENTE, EN ESTA OCASION USAR
--   AL USUARIO USER03.

