fun main(){
    //bucleFor()
    bucleWhileDoWhile()
}

fun bucleFor(){
    val numerosAleatorios = intArrayOf(12,18,28,35,47,85)
    for(numero: Int in numerosAleatorios){
        println("Número: $numero")
    }
    for((indice, valor) in numerosAleatorios.withIndex()){
        println("Indice $indice - Número: $valor")
    }
    for(i in 1..5){
        println("Universitario 0 vs Alianza Lima $i")
    }
    val paises = ArrayList<String>()
    paises.add("Perú")
    paises.add("Uruguay")
    paises.add("Colombia")
}
fun bucleWhileDoWhile(){
    var i = 10
    while (i > 0){
        println("WHILE = Numero : $i")
        i--
    }
    do{
        println("DO WHILE = Número: $i")
        i++
    }while (i < 10)
}