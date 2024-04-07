import sys
from PyQt5 import uic
from PyQt5.QtWidgets import QMainWindow, QApplication
from clases.trabajador import trabajador

class frmtrabajador(QMainWindow):
    def __init__(self):
        QMainWindow.__init__(self)
        uic.loadUi("gui/frmtrabajador.ui",self)
        self.btnAceptar.clicked.connect(self.mostrarDatos)
    
    def mostrarDatos(self):
        objTrabajador=trabajador(1001,"josé",20,30)
        salida="Codigo:\t" + str(objTrabajador.codigo)
        salida+="\nNombre:\t" + str(objTrabajador.nombre)
        salida+="\nHoras:\t" + str(objTrabajador.horas)
        salida+="\nTarifas:\t" + str(objTrabajador.tarifa)
        salida+="\nSueldo Bruto:\t" + str(objTrabajador.calcularSueldoBruto())
        salida+="\nDescuento:\t" + str(objTrabajador.calcularDescuento())
        salida+="\nSueldo Neto:\t" + str(objTrabajador.calcularSueldoNeto())

        self.txtSalida.setText(salida)

if __name__=="__main__":
    app=QApplication(sys.argv)
    gui=frmtrabajador()
    gui.show()
    sys.exit(app.exec_())