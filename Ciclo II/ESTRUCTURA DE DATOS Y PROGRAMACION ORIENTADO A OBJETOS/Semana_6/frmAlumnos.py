import sys
from PyQt5 import uic
from PyQt5.QtWidgets import QMainWindow, QApplication

class frmAlumnos(QMainWindow):
    def __init__(self):
        QMainWindow.__init__(self):
        uic.loadUi("gui/frmAlumnos.ui",self)
        self.total=0
        self.btnAgregar.clicked.connect(self.agregar)
        self.btnCerrar.clicked.connect(self.close)

    def agregar(self):
        self.tblAlumnos.setRowCount(self.total+1)
        self.tblAlumnos.verticalHeader().setV
        self.tblAlumnos.setItem(self.total,0,QTableWidgetItem(self.lneDNI.text()))
        self.tblAlumnos.setItem(self.total,1,QTableWidgetItem(self.lneNombre.text()))
        self.tblAlumnos.setItem(self.total,2,QTableWidgetItem(self.dteFecNac.text()))


if __name__ == "__main__":
    app = QApplication(sys.argv)
    gui = frmAlumnos()
    gui.show()
    sys.exit(app.exec_())