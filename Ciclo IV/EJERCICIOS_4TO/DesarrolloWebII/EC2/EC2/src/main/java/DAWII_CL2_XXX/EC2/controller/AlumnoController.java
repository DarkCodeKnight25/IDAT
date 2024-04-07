package DAWII_CL2_XXX.EC2.controller;

import DAWII_CL2_XXX.EC2.model.bd.Alumno;
import DAWII_CL2_XXX.EC2.service.AlumnoService;
import org.springframework.ui.Model;

import java.util.List;

public class AlumnoController {
    private AlumnoService alumnoService;
    public String listarAlumnos(Model model){
        List<Alumno> alumnos = alumnoService.listarAlumnos();
        model.addAttribute("alumnos",alumnos);
        return "list";
    }
}
