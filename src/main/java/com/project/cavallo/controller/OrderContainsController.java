package com.project.cavallo.controller;


import com.project.cavallo.dao.IceCreamRepository;
import com.project.cavallo.dao.OrderContainsRepository;
import com.project.cavallo.domain.IceCream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Rest controller to get the ice cream (that is in an iceCreamorder) and add the related iceCreamId and
 * orderID to a value in the orderContains table.
 *
 * @author George Black
 */
@RestController
public class OrderContainsController {


    //to get the ice cream
    @Autowired
    IceCreamRepository iceCreamRepository;

    //to add values to the ordercontains table
    @Autowired
    OrderContainsRepository orderContainsRepository;

    /**
     * Method that receives the list of iceCreams the customer has ordered(without their respected IDs.
     * Gets the ice cream ids for each iceCream. Then adds each iceCreamID to an orderContains value with the
     * orderID from the customer's order.
     *
     * Original author: Hanxiong Wang
     * Modifying author: George Black
     *
     * @param iceCreamsWithoutIDs The iceCreams received from the client that the customer ordered (without the needed
     *                            iceCreamIDs.
     * @param session             The current Httpsession to get the attribute that contains the orderID of the customer's order.
     */
    @PostMapping(value = "getIceCreams", consumes = "application/json")
    public void createListForOrders(@RequestBody ArrayList<IceCream> iceCreamsWithoutIDs, HttpSession session) {

        //map to hold the iceCreamIDs and the number of times that iceCreamID appears in the order
        HashMap<Integer, Integer> iceCreamForOrderContains = new HashMap<>();


        int orderID = (Integer) session.getAttribute("orderID");


        for (IceCream iceCream : iceCreamsWithoutIDs) {
            //get the iceCreamId
            int iceCreamId = iceCreamRepository.getIceCreamId(iceCream);

            //let n be the value of the current key.
            //if the map contains that iceCreamId already then we need to add another value to the key's value stating
            //that this order actually contains n+1 of the iceCream with the given iceCreamOrderID.
            if (iceCreamForOrderContains.containsKey(iceCreamId)) {
                int addAnother = iceCreamForOrderContains.get(iceCreamId) + 1;
                iceCreamForOrderContains.replace(iceCreamId, addAnother);
            } else {
                //otherwise we need n=1
                iceCreamForOrderContains.put(iceCreamId, 1);
            }
        }

        //add the orderID, the iceCreamID and the number of times the iceCreamId occurs in the order to a value in the
        //order contains table.
        for (Map.Entry<Integer, Integer> entry : iceCreamForOrderContains.entrySet()) {
            orderContainsRepository.enterOrderContains(orderID, entry.getKey(), entry.getValue());
        }
    }
}


