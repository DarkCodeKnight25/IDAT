import sys
from PyQt5 import uic
from PyQt5.QtWidgets import QMainWindow, QApplication

class frmPromedio(QMainWindow):
    def __init__(self):
        QMainWindow.__init__(self)
        uic.loadUi("gui/frmPromedio.ui",self)
        self.curso = ""
        self.lstCursos.itemClicked.connect(self.mostrarCurso)
        self.btnPromedio.clicked.connect(self.calcularPromedio)

    def mostrarCurso(self):
        self.curso = self.lstCursos.currentItem().text()
        self.lblNotas.setText("Ingrese la nota de " + self.curso)

    def calcularPromedio(self):
        if self.curso != "":    
            nota1 = int(self.spbNota1.text())
            nota2 = int(self.spbNota2.text())
            nota3 = int(self.spbNota3.text())
            promedio = round((nota1 + nota2 + nota3)/3,2)
            salida = "Alumno: " + self.lneNombre.text()
            salida += "\nPromedio final {}:{}".format(self.curso,promedio)
            self.lblPromedio.setText(salida)
        else:
            self.lblPromedio.setText("Debe seleccionar un curso")

if __name__ == "__main__":
    app = QApplication(sys.argv)
    gui = frmPromedio()
    gui.show()
    sys.exit(app.exec_())