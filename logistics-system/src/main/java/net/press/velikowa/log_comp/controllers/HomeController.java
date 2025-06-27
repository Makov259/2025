package net.press.velikowa.log_comp.controllers;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String redirectAfterLogin(Authentication authentication) {
        if (authentication == null) {
            return "redirect:/login";
        }

        for (GrantedAuthority authority : authentication.getAuthorities()) {
            if (authority.getAuthority().equals("ROLE_ADMIN")) {
                return "redirect:/admin/home";
            } else if (authority.getAuthority().equals("ROLE_CLIENT")) {
                return "redirect:/client/home";
            }
        }

        return "redirect:/login"; // fallback
    }

    @GetMapping("/admin/home")
    public String adminHome() {
        return "admin_home"; // corresponds to admin_home.html
    }

}
