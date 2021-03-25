package com.project.cavallo.service;


import java.util.HashMap;

/**
 * Interface for the LoginService class. The interface only contains the method login.
 * Original Author: Hanxiong Wang
 * Modifying Author: George Black
 */
public interface ILoginService {
    /**
     * Method to see if a person can login. If the entered email and password belong to a User in the database, then they
     * can login. The single key in the map is then set to true, and the String is not important. If the email and
     * password entered do not belong to a User in the database, the single key in the map is set to false, and the
     * value is a String giving the reason they were unable to login.
     */
    HashMap<Boolean, String> login(String username, String password) throws Exception;

}



