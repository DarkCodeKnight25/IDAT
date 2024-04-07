from logging import setLogRecordFactory


class cuenta:
    def __init__(self,numero,titular,monto):
        self.__numero=numero
        self.__titular=titular
        self.__monto=monto
    
    def mostrarDatos(self):
        salida="Numero :" + self.__numero
        salida+="\nTitular :" + self.__titular
        salida+="\nMonto :" + self.__monto
        return salida
