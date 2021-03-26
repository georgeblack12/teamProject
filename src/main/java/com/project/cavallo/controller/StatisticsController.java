package com.project.cavallo.controller;

import com.project.cavallo.dao.StatisticsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

/**
 * Rest Controller used to obtain the proper Statistics needed on the analytics page.
 * <p>
 * Original Author: Yotam Chan Cheng
 * Modifying Author: George Black
 */
@RestController
public class StatisticsController {


    //to connect to the database.
    @Autowired
    StatisticsRepository statisticsRepository;

    /**
     * Method that gets the total number of iceCreamOrders from a given date specified by the admin.
     *
     * @param dateString The date the admin has entered
     * @return The total number of iceCreamorders that have occurred on the date that the admin entered.
     * @author George Black
     */
    @PostMapping(value = {"analyticsDate"}, consumes = "application/json", produces = "application/json")
    public int getAdminDateSold(@RequestBody String dateString) {

        DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("dd/MM/yyyy");

        LocalDate dateToGet = LocalDate.parse(dateString, dateFormat);

        return statisticsRepository.getTotalOrdersFromDate(dateToGet);
    }

    /**
     * Method that returns a list where each value is a number of iceCreamOrders that occurred during a related
     * time on the date entered by the admin. For example, the first number in the list is the number of iceCreamOrders
     * that occurred between 11-12 on the entered date, the second number in the list is the number of iceCreamOrders
     * that occurred between 12-1 on the entered date,..., the last number in the list is the number of iceCreamOrders
     * that occurred between 17-18 on the entered date. NOTE: Using a list instead of a map made using JSPs easier, so
     * that is why I am using a list.
     *
     * @param dateString The specified date entered by the admin.
     * @return A List where each value relates to the number of iceCreamOrders that have occurred during the related
     * time of the date entered by the admin.
     * @author George Black
     */
    @PostMapping(value = {"getYForOrder"}, consumes = "application/json", produces = "application/json")
    public List<Integer> getYForOrder(@RequestBody String dateString) {
        DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("dd/MM/yyyy");

        LocalDate dateToGet = LocalDate.parse(dateString, dateFormat);

        return statisticsRepository.getYForOrderGraph(dateToGet);
    }

}
