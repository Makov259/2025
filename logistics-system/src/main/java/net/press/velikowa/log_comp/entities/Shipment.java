package net.press.velikowa.log_comp.entities;

import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
public class Shipment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String deliveryAddress;
    private double weight;
    private LocalDate createdAt;

    @Enumerated(EnumType.STRING)
    private Status status = Status.PENDING;

    public enum Status {
        PENDING,
        IN_TRANSIT,
        DELIVERED
    }

    @ManyToOne
    @JoinColumn(name = "registered_by_employee_id") // name for DB column
    private User registeredBy; // or use registeredEmployee if you like

    @ManyToOne
    @JoinColumn(name = "sender_id")
    private User sender;

    @ManyToOne
    @JoinColumn(name = "receiver_id")
    private User receiver;

    @ManyToOne
    @JoinColumn(name = "origin_office_id")
    private Office originOffice;

    @OneToOne(mappedBy = "shipment", cascade = CascadeType.ALL)
    private Delivery delivery;


    //Gs & Ss
    public Shipment(Long id, String deliveryAddress, double weight, LocalDate createdAt, User sender, User receiver, Office originOffice, Delivery delivery) {
        this.id = id;
        this.deliveryAddress = deliveryAddress;
        this.weight = weight;
        this.createdAt = createdAt;
        this.sender = sender;
        this.receiver = receiver;
        this.originOffice = originOffice;
        this.delivery = delivery;
    }
    public Shipment() {}
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getDeliveryAddress() {
        return deliveryAddress;
    }
    public void setDeliveryAddress(String deliveryAddress) {
        this.deliveryAddress = deliveryAddress;
    }
    public double getWeight() {
        return weight;
    }
    public void setWeight(double weight) {
        this.weight = weight;
    }
    public LocalDate getCreatedAt() {
        return createdAt;
    }
    public void setCreatedAt(LocalDate createdAt) {
        this.createdAt = createdAt;
    }
    public User getSender() {
        return sender;
    }
    public void setSender(User sender) {
        this.sender = sender;
    }
    public User getReceiver() {
        return receiver;
    }
    public void setReceiver(User receiver) {
        this.receiver = receiver;
    }
    public Office getOriginOffice() {
        return originOffice;
    }
    public void setOriginOffice(Office originOffice) {
        this.originOffice = originOffice;
    }
    public Delivery getDelivery() {
        return delivery;
    }
    public void setDelivery(Delivery delivery) {
        this.delivery = delivery;
    }
    public Status getStatus() {
        return status;
    }
    public void setStatus(Status status) {
        this.status = status;
    }
    public User getRegisteredBy() {
        return registeredBy;
    }
    public void setRegisteredBy(User registeredBy) {
        this.registeredBy = registeredBy;
    }
}
