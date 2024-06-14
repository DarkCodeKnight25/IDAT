package idat.edu.pe.EC01_DavidVega.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;



@Entity
@Table(name = "tbl_factura")
public class factura {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long nroFactura;

    @Column(name= "idCliente", nullable = false)
    private Long idCliente;

    @Column(name= "montoFactura", nullable = false)
    private Double montoFactura;

    @Enumerated(EnumType.STRING)
    @Column(name= "estadoFactura",nullable = false)
    private EstadoFactura estadoFactura;

    public factura() {
    }

    public factura(Long idCliente, Double montoFactura, EstadoFactura estadoFactura) {
        this.idCliente = idCliente;
        this.montoFactura = montoFactura;
        this.estadoFactura = estadoFactura;
    }

    public Long getNroFactura() {
        return nroFactura;
    }

    public void setNroFactura(Long nroFactura) {
        this.nroFactura = nroFactura;
    }

    public Long getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(Long idCliente) {
        this.idCliente = idCliente;
    }

    public Double getMontoFactura() {
        return montoFactura;
    }

    public void setMontoFactura(Double montoFactura) {
        this.montoFactura = montoFactura;
    }

    public EstadoFactura getEstadoFactura() {
        return estadoFactura;
    }

    public void setEstadoFactura(EstadoFactura estadoFactura) {
        this.estadoFactura = estadoFactura;
    }

    @Override
    public String toString() {
        return "Factura{" +
                "nroFactura=" + nroFactura +
                ", idCliente=" + idCliente +
                ", montoFactura=" + montoFactura +
                ", estadoFactura=" + estadoFactura +
                '}';
    }
    
    public enum EstadoFactura {
        P, 
        S  
    }
}
