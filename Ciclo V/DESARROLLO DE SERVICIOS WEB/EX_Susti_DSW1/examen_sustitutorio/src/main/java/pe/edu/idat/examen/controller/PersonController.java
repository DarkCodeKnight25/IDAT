package pe.edu.idat.examen.controller;

import java.util.List;

import org.springframework.web.bind.annotation.*;

import jakarta.validation.Valid;
import pe.edu.idat.examen.entity.Person;
import pe.edu.idat.examen.service.PersonService;

@RestController
@RequestMapping("/api/persons")
@CrossOrigin(origins = "*")
public class PersonController {

    private final PersonService personService;

    public PersonController(PersonService personService) {
        this.personService = personService;
    }

    @GetMapping
    public List<Person> listar() {
        return personService.listar();
    }

    @GetMapping("/{id}")
    public Person buscarPorId(@PathVariable Integer id) {
        return personService.buscarPorId(id);
    }

    @PostMapping
    public Person guardar(@Valid @RequestBody Person person) {
        return personService.guardar(person);
    }

    @PutMapping("/{id}")
    public Person actualizar(@PathVariable Integer id, @Valid @RequestBody Person person) {
        return personService.actualizar(id, person);
    }

    @DeleteMapping("/{id}")
    public String eliminar(@PathVariable Integer id) {
        personService.eliminar(id);
        return "Persona eliminada correctamente";
    }
}