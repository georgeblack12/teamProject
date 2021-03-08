package com.project.cavallo.HorsePayClass;

import com.fasterxml.jackson.annotation.JsonGetter;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;


/**
 * A class used to simulate if the payment was successful or not when the original horsePay JSON is sent in. Randomly
 * sets the values of Status and reason.
 * @author George Black
 */
//All Json properties are added to put the JSON in the same order as the JSON shown in dans examples.
@JsonPropertyOrder({ "Status", "reason" })
public class PaymentResult {

    //only capital S in Status to make this identical to Dan's example given to us
    @JsonProperty("Status")
    private boolean Status;
    @JsonProperty("reason")
    private String reason;



    /**
     *
     * Constructor that randomly generates a number between 1 and 100. If randomInt is less than 30, than Status is set
     * to false and the reason is sent to "transaction declined by bank". Otherwise, the Status is set to true and the
     * reason is set to "Payment Successful". This simulates a "payment transaction" with horsePay.
     *
     * @author Unkown
     * @See https://www.educative.io/edpresso/how-to-generate-random-numbers-in-java
     * Modifying authoer: George Black
     *
     */
    PaymentResult() {

        //generate random number
        int randomInt = (int) (Math.random() * (100) + 1);
        System.out.println(randomInt);
        if (randomInt > 30) {
            Status = true;
            reason = "Payment Successful";
        } else {
            Status = false;
            reason = "transaction declined by bank";
        }
    }



    @JsonGetter("Status")
    public boolean isStatus() {
        return Status;
    }

    public void setStatus(boolean status) {
        Status = status;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }


}
