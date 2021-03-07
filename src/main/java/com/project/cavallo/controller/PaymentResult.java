package com.project.cavallo.controller;

import com.project.cavallo.controller.HorsePay;

public class PaymentResult {
    private boolean Status;
    private String reason;

     PaymentResult(HorsePay hReceive) {
         Status = hReceive.isForcePaymentSatusReturnType();
         this.reason = "forcePaymentSatusReturnType set";
     }

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
