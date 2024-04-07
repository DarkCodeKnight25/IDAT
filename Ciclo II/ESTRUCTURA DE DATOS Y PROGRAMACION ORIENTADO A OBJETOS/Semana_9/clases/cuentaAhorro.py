from tkinter.filedialog import SaveFileDialog
from clases.cuenta import cuenta
class cuentaAhorro(cuenta):
    def __init__(self,numero,titular,monto,retiro):
        super().__init__(numero,titular,monto)
        #cuenta.__init__(self,numero,titular,monto)
        self.__retiro=retiro

    def mostrarDatos(self):
        salida="cuenta de ahorros\n"
        salida+=super().mostrarDatos()
        salida+="\nMonto maximo de retiro :" + str(self.__retiro)
        return salida
