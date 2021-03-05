package com.project.cavallo.controller;

import com.project.cavallo.dao.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@RestController
public class HorsePayController {




    @PostMapping(value="/horsePay")
    public void checkHorsePay(){
        System.out.println("we got em");
    }



}
