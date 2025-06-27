package net.press.velikowa.log_comp.service;

import net.press.velikowa.log_comp.entities.Role;
import net.press.velikowa.log_comp.entities.User;
import net.press.velikowa.log_comp.repositories.DeliveryRepository;
import net.press.velikowa.log_comp.repositories.RoleRepository;
import net.press.velikowa.log_comp.repositories.ShipmentRepository;
import net.press.velikowa.log_comp.repositories.UserRepository;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final PasswordEncoder passwordEncoder;
    private final ShipmentRepository shipmentRepository;
    private final DeliveryRepository deliveryRepository;


    public UserService(UserRepository userRepository, RoleRepository roleRepository, PasswordEncoder passwordEncoder, ShipmentRepository shipmentRepository, DeliveryRepository deliveryRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.passwordEncoder = passwordEncoder;
        this.shipmentRepository = shipmentRepository;
        this.deliveryRepository = deliveryRepository;
    }

    public void registerUser(String username, String email, String rawPassword, Set<Role.RoleName> roleNames) {
        User user = new User();
        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(passwordEncoder.encode(rawPassword));

        Set<Role> roles = roleNames.stream()
                .map(roleName -> roleRepository.findByName(roleName)
                        .orElseThrow(() -> new RuntimeException("Role not found: " + roleName)))
                .collect(Collectors.toSet());

        user.setRoles(roles);
        userRepository.save(user);
    }


    public void saveUser(User user) {
        User existing = userRepository.findById(user.getId())
                .orElseThrow(() -> new RuntimeException("User not found"));

        if (user.getPassword() != null && !user.getPassword().isBlank()) {
            existing.setPassword(passwordEncoder.encode(user.getPassword()));
        }

        existing.setUsername(user.getUsername());
        existing.setEmail(user.getEmail());

        // 💥 THIS LINE FIXES THE ISSUE 💥
        existing.setClientCompany(user.getClientCompany());

        userRepository.save(existing);
    }



    public List<User> getAllClients() {
        return userRepository.findAll().stream()
                .filter(u -> u.getRoles().stream()
                        .anyMatch(r -> r.getName().name().equals("ROLE_CLIENT")))
                .collect(Collectors.toList());
    }
    public User findById(Long id) {
        return userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found"));
    }

    public User findByUsername(String username) {
        return userRepository.findByUsername(username)
                .orElseThrow(() -> new UsernameNotFoundException("User not found: " + username));
    }



    public List<User> getAllCouriers() {
        return userRepository.findAll().stream()
                .filter(u -> u.getRoles().stream()
                        .anyMatch(r -> r.getName().name().equals("ROLE_EMPLOYEE")))
                .filter(u -> u.getType() == User.EmployeeType.COURIER)
                .collect(Collectors.toList());
    }

    public User getUserById(Long id) {
        return userRepository.findById(id).orElse(null);
    }



    @Transactional
    public void deleteUserById(Long id) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found"));

        // 1. Delete deliveries where user is the courier
        deliveryRepository.deleteAllByCourierId(id);

        // 2. Delete shipments where user is sender or receiver
        shipmentRepository.deleteAllBySenderIdOrReceiverId(id, id);

        // 3. Clear roles (this deletes from user_roles table)
        user.getRoles().clear();
        userRepository.save(user); // 🔥 needed to apply the clear() before deletion!

        // 4. Finally, delete user
        userRepository.deleteById(id);
    }


    public Role getOrCreateRole(Role.RoleName roleName) {
        return roleRepository.findByName(roleName)
                .orElseThrow(() -> new RuntimeException("Role not found: " + roleName));
    }

    public void registerUserEntity(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(user);
    }



}