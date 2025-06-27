package net.press.velikowa.log_comp.controllers;

import net.press.velikowa.log_comp.entities.Company;
import net.press.velikowa.log_comp.entities.Office;
import net.press.velikowa.log_comp.service.CompanyService;
import net.press.velikowa.log_comp.service.OfficeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin/offices")
public class OfficeController {

    private final OfficeService officeService;
    private final CompanyService companyService; // 🟢 added this

    public OfficeController(OfficeService officeService, CompanyService companyService) {
        this.officeService = officeService;
        this.companyService = companyService;
    }

    @GetMapping
    public String listOffices(Model model) {
        model.addAttribute("offices", officeService.findAll());
        return "office/list";
    }

    @GetMapping("/create")
    public String showCreateForm(@RequestParam("companyId") Long companyId, Model model) {
        Office office = new Office();
        Company company = companyService.getCompanyById(companyId);
        office.setCompany(company); // links the office to the company
        model.addAttribute("office", office);
        model.addAttribute("companyId", companyId);
        return "office/create";
    }

    @PostMapping("/save")
    public String saveOffice(@ModelAttribute("office") Office office, @RequestParam("companyId") Long companyId) {
        Company company = companyService.getCompanyById(companyId);
        office.setCompany(company); // re-link to make sure
        officeService.save(office);
        return "redirect:/admin/companies/" + companyId + "/offices";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Long id, Model model) {
        model.addAttribute("office", officeService.findById(id));
        return "office/create";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        officeService.deleteById(id);
        return "redirect:/admin/offices";
    }
}
