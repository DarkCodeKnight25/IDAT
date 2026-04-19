class PagoEfectivo(monto: Double) : MetodoPago(monto) {

    override fun procesarPago() {
       println("Pago en efectivo por S/. $monto recibido correctamente")
    }

}