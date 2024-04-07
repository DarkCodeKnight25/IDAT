import sys
from PyQt5 import uic
from PyQt5.QtWidgets import QMainWindow, QApplication
from clases.Alumno import Alumno
from clases.Docente import Docente

class frmUsuario(QMainWindow):
    def __init__(self):
        super().__init__()
        uic.loadUi("gui/frmUsuario.ui",self)
        self.btnAceptar.clicked.connect(self.mostrarDatos)

    def mostrarDatos(self):
        objAlumno = Alumno("Viviana","Castro",25,16,17,18)
        self.txtAlumno.setText(objAlumno.mostrarDatos())

        objDocente = Docente("Carolina","Ruiz",46,40,50)
        self.txtDocente.setText(objDocente.mostrarDatos())


if __name__=='__main__':
    app=QApplication(sys.argv)
    gui=frmUsuario()
    gui.show()
    sys.exit(app.exec_())
    