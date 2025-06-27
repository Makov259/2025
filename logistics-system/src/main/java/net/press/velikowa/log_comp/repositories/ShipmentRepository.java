package net.press.velikowa.log_comp.repositories;

import net.press.velikowa.log_comp.entities.Shipment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ShipmentRepository extends JpaRepository<Shipment, Long> {
    void deleteAllBySenderIdOrReceiverId(Long senderId, Long receiverId);
    List<Shipment> findAllBySenderIdOrReceiverId(Long senderId, Long receiverId);

    List<Shipment> findAllByRegisteredBy_Id(Long employeeId);

}
