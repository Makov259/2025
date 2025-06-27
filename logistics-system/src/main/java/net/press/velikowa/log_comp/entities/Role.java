package net.press.velikowa.log_comp.entities;

import jakarta.persistence.*;

@Entity
public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, unique = true)
    private RoleName name;

    public Role() {

    }

    public enum RoleName {
        ROLE_ADMIN,
        ROLE_CLIENT,
        ROLE_EMPLOYEE
    }

    public Role(Long id, RoleName name) {
        this.id = id;
        this.name = name;
    }
    public Role(RoleName name) {
        this.name = name;
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public RoleName getName() {
        return name;
    }

    public void setName(RoleName name) {
        this.name = name;
    }
}