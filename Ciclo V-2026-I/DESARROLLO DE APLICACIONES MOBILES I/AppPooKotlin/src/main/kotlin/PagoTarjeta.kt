class PagoTarjeta(monto: Double,
    private val numeroTarjeta: String) : MetodoPago(monto) {

    override fun procesarPago() {
        println("Pago con tarjeta $numeroTarjeta por S/. $monto, correctamente")
    }

}