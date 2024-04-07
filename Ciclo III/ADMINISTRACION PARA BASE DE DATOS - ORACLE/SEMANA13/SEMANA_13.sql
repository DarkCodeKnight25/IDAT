CREATE TABLE Empleado (
    Dni char(8) PRIMARY KEY, 
    Nomemp varchar2(50), 
    Jefe char(8), 
    Departamento integer,
    Salario number(9,2) DEFAULT 1000, 
    Usuario varchar2(50), 
    Fecha date,
    FOREIGN KEY (Jefe) REFERENCES Empleado (Dni)
);

SELECT * FROM EMPLEADO;

-- Ejercicio 1:
-- Crear un trigger sobre la tabla EMPLEADO para que no
-- se permita que un empleado sea jefe de más de cinco
-- empleados

CREATE OR REPLACE TRIGGER jefes
BEFORE INSERT ON Empleado
FOR EACH ROW
DECLARE
  Supervisa INTEGER := 0;
BEGIN
  SELECT count(*) INTO Supervisa FROM Empleado WHERE jefe = :new.jefe;
  IF (Supervisa > 4) THEN
     raise_application_error(-20600, :new.jefe||' No puede tener a cargo a mas de 5 Trabajadores');
  END IF;
END;

-- PROBANDO EL DISPARADOR.
SELECT * FROM EMPLEADO;

INSERT INTO EMPLEADO VALUES ('45878741','JUAN CARLOS PEREZ','45878741',1,1200,'USER13',SYSDATE);
COMMIT;
INSERT INTO EMPLEADO VALUES ('45878742','ELENA CHAVEZ','45878741',1,1500,'USER13',SYSDATE);
COMMIT;
INSERT INTO EMPLEADO VALUES ('45878743','JOSE CARBONEL','45878741',1,1600,'USER13',SYSDATE);
COMMIT;
INSERT INTO EMPLEADO VALUES ('45878744','ALBERTO ALCANTARA','45878741',1,1400,'USER13',SYSDATE);
COMMIT;
INSERT INTO EMPLEADO VALUES ('45878745','CARLOS TORRES','45878741',1,1200,'USER13',SYSDATE);
COMMIT;
INSERT INTO EMPLEADO VALUES ('45878746','CESAR CAMPOS','45878743',1,1100,'USER13',SYSDATE);
COMMIT;

SELECT * FROM EMPLEADO;

-- Ejemplo 2:
-- Crear un trigger para impedir que se aumente el salario
-- de un empleado, en más de un 20%.
-- • Es necesario comparar los valores :old.salario y
--   :new.salario cada vez que se modifica el atributo salario
--   (BEFORE UPDATE).

CREATE OR REPLACE TRIGGER aumentoSalario
BEFORE UPDATE OF salario ON Empleado
FOR EACH ROW
BEGIN
    IF :NEW.salario > :OLD.salario*1.20 THEN
        raise_application_error(-20600,:new.Salario || ' no se puede aumentar el salario más de un 20%');
    END IF;
END;

-- PRUEBA DEL DIPARADOR
SELECT  * FROM EMPLEADO;



UPDATE EMPLEADO SET SALARIO = 1350 WHERE DNI = '45878741';
COMMIT;

UPDATE EMPLEADO SET SALARIO = 1350 WHERE DNI = '45878742';
COMMIT;

UPDATE EMPLEADO SET SALARIO = 1350 WHERE DNI = '45878743';
COMMIT;

UPDATE EMPLEADO SET SALARIO = 1350 WHERE DNI = '45878744';
COMMIT;


UPDATE EMPLEADO SET SALARIO = 1350 WHERE DNI = '45878745';
COMMIT;

-- PROVOCA UN ERROR
UPDATE EMPLEADO SET SALARIO = 1350 WHERE DNI = '45878746';
COMMIT;


-- Ejemplo 3:
-- Crear una tabla empleados_baja con la siguiente
-- estructura:
CREATE TABLE Empleados_Baja (
  dni char(9) PRIMARY KEY,
  nomemp varchar2(50),
  jefe char(9),
  departamento integer,
  salario number(9,2) DEFAULT 1000,
  usuario varchar2(50),
  fecha date
);

-- Crear un trigger que inserte una fila en la tabla
--empleados_baja cuando se borre una fila en la tabla
--empleados.

-- Los datos que se insertan son los del empleado que se
-- da de baja en la tabla empleados, salvo en las columnas
-- usuario y fecha se grabarán las variables del sistema
-- USER y SYSDATE que almacenan el usuario y fecha
-- actual.
-- El comando que dispara el trigger es AFTER DELETE
SELECT * FROM EMPLEADO;
SELECT * FROM EMPLEADOS_BAJA;

CREATE OR REPLACE TRIGGER bajas
AFTER DELETE ON Empleado
FOR EACH ROW
BEGIN
  INSERT INTO Empleados_Baja
  VALUES (:old.dni,:old.nomemp,:old.jefe,:old.departamento, :old.salario, USER, SYSDATE);
END;

SELECT * FROM EMPLEADO;

-- PRUEBA DEL DISPARADOR
DELETE FROM EMPLEADO where Dni = '45878742';
COMMIT;

--Comprobando en anbas tablas
SELECT * FROM EMPLEADO;
SELECT * FROM EMPLEADOS_BAJA;



-- Ejercicio 4.
-- Crear un trigger para impedir que, al insertar un
-- Empleado, el empleado y su jefe puedan pertenecer a
-- departamentos distintos.

CREATE OR REPLACE TRIGGER MISMO_DEP
BEFORE INSERT ON EMPLEADO
FOR EACH ROW
DECLARE
  dept_jefe INTEGER;
BEGIN
  IF (:NEW.jefe IS NOT NULL) THEN
    SELECT departamento INTO dept_jefe FROM Empleado WHERE dni=:NEW.jefe;
    IF (dept_jefe <> :NEW.departamento) THEN 
      raise_application_error(-20600,:NEW.departamento||' Un empleado y su jefe no pueden
      pertenecer a departamentos diferentes');
    END IF;
  END IF;
END;


-- Ejercicio 5.
-- Crear un trigger para impedir que, al insertar un
-- Empleado, la suma de los salarios de los empleados
-- pertenecientes al departamento del empleado insertado
-- supere los 10.000.
CREATE OR REPLACE TRIGGER sumaDept
BEFORE INSERT ON Empleado
FOR EACH ROW
DECLARE
  suma INTEGER;
BEGIN
    SELECT SUM(salario) INTO suma FROM Empleado
    WHERE departamento=:NEW.departamento;
    suma := suma + :NEW.salario;
    IF (suma > 10000) THEN
        raise_application_error (-20600,:NEW.departamento||' La suma de salarios no puede ser
                                superior a 10000');
    END IF;
END;















