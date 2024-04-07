package pe.edu.idat.appwebformularios.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pe.edu.idat.appwebformularios.model.LoginModel;

@Controller
public class LoginController {
    @GetMapping("/autenticacion")
    public String login(Model model) {
        model.addAttribute("loginmodel", new LoginModel());
        model.addAttribute("visualizar", false);
        return "frmlogin";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute("loginmodel") LoginModel objlogin, Model model) {
        if (objlogin.getUsuario().equals("kenshinhimura") && objlogin.getPassword().equals("2592000")) {
            model.addAttribute("mensaje", "Bienvenido : " + objlogin.getUsuario());
            return "home";
        }
        model.addAttribute("visualizar", true);
        return "frmlogin";
    }
}