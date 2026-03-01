package com.example.soap;

import jakarta.xml.bind.annotation.XmlRootElement;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlType;

@XmlRootElement(name = "SaludarRequest", namespace = "http://problema3.com/soap")
@XmlType(name = "SaludarRequest", namespace = "http://problema3.com/soap")
public class SaludarRequest {

    private String nombre;

    @XmlElement(namespace = "http://problema3.com/soap")
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}