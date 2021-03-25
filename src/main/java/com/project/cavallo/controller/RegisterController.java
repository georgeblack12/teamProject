package com.project.cavallo.controller;

import com.project.cavallo.dao.CustomerRepository;
import com.project.cavallo.dao.UserRepository;
import com.project.cavallo.domain.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * Rest Controller to add a customer in the Customer table and a User in the User table after the client has registered.
 * Additionally checks to see if a User has already registered an email entered by the client. These methods are to be
 * used with the registration page.
 *
 * @author George Black
 */
@RestController
public class RegisterController {

    //to see if an email is in the User table.
    @Autowired
    UserRepository userRepository;

    //to add Customer to Customer table
    @Autowired
    CustomerRepository customerRepository;


    /**
     * Method to see if the email entered by the client is located in the User table.
     *
     * @param email The email the client has entered.
     * @return Returns true if the email is in use (in the User table). Returns false otherwise.
     * @author George Black
     */
    @PostMapping(value = {"checkEmailInUse"}, produces = "application/json")
    public boolean checkEmailInUse(@RequestBody String email) {


        //if the email is in the User table the email is returned, otherwise the string is set to "no email
        String emailInUse = userRepository.checkEmail(email).orElse("no email");

        if (emailInUse.equals("no email")) {
            return false;
        } else {
            return true;
        }
    }


    /**
     * Method that enters the customer info the client entered/registered into a value in the customer table and a value in the
     * User table.
     *
     * @param customer The customer the client entered and is registering as a Customer and User.
     * @author George Black
     */
    @PostMapping(value = {"registerCustomerUser"}, consumes = "application/json")
    public void insertUserAndCustomer(@RequestBody Customer customer) {
        customerRepository.addUserAndCustomer(customer);
    }

}
