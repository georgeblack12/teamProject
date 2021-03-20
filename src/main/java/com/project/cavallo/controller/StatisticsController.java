package com.project.cavallo.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;



@RestController
public class StatisticsController {

    @PostMapping(value = {"analyticsDate"}, consumes = "application/json")
    public void getAdminDate(@RequestBody String dateString, Model model){
        System.out.println(dateString);
    }

}
