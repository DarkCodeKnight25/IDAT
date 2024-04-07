from clases.Cuenta import Cuenta

class CuentaAhorro(Cuenta):
    def __init__(self,numero,titular,monto,retiro):
        super().__init__(numero,titular,monto)
        #Cuenta.__init__(self,numero,titular,monto)
        self.__retiro=retiro

    def mostrarDatos(self):
        salida = "Cuenta de Ahorros\n"
        salida+=super().mostrarDatos()
        salida+="\nMonto máximo de retiro: " + str(self.__retiro)
        return salida



