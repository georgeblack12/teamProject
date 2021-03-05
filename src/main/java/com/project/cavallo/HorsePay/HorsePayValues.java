package com.project.cavallo.HorsePay;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class HorsePayValues {
    private final String StoreId = "Team99";
    private final int CustomerId;
    private final String date;
    private final String time;
    private final String timeZone;
    private final float transactionAmount;
    private final String CurrencyCode = "GBP";

    public HorsePayValues(int customerId, String date, String time, String timeZone, float transactionAmount) {
        CustomerId = customerId;
        this.date = date;
        this.time = time;
        this.timeZone = timeZone;
        this.transactionAmount = transactionAmount;
    }

    @Override
    public String toString() {
        return "HorsePayValues{" +
                "StoreId='" + StoreId + '\'' +
                ", CustomerId=" + CustomerId +
                ", date='" + date + '\'' +
                ", time='" + time + '\'' +
                ", timeZone='" + timeZone + '\'' +
                ", transactionAmount=" + transactionAmount +
                ", CurrencyCode='" + CurrencyCode +
                '}';
    }
}









