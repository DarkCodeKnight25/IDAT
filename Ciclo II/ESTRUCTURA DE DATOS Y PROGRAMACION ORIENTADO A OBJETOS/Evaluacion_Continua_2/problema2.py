from sunau import Au_read
import sys
from PyQt5 import uic
from PyQt5.QtWidgets import QMainWindow, QApplication

class problema_1(QMainWindow):
    def __init__(self):
        QMainWindow.__init__(self)
        uic.loadUi("gui/PROBLEMA_2.ui", self)
        self.btnAceptar.clicked.connect(self.aceptar)
    
    def aceptar(self):
        dia=self.cmbDias.currentText()
        cantidadAdultos=float(self.spnAdultos.text())
        cantidadNiños=float(self.spnBoys.text())
        if dia=="Lunes":
            PEA=15.00*cantidadAdultos
            PEB=13.00*cantidadNiños
        else:
            if dia=="Martes":
                PEA=12.00*cantidadAdultos
                PEB=10.00*cantidadNiños
            else:
                if dia=="Miercoles" and dia=="Jueves" and dia=="Viernes":
                    PEA=20.00*cantidadAdultos
                    PEB=18.00*cantidadNiños
                else:
                    if dia=="Sabado" and dia=="Domingo":
                        PEA=25.00*cantidadAdultos
                        PEB=20.00*cantidadNiños
        if cantidadAdultos==1 and cantidadNiños==1:
            pntAdultos=1
            pntNiños=0.5
            puntosAcum=pntAdultos+pntNiños
        else:
            if cantidadAdultos==2 and cantidadNiños==2:
                pntAdultos=3
                pntNiños=1.5
                puntosAcum=pntAdultos+pntNiños
            else:
                if cantidadAdultos==3 and cantidadNiños==3:
                    pntAdultos=5
                    pntNiños=2.5
                    puntosAcum=pntAdultos+pntNiños
                else:
                    if cantidadAdultos>3 and cantidadNiños>3:
                        pntAdultos=2*cantidadAdultos
                        pntNiños=1*cantidadNiños
                        puntosAcum=pntAdultos+pntNiños
        importeCompra=PEA+PEB
        puntosAcum=puntosAcum
        self.lblRespuesta.setText("Importe de compra : S/." + str(importeCompra) + "\nPuntos Acumulados :"+ str(puntosAcum))
        


if __name__ == "__main__":
    app = QApplication(sys.argv)
    gui = problema_1()
    gui.show()
    sys.exit(app.exec_())