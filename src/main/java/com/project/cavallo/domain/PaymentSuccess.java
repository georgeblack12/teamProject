package com.project.cavallo.domain;

 class PaymentSuccess {
    private boolean Status;
    private String reason;

     PaymentSuccess(HorsePayReceive hReceive) {
         Status = hReceive.isForcePaymentSatusReturnType();
         this.reason = "forcePaymentSatusReturnType set";
     }

     public String getReason() {
         return reason;
     }

     @Override
     public String toString() {
         return "PaymentSuccess{" +
                 "Status=" + Status +
                 ", reason='" + reason + '\'' +
                 '}';
     }
 }
