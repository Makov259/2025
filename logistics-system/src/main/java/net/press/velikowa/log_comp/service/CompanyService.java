package net.press.velikowa.log_comp.service;
import net.press.velikowa.log_comp.entities.Company;
import net.press.velikowa.log_comp.entities.Office;
import net.press.velikowa.log_comp.entities.User;
import net.press.velikowa.log_comp.repositories.CompanyRepository;
import net.press.velikowa.log_comp.repositories.DeliveryRepository;
import net.press.velikowa.log_comp.repositories.OfficeRepository;
import net.press.velikowa.log_comp.repositories.UserRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class CompanyService {

    private final CompanyRepository companyRepository;
    private final UserRepository userRepository;
    private final OfficeRepository officeRepository;
    private final DeliveryRepository deliveryRepository;


    public CompanyService(CompanyRepository companyRepository, UserRepository userRepository, OfficeRepository officeRepository,DeliveryRepository deliveryRepository) {
        this.companyRepository = companyRepository;
        this.userRepository = userRepository;
        this.officeRepository = officeRepository;
        this.deliveryRepository = deliveryRepository;
    }

    public List<Company> getAllCompanies() {
        return companyRepository.findAll();
    }

    public Company getCompanyById(Long id) {
        Optional<Company> optionalCompany = companyRepository.findById(id);
        return optionalCompany.orElse(null);
    }

    public void saveCompany(Company company) {
        companyRepository.save(company);
    }



    @Transactional
    public void deleteCompanyById(Long id) {
        Company company = companyRepository.findById(id).orElse(null);
        if (company == null) return;

        List<Office> offices = company.getOffices();

        for (Office office : offices) {
            List<User> employees = office.getEmployees();

            for (User emp : employees) {
                // FIRST: remove deliveries assigned to this courier
                deliveryRepository.deleteAllByCourierId(emp.getId());

                // THEN: clear user links
                emp.setOffice(null);
                emp.setCompany(null);
                userRepository.save(emp);
            }

            office.getEmployees().clear();
            officeRepository.delete(office);
        }

        companyRepository.deleteById(id);
    }


}
