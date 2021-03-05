package com.project.cavallo.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HorsePayControler {

    @PostMapping("checkHorseValue")
    public void checkHorsePay(){
        System.out.println("we got em");
    }

}
