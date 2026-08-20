package com.example.jms;

import com.example.model.Cliente;
import com.google.gson.Gson;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.stereotype.Component;

@Component
public class ClienteReceiver {

    private Gson gson = new Gson();

    @JmsListener(destination = "cola.clientes")
    public void recibirCliente(String mensaje) {
        Cliente cliente = gson.fromJson(mensaje, Cliente.class);  // Convertir JSON a Cliente
        System.out.println("Mensaje recibido: " + cliente);
    }
}