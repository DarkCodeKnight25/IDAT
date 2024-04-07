import sys
from unittest import result
from PyQt5 import uic
from PyQt5.QtWidgets import QMainWindow, QApplication

class frmCalculadora(QMainWindow):
    def __init__(self):
        QMainWindow.__init__(self)
        uic.loadUi("gui/frmCalculadora.ui",self)
        self.btnCalcular.clicked.connect(self.calcular)
    
    def calcular(self):
        valor1 = float(self.dsbValor1.text())
        valor2 = float(self.dsbValor2.text())

        if self.rbSumar.isChecked():
            resultado = valor1+valor2
        elif self.rbRestar.isChecked():
            resultado = valor1-valor2
        elif self.rbMultiplicar.isChecked():
            resultado = valor1*valor2
        elif self.rbDividir.isChecked():
            resultado = valor1/valor2
        else:
            resultado = "Seleccionar Operacion"
        
        self.lblResultado.setText(str(resultado))

if __name__ == "__main__":
    app = QApplication(sys.argv)
    gui = frmCalculadora()
    gui.show()
    sys.exit(app.exec_())