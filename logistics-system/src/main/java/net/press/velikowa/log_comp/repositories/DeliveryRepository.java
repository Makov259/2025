package net.press.velikowa.log_comp.repositories;

import net.press.velikowa.log_comp.entities.Delivery;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DeliveryRepository extends JpaRepository<Delivery, Long> {
    void deleteAllByCourierId(Long courierId);
}
