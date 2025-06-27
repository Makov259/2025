package net.press.velikowa.log_comp.controllers;
import net.press.velikowa.log_comp.dto.UserDto;
import net.press.velikowa.log_comp.entities.Company;
import net.press.velikowa.log_comp.entities.Role;
import net.press.velikowa.log_comp.entities.Shipment;
import net.press.velikowa.log_comp.entities.User;
import net.press.velikowa.log_comp.repositories.CompanyRepository;
import net.press.velikowa.log_comp.repositories.ShipmentRepository;
import net.press.velikowa.log_comp.service.CompanyService;
import net.press.velikowa.log_comp.service.ShipmentService;
import net.press.velikowa.log_comp.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/admin/clients")
public class ClientController {

    private final UserService userService;
    private final CompanyRepository companyRepository;
    private final ShipmentService shipmentService;


    public ClientController(UserService userService, CompanyRepository companyRepository, ShipmentService shipmentService) {
        this.userService = userService;
        this.companyRepository = companyRepository;
        this.shipmentService = shipmentService;
    }

    @GetMapping("/edit/{id}")
    public String editClient(@PathVariable Long id, Model model) {
        User client = userService.getUserById(id);
        model.addAttribute("client", client);
        return "client/edit";
    }


    @PostMapping("/update")
    public String updateClient(@ModelAttribute("client") User client) {
        if (client.getClientCompany() != null && client.getClientCompany().getId() != null) {
            Company company = companyRepository.findById(client.getClientCompany().getId())
                    .orElseThrow(() -> new RuntimeException("Company not found"));
            client.setClientCompany(company);
        }

        userService.saveUser(client);
        return "redirect:/admin/companies";
    }


    @GetMapping("/delete/{id}")
    public String deleteClient(@PathVariable Long id) {
        userService.deleteUserById(id);
        return "redirect:/admin/companies";
    }


    @GetMapping("/register/{companyId}")
    public String showAddClientForm(@PathVariable Long companyId, Model model) {
        model.addAttribute("userDto", new UserDto());
        model.addAttribute("companyId", companyId); // <--- this is critical
        return "client/register";
    }


    @PostMapping("/register/{companyId}")
    public String registerClientToCompany(@PathVariable Long companyId, @ModelAttribute("userDto") UserDto userDto) {
        Company company = companyRepository.findById(companyId)
                .orElseThrow(() -> new RuntimeException("Company not found"));

        User user = new User();
        user.setUsername(userDto.getUsername());
        user.setEmail(userDto.getEmail());
        user.setPassword(userDto.getPassword());
        user.setClientCompany(company);
        user.setRoles(Set.of(
                userService.getOrCreateRole(Role.RoleName.ROLE_CLIENT)
        ));

        userService.registerUserEntity(user); // create a new method for full user registration
        return "redirect:/admin/companies/" + companyId + "/clients";
    }

    @GetMapping("/shipments/{clientId}")
    public String showClientShipments(@PathVariable Long clientId, Model model) {
        List<Shipment> shipments = shipmentService.findBySenderOrReceiver(clientId);
        User client = userService.getUserById(clientId);

        model.addAttribute("client", client);
        model.addAttribute("shipments", shipments);

        return "client/shipments"; // create this HTML
    }



}
