package com.project.cavallo.controller;

import com.project.cavallo.Response.IceCreamRes;
import com.project.cavallo.domain.Order;
import com.project.cavallo.service.IstatisticService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collector;
import java.util.stream.Collectors;

/**
 * Statistics
 */
@CrossOrigin(origins = "*")
@RestController
@RequestMapping(value = "/tj")
public class StatisticsController {


    @Autowired
    private IstatisticService service;

    /**
     * Sales by taste
     */
    @GetMapping(value = "/getXlByCw")
    public List<IceCreamRes> getXlByCw() {
        return service.getXlByCw();
    }

    /**
     * Calculate daily, monthly and annual order quantity
     */
    @GetMapping(value = "/getOrderNumByDate")
    public List<Order> getOrderNumByDate() {

        return service.getOrderNumByDate();
    }

}