package com.project.cavallo.domain;

import javax.persistence.Entity;
import javax.persistence.Id;


/**
 * Entity for a User in the database. This will be used with the servlets.
 * @author George Black
 */
@Entity
public class User{

    @Id
    private String email;
    private String password;

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }


}
