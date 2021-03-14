package com.project.cavallo.service;


import java.util.HashMap;

public interface ILoginService {

    HashMap<Boolean,String> login(String username, String password) throws Exception;

}



