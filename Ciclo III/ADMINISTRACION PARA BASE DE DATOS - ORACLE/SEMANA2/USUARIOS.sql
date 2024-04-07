--BORRANDO EL TABLESPACE, USUARIO Y ROL, SI EXISTIERAN
-- NO TOCAR

-- INGRESAR CON EL USUARIO SYSTEM Y LA CLASE 123

DROP ROLE ROL_02;
DROP USER USER02 CASCADE;
DROP TABLESPACE SEMANA02 INCLUDING CONTENTS;





-- CREACION DE CUENTA DE USUARIO

--1 Creando el TableSpace
Create TableSpace SEMANA02 DataFile 'C:\IDAT\IDAT_02.DBF' Size 150M;

--2 Verificando la creación del TableSpace (Opcional)
Select * From v$tablespace;

--3 Ahora crearemos al usuario USER02, cuya contraseña será: 123456
Create User USER02 Identified by "123456"
Default TableSpace SEMANA02
Temporary TableSpace TEMP
Quota unlimited on SEMANA02;

--4 Creamos un Rol el cual contendrá los permisos, en este caso
-- el Role tendrá el nombre ROL_02
Create Role ROL_02;

--5 Asignaremos los permisos (GRANT) al rol creado.
Grant CONNECT, CREATE TABLE, RESOURCE, 
      ALTER ANY INDEX, ALTER ANY SEQUENCE, ALTER ANY TABLE,
      ALTER ANY TRIGGER, CREATE ANY INDEX, CREATE ANY SEQUENCE,
      CREATE ANY SYNONYM, CREATE ANY TABLE, CREATE ANY TRIGGER,
      CREATE ANY VIEW, CREATE PROCEDURE, CREATE PUBLIC SYNONYM, 
      CREATE TRIGGER, CREATE VIEW, DROP ANY INDEX,
      DROP ANY SEQUENCE, DROP ANY TABLE, DROP ANY TRIGGER, DROP ANY VIEW,
      INSERT ANY TABLE, QUERY REWRITE, SELECT ANY TABLE,
      UNLIMITED TABLESPACE To ROL_02;
      
--6 Asociamos (GRANT) el Rol ROL_02 con el usuario USER02,
--de esta manera el usuario USER02, podrá realizar las tareas
--i/o permisos que el Rol_02 tiene.
Grant ROL_02 To USER02;

--7. CERRAR TODO, DESCONECTAR E INICIAR NUEVAMENTE, EN ESTA OCASION USAR
--   AL USUARIO USER02.

