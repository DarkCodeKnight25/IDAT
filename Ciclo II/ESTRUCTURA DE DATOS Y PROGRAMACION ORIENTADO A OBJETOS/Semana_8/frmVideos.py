import sys
from PyQt5 import uic
from PyQt5.QtWidgets import QMainWindow, QApplication
from clases.videos import videos

class frmVideos(QMainWindow):
    def __init__(self):
        QMainWindow.__init__(self)
        uic.loadUi("gui/frmVideos.ui",self)
        self.btnAceptar.clicked.connect(self.mostrarDatos)
    
    def mostrarDatos(self):
        objVideos=videos(2022,"jaimito",180,60)
        salida="Codigo:\t" + str(objVideos.codigo)
        salida+="\nTitulo:\t" + str(objVideos.titulo)
        salida+="\nDuracion:\t" + str(objVideos.duracion)
        salida+="\nPrecioSoles:\t" + str(objVideos.precioSoles)
        salida+="\nPrecioVideo:\t" + str(objVideos.calcularPrecioVideo())


        self.txtSalida.setText(salida)

if __name__=="__main__":
    app=QApplication(sys.argv)
    gui=frmVideos()
    gui.show()
    sys.exit(app.exec_())