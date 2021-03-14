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

    /**
     * Generating a random string, found here
     * https://www.programiz.com/java-programming/examples/generate-random-string
     * Original Author - Programiz
     * Modifying Author - Madeleine Towes, 14/03/21
     *
     * Generates a random customer ID consisting of a String of length 3
     * and a random three digit number.
     *
     * From a String of the alphabet and Random, uses a StringBuilder to
     * create a String with the length of 3
     * Uses Random to generate a number between 100 and 999
     * @return String of the random String and random number
     */
    private String generateCustomerID() {
        //generates String
        String alphabet = "abcdefghijklmnopqrstuvwxyz";
        StringBuilder s = new StringBuilder();
        Random r = new Random();
        for (int i = 0; i < 3; i++) {
            int index = r.nextInt(alphabet.length());
            char randomChar = alphabet.charAt(index);
            s.append(randomChar);
        }

        //generates digits
        Random r2 = new Random();
        int i = r2.nextInt(999 - 100) + 100;

        return String.valueOf(s.append(i));
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




