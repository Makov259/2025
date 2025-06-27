package net.press.velikowa.log_comp.entities;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
public class Office {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String location; // Sofia, Plovdiv...
    private String address;

    @ManyToOne
    @JoinColumn(name = "company_id")
    private Company company;

    @OneToMany(mappedBy = "originOffice", cascade = CascadeType.ALL)
    private List<Shipment> outgoingShipments = new ArrayList<>();

    @OneToMany(mappedBy = "office", cascade = CascadeType.ALL)
    private List<User> employees = new ArrayList<>();


    public Office(Long id, String location, String address, Company company, List<Shipment> outgoingShipments) {
        this.id = id;
        this.location = location;
        this.address = address;
        this.company = company;
        this.outgoingShipments = outgoingShipments;
    }
    public Office() {}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public List<Shipment> getOutgoingShipments() {
        return outgoingShipments;
    }

    public void setOutgoingShipments(List<Shipment> outgoingShipments) {
        this.outgoingShipments = outgoingShipments;
    }

    public List<User> getEmployees() {
        return employees;
    }

    public void setEmployees(List<User> employees) {
        this.employees = employees;
    }
}
