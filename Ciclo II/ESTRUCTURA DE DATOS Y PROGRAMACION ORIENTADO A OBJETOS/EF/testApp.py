import unittest
from entity.Obrero import Obrero

class TestApp(unittest.TestCase):
    def setUp(self):
        self.__obj1 = Obrero("A2022","Alvaro","12345678",60,1.70,8,70)

    def testIMC(self):
        self.assertEqual(self.__obj1.calcularIMC(),20.8)

    def testGradoObesidad(self):
        self.assertEqual(self.__obj1.obtenerGradoObesidad(),"Normal")    

    def testSueldoBruto(self):
        self.assertEqual(self.__obj1.calcularSueldoBruto(),560) 
    
    def testIncentivo(self):
        self.assertEqual(self.__obj1.calcularIncentivo(),84) 

    def testSueldoNeto(self):
        self.assertEqual(self.__obj1.calcularSueldoNeto(),644)     
    
if __name__ == "__main__":
    unittest.main()