package com.example.soap;

import jakarta.xml.bind.annotation.XmlRootElement;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlType;

@XmlRootElement(name = "CalcularEdadResponse", namespace = "http://problema3.com/soap")
@XmlType(name = "CalcularEdadResponse", namespace = "http://problema3.com/soap")
public class CalcularEdadResponse {
    private int edad;

    @XmlElement(namespace = "http://problema3.com/soap")
    public int getEdad() { return edad; }
    public void setEdad(int edad) { this.edad = edad; }
}