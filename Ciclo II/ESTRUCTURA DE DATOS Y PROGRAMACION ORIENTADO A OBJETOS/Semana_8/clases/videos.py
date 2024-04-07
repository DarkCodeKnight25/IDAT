class videos:
    def __init__(self,codigo,titulo,duracion,precioSoles):
        self.__codigo=codigo
        self.__titulo=titulo
        self.__duracion=duracion
        self.__precioSoles=precioSoles
    
    @property
    def codigo(self):
        return self.__codigo
    
    @codigo.setter
    def codigo(self,codigo):
        self.__codigo=codigo
    
    @property
    def titulo(self):
        return self.__titulo
    @titulo.setter
    def titulo(self,titulo):
        self.__titulo=titulo    
    
    @property
    def duracion(self):
        return self.__duracion
    @duracion.setter
    def duracion(self,duracion):
        self.__duracion=duracion
    
    @property
    def precioSoles(self):
        return self.__precioSoles
    @precioSoles.setter
    def precioSoles(self,precioSoles):
        self.__precioSoles=precioSoles
    
    def calcularPrecioVideo(self):
        return self.__precioSoles/3.75
    
