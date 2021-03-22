package com.project.cavallo.controller;

import com.project.cavallo.dao.StatisticsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;


@RestController
public class StatisticsController {

    @Autowired
    StatisticsRepository statisticsRepository;

    @PostMapping(value = {"analyticsDate"}, consumes = "application/json",produces = "application/json")
    public int getAdminDateSold(@RequestBody String dateString){

        DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("dd/MM/yyyy");

        LocalDate dateToGet= LocalDate.parse(dateString,dateFormat);

        return statisticsRepository.getTotalOrdersFromDate(dateToGet);

    }

    @PostMapping(value = {"getYForOrder"}, consumes = "application/json",produces = "application/json")
    public List<Integer> getYForOrder(@RequestBody String dateString){
        DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("dd/MM/yyyy");

        LocalDate dateToGet= LocalDate.parse(dateString,dateFormat);

        return statisticsRepository.getYForOrderGraph(dateToGet);
    }






}
