package idat.edu.pe.EC01_DavidVega.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import idat.edu.pe.EC01_DavidVega.model.factura;
import idat.edu.pe.EC01_DavidVega.services.facturaIServices;

import java.util.List;

@RestController
@RequestMapping("/examen")
public class facturaController { 

    @Autowired
    private facturaIServices facturaService;

    @PostMapping
    public ResponseEntity<String> crearFacturas(@RequestBody List<factura> facturas) { 
        double montoTotalPendiente = facturaService.calcularTotalPendiente(facturas);
        facturaService.guardarFacturas(facturas);

        String mensaje = "El monto de las facturas pendientes de pago es: " + montoTotalPendiente;
        return new ResponseEntity<>(mensaje, HttpStatus.OK);
    }
}
