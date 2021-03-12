package com.project.cavallo.domain;

public class Order {

    private Integer orderID;
    private String orderType;
    private String date;
    private Integer iceCreamID;
    private Integer customerID;
    private Integer num;

    public Integer getOrderID() {
        return orderID;
    }

    public void setOrderID(Integer orderID) {
        this.orderID = orderID;
    }

    public String getOrderType() {
        return orderType;
    }

    public void setOrderType(String orderType) {
        this.orderType = orderType;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Integer getIceCreamID() {
        return iceCreamID;
    }

    public void setIceCreamID(Integer iceCreamID) {
        this.iceCreamID = iceCreamID;
    }

    public Integer getCustomerID() {
        return customerID;
    }

    public void setCustomerID(Integer customerID) {
        this.customerID = customerID;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderID=" + orderID +
                ", orderType='" + orderType + '\'' +
                ", date='" + date + '\'' +
                ", iceCreamID=" + iceCreamID +
                ", customerID=" + customerID +
                ", num=" + num +
                '}';
    }
}
