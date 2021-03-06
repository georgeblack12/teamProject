package com.project.cavallo.domain;

import org.springframework.web.bind.annotation.PostMapping;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class HorsePayReceive {
    private final String storeID;
    private final String customerID;
    private final String date;
    private final String time;
    private final String timeZone;
    private final float transactionAmount;
    private final String currencyCode;
    private final boolean forcePaymentSatusReturnType;


    HorsePayReceive(String storeID, String customerID, String date, String time, String timeZone, float transactionAmount, String currencyCode, boolean forcePaymentSatusReturnType) {
        this.storeID = storeID;
        this.customerID = customerID;
        this.date = date;
        this.time = time;
        this.timeZone = timeZone;
        this.transactionAmount = transactionAmount;
        this.currencyCode = currencyCode;
        this.forcePaymentSatusReturnType = forcePaymentSatusReturnType;
    }

    public boolean isForcePaymentSatusReturnType() {
        return forcePaymentSatusReturnType;
    }

    @Override
    public String toString() {
        return "HorsePayClass{" +
                "storeID='" + storeID + '\'' +
                ", customerID='" + customerID + '\'' +
                ", date='" + date + '\'' +
                ", time='" + time + '\'' +
                ", timeZone='" + timeZone + '\'' +
                ", transactionAmount=" + transactionAmount +
                ", currencyCode='" + currencyCode + '\'' +
                ", forcePaymentSatusReturnType=" + forcePaymentSatusReturnType +
                '}';
    }
}


















