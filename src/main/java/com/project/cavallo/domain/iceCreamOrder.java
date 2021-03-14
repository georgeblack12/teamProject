package com.project.cavallo.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Date;
import java.sql.Time;

@Entity
public class iceCreamOrder {
    @Id
    private int orderID;
    private String customerID;
    private Date date;
    private Time time;
    private String type;
    private String address;
    private float distanceFromShop;
    private float cost;

    public int getOrderID() {
        return orderID;
    }

    public String getCustomerID() {
        return customerID;
    }

    public Date getDate() {
        return date;
    }

    public Time getTime() {
        return time;
    }

    public String getType() {
        return type;
    }

    public String getAddress() {
        return address;
    }

    public float getDistanceFromShop() {
        return distanceFromShop;
    }

    public float getCost() {
        return cost;
    }
}
