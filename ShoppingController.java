package com.project.cavallo.controller;


import com.project.cavallo.domain.IceCream;
import com.project.cavallo.domain.Shopping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/shoppinig")
public class ShoppingController {



    @PostMapping(value = "/checkout")
    public String order(@RequestBody Shopping order){


        System.out.println(order.getIceCreamList());

        for (IceCream ice:order.getIceCreamList()){
            System.out.println(ice.getId());
            System.out.println(ice.getType());
            System.out.println(ice.getSize());
            System.out.println(ice.getNumber());
            System.out.println(ice.getPrice());
        }

        return "success";

    }
}
