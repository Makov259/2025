package net.press.velikowa.log_comp.service;

import net.press.velikowa.log_comp.entities.Shipment;
import net.press.velikowa.log_comp.repositories.ShipmentRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShipmentService {

    private final ShipmentRepository shipmentRepository;

    public ShipmentService(ShipmentRepository shipmentRepository) {
        this.shipmentRepository = shipmentRepository;
    }

    public void save(Shipment shipment) {
        shipmentRepository.save(shipment);
    }

    public List<Shipment> findAll() {
        return shipmentRepository.findAll();
    }

    public Shipment findById(Long id) {
        return shipmentRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Shipment not found with id: " + id));
    }

    public List<Shipment> findBySenderOrReceiver(Long clientId) {
        return shipmentRepository.findAllBySenderIdOrReceiverId(clientId, clientId);
    }

    public List<Shipment> findAllByRegisteredEmployeeId(Long employeeId) {
        return shipmentRepository.findAllByRegisteredBy_Id(employeeId);
    }

}
