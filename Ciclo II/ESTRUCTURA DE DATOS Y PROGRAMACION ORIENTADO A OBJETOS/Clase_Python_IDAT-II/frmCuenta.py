import sys
from PyQt5 import uic
from PyQt5.QtWidgets import QMainWindow, QApplication
from clases.CuentaAhorro import CuentaAhorro
from clases.CuentaPlazoFijo import CuentaPlazoFijo

class frmCuenta(QMainWindow):
    def __init__(self):
        super().__init__()
        uic.loadUi("gui/frmCuenta.ui",self)
        self.btnAceptar.clicked.connect(self.mostrarDatos)

    def mostrarDatos(self):
        objCuentaAhorro = CuentaAhorro("12345","Julio",20000,3000)
        self.txtAhorro.setText(objCuentaAhorro.mostrarDatos())

        objCuentaPlazoFijo = CuentaPlazoFijo("98765","Avril",30000,30,5)
        self.txtPlazoFijo.setText(objCuentaPlazoFijo.mostrarDatos())


if __name__=='__main__':
    app=QApplication(sys.argv)
    gui=frmCuenta()
    gui.show()
    sys.exit(app.exec_())
    