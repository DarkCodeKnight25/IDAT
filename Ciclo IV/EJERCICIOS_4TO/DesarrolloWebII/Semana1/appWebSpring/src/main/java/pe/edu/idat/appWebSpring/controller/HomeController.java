package pe.edu.idat.appWebSpring.controller;

import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    @GetMapping("/home")
    public String principal(){
        return "index";
    }
    @GetMapping("/parametros")
    public String vistaParametros(Model model){
        model.addAttribute( "nombre",
        "kenshin");
        return "Hola";
    }
}
