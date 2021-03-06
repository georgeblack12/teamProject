package com.project.cavallo.domain;


public class HorsePayResponse {
    private final PaymentSuccess hResult;
    private final HorsePayReceive hReceive;

    public HorsePayResponse(HorsePayReceive hReceive) {
        this.hResult = new PaymentSuccess(hReceive);
        this.hReceive = hReceive;
    }

    public String getPaymentSuccessMessage(){
        return hResult.getReason();
    }


    //for testing purposes
    @Override
    public String toString() {
        return "HorsePaySend{" +
                hResult +
                hReceive +
                '}';
    }
}
