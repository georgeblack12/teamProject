package com.project.cavallo.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;


@RestController
public class StatisticsController {

    @PostMapping(value = {"analyticsDate"}, consumes = "application/json",produces = "application/json")
    public LocalDate getAdminDate(@RequestBody String dateString, Model model){

        DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("dd/MM/yyyy");

        LocalDate dateToGet= LocalDate.parse(dateString,dateFormat);
        model.addAttribute(dateToGet);
        return dateToGet;
    }





}
