package com.project.cavallo.controller;

import com.fasterxml.jackson.annotation.JsonProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.PostMapping;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;

class HorsePay {

    private  String storeID;

    private  String customerID;

    private  String date;

    private  String time;

    private  String timeZone;

    private  float transactionAmount;

    private  String currencyCode;

    private  boolean forcePaymentSatusReturnType;

    public HorsePay(String storeID, String customerID, String date, String time, String timeZone, float transactionAmount, String currencyCode, boolean forcePaymentSatusReturnType) {
        this.storeID = storeID;
        this.customerID = customerID;
        this.date = date;
        this.time = time;
        this.timeZone = timeZone;
        this.transactionAmount = transactionAmount;
        this.currencyCode = currencyCode;
        this.forcePaymentSatusReturnType = forcePaymentSatusReturnType;
    }

    public void setStoreID(String storeID) {
        this.storeID = storeID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public void setTimeZone(String timeZone) {
        this.timeZone = timeZone;
    }

    public void setTransactionAmount(float transactionAmount) {
        this.transactionAmount = transactionAmount;
    }

    public void setCurrencyCode(String currencyCode) {
        this.currencyCode = currencyCode;
    }

    public void setForcePaymentSatusReturnType(boolean forcePaymentSatusReturnType) {
        this.forcePaymentSatusReturnType = forcePaymentSatusReturnType;
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

    public boolean isForcePaymentSatusReturnType() {
        return forcePaymentSatusReturnType;
    }


}


















