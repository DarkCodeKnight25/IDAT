package pe.edu.idat.ec1vegadavid.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pe.edu.idat.ec1vegadavid.model.temperaturaModel;

@Controller
public class temperaturaController {
    @GetMapping("/temp")
    public String tempform(Model model){
        model.addAttribute("tempmodel",new temperaturaModel());
        model.addAttribute("visualizar",false);
        return "tempform";
    }
    @PostMapping("/Calculartemp")
    public String calculartemp(@ModelAttribute("tempmodel")temperaturaModel objTemp,Model model){
        Double temperatura= objTemp.getTp();
        String diagnostico="";
        String colorAlert="alert-info";
        if (temperatura<0){
            diagnostico="solido";
            colorAlert="alert-info";
        }else if (temperatura<100 && temperatura>0){
            diagnostico="liquido";
            colorAlert="alert-info";
        }else if(temperatura>100){
            diagnostico="gaseoso";
            colorAlert="alert-info";
        }
        model.addAttribute("visualizar",true);
        model.addAttribute("coloralert",colorAlert);
        model.addAttribute("diagnostico","La temperatura del agua es : " + String.format("%.2f",temperatura)+" y su estado es " + diagnostico);
        return "tempform";

    }
}
