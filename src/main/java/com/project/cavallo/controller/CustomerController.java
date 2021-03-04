package com.project.cavallo.controller;

import com.project.cavallo.dao.CustomerRepository;
import com.project.cavallo.service.impl.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import javax.servlet.http.HttpSession;

//
//@RestController
//@RequestMapping("/customer")
//public class CustomerController {
//
//    @Autowired
//    private CustomerService customerService;
//
//    @PostMapping(value = "/login")
//    public boolean login(@RequestParam("username") String username, @RequestParam("password") String password) {
//
//
//        return customerService.login(username, password);
//    }




//@RequestMapping("/customer")
@RestController
public class CustomerController {


    @Autowired
    private CustomerService customerService;


    @PostMapping(value = {"login", "pages/login"})
    public ModelAndView login(@RequestParam("username") String username, @RequestParam("password") String password, Model model) throws Exception {
        boolean ableToLogin = customerService.login(username, password);
        ModelAndView mv = new ModelAndView();
        System.out.println(username);

        if(ableToLogin){
            //set the session for attribute of CustomerId will be done later?
            System.out.println("Login successful");


            mv.setViewName("redirect:/pages/shopping.jsp");
        }
        else {
            System.out.println("error here");
            model.addAttribute("ERROR", "Invalid Entries");

            mv.setViewName("redirect:/pages/home.jsp");

        }
        return mv;
    }




}
