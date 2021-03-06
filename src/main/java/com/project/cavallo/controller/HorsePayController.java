package com.project.cavallo.controller;

import com.project.cavallo.domain.HorsePayReceive;
import com.project.cavallo.domain.HorsePayResponse;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class HorsePayController {




    @PostMapping(value="horsePay", consumes={"application/json"})
    public ModelAndView checkHorsePay(@RequestBody HorsePayReceive hReceive){
        HorsePayResponse hSend = new HorsePayResponse(hReceive);
        ModelAndView mv = new ModelAndView("/pages/payment.jsp","horsePayResponse", hSend);
        return mv;
    }





}
