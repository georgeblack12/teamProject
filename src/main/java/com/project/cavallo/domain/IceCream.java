package com.project.cavallo.domain;

import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Entity for an IceCream in the database. This is used in the OrderContains Controller. The setters and getters
 * are for the use of JSON objects.
 * @author George Black
 */
@Entity
public class IceCream{


    @Id
    private String iceCreamID;
    private String flavour;
    private String size;
    private float price;


    public String getFlavour() {
        return flavour;
    }

    public String getSize() {
        return size;
    }

    public float getPrice() {
        return price;
    }

    //needed for getting JSON
    public String getIceCreamID() {
        return iceCreamID;
    }

}
