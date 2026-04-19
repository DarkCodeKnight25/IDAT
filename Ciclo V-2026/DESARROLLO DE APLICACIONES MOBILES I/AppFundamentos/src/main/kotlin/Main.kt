
fun main (args: Array<String>){
    //Definición de variables
    var curso : String = "Moviles 1"
    var bloque = "Unidad didactica Nro. 1"
    //Definición de constantes
    val credito = 4
    var precio = 581.85
    var estado = true
    var numeroFloat : Float = 85.25f
    //Conversión de tipos de variables
    val creditoDouble: Double = credito.toDouble()
    val precioInt : Int = precio.toInt()

    println(creditoDouble)
    println(precioInt)
    compararLongitudPalabras("argumento", "argumento")
    val respuesta = validarNumeroPar(100)
    println(respuesta)
    tipoDePalabraPorLongitud("eucalipto")
}

fun compararLongitudPalabras(palabra1:String, palabra2:String){
    var resultado: String
    if(palabra1.length > palabra2.length){
        resultado = palabra1
    }else if(palabra2.length > palabra1.length){
        resultado = palabra2
    }else{
        resultado = "Ambas palabras tienen la misma longitud"
    }
    println(resultado)
}

fun validarNumeroPar(numero: Int): String{
    var resultado: String
    when(numero % 2){
        0 -> resultado = "Número PAR"
        else ->  resultado = "Número IMPAR"
    }
    return resultado
}

fun tipoDePalabraPorLongitud(palabra: String){
    when(palabra.length){
        0 -> println("Nombre vacio")
        in 1..4 -> println("palabra pequeña")
        in 5..7 -> println("palabra mediana")
        else ->  println("Palabra extensa")
    }
}