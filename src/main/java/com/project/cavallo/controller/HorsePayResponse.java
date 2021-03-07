package com.project.cavallo.controller;


public class HorsePayResponse extends HorsePay {

    private PaymentResult paymentResult;

    public HorsePayResponse(HorsePay hPay) {
        super(hPay.getStoreID(), hPay.getCustomerID(), hPay.getDate(), hPay.getTime(), hPay.getTimeZone(),
                hPay.getTransactionAmount(), hPay.getCurrencyCode(), hPay.isForcePaymentSatusReturnType());
        this.paymentResult = new PaymentResult(hPay);
    }

    public PaymentResult getPaymentResult() {
        return paymentResult;
    }

    public void setPaymentSuccess(PaymentResult paymentResult) {
        this.paymentResult = paymentResult;
    }
}











