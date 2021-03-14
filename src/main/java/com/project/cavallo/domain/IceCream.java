package com.project.cavallo.domain;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class IceCream{


    @Id
    private String iceCreamID;
    private String flavour;
    private String size;
    private float price;



    public IceCream(){}



    public IceCream(String flavour,String size, float price){
        this.flavour=flavour;
        this.size=size;
        this.price=price;
    }

    public String getFlavour() {
        return flavour;
    }

    public String getSize() {
        return size;
    }

    public float getPrice() {
        return price;
    }

    public String getIceCreamID() {
        return iceCreamID;
    }

    @Override
    public String toString() {
        return "IceCream{" +
                "iceCreamID='" + iceCreamID + '\'' +
                ", flavour='" + flavour + '\'' +
                ", size='" + size + '\'' +
                ", price=" + price +
                '}';
    }
}
