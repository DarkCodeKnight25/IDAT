package com.example.soap;

import jakarta.xml.bind.annotation.XmlRootElement;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlType;

@XmlRootElement(name = "SaludarEdadResponse", namespace = "http://problema3.com/soap")
@XmlType(name = "SaludarEdadResponse", namespace = "http://problema3.com/soap")
public class SaludarEdadResponse {

    private String mensaje;

    @XmlElement(namespace = "http://problema3.com/soap")
    public String getMensaje() { return mensaje; }
    public void setMensaje(String mensaje) { this.mensaje = mensaje; }
}