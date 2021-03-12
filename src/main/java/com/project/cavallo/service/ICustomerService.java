package com.project.cavallo.service;


import java.util.HashMap;

public interface ICustomerService {

    HashMap<Boolean,String> login(String username, String password) throws Exception;

}



