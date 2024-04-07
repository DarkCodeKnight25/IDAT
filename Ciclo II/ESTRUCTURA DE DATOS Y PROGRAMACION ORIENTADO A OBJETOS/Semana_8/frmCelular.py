from ast import Num
import sys
from PyQt5 import uic
from PyQt5.QtWidgets import QMainWindow, QApplication
from clases.Celular import Celular

class frmCelular(QMainWindow):
    def __init__(self):
        QMainWindow.__init__(self)
        uic.loadUi("gui/frmCelular.ui",self)
        self.btnAceptar.clicked.connect(self.mostrarDatos)
    
    def mostrarDatos(self):
        numero=self.lneNumero.text()
        usuario=self.lneUsuario.text()
        segundos=int(self.spbSegundos.text())
        precio=float(self.spbPrecio.text())
        objCelular=Celular(numero,usuario,segundos,precio)
        self.listar(objCelular)
        objCelular.segundoConsumidos+=20
        objCelular.precioSegundo=objCelular.precioSegundo-objCelular.precioSegundo*0.05
        self.listar(objCelular)
    def listar(self,objeto):
        salida="Numero : \t" + objeto.numero
        salida+="\nUsuario : \t" + objeto.usuario
        salida+="\nSegundos : \t" + objeto.segundosConsumidos
        salida+="\nPrecio : \t" + objeto.precioSegundo
        salida+="\nCosto por consumo : \t" + str(objeto.calcularCostoConsumo())
        salida+="\nIGV : \t" + str(objeto.calcularIGV())
        salida+="\nImporte a Pagar : \t" + str(objeto.calcularImportePagar())
        self+="-------------------------------------------------"
        self.txtSalida.append(salida)



if __name__=="__main__":
    app=QApplication(sys.argv)
    gui=frmCelular()
    gui.show()
    sys.exit(app.exec_())