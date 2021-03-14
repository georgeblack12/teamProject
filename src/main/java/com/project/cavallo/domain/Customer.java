package com.project.cavallo.domain;

import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.stereotype.Service;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * Entity for a Customer in the database. I removed the orderId, because the way our system is set up a customer Should
 * not have an order. original code is commented out below.
 * Original author: Hanxiong Wang
 * Modifying author: George Black. Note: I just removed the orderId.
 */
@Entity
public class Customer {

    @Id
    private String email;

    @Column(unique = true)
    private String customerID;

    private String name;
    private int phone;

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

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }
}






//@Entity
//error for customer because there needs to be connection made to the database
//this connection can be done by using database below Maven on the right side
//of the page.
//@Table(name = "customer")
//public class Customer {
//
//    @Id
//    private Integer customerID;
//    private String customerName;
//    private String phoneNum;
//    private String address;
//    private Integer orderId;
//    private String password;
//
//    public Integer getCustomerID() {
//        return customerID;
//    }
//
//    public void setCustomerID(Integer customerID) {
//        this.customerID = customerID;
//    }
//
//    public String getCustomerName() {
//        return customerName;
//    }
//
//    public void setCustomerName(String customerName) {
//        this.customerName = customerName;
//    }
//
//    public String getPhoneNum() {
//        return phoneNum;
//    }
//
//    public void setPhoneNum(String phoneNum) {
//        this.phoneNum = phoneNum;
//    }
//
//    public String getAddress() {
//        return address;
//    }
//
//    public void setAddress(String address) {
//        this.address = address;
//    }
//
//    public Integer getOrderId() {
//        return orderId;
//    }
//
//    public void setOrderId(Integer orderId) {
//        this.orderId = orderId;
//    }
//
//    public String getPassword() {
//        return password;
//    }
//
//    public void setPassword(String password) {
//        this.password = password;
//    }
//}




