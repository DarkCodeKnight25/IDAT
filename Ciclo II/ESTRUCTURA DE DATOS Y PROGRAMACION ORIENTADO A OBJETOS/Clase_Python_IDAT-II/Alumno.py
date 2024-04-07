from clases.Usuario import Usuario

class Alumno(Usuario):
    def __init__(self,nombre,apellido,edad,nota1,nota2,nota3):
        super().__init__(nombre, apellido, edad)
        self.__nota1=nota1
        self.__nota2=nota2
        self.__nota3=nota3

    def calcularPromedio(self):
        return (self.__nota1+self.__nota2+self.__nota3)/3

    def mostrarDatos(self):
        salida="Alumno\n"
        salida+=super().mostrarDatos() 
        salida+="\nNota 1: " + str(self.__nota1)
        salida+="\nNota 2: " + str(self.__nota2)
        salida+="\nNota 3: " + str(self.__nota3)
        salida+="\nPromedio: " + str(self.calcularPromedio())
        return salida
            
