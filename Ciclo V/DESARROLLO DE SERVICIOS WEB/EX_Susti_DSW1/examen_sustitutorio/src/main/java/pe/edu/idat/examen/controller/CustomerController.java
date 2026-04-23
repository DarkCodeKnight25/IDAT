package pe.edu.idat.examen.controller;

import java.util.List;

import org.springframework.web.bind.annotation.*;

import jakarta.validation.Valid;
import pe.edu.idat.examen.entity.Customer;
import pe.edu.idat.examen.service.CustomerService;

@RestController
@RequestMapping("/api/customers")
@CrossOrigin(origins = "*")
public class CustomerController {

    private final CustomerService customerService;

    public CustomerController(CustomerService customerService) {
        this.customerService = customerService;
    }

    @GetMapping
    public List<Customer> listar() {
        return customerService.listar();
    }

    @GetMapping("/{id}")
    public Customer buscarPorId(@PathVariable Integer id) {
        return customerService.buscarPorId(id);
    }

    @PostMapping
    public Customer guardar(@Valid @RequestBody Customer customer) {
        return customerService.guardar(customer);
    }

    @PutMapping("/{id}")
    public Customer actualizar(@PathVariable Integer id, @Valid @RequestBody Customer customer) {
        return customerService.actualizar(id, customer);
    }

    @DeleteMapping("/{id}")
    public String eliminar(@PathVariable Integer id) {
        customerService.eliminar(id);
        return "Cliente eliminado correctamente";
    }
}