package com.project.cavallo.controller;

import com.project.cavallo.service.impl.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @PostMapping(value = "/login")
    public boolean login(@RequestParam("username") String username, @RequestParam("password") String password) {


        return customerService.login(username, password);
    }


}
