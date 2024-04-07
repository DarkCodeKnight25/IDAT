class trabajador:
    def __init__(self,codigo,nombre,horas,tarifa):
        self.__codigo=codigo
        self.__nombre=nombre
        self.__horas=horas
        self.__tarifa=tarifa

    @property
    def codigo(self):
        return self.__codigo
    
    @codigo.setter
    def codigo(self,codigo):
        self.__codigo=codigo
    
    @property
    def nombre(self):
        return self.__nombre
    @nombre.setter
    def nombre(self,nombre):
        self.__nombre=nombre
    
    @property
    def horas(self):
        return self.__horas
    @horas.setter
    def horas(self,horas):
        self.__horas=horas
    
    @property
    def tarifa(self):
        return self.__tarifa
    @tarifa.setter
    def tarifa(self,tarifa):
        self.__tarifa=tarifa
    
    def calcularSueldoBruto(self):
        return self.__horas*self.__tarifa
    
    def calcularDescuento(self):
        sueldoBruto=self.calcularSueldoBruto()
        if sueldoBruto<4500:
            descuento=sueldoBruto*0.12
        elif sueldoBruto<6500:
            descuento=sueldoBruto*0.14
        else:
            descuento=sueldoBruto*0.16
        return descuento
    
    def calcularSueldoNeto(self):
        return self.calcularSueldoBruto()-self.calcularDescuento()
