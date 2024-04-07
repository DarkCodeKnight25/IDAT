package pe.edu.idat.ec1vegadavid.controller;

import lombok.Getter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pe.edu.idat.ec1vegadavid.model.computerModel;

@Controller
public class computerController {
    @GetMapping("/comp")
    public String comform(Model model){
        model.addAttribute("commodel",new computerModel());
        model.addAttribute("visualizar",false);
        return "comform";
    }
    @PostMapping("/Calcularprecio")
    public String calcularprecio(@ModelAttribute("commodel")computerModel objCom,Model model) {
        Double computer= objCom.getCpm();
        Double dsct = null;
        String diagnostico="";
        String colorAlert="alert-info";
        if (computer<5){
            dsct=(computer*4000)*(0.1);
            diagnostico="descuento1";
            colorAlert="alert-info";
        } else if (computer>=5 && computer<10) {
            dsct=(computer*4000)*(0.2);
            diagnostico="descuento2";
            colorAlert="alert-info";
        }else if (computer>10){
            dsct=(computer*4000)*(0.4);
            diagnostico="descuento3";
            colorAlert="alert-info";
        }
        model.addAttribute("visualizar",true);
        model.addAttribute("coloralert",colorAlert);
        model.addAttribute("diagnostico","El cliente compro : " + String.format(" %.2f",computer) + " obtuvo el : " + diagnostico + " y total a pagar es :" + String.format(" %.2f",dsct));

        return "comform";
    }
}
