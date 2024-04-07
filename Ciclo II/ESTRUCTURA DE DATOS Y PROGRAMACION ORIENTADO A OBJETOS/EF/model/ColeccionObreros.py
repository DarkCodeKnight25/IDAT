from entity.Obrero import Obrero

class ColeccionObreros:
    def __init__(self):
        self.__listaObreros = []
        self.cargar()

    def agregar(self, objeto): 
        self.__listaObreros.append(objeto)  

    def longitud(self):
        return len(self.__listaObreros) 

    def obtener(self, pos): 
        return self.__listaObreros[pos]         

    def buscar(self, codigo): 
        for i in range(self.longitud()): 
            if codigo == self.__listaObreros[i].codigo:
                return i 
        return -1

    def eliminar(self, pos):
        del(self.__listaObreros[pos]) 

    def modificar(self, objetoReemplazante, pos):
        self.obtener(pos).nombre = objetoReemplazante.nombre
        self.obtener(pos).dni = objetoReemplazante.dni
        self.obtener(pos).peso = objetoReemplazante.peso
        self.obtener(pos).estatura = objetoReemplazante.estatura
        self.obtener(pos).horaTrabajada = objetoReemplazante.horaTrabajada
        self.obtener(pos).tarifaHoraria = objetoReemplazante.tarifaHoraria

    def grabar(self):
        archivo = open("data/Obrero.txt","w", encoding="utf-8") 
        for i in range(self.longitud()):
            cadena = self.obtener(i).codigo + ";"
            cadena += self.obtener(i).nombre + ";"
            cadena += self.obtener(i).dni + ";"
            cadena += str(self.obtener(i).peso) + ";"
            cadena += str(self.obtener(i).estatura) + ";"
            cadena += str(self.obtener(i).horaTrabajada) + ";"
            cadena += str(self.obtener(i).tarifaHoraria) + "\n"
            archivo.write(cadena)
        archivo.close()  

    def cargar(self):
        try:
            archivo = open("data/Obrero.txt","r", encoding="utf-8") 
            for linea in archivo.readlines():
                columnas = str(linea).split(";")
                codigo = columnas[0]
                nombre = columnas[1]
                dni = columnas[2]
                peso = float(columnas[3])
                estatura = float(columnas[4])
                horaTrabajada = float(columnas[5])
                tarifaHoraria = float(columnas[6])
                objObrero = Obrero(codigo,nombre,dni,peso,estatura,horaTrabajada,tarifaHoraria)
                self.agregar(objObrero)
            archivo.close() 

        except IOError:
            print("Error de E/S")        