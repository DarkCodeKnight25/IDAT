fun main (){


    /*val impuesto = OrdenCompra.Impuesto()
    println("Impuesto a pagar ${impuesto.calcularImpuesto(100.0)}")
     */
    val orden = OrdenCompra("OC-2026-001", 350.0)
    val detalle = orden.Detalle()
    detalle.mostrarDetalle()
    val objAuto = Auto("Toyota", "Sedan",
        2026, 17500.0)
    val objKia = objAuto.copy(marca = "KIA", precio = 15200.0)
    val (tipo, anioFabricacion) = objAuto
    println(tipo)
    

    /*
    val pagos : List<MetodoPago> = listOf(
        PagoEfectivo(50.0),
        PagoTarjeta(120.0, "14487848784"),
        PagoTransferencia(320.8, "IBK")
    )

    for(pago in pagos){
        pago.procesarPago()
    }
     */


}