class OrdenCompra(val numeroOrden: String,
    val total: Double) {
    //Clase Anidada
    /*class Impuesto{
        fun calcularImpuesto(monto: Double): Double{
            return monto * 0.18
        }
    }*/
    inner class Detalle {
        fun mostrarDetalle(){
            println("Orden: $numeroOrden")
            println("Total: $total" )
        }
    }
}