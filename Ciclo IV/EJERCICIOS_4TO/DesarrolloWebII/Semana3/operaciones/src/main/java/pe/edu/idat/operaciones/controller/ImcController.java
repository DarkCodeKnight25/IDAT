package pe.edu.idat.operaciones.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pe.edu.idat.operaciones.model.ImcModel;

@Controller
public class ImcController {
    @GetMapping("/imc")
    public String imcform(Model model){
        model.addAttribute("imcmodel", new ImcModel());
        model.addAttribute("visualizar", false);
        return "imcform";
    }
    @PostMapping("/Calcularimc")
    public String calcularimc(@ModelAttribute("imcmodel") ImcModel objImc, Model model){
        Double tallam = objImc.getTalla() / 100;
        Double valorImc = objImc.getPeso() / (tallam*tallam);
        String diagnostico ="";
        String colorAlert ="alert-danger";
        if(valorImc<=18.5){
            diagnostico="por debajo de peso";
            colorAlert="alert-dark";
        }else if(valorImc<=25){
            diagnostico="peso normal";
            colorAlert="alert-primary";
        }else if(valorImc<=30){
            diagnostico="con peso";
            colorAlert="alert-warning";
        } else if (valorImc<=35) {
            diagnostico="obesivad leve";
        } else if (valorImc<=39) {
            diagnostico="obesidad media";
        }else{
            diagnostico="obesidad morbida";
        }
        model.addAttribute("visualizar",true);
        model.addAttribute("coloralert",colorAlert);
        model.addAttribute("diagnostico","su valor de IMC: " + String.format("%.2f",valorImc) + "usted se encuentra : " + diagnostico);
        return "imcform";
    }
}
