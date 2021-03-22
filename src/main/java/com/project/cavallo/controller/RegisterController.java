package com.project.cavallo.controller;

import com.project.cavallo.dao.CustomerRepository;
import com.project.cavallo.dao.UserRepository;
import com.project.cavallo.domain.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RegisterController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    CustomerRepository customerRepository;


    @PostMapping(value = {"checkEmailInUse"},produces = "application/json")
    public boolean checkEmailInUse(@RequestBody String email){
        System.out.println("in check email");
        String emailInUse=userRepository.checkEmail(email).orElse("no email");

        if(emailInUse.equals("no email")){
            return false;
        }else{
            return true;
        }
    }


    @PostMapping(value = {"registerCustomerUser"}, consumes = "application/json")
    public void insertUserAndCustomer(@RequestBody Customer customer){
        customerRepository.addUserAndCustomer(customer);
    }

}
