package pe.edu.idat.examen.service;

import java.util.List;

import org.springframework.stereotype.Service;

import pe.edu.idat.examen.entity.Customer;
import pe.edu.idat.examen.entity.Person;
import pe.edu.idat.examen.repository.CustomerRepository;
import pe.edu.idat.examen.repository.PersonRepository;

@Service
public class CustomerService {

    private final CustomerRepository customerRepository;
    private final PersonRepository personRepository;

    public CustomerService(CustomerRepository customerRepository, PersonRepository personRepository) {
        this.customerRepository = customerRepository;
        this.personRepository = personRepository;
    }

    public List<Customer> listar() {
        return customerRepository.findAll();
    }

    public Customer buscarPorId(Integer id) {
        return customerRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Cliente no encontrado con id: " + id));
    }

    public Customer guardar(Customer customer) {
        if (customer.getPerson() != null && customer.getPerson().getBusinessEntityId() != null) {
            Person person = personRepository.findById(customer.getPerson().getBusinessEntityId())
                    .orElseThrow(() -> new RuntimeException("Persona no encontrada"));
            customer.setPerson(person);
        }

        return customerRepository.save(customer);
    }

    public Customer actualizar(Integer id, Customer data) {
        Customer customer = buscarPorId(id);

        if (data.getPerson() != null && data.getPerson().getBusinessEntityId() != null) {
            Person person = personRepository.findById(data.getPerson().getBusinessEntityId())
                    .orElseThrow(() -> new RuntimeException("Persona no encontrada"));
            customer.setPerson(person);
        } else {
            customer.setPerson(null);
        }

        customer.setStoreId(data.getStoreId());
        customer.setTerritoryId(data.getTerritoryId());
        customer.setAccountNumber(data.getAccountNumber());
        customer.setRowguid(data.getRowguid());
        customer.setModifiedDate(data.getModifiedDate());

        return customerRepository.save(customer);
    }

    public void eliminar(Integer id) {
        Customer customer = buscarPorId(id);
        customerRepository.delete(customer);
    }
}