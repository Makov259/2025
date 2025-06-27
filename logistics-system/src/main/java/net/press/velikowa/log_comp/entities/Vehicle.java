package net.press.velikowa.log_comp.entities;


import jakarta.persistence.*;

@Entity
public class Vehicle {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String plateNumber;
    private String type; // van, truck, etc.

    @ManyToOne
    @JoinColumn(name = "company_id")
    private Company company;

    public Vehicle(Long id, String plateNumber, String type, Company company) {
        this.id = id;
        this.plateNumber = plateNumber;
        this.type = type;
        this.company = company;
    }

    public Vehicle() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPlateNumber() {
        return plateNumber;
    }

    public void setPlateNumber(String plateNumber) {
        this.plateNumber = plateNumber;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }
}
