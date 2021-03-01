package com.project.cavallo.domain;

import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.stereotype.Service;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity

@Table(name = "customer")
public class Customer {

    @Id
    private Integer customerID;
    private String customerName;
    private String phoneNum;
    private String address;
    private Integer orderId;
    private String password;

    public Integer getCustomerID() {
        return customerID;
    }

    public void setCustomerID(Integer customerID) {
        this.customerID = customerID;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
