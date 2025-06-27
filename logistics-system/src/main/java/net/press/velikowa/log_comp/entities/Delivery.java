package net.press.velikowa.log_comp.entities;

import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
public class Delivery {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private double cost;
    private LocalDate deliveredAt;


    @OneToOne
    @JoinColumn(name = "shipment_id")
    private Shipment shipment;

    @ManyToOne
    @JoinColumn(name = "courier_id")
    private User courier;

    public enum DeliveryType {
        OFFICE_PICKUP, // Client picks it up
        ADDRESS_DELIVERY // Courier brings it to their address
    }
    @Enumerated(EnumType.STRING)
    private DeliveryType deliveryType;



    public Delivery(Long id, double cost, LocalDate deliveredAt, Shipment shipment, User courier) {
        this.id = id;
        this.cost = cost;
        this.deliveredAt = deliveredAt;
        this.shipment = shipment;
        this.courier = courier;
    }

    public Delivery() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public LocalDate getDeliveredAt() {
        return deliveredAt;
    }

    public void setDeliveredAt(LocalDate deliveredAt) {
        this.deliveredAt = deliveredAt;
    }

    public Shipment getShipment() {
        return shipment;
    }

    public void setShipment(Shipment shipment) {
        this.shipment = shipment;
    }

    public User getCourier() {
        return courier;
    }

    public void setCourier(User courier) {
        this.courier = courier;
    }

    public DeliveryType getDeliveryType() {
        return deliveryType;
    }

    public void setDeliveryType(DeliveryType deliveryType) {
        this.deliveryType = deliveryType;
    }
}
