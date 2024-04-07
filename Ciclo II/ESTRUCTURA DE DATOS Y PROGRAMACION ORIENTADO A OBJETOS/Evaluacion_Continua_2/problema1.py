from sunau import Au_read
import sys
from PyQt5 import uic
from PyQt5.QtWidgets import QMainWindow, QApplication

class problema_1(QMainWindow):
    def __init__(self):
        QMainWindow.__init__(self)
        uic.loadUi("gui/PROBLEMA_1.ui", self)
        self.alumno=""
        self.lstModalidad.itemClicked.connect(self.mostrarModalidad)
        self.lstArea.itemClicked.connect(self.mostrarArea)
        self.btnAceptar.clicked.connect(self.aceptar)
    
    def mostrarModalidad(self):
        self.modalidad = self.lstModalidad.currentItem().text()
        if self.modalidad=="Practicante":
            self.modalidad="PR"
        else:
            if self.modalidad=="Medio Tiempo":
                self.modalidad="MT"
            else:
                if self.modalidad=="Tiempo Completo":
                    self.modalidad="TC"
    
    def mostrarArea(self):
        self.area=self.lstArea.currentItem().text()
        if self.area=="Desarrollo de Sistemas":
            self.area="DSI"
        else:
            if self.area=="Redes Informaticas":
                self.area="RIN"
            else:
                if self.area=="Soporte Tecnico":
                    self.area="STE"

    
    def aceptar(self):
        edad=float(self.spnEdad.text())
        if self.rdbMasculino.isChecked():
            sexo="masculino"
        else:
            if self.rdbFemenino.isChecked():
                sexo="femenino"
        if sexo=="masculino" and edad<=23:
            factor="MA"
        else:
            if sexo=="masculino" and edad>23:
                factor="MB"
            else:
                if sexo=="masculino" and edad<=23:
                    factor="FA"
                else:
                    if sexo=="femenino" and edad>23:
                        factor="FB"

        
        salida = "Alumno : " + self.lneNombre.text()
        salida += "\ncodigo : " + self.modalidad +self.area +  factor + self.lneDNI.text()
        self.lblResultado.setText(salida)

if __name__ == "__main__":
    app = QApplication(sys.argv)
    gui = problema_1()
    gui.show()
    sys.exit(app.exec_())