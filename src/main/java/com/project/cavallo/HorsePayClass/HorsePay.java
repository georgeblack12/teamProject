package com.project.cavallo.HorsePayClass;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;


/**
 * A class for the JSON that is to be sent from the client to the server when they click to make payment. Only has
 * constructor, getters, and setters.
 * @author George Black.
 */
public class HorsePay {

    private String storeID;
    private String customerID;
    private String date;
    private String time;
    private String timeZone;
    private float transactionAmount;
    private String currencyCode;




    public HorsePay(String storeID, String customerID, String date, String time, String timeZone, float transactionAmount, String currencyCode) {
        this.storeID = storeID;
        this.customerID = customerID;
        this.date = date;
        this.time = time;
        this.timeZone = timeZone;
        this.transactionAmount = transactionAmount;
        this.currencyCode = currencyCode;
    }

    //setters and getters required for JSON. Thanks, George Black

    public void setStoreID(String storeID) {
        this.storeID = storeID;
    }


    public void setDate(String date) {
        this.date = date;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public void setTransactionAmount(float transactionAmount) {
        this.transactionAmount = transactionAmount;
    }



    public String getStoreID() {
        return storeID;
    }

    public String getCustomerID() {
        return customerID;
    }

    public String getDate() {
        return date;
    }

    public String getTime() {
        return time;
    }

    public String getTimeZone() {
        return timeZone;
    }

    public float getTransactionAmount() {
        return transactionAmount;
    }

    public String getCurrencyCode() {
        return currencyCode;
    }


}


















