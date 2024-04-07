from clases.Usuario import Usuario

class Docente(Usuario):
    def __init__(self,nombre,apellido,edad,horas,tarifa):
        super().__init__(nombre, apellido, edad)
        self.__horas=horas
        self.__tarifa=tarifa
    
    def calcularSueldo(self):
        return self.__horas*self.__tarifa
    
    def mostrarDatos(self):
        salida="Docente"
        salida+=super().mostrarDatos()
        salida+="\nHoras: " + str(self.__horas)
        salida+="\nTarifa: " + str(self.__tarifa)
        salida+="\nSueldo: " + str(self.calcularSueldo())
        return salida

        