package com.project.cavallo.controller;

import com.project.cavallo.service.impl.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

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


    @PostMapping(value = "login")
    public ModelAndView login(@RequestParam("username") String username, @RequestParam("password") String password) {
        boolean ableToLogin = customerService.login(username, password);
        ModelAndView mv = new ModelAndView();

        if(ableToLogin){
            //set the session for attribute of CustomerId will be done later?
            System.out.println("Login successful");
            mv.setViewName("redirect:/shopping.html");
        }
        else{
            String errorMessage="Invalid data entered, please try again";
            System.out.println("unsuccessful login ");
            mv.setViewName("redirect:/index.jsp");
            mv.addObject("error",errorMessage);
        }
        return mv;
    }


}
