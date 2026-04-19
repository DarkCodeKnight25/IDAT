open class MetodoPago(var monto: Double) {

    open fun procesarPago(){
        println("Procesando pago genérico por el monto S/. $monto")
    }
}