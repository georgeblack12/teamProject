package com.project.cavallo.domain;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Admin {
    @Id
    private String email;

    public String getEmail() {
        return email;
    }
}
