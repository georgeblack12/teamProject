package com.project.cavallo.controller;


import com.project.cavallo.dao.OrderRepository;
import com.project.cavallo.domain.HorsePayClass.HorsePay;
import com.project.cavallo.domain.HorsePayClass.HorsePayResponse;

//for servlets
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.text.ParseException;

/**
 * RestController to receive the horsePay JSON and send back the required JSON with the payment values.
 *
 * @author George Black.
 */
@RestController
public class HorsePayController {
    //order repository needed to run function with database
    @Autowired
    private OrderRepository orderRepository;


    /**
     * Method that takes the JSON needed for horsePay from the client and then sends back the JSON with the paymentSucess
     * added to it.
     *
     * @param hReceive The horsePay JSON that was received from the client.
     * @return The HorsePay JSON with the paymentSuccess added to it.
     * @author George Black
     */
    @PostMapping(value = {"horsePay"}, consumes = "application/json", produces = "application/json")
    public HorsePayResponse checkHorsePay(@RequestBody HorsePay hReceive, HttpSession session,
                                          @RequestParam("address") String address) throws ParseException {

        //get the Received JSON and get the JSON with paymentSuccess added.
        HorsePayResponse hSend = new HorsePayResponse(hReceive);

        //if the Payment is successful put the iceCreamOrder in the database.
        int insert = orderRepository.createOrderFromHResponse(hSend, address);

        //if the iceCreamOrder has been added to the database (aka if the payment was successful)
        //set the orderID as a session attribute. This will be used for entering data into orderContains
        if (insert == 1) {
            session.setAttribute("orderID", orderRepository.getOrderID(hSend));
        }
        //else do not add an orderID;


        //return the JSON with paymentSuccess added
        return hSend;
    }
}














