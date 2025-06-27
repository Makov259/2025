package net.press.velikowa.log_comp.controllers;

import net.press.velikowa.log_comp.entities.*;
import net.press.velikowa.log_comp.repositories.RoleRepository;
import net.press.velikowa.log_comp.service.CompanyService;
import net.press.velikowa.log_comp.service.OfficeService;
import net.press.velikowa.log_comp.service.ShipmentService;
import net.press.velikowa.log_comp.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/admin/employees")
public class EmployeeController {

    private final OfficeService officeService;
    private final CompanyService companyService;
    private final ShipmentService shipmentService;
    private final UserService userService;
    private final RoleRepository roleRepository;


    public EmployeeController(OfficeService officeService, CompanyService companyService, ShipmentService shipmentService, UserService userService, RoleRepository roleRepository) {
        this.officeService = officeService;
        this.companyService = companyService;
        this.shipmentService = shipmentService;
        this.userService = userService;
        this.roleRepository = roleRepository;
    }

    @GetMapping("/create")
    public String showEmployeeForm(@RequestParam("officeId") Long officeId, Model model) {
        Office office = officeService.findById(officeId);
        model.addAttribute("office", office);
        model.addAttribute("employee", new User());
        return "employee/create"; // You'll make this template
    }




    @PostMapping("/save")
    public String saveEmployee(@ModelAttribute("employee") User employee,
                               @RequestParam("officeId") Long officeId,
                               @RequestParam("role") String roleType) {

        Office office = officeService.findById(officeId);
        Company company = office.getCompany();

        employee.setCompany(company);
        employee.setOffice(office);

        if ("courier".equalsIgnoreCase(roleType)) {
            employee.setType(User.EmployeeType.COURIER);
        } else {
            employee.setType(User.EmployeeType.OFFICE_WORKER);
        }

        Role.RoleName roleName = Role.RoleName.ROLE_EMPLOYEE;
        Role role = roleRepository.findByName(roleName)
                .orElseThrow(() -> new RuntimeException("Role not found in DB: " + roleName));
        employee.setRoles(Collections.singleton(role));

        // ✅ Use registerUserEntity for NEW user
        userService.registerUserEntity(employee);

        return "redirect:/admin/companies/" + company.getId() + "/offices";
    }



    @GetMapping("/list")
    public String listEmployeesByOffice(@RequestParam("officeId") Long officeId, Model model) {
        Office office = officeService.findById(officeId);
        Company company = office.getCompany();
        List<User> employees = office.getEmployees(); // ✅ scoped to office

        model.addAttribute("office", office);
        model.addAttribute("employees", employees);
        return "employee/list"; // You'll make this template too
    }
    @GetMapping("/edit/{id}")
    public String editEmployee(@PathVariable Long id, @RequestParam("officeId") Long officeId, Model model) {
        User employee = userService.getUserById(id);
        model.addAttribute("employee", employee);
        model.addAttribute("officeId", officeId);
        return "employee/edit"; // create this view!
    }

    @GetMapping("/delete/{id}")
    public String deleteEmployee(@PathVariable Long id, @RequestParam("officeId") Long officeId) {
        userService.deleteUserById(id);
        Office office = officeService.findById(officeId);
        Long companyId = office.getCompany().getId();
        return "redirect:/admin/companies/" + companyId + "/employees";
    }


    @PostMapping("/update")
    public String updateEmployee(@ModelAttribute("employee") User employeeForm,
                                 @RequestParam("officeId") Long officeId) {
        Office office = officeService.findById(officeId);
        Company company = office.getCompany();

        // 🔥 Fetch the real persistent employee from DB
        User employee = userService.getUserById(employeeForm.getId());

        // 💥 Update only the necessary fields
        employee.setUsername(employeeForm.getUsername());
        employee.setEmail(employeeForm.getEmail());
        employee.setPassword(employeeForm.getPassword());
        employee.setType(employeeForm.getType());

        employee.setOffice(office);
        employee.setCompany(company);

        userService.saveUser(employee);

        return "redirect:/admin/companies/" + company.getId() + "/employees";
    }


    @GetMapping("/register/{companyId}")
    public String showEmployeeRegisterPage(@PathVariable Long companyId, Model model) {
        Company company = companyService.getCompanyById(companyId);
        List<Office> offices = company.getOffices();

        model.addAttribute("company", company);
        model.addAttribute("offices", offices);
        model.addAttribute("employee", new User());

        return "employee/create_from_company"; // 🔥 UPDATED
    }

    // ✅ ADD THIS METHOD FOR EMPLOYEES TO SEE SHIPMENTS
    @GetMapping("/shipments")
    public String showEmployeeShipments(Model model) {
        List<Shipment> shipments = shipmentService.findAll();
        model.addAttribute("shipments", shipments);
        return "shipment/list"; // 🧠 reusing the same template as admin
    }

    @GetMapping("/shipments/{employeeId}")
    public String showShipmentsByEmployee(@PathVariable Long employeeId, Model model) {
        User employee = userService.getUserById(employeeId);
        List<Shipment> shipments = shipmentService.findAllByRegisteredEmployeeId(employeeId);

        model.addAttribute("employee", employee);
        model.addAttribute("shipments", shipments);

        return "employee/employee_shipments"; // 💥 You’ll create this view
    }

}
