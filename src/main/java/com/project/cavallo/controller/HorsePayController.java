package com.project.cavallo.controller;


import org.springframework.web.bind.annotation.*;

@RestController
public class HorsePayController {




    @PostMapping(value="horsePay", consumes="application/json", produces="application/json")
    public HorsePayResponse checkHorsePay(@RequestBody HorsePay hReceive){
        HorsePayResponse hSend = new HorsePayResponse(hReceive);
        System.out.println(hSend);
        return hSend;
    }

//    @PostMapping(value="horsePay", consumes="application/json", produces="application/json")
//    public HorsePay checkHorsePay(@RequestBody HorsePay hReceive){
//
//        return hReceive;
//    }








}
