package com.project.cavallo.domain.HorsePayClass;

import com.fasterxml.jackson.annotation.JsonGetter;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

import java.util.HashMap;


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
     * Constructor that randomly generates a number between 1 and 100. If randomInt is less than 30, then Status is set
     * to false and the reason why it was declined. Otherwise, the Status is set to true and the
     * reason is set to "Payment Successful".
     * @author George Black
     */
    PaymentResult() {
        //generate random number
        int randomInt =randomInt(100);
        System.out.println(randomInt);

        //create map with the original values to be set for the Status and reason
        HashMap<Boolean,String>resultSet=getAttributes(randomInt,30);

        //set the Status to the first Boolean in the HashMap Note: the first key is the only
        //key in the Map
        Status=resultSet.keySet().stream().findFirst().get();

        //get the proper reason based off of what the String value is in  resultSet.
        //Note: the first value is the only value in the Map
        reason=getReason(resultSet.values().stream().findFirst().get());
    }


    /**
     * Takes two numbers if the errorCaused number is less than numberReturned, then true and "Payment Successful is
     * added otherwise false and "Need to find Reason is added. This function will be used in the class's constructor.
     * This is to be used in the constructor.
     *
     * @author George Black
     *
     * @param numberReturned The number that was returned by the randomInt method.
     * @param errorCaused The number used to decide when the number returned is an unsuccessful.
     * @return A map with the boolean for the paymentResult Status for the key, and a value who's String is used to
     * get the reason for the paymentResult.
     */
    private HashMap<Boolean,String> getAttributes(int numberReturned, int errorCaused){
        HashMap<Boolean,String> resultToAdd = new HashMap<Boolean,String>();

        if(numberReturned>errorCaused){
            resultToAdd.put(true,"Payment Successful");
        } else{
            resultToAdd.put(false,"Need to find Reason");
        }
        return resultToAdd;
    }

    /**
     * Method to get the reason of the payment success. If the message is not "Need to find Reason" (aka the
     * message is payment successful. This will be used in the constructor.
     *
     * @author George Black
     * @param originalReason The reason that we were given from the map that is returned by the getAttributes
     *                       method
     * @return A String to be used as the reason in this payment resul t
     */
    private String getReason(String originalReason){
        if(originalReason.equals("Need to find Reason")){
           int newRandom= randomInt(3);
           if(newRandom>1){
               return "Transaction declined by bank";
           }
           else{
               return "internal error with\n" +
                       "HorsePay serve ";
           }
        } else{
            return originalReason;
        }
    }


    /**
     * Method that returns a random number between 1 and the max.
     * @param max the maximum number we could get
     * @return a random number between 1 and the max.
     * @author Unkown
     * @See https://www.educative.io/edpresso/how-to-generate-random-numbers-in-java
     * Modifying author: George Black
     */
    private int randomInt(int max){
        return  (int) (Math.random() * (max) + 1);
    }


    //setters and getters required for JSON. Thanks, George Black
    @JsonGetter("Status")
    public boolean isStatus() {
        return Status;
    }


    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }


}
