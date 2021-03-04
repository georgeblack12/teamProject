package com.project.cavallo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Controller
public class WebStartConfig {

    //going ahead and creating this class


    //The moment I call slash go to /pages/datahome.jsp
    @RequestMapping("/")
    public String home(){
        return "/pages/home.jsp";
    }

}
