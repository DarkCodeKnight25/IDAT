package com.example;

import org.springframework.ws.server.endpoint.annotation.Endpoint;
import org.springframework.ws.server.endpoint.annotation.PayloadRoot;
import org.springframework.ws.server.endpoint.annotation.RequestPayload;
import org.springframework.ws.server.endpoint.annotation.ResponsePayload;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.bootstrap.DOMImplementationRegistry;
import org.w3c.dom.DOMImplementation;

@Endpoint
public class EstudiantesEndpoint {

    private static final String NAMESPACE = "http://example.com/EC01_Soap_Estudiantes";
    private final EstudianteRepository repository;

    public EstudiantesEndpoint(EstudianteRepository repository) {
        this.repository = repository;
    }

    @PayloadRoot(namespace = NAMESPACE, localPart = "obtenerEstudiantePorIdRequest")
    @ResponsePayload
    public Element obtenerEstudiantePorId(@RequestPayload Element request) throws Exception {
        // Obtener el ID del estudiante usando el namespace correcto
        int id = -1;  // Valor por defecto en caso de que no se pueda obtener el id
        if (request.getElementsByTagNameNS(NAMESPACE, "id").getLength() > 0) {
            id = Integer.parseInt(request.getElementsByTagNameNS(NAMESPACE, "id").item(0).getTextContent());
        }

        // Buscar al estudiante en el repositorio
        Estudiante estudiante = repository.findEstudianteById(id);

        // Crear la respuesta XML
        DOMImplementationRegistry registry = DOMImplementationRegistry.newInstance();
        DOMImplementation impl = registry.getDOMImplementation("XML 1.0");
        Document doc = impl.createDocument(NAMESPACE, "obtenerEstudiantePorIdResponse", null);
        Element responseEl = doc.getDocumentElement();
        
        // Crear elementos de respuesta
        Element estudianteEl = doc.createElementNS(NAMESPACE, "estudiante");
        Element nombreEl = doc.createElementNS(NAMESPACE, "nombre");
        nombreEl.setTextContent(estudiante != null ? estudiante.getNombre() : "No encontrado");
        
        Element edadEl = doc.createElementNS(NAMESPACE, "edad");
        edadEl.setTextContent(estudiante != null ? String.valueOf(estudiante.getEdad()) : "0");

        // Añadir los elementos al estudiante
        estudianteEl.appendChild(nombreEl);
        estudianteEl.appendChild(edadEl);
        responseEl.appendChild(estudianteEl);

        // Devolver la respuesta
        return responseEl;
    }


    @PayloadRoot(namespace = NAMESPACE, localPart = "registrarEstudianteRequest")
    @ResponsePayload
    public Element registrarEstudiante(@RequestPayload Element request) throws Exception {
        // Obtener el nombre desde el XML de la solicitud, usando el namespace correcto
        String nombre = null;
        if (request.getElementsByTagNameNS(NAMESPACE, "nombre").getLength() > 0) {
            nombre = request.getElementsByTagNameNS(NAMESPACE, "nombre").item(0).getTextContent();
        }

        // Obtener la edad desde el XML de la solicitud, usando el namespace correcto
        int edad = 0;
        if (request.getElementsByTagNameNS(NAMESPACE, "edad").getLength() > 0) {
            edad = Integer.parseInt(request.getElementsByTagNameNS(NAMESPACE, "edad").item(0).getTextContent());
        }

        // Registrar el estudiante
        String confirmationMessage = repository.registrarEstudiante(nombre, edad);

        // Crear la respuesta XML
        DOMImplementationRegistry registry = DOMImplementationRegistry.newInstance();
        DOMImplementation impl = registry.getDOMImplementation("XML 1.0");
        Document doc = impl.createDocument(NAMESPACE, "registrarEstudianteResponse", null);
        Element responseEl = doc.getDocumentElement();

        // Crear el nodo de confirmación
        Element confirmacionEl = doc.createElementNS(NAMESPACE, "confirmacion");
        confirmacionEl.setTextContent(confirmationMessage);
        responseEl.appendChild(confirmacionEl);

        return responseEl;
    }

}

