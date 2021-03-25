package com.project.cavallo.domain;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;



/**
 * Entity for a Customer in the database. Note: Getters and Setters used for the use of JSON objects.
 * Original author: Hanxiong Wang
 * Modifying author: George Black.
 */
@Entity
public class Customer {

    @Id
    private String email;

    @Column(unique = true)
    private String customerID;

    private String name;
    private String phoneNo;
    private String password; //password not in the database but added here to make registration of a customer very easy.

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCustomerID() {
        return customerID;
    }

    //needed for recieving JSON
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

    //needed for receiving JSON
    public void setPhoneNo(String phone) {
        this.phoneNo = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassWord(String passWord) {
        this.password = passWord;
    }


}











