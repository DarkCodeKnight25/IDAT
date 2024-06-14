package idat.edu.pe.EC01_DavidVega.services;

import java.util.List;

import idat.edu.pe.EC01_DavidVega.model.factura;


public interface facturaIServices { 
    public double calcularTotalPendiente(List<factura> facturas); 
    public void guardarFacturas(List<factura> facturas); 
}
