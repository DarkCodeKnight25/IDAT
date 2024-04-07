class Obrero:
    def __init__(self,codigo, nombre, dni, peso, estatura, horaTrabajada, tarifaHoraria):
        self.__codigo = codigo
        self.__nombre = nombre
        self.__dni = dni
        self.__peso = peso
        self.__estatura = estatura
        self.__horaTrabajada = horaTrabajada
        self.__tarifaHoraria = tarifaHoraria

    @property
    def codigo(self):
        return self.__codigo

    @property
    def nombre(self):
        return self.__nombre
    @nombre.setter
    def nombre(self,nombre):
        self.__nombre = nombre   

    @property
    def dni(self):
        return self.__dni
    @dni.setter
    def dni(self,dni):
        self.__dni = dni      

    @property
    def peso(self):
        return self.__peso
    @peso.setter
    def peso(self,peso):
        self.__peso = peso  

    @property
    def estatura(self):
        return self.__estatura
    @estatura.setter
    def estatura(self,estatura):
        self.__estatura = estatura

    @property
    def horaTrabajada(self):
        return self.__horaTrabajada
    @horaTrabajada.setter
    def horaTrabajada(self,horaTrabajada):
        self.__horaTrabajada = horaTrabajada 

    @property
    def tarifaHoraria(self):
        return self.__tarifaHoraria
    @tarifaHoraria.setter
    def tarifaHoraria(self,tarifaHoraria):
        self.__tarifaHoraria = tarifaHoraria      

    def calcularIMC(self):
        return round((self.__peso / (self.__estatura * self.__estatura)),1)

    def obtenerGradoObesidad(self):
        if (self.calcularIMC() < 20):
            grado = "Delgado"
        elif (self.calcularIMC() < 25):
            grado = "Normal"
        elif (self.calcularIMC() < 30):
            grado = "Sobrepeso"
        else:
            grado = "Obesidad"            
        return grado

    def calcularSueldoBruto(self):
        return round((self.__horaTrabajada * self.__tarifaHoraria),2)

    def calcularIncentivo(self):
        salida = self.obtenerGradoObesidad()

        if (salida == "Normal"):
            salida = (0.15 * self.calcularSueldoBruto())
        elif (salida == "Sobrepeso"):
            salida = (0.15 * self.calcularSueldoBruto())
        else:
            salida = "No hay incentivo"            
        return salida

    def calcularSueldoNeto(self):
        return (self.calcularSueldoBruto() + self.calcularIncentivo()) 