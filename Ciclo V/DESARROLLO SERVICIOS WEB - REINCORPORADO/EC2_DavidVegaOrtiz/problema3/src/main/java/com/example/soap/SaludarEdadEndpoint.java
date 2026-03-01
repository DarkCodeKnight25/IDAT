package com.example.soap;

import org.springframework.ws.server.endpoint.annotation.Endpoint;
import org.springframework.ws.server.endpoint.annotation.PayloadRoot;
import org.springframework.ws.server.endpoint.annotation.RequestPayload;
import org.springframework.ws.server.endpoint.annotation.ResponsePayload;
import java.time.Year;

@Endpoint
public class SaludarEdadEndpoint {

    private static final String NAMESPACE_URI = "http://problema3.com/soap";

    @PayloadRoot(namespace = NAMESPACE_URI, localPart = "SaludarEdadRequest")
    @ResponsePayload
    public SaludarEdadResponse saludarEdad(@RequestPayload SaludarEdadRequest request) {

        int anioActual = Year.now().getValue();
        int edad = anioActual - request.getAnioNacimiento();

        SaludarEdadResponse response = new SaludarEdadResponse();
        response.setMensaje("Hola " + request.getNombre() + ", tienes " + edad + " años");
        return response;
    }
}