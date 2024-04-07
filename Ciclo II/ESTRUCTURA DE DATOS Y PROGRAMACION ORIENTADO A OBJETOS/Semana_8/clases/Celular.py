class Celular:
    def __init__(self,numero,usuario,segundoConsumidos,precioSegundo):
        self.__numero=numero
        self.__usuario=usuario
        self.__segundoConsumidos=segundoConsumidos
        self.__precioSegundo=precioSegundo
    
    @property
    def numero(self):
        return self.__numero
    @numero.setter
    def numero(self,numero):
        self.__numero=numero
    
    @property
    def usuario(self):
        return self.__usuario
    @usuario.setter
    def ususario(self,usuario):
        self.__usuario=usuario
    
    @property
    def segungoConsumidos(self):
        return self.__segundoConsumidos
    @segungoConsumidos.setter
    def segundoConsumidos(self,segundoConsumidos):
        self.__segundoConsumidos=segundoConsumidos
    
    @property
    def precioSegundo(self):
        return self.__precioSegundo
    @precioSegundo.setter
    def precioSegundo(self,precioSegundo):
        self.__precioSegundo=precioSegundo
    
    def calcularCostoConsumo(self):
        return self.__segundoConsumidos*self.__precioSegundo
    
    def calcularIGV(self):
        return self.calcularCostoConsumo()*0.18
    
    def calcularImportePagar(self):
        return self.calcularCostoConsumo(self)+self.calcularIGV()