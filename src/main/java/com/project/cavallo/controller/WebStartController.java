package com.project.cavallo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * Controller whose only purpose is make it so when the / is entered into the url, the user is sent to
 * "/pages/home.jsp". This method occures during the start up of the application
 *
 * @author George Black
 */
@Controller
public class WebStartController {

    //The moment I call slash go to /pages/datahome.jsp
    @RequestMapping("/")
    public String home() {
        return "/pages/home.jsp";
    }
}
