package com.example;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import com.example.jms.ClienteSender;
import com.example.model.Cliente;

@SpringBootApplication
public class Problema11Application {

	 public static void main(String[] args) {
	        SpringApplication.run(Problema11Application.class, args);
	    }

	    @Bean
	    CommandLineRunner runner(ClienteSender clienteSender) {
	        return args -> {
	            // Crear cliente de prueba
	            Cliente cliente = new Cliente(1, "Juan Perez", "juan@email.com");
	            // Enviar el cliente a la cola
	            clienteSender.enviarCliente(cliente);
	        };
	    }

}
