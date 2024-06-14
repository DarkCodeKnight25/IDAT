package idat.edu.pe.EC01_DavidVega.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import idat.edu.pe.EC01_DavidVega.dao.facturaDao;
import idat.edu.pe.EC01_DavidVega.model.factura;

import java.util.List;

@Service
public class facturaServices implements facturaIServices {

    @Autowired
    private facturaDao dao; 

    @Override
    public double calcularTotalPendiente(List<factura> facturas) {
        return facturas.stream()
                .filter(f -> f.getEstadoFactura() == factura.EstadoFactura.S)
                .mapToDouble(factura::getMontoFactura)
                .sum();
    }

    @Override
    public void guardarFacturas(List<factura> facturas) {
        dao.saveAll(facturas);
    }
}
