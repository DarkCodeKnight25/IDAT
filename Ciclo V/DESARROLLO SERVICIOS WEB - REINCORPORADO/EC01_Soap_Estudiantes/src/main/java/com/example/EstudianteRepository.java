package com.example;

import org.springframework.stereotype.Component;
import java.util.HashMap;
import java.util.Map;

@Component
public class EstudianteRepository {

    private static final Map<Integer, Estudiante> estudiantes = new HashMap<>();

    static {
        // Agregar algunos estudiantes de ejemplo
        Estudiante estudiante1 = new Estudiante(1, "Juan Perez", 20);
        Estudiante estudiante2 = new Estudiante(2, "Maria Lopez", 22);
        estudiantes.put(1, estudiante1);
        estudiantes.put(2, estudiante2);
    }

    public Estudiante findEstudianteById(int id) {
        return estudiantes.get(id);
    }

    public String registrarEstudiante(String nombre, int edad) {
        int id = estudiantes.size() + 1;
        Estudiante newEstudiante = new Estudiante(id, nombre, edad);
        estudiantes.put(id, newEstudiante);
        return "Estudiante registrado con ID: " + id;
    }
}
