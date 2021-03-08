package com.project.cavallo.controller;


import com.project.cavallo.HorsePayClass.HorsePay;
import com.project.cavallo.HorsePayClass.HorsePayResponse;
import com.project.cavallo.dao.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

/**
 * RestController to receive the horsePay Json and send back the required JSon with the payment values.
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
     * @author George Black
     * @param hReceive The horsePay JSON that was received from the client with needed values.
     * @param totalCost The totalCost of the order.
     * @return The HorsePay JSON with the paymentSuccess added to it.
     */
    @PostMapping(value={"horsePay","horsePay"}, consumes="application/json", produces="application/json")
    public HorsePayResponse checkHorsePay(@RequestBody HorsePay hReceive, @RequestParam("totalCost") float totalCost){

        //get the Received JSON and get the JSON with paymentSuccess added.
        HorsePayResponse hSend = new HorsePayResponse(hReceive);

//        System.out.println(totalCost); for testing

        //if the Payment is successful put the order in the database.
        orderRepository.createOrderFromHResponse(hSend,totalCost);


//        System.out.println(hSend); for testing

        //return the JSON with paymentSuccess added
        return hSend;
    }













}
