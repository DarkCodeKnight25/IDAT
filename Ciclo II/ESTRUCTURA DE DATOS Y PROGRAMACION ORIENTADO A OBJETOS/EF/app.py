import sys 
from PyQt5.QtWidgets import QApplication
from controller.frmObrero import frmObrero

if __name__ == '__main__': 
    app = QApplication(sys.argv)
    ventana = frmObrero() 
    app.exec_()