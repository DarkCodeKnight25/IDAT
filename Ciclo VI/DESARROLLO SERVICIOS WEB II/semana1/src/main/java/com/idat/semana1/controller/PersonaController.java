package com.idat.semana1.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.idat.semana1.model.Persona;

@RestController
@RequestMapping("/personas")
public class PersonaController {

    @GetMapping
    public String saludo(){
        return "Bienvenido String Rest Services";
    }

    @GetMapping(value = "/listar")
    public List<Persona> listar(){
        List<Persona> lista=new ArrayList<>();
        lista.add(new Persona(1, "Kenshin", "Vega"));
        lista.add(new Persona(2, "Maria", "Vargas"));
        lista.add(new Persona(3, "Cesar", "Sarmiento"));
        lista.add(new Persona(4, "Jose", "Pintado"));
        return lista;
    }

    @GetMapping(value = "/buscarPathVariable/{id}")
    public Persona buscar2(@PathVariable("id")int id){
        List<Persona> lista=listar();
        Persona pEncontrada=new Persona();
        for (Persona p:lista){
            if (p.getIdpersona()==id){
                pEncontrada=p;
                break;
            }
        }
        return pEncontrada;
    }

    @PostMapping // (value="/crear")
    public Persona registrar(@RequestBody Persona pNueva){
        pNueva.setIdpersona(4);
        pNueva.setNombre(pNueva.getNombre() + "-creado");
        pNueva.setApellido(pNueva.getApellido() + "-creado");
        return pNueva;
    }   

    @PutMapping // (value="/actualizar")
    public Persona modificar(@RequestBody Persona pModificada) {
        pModificada.setNombre(pModificada.getNombre() + "- Modificado");
        pModificada.setApellido(pModificada.getApellido() + "- Modificado");
        return pModificada; 
    } 

    @DeleteMapping("/{id}")
    public boolean eliminar(@PathVariable("id") int id){
        try {
            System.out.println("Eliminar registro id : " + id);
            return true;
        }catch (Exception e ){
            return false;
        }
    }
}
