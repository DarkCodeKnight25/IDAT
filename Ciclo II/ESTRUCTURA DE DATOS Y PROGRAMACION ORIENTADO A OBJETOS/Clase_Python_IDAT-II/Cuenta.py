class Cuenta:
    def __init__(self,numero,titular,monto):
        self.__numero=numero
        self.__titular=titular
        self._monto=monto
    
    def mostrarDatos(self):
        salida="Número: " + self.__numero
        salida+="\nTitular: " + self.__titular
        salida+="\nMonto: " + str(self._monto)
        return salida

    
