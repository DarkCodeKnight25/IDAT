-- MODELO RELACIONAL: EXPRESA LOS VINCULOS EXISTENTES ENTRE EMPLEADO Y CARGO
-- LOS EMPLEADOS DEBEN TENER CARGOS.
Create Table CARGO(
      IdCargo  int Not Null,
      Nombre   Varchar2(50) Not Null,
      Sueldo   Numeric(10,2) Not Null,
      Primary Key(IdCargo));

Create Table EMPLEADO(
      IdEmpleado Char(5) Not Null,
      IdCargo  int Not Null,
      NombreE  Varchar2(50) Not Null,
      Dni      Char(8) Not Null,
      Primary Key (IdEmpleado),
      Constraint FK_Relacion_Cargo Foreign Key(IdCargo) References Cargo(IdCargo));

Insert Into Cargo Values(1, 'Administrador',5000.00);
Insert Into Cargo Values(2, 'Gerente',4000.00);
Insert Into Cargo Values(3, 'Secretaria',2500.00);
Insert Into Cargo Values(4, 'Servicios',930.00);

Insert Into Empleado Values ('E0001',1,'Juan Perez','45857458');
Insert Into Empleado Values ('E0002',2,'Celeste Gamarra','45859865');
Insert Into Empleado Values ('E0003',3,'Cecilia Campos','41212363');
Insert Into Empleado Values ('E0004',4,'Carlos Rosales','45212124');

SELECT * FROM CARGO;
SELECT * FROM EMPLEADO;