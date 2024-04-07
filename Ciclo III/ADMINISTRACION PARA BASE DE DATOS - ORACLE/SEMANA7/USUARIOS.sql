--BORRANDO EL TABLESPACE, USUARIO Y ROL, SI EXISTIERAN

DROP ROLE ROL_07;
DROP USER USER07 CASCADE;
DROP TABLESPACE SEMANA_07 INCLUDING CONTENTS;

--1 Creando el TableSpace
Create TableSpace SEMANA_07 DataFile 'C:\IDAT\IDAT_07.DBF' Size 100M;

--2 Verificando la creación del TableSpace
Select * From v$tablespace;

--3 Ahora crearemos al usuario USER07, cuya contraseña será: 123456
Create User USER07 Identified by "123456"
Default TableSpace SEMANA_07
Temporary TableSpace TEMP
Quota unlimited on SEMANA_07;

--4 Creamos un Rol el cual contendrá los permisos, en este caso
-- el Role tendrá el nombre ROL_07.

Create Role ROL_07;

--5 Asignaremos los permisos (GRANT) al rol creado.

Grant CONNECT, CREATE TABLE, RESOURCE, 
      ALTER ANY INDEX, ALTER ANY SEQUENCE, ALTER ANY TABLE,
      ALTER ANY TRIGGER, CREATE ANY INDEX, CREATE ANY SEQUENCE,
      CREATE ANY SYNONYM, CREATE ANY TABLE, CREATE ANY TRIGGER,
      CREATE ANY VIEW, CREATE PROCEDURE, CREATE PUBLIC SYNONYM, 
      CREATE TRIGGER, CREATE VIEW, DROP ANY INDEX,
      DROP ANY SEQUENCE, DROP ANY TABLE, DROP ANY TRIGGER, DROP ANY VIEW,
      INSERT ANY TABLE, QUERY REWRITE, SELECT ANY TABLE,
      UNLIMITED TABLESPACE To ROL_07;
      
--6 Asociamos (GRANT) el Rol ROL_07 con el usuario USER07,
--de esta manera el usuario USER07, podrá realizar las tareas
--i/o permisos que el Rol tiene.

Grant ROL_07 To USER07;

--7. CERRAR TODO, DESCONECTAR E INICIAR NUEVAMENTE, EN ESTA OCASION USAR
--   AL USUARIO USER07.

