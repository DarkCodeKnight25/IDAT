package pe.edu.idat.examen.service;

import java.util.List;

import org.springframework.stereotype.Service;

import pe.edu.idat.examen.entity.Person;
import pe.edu.idat.examen.repository.PersonRepository;

@Service
public class PersonService {

    private final PersonRepository personRepository;

    public PersonService(PersonRepository personRepository) {
        this.personRepository = personRepository;
    }

    public List<Person> listar() {
        return personRepository.findAll();
    }

    public Person buscarPorId(Integer id) {
        return personRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Persona no encontrada con id: " + id));
    }

    public Person guardar(Person person) {
        return personRepository.save(person);
    }

    public Person actualizar(Integer id, Person data) {
        Person person = buscarPorId(id);

        person.setPersonType(data.getPersonType());
        person.setNameStyle(data.getNameStyle());
        person.setTitle(data.getTitle());
        person.setFirstName(data.getFirstName());
        person.setMiddleName(data.getMiddleName());
        person.setLastName(data.getLastName());
        person.setSuffix(data.getSuffix());
        person.setEmailPromotion(data.getEmailPromotion());
        person.setAdditionalContactInfo(data.getAdditionalContactInfo());
        person.setDemographics(data.getDemographics());
        person.setRowguid(data.getRowguid());
        person.setModifiedDate(data.getModifiedDate());

        return personRepository.save(person);
    }

    public void eliminar(Integer id) {
        Person person = buscarPorId(id);
        personRepository.delete(person);
    }
}