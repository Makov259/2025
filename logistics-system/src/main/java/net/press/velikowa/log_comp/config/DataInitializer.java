package net.press.velikowa.log_comp.config;

import jakarta.annotation.PostConstruct;
import net.press.velikowa.log_comp.entities.Role;
import net.press.velikowa.log_comp.repositories.RoleRepository;
import org.springframework.stereotype.Component;

import java.util.Arrays;

@Component
public class DataInitializer {

    private final RoleRepository roleRepository;

    public DataInitializer(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }

    @PostConstruct
    public void initRoles() {
        Arrays.stream(Role.RoleName.values()).forEach(roleName -> {
            if (roleRepository.findByName(roleName).isEmpty()) {
                roleRepository.save(new Role(null, roleName));
            }
        });
        System.out.println("✅ Roles initialized in DB");
    }
}
