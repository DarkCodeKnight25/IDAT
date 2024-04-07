class Usuario:
    def __init__(self,nombre,apellido,edad):
        self.__nombre=nombre
        self.__apellido=apellido
        self.__edad=edad
    
    def generarCorreo(self):
        return self.__nombre+"."+self.__apellido+"@idat.edu.pe"

    def mostrarDatos(self):
        salida="Nombre: " + self.__nombre  
        salida+="\nApellido: " + self.__apellido 
        salida+="\nEdad: " + str(self.__edad)
        salida+="\nCorreo: " + self.generarCorreo()
        return salida
 

