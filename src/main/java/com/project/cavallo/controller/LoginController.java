package com.project.cavallo.controller;

import com.project.cavallo.dao.CustomerRepository;
import com.project.cavallo.dao.StatisticsRepository;
import com.project.cavallo.domain.Customer;
import com.project.cavallo.service.impl.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

/**
 * A rest Controller for the Customer used to allow customer to log in into the website.
 * Original author: Hanxiong Wang
 * Modifying author: George Black
 */
@RestController
public class LoginController {

    @Autowired
    private LoginService loginService;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private StatisticsRepository statisticsRepository;


    /**
     * Method that takes the email and password that were entered into the website and checks to see if the values are
     * in the database. If they are in the database and they are customers, they are sent to the
     * shopping page. If they are in the database and they are admins, they are sent to the analytics page.
     * Additionally, if they can log in (as a customer), the corresponding customer value is set as a session
     * attribute. (This is used when the client tries to make a purchase). If the credentials are wrong. an Error
     * attribute is sent to be displayed.
     * <p>
     * Original author: Hanxiong Wang
     * Modifying autHor: George Black
     *
     * @param email    The email the user entered
     * @param password The password the user entered
     * @param session  An HttpSession attribute to store the client's Customer. (This will be used for shopping).
     * @return A ModelAndView that will change the client's page. If the log in was successful, and the user is a customer,
     * they are sent to the shopping page. If the log in was successful, and the user is an admin, they are sent to the analytics
     * page. If the log in is not successful, they return to the same page, and an error is displayed.
     */
    @PostMapping(value = {"login", "pages/login"})
    public ModelAndView login(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session) {

        HashMap<Boolean, String> credentials = loginService.login(email, password);
        //see if values are in database
        boolean ableToLogin = credentials.keySet().stream().findFirst().get();
        ModelAndView mv = new ModelAndView();
        if (ableToLogin) {
            //if the user is able to login see if they are a customer.
            Customer cust = customerRepository.getCustomerFromEmail(email).orElse(new Customer());
            //if the customer received has an email that is not null, then it is a customer in the databse. Set the c
            // ustomer as a session attribute and take the customer to the shopping page/
            if (cust.getEmail() != null) {
                session.setAttribute("cust", cust);
                System.out.println(cust);
                //move to a the shopping page
                mv.setViewName("redirect:/pages/shopping.jsp");
                //If the the customer cust has a null value for email then there is no customer in the
                //database that has the credentials. Therefore, the person able to login must be an admin, so take the user
                //to the admin page
            } else {
                //creates a statisticsRepository session attribute to make it very easy to display the needed
                //statistics needed to be shown on the analytics page.
                session.setAttribute("statsRepo", statisticsRepository);
                mv.setViewName("redirect:/pages/analytics.jsp");
            }

        } else {
            //error message to be displayed
            mv.addObject("ERROR", credentials.values().stream().findFirst().get());
            mv.setViewName("/pages/home.jsp");
        }
        return mv;
    }
}
