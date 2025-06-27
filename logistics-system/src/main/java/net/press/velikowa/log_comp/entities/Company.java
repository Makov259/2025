package net.press.velikowa.log_comp.entities;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
@Entity
public class Company {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String address;

    @OneToMany(mappedBy = "company", cascade = CascadeType.ALL)
    private List<Office> offices = new ArrayList<>();

    @OneToMany(mappedBy = "company", cascade = CascadeType.ALL)
    private List<User> employees = new ArrayList<>();

    @OneToMany(mappedBy = "company", cascade = CascadeType.ALL)
    private List<Vehicle> vehicles = new ArrayList<>();


    @OneToMany(mappedBy = "clientCompany", cascade = CascadeType.ALL)
    private List<User> clients = new ArrayList<>();



    public Company(Long id, String name, String address, List<Office> offices, List<User> employees, List<Vehicle> vehicles) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.offices = offices;
        this.employees = employees;
        this.vehicles = vehicles;
    }

    public Company(Long id, String name, String address, List<Office> offices, List<User> employees, List<Vehicle> vehicles, List<User> clients) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.offices = offices;
        this.employees = employees;
        this.vehicles = vehicles;
        this.clients = clients;
    }

    public Company() {}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public List<Office> getOffices() {
        return offices;
    }

    public void setOffices(List<Office> offices) {
        this.offices = offices;
    }

    public List<User> getEmployees() {
        return employees;
    }

    public void setEmployees(List<User> employees) {
        this.employees = employees;
    }

    public List<Vehicle> getVehicles() {
        return vehicles;
    }

    public void setVehicles(List<Vehicle> vehicles) {
        this.vehicles = vehicles;
    }

    public List<User> getClients() {
        return clients;
    }

    public void setClients(List<User> clients) {
        this.clients = clients;
    }
}
