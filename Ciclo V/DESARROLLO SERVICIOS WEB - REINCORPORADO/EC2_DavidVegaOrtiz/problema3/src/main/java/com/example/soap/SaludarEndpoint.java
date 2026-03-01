package com.example.soap;

import org.springframework.ws.server.endpoint.annotation.Endpoint;
import org.springframework.ws.server.endpoint.annotation.PayloadRoot;
import org.springframework.ws.server.endpoint.annotation.RequestPayload;
import org.springframework.ws.server.endpoint.annotation.ResponsePayload;

@Endpoint
public class SaludarEndpoint {

    private static final String NAMESPACE_URI = "http://problema3.com/soap";

    @PayloadRoot(namespace = NAMESPACE_URI, localPart = "SaludarRequest")
    @ResponsePayload
    public SaludarResponse saludar(@RequestPayload SaludarRequest request) {
        SaludarResponse response = new SaludarResponse();
        response.setMensaje("Hola " + request.getNombre());
        return response;
    }
}