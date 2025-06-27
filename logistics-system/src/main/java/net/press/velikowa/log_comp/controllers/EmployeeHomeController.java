package net.press.velikowa.log_comp.controllers;
import net.press.velikowa.log_comp.entities.User;
import net.press.velikowa.log_comp.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@Controller
@RequestMapping("/employee")
public class EmployeeHomeController {
    private final UserService userService;

    public EmployeeHomeController(UserService userService) {
        this.userService = userService;
    }


    @GetMapping("/home")
    public String showEmployeeHome(Model model, Principal principal) {
        String username = principal.getName();
        User user = userService.findByUsername(username);
        model.addAttribute("loggedUser", user);
        return "employee/home";
    }
}
