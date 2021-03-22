package com.project.cavallo.controller;

import com.project.cavallo.dao.CustomerRepository;
import com.project.cavallo.dao.StatisticsRepository;
import com.project.cavallo.dao.UserRepository;
import com.project.cavallo.domain.Customer;
import com.project.cavallo.service.impl.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

/**
 * A rest Controller for the Customer used to allow customer to login into the website.
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
     * Method that takes the email (email) and password that were entered into the website and checks to see
     * if the values are in the database. If they are in the database, they are logged in and sent to the shopping page.
     * Additionally, if they are able to login they custId is set as a session attribute. (This is used for when the
     * client tries to make a purchase). If the credentials are wrong. an Error attribute is sent to be displayed.
     *
     * Original author: Hanxiong Wang
     * Modifying autHor: George Black
     *
     * @param email The email the customer entered
     * @param password The password the customer entered
     * @param session An HttpSession attribute to store the clients CustId. (This will be used for shopping).
     * @return A ModelAndView that will change the clients page. If the login was successful, they are sent to shopping.
     * If the login is not successful, they return back to the same page and an error is displayed.
     * @throws Exception Throws exception if insufficient values are entered by the client for the database to retrieve,
     * (an example would be a null value). Note: This will never happened due to the good work of our front end.
     */
    @PostMapping(value = {"login", "pages/login"})
    public ModelAndView login(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session) throws Exception {

        HashMap<Boolean,String> credentials = loginService.login(email, password);
        //see if values are in database
        boolean ableToLogin = credentials.keySet().stream().findFirst().get();
        ModelAndView mv = new ModelAndView();

        if(ableToLogin){
            //if values are in database pull the customerId that belongs to the person and store it as a
            //session attribute
            Customer cust= customerRepository.getCustomerFromEmail(email).orElse(new Customer());

            if(cust.getEmail() != null) {
                session.setAttribute("cust", cust);
                System.out.println(cust);
                //move to a the shopping page
                mv.setViewName("redirect:/pages/shopping.jsp");
            } else {
                session.setAttribute("statsRepo",statisticsRepository);
                mv.setViewName("redirect:/pages/analytics.jsp");
            }

        }
        else {
            //error message to be displayed

            mv.addObject("ERROR",credentials.values().stream().findFirst().get());
             mv.setViewName("/pages/home.jsp");
        }
        return mv;
    }
}
