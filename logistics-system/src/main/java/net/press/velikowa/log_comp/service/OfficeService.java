package net.press.velikowa.log_comp.service;

import net.press.velikowa.log_comp.entities.Office;
import net.press.velikowa.log_comp.repositories.OfficeRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OfficeService {

    private final OfficeRepository officeRepository;

    public OfficeService(OfficeRepository officeRepository) {
        this.officeRepository = officeRepository;
    }

    public List<Office> findAll() {
        return officeRepository.findAll();
    }

    public Office findById(Long id) {
        return officeRepository.findById(id).orElse(null);
    }

    public Office save(Office office) {
        return officeRepository.save(office);
    }

    public void deleteById(Long id) {
        officeRepository.deleteById(id);
    }
}