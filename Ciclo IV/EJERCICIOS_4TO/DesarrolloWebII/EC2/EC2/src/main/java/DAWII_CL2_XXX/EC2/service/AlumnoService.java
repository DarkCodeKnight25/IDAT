package DAWII_CL2_XXX.EC2.service;

import DAWII_CL2_XXX.EC2.model.bd.Alumno;
import DAWII_CL2_XXX.EC2.repository.AlumnoRepository;

import java.util.List;

public class AlumnoService {
    private AlumnoRepository alumnoRepository;
    public List<Alumno> listarAlumnos(){
        return alumnoRepository.findAll();
    }
}
