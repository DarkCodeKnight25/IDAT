package com.example.soap;

import jakarta.xml.bind.annotation.XmlRootElement;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlType;

@XmlRootElement(name = "SaludarEdadRequest", namespace = "http://problema3.com/soap")
@XmlType(name = "SaludarEdadRequest", namespace = "http://problema3.com/soap")
public class SaludarEdadRequest {

    private String nombre;
    private int anioNacimiento;

    @XmlElement(namespace = "http://problema3.com/soap")
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    @XmlElement(namespace = "http://problema3.com/soap")
    public int getAnioNacimiento() { return anioNacimiento; }
    public void setAnioNacimiento(int anioNacimiento) { this.anioNacimiento = anioNacimiento; }
}