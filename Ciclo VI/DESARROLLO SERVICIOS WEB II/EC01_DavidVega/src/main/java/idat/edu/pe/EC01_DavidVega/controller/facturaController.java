package idat.edu.pe.EC01_DavidVega.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

// import com.idat.wsExamen.model.Factura;
// import com.idat.wsExamen.service.IFacturaService;

import java.util.List;

@RestController
@RequestMapping("/examen")
public class facturaController {

    @Autowired
    private IFacturaService facturaService;

    @PostMapping
    public ResponseEntity<String> crearFacturas(@RequestBody List<Factura> facturas) {
        double montoTotalPendiente = facturaService.calcularTotalPendiente(facturas);
        facturaService.guardarFacturas(facturas);

        String mensaje = "El monto de las facturas pendientes de pago es: " + montoTotalPendiente;
        return new ResponseEntity<>(mensaje, HttpStatus.OK);
    }
}
