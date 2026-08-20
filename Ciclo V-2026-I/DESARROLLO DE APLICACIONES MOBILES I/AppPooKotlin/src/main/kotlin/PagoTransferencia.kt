class PagoTransferencia(monto: Double,
    private val banco: String) : MetodoPago(monto) {

    override fun procesarPago() {
        println("Pago por transferencia desde $banco por S/. $monto  confirmado" )
    }

}