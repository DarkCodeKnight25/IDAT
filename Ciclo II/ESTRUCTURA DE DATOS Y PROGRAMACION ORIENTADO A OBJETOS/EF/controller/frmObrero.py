from PyQt5 import uic
from PyQt5.QtWidgets import QMainWindow, QTableWidgetItem
from model.ColeccionObreros import ColeccionObreros
from entity.Obrero import Obrero
    
objColeccionObreros = ColeccionObreros()

class frmObrero(QMainWindow):
    def __init__(self, parent=None):
        super(frmObrero,self).__init__(parent)
        uic.loadUi("view/frmObrero.ui",self)
        self.listar()
        self.btnGrabar.clicked.connect(self.grabar)
        self.tblObreros.itemClicked.connect(self.mostrar)
        self.btnEliminar.clicked.connect(self.eliminar)
        self.show()

    def listar(self):
        self.tblObreros.setRowCount(objColeccionObreros.longitud()) 

        for i in range(objColeccionObreros.longitud()):
            self.tblObreros.setItem(i,0,QTableWidgetItem(objColeccionObreros.obtener(i).codigo))
            self.tblObreros.setItem(i,1,QTableWidgetItem(objColeccionObreros.obtener(i).nombre))
            self.tblObreros.setItem(i,2,QTableWidgetItem(objColeccionObreros.obtener(i).dni))
            self.tblObreros.setItem(i,3,QTableWidgetItem(str(objColeccionObreros.obtener(i).peso)))
            self.tblObreros.setItem(i,4,QTableWidgetItem(str(objColeccionObreros.obtener(i).estatura)))
            self.tblObreros.setItem(i,5,QTableWidgetItem(str(objColeccionObreros.obtener(i).horaTrabajada)))
            self.tblObreros.setItem(i,6,QTableWidgetItem(str(objColeccionObreros.obtener(i).tarifaHoraria)))

    def grabar(self):
        codigo = self.lneCodigo.text()   
        nombre = self.lneNombre.text()    
        dni = self.lneDni.text()      
        peso = float(self.dsbPeso.text()) 
        estatura = float(self.dsbEstatura.text()) 
        horaTrabajada = float(self.dsbHoraTrabajada.text()) 
        tarifaHoraria = float(self.dsbTarifaHoraria.text()) 
        objObrero = Obrero(codigo, nombre, dni, peso, estatura, horaTrabajada, tarifaHoraria)

        posicion = objColeccionObreros.buscar(codigo)
        if posicion == -1:
            objColeccionObreros.agregar(objObrero)
        else:
            objColeccionObreros.modificar(objObrero, posicion)   
        
        objColeccionObreros.grabar()
        self.listar() 
        self.limpiar()

    def limpiar(self):
        self.lneCodigo.setText("")
        self.lneNombre.setText("")   
        self.lneDni.setText("")   
        self.dsbPeso.setValue(0)
        self.dsbEstatura.setValue(0)
        self.dsbHoraTrabajada.setValue(0) 
        self.dsbTarifaHoraria.setValue(0) 

    def mostrar(self):
        fila = self.tblObreros.selectedItems()
        indiceFila = fila[0].row()
        codigo = self.tblObreros.item(indiceFila,0).text()
        nombre = self.tblObreros.item(indiceFila,1).text()  
        dni = self.tblObreros.item(indiceFila,2).text() 
        peso = float(self.tblObreros.item(indiceFila,3).text())   
        estatura = float(self.tblObreros.item(indiceFila,4).text()) 
        horaTrabajada = float(self.tblObreros.item(indiceFila,5).text())
        tarifaHoraria = float(self.tblObreros.item(indiceFila,6).text())
        self.lneCodigo.setText(codigo)
        self.lneNombre.setText(nombre)   
        self.lneDni.setText(dni)   
        self.dsbPeso.setValue(peso)
        self.dsbEstatura.setValue(estatura) 
        self.dsbHoraTrabajada.setValue(horaTrabajada) 
        self.dsbTarifaHoraria.setValue(tarifaHoraria) 

    def eliminar(self):
        fila = self.tblObreros.selectedItems()
        indiceFila = fila[0].row()
        codigo = self.tblObreros.item(indiceFila,0).text()
        posicion = objColeccionObreros.buscar(codigo)
        objColeccionObreros.eliminar(posicion)

        self.tblObreros.clearContents()
        self.tblObreros.setRowCount(0)

        objColeccionObreros.grabar()
        self.listar()
        self.limpiar()   