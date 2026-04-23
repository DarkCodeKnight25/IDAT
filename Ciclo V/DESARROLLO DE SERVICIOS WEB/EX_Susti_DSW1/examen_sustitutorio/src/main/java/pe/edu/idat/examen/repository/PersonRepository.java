package pe.edu.idat.examen.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pe.edu.idat.examen.entity.Person;

public interface PersonRepository extends JpaRepository<Person, Integer> {
}