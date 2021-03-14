package com.project.cavallo.domain.HorsePayClass;


/**
 * The JSON that is to be sent back with the payment results. This class is a subclass of horsePay because it has
 * all the attributes of horsePay. This makes it really easy to create and send back to the client.
 * @author George Black.
 */
public class HorsePayResponse extends HorsePay {

    private PaymentResult paymentResult;

    /**
     * Constructor that takes the a horsePay and finds out/creates the successPayment based on the results.
     * @param hPay normal horsePay that needs a paymentResult.
     */
    public HorsePayResponse(HorsePay hPay) {
        super(hPay.getStoreID(), hPay.getCustomerID(), hPay.getDate(), hPay.getTime(), hPay.getTimeZone(),
                hPay.getTransactionAmount(), hPay.getCurrencyCode());
        this.paymentResult = new PaymentResult();
    }

    //Getter required for JSON. Thanks, George Black
    public PaymentResult getPaymentResult() {
        return paymentResult;
    }

}











