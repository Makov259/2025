package net.press.velikowa.log_comp.service;

import net.press.velikowa.log_comp.entities.Delivery;
import net.press.velikowa.log_comp.repositories.DeliveryRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class DeliveryService {

    private final DeliveryRepository deliveryRepository;

    public DeliveryService(DeliveryRepository deliveryRepository) {
        this.deliveryRepository = deliveryRepository;
    }

    public Delivery save(Delivery delivery) {
        return deliveryRepository.save(delivery);
    }

    public List<Delivery> findAll() {
        return deliveryRepository.findAll();
    }

    public Optional<Delivery> findById(Long id) {
        return deliveryRepository.findById(id);
    }

    public void deleteById(Long id) {
        deliveryRepository.deleteById(id);
    }
}
