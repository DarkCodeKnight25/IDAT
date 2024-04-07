from clases.Cuenta import Cuenta

class CuentaPlazoFijo(Cuenta):
    def __init__(self,numero,titular,monto,plazo,tasa):
        super().__init__(numero, titular, monto)
        self.__plazo=plazo
        self.__tasa=tasa

    def calcularInteres(self):
        return self._monto*self.__tasa/100
    
    def mostrarDatos(self):
        salida="Cuenta de Plazo Fijo\n"
        salida+=super().mostrarDatos()
        salida+="\nPlazo en días: " + str(self.__plazo)
        salida+="\nTasa de interés: " + str(self.__tasa)
        salida+="\nImporte de interés: " + str(self.calcularInteres())
        return salida
        
