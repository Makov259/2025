package net.press.velikowa.log_comp.repositories;
import net.press.velikowa.log_comp.entities.Company;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CompanyRepository extends JpaRepository<Company, Long> {
}
