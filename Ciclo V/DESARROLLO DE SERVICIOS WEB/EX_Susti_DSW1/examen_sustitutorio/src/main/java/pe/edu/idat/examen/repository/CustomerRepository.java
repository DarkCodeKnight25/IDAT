package pe.edu.idat.examen.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pe.edu.idat.examen.entity.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Integer> {
}