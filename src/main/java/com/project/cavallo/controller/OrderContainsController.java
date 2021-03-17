package com.project.cavallo.controller;


import com.project.cavallo.dao.IceCreamRepository;
import com.project.cavallo.dao.OrderContainsRepository;
import com.project.cavallo.domain.IceCream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.persistence.OrderColumn;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@RestController
public class OrderContainsController {

    @Autowired
    IceCreamRepository iceCreamRepository;
    @Autowired
    OrderContainsRepository orderContainsRepository;

    @PostMapping(value = "getIceCreams", consumes = "application/json")
    public void createListForOrders(@RequestBody ArrayList<IceCream> iceCreamsWithoutIDs, HttpSession session) {

        HashMap<Integer, Integer> iceCreamForOrderContains = new HashMap<>();

        int orderID = (Integer) session.getAttribute("orderID");


        for (IceCream iceCream : iceCreamsWithoutIDs) {
            int iceCreamId = iceCreamRepository.getIceCreamId(iceCream);

            if (iceCreamForOrderContains.containsKey(iceCreamId)) {
                int addAnother = iceCreamForOrderContains.get(iceCreamId) + 1;
                iceCreamForOrderContains.replace(iceCreamId, addAnother);
            } else {
                iceCreamForOrderContains.put(iceCreamId, 1);
            }
        }


        for (Map.Entry<Integer, Integer> entry : iceCreamForOrderContains.entrySet()) {
            orderContainsRepository.enterOrderContains(orderID, entry.getKey(), entry.getValue());
        }


    }


}


