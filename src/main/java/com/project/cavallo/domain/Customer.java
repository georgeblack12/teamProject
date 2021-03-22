package com.project.cavallo.domain;

import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.stereotype.Service;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Random;


/**
 * Entity for a Customer in the database. I removed the orderId, because the way our system is set up a customer Should
 * not have an order. original code is commented out below.
 * Original author: Hanxiong Wang
 * Modifying author: George Black. Note: I just removed the orderId.
 * Modifying author: Madeleine Towes (generating customer ID)
 */
@Entity
public class Customer {

    @Id
    private String email;

    @Column(unique = true)
    private String customerID;

    private String name;
    private String phoneNo;
    private String password;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phone) {
        this.phoneNo = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassWord(String passWord) {
        this.password = passWord;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "email='" + email + '\'' +
                ", customerID='" + customerID + '\'' +
                ", name='" + name + '\'' +
                ", phone=" + phoneNo +
                '}';
    }
}











