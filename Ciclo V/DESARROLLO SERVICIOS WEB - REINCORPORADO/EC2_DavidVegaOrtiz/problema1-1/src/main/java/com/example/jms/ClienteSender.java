package com.example.jms;

import com.example.config.JmsConfig;
import com.example.model.Cliente;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.stereotype.Component;

@Component
public class ClienteSender {

    @Autowired
    private JmsTemplate jmsTemplate;

    private Gson gson = new Gson();

    public void enviarCliente(Cliente cliente) {
        String json = gson.toJson(cliente);          // Convertir Cliente a JSON
        jmsTemplate.convertAndSend(JmsConfig.QUEUE_NAME, json); // Enviar a la cola
        System.out.println("Mensaje enviado: " + json);
    }
}