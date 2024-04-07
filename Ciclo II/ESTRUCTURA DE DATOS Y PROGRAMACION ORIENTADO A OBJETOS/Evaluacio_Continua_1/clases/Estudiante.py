class Estudiante:
    def __init__(self,nombre,apellido,dni):
        self.nombre = nombre
        self.apellido = apellido
        self.dni = dni

    def generarCodigo(self):
        codigo = self.nombre[:2]+self.apellido[-3:]+self.dni[-5:]
        return codigo.upper()  

    def mostrarDatos(self):
        print("Nombre:", self.nombre)
        print("Apellido:", self.apellido)
        print("DNI:", self.dni)
        print("Código:", self.generarCodigo())