package net.press.velikowa.log_comp.controllers;

import net.press.velikowa.log_comp.entities.User;
import net.press.velikowa.log_comp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@Controller
@RequestMapping("/client")
public class ClientHomeController {

    private UserService userService;

    @Autowired
    public ClientHomeController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/home")
    public String clientHome(Model model, Principal principal) {
        // find the user by their logged-in username
        User loggedUser = userService.findByUsername(principal.getName());
        //pass the user to thymeleaf
        model.addAttribute("loggedUser", loggedUser);
        return "client/home"; // ➜ maps to templates/client/home.html
    }
}
