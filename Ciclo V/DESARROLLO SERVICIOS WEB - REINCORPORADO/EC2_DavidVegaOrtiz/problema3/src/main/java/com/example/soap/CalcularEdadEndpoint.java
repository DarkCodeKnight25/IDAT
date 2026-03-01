package com.example.soap;

import org.springframework.ws.server.endpoint.annotation.Endpoint;
import org.springframework.ws.server.endpoint.annotation.PayloadRoot;
import org.springframework.ws.server.endpoint.annotation.RequestPayload;
import org.springframework.ws.server.endpoint.annotation.ResponsePayload;
import java.time.Year;

@Endpoint
public class CalcularEdadEndpoint {

    private static final String NAMESPACE_URI = "http://problema3.com/soap";

    @PayloadRoot(namespace = NAMESPACE_URI, localPart = "CalcularEdadRequest")
    @ResponsePayload
    public CalcularEdadResponse calcularEdad(@RequestPayload CalcularEdadRequest request) {
        int anioActual = Year.now().getValue();
        int edad = anioActual - request.getAnioNacimiento();

        CalcularEdadResponse response = new CalcularEdadResponse();
        response.setEdad(edad);
        return response;
    }
}