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





@RestController
public class CustomerController {


    @Autowired
    private CustomerService customerService;

    @Autowired
    private CustomerRepository customerRepository;

//    //added to avoid having messy message displayed to
//    @RequestMapping("/invalidEntry")
//    public ModelAndView getError(Model model){
//        model.addAttribute("ERROR", "Error! Invalid Entries, please try again");
//        return new ModelAndView("/pages/home.jsp");
//    }





    @PostMapping(value = {"login", "pages/login"})
    public ModelAndView login(@RequestParam("username") String username, @RequestParam("password") String password,HttpSession session) throws Exception {
        boolean ableToLogin = customerService.login(username, password);
        ModelAndView mv = new ModelAndView();

        if(ableToLogin){
            int custId=customerRepository.getLoginId(username,password);
            session.setAttribute("custId",custId);
            mv.setViewName("/pages/shopping.jsp");

        }
        else {
            mv.addObject("ERROR", "Error! Invalid Entries, please try again");
             mv.setViewName("/pages/home.jsp");
        }
        return mv;
    }
}
