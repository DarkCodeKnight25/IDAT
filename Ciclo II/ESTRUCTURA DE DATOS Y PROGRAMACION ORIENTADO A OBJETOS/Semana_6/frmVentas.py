import sys
from PyQt5 import uic
from PyQt5.QtWidgets import QMainWindow, QApplication

class frmVentas(QMainWindow):
    def __init__(self):
        QMainWindow.__init__(self)
        uic.loadUi("gui/frmVenta.ui", self)
        self.btnAceptar.clicked.connect(self.calcular)
    
    def calcular(self):
        cantidad=int(self.spbCantidad.text())
        turno = self.cboTurno.currentText()
        if turno=="Mañana":
            precio=25
        elif turno=="Tarde":
            precio=35
        elif turno=="Noche":
            precio=50
        importeCompra=precio*cantidad
        self.lblResultado.setText("Importe de compra : S/." + str(resultado))
    
if __name__ == "__main__":
    app = QApplication(sys.argv)
    gui = frmVentas()
    gui.show()
    sys.exit(app.exec_())