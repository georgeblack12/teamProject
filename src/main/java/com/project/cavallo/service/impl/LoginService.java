package com.project.cavallo.service.impl;

import com.project.cavallo.dao.UserRepository;
import com.project.cavallo.domain.User;
import com.project.cavallo.service.ILoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

/**
 * Service Used to see if a client can login to the website.
 * Original Author: Hanxiong Wang.
 * Modifying Author: George Black
 */
@Service
public class LoginService implements ILoginService {

    //used to perform sql on the User table.
    @Autowired
    private UserRepository userRepository;

    /**
     * Method to see if a person can login. If the entered email and password belong to a User in the database, then they
     * can login. The single key in the map is then set to true, and the String is not important. If the email and
     * password entered do not belong to a User in the database, the single key in the map is set to false, and the
     * value is a String giving the reason they were unable to login.
     *
     * Original Author: Hanxiong Wang
     * Modifying Author: George Black
     *
     * @param email    The email of a potential User in the database (Call them U).
     * @param password The potential password of U.
     * @return A map with a single key and value. The key is a boolean saying if the credentials allow for a login,
     * and the String is an explanation of why they could not login. If the key is true, the String is not
     * important(The String has the word poop in it if you care to know).
     */
    public HashMap<Boolean, String> login(String email, String password) {
        User isUser = new User();

        //this will help us decide if the credentials entered allow for a login or the reason why the credentials
        //entered do not allow one to login.
        int reasonForFault = 0;

        //see if email is in the database.
        String possibleEmail = userRepository.checkEmail(email).
                orElse(new String());


        //if the email is in the database add +1 to reasonForFault
        if (possibleEmail.length() != 0) {
            reasonForFault += 1;
        }

        //if the email is the databse try to login with the entered email and password.
        if (reasonForFault == 1) {
            isUser = userRepository.login(email, password).orElse(new User());

        }

        //if the email and Password belong to a User add 1 to reason for fault.
        if (isUser.getEmail() != null) {
            reasonForFault += 1;
        }

        //return the map needed saying if login will occur and a message explaining reasoning (if the key
        //value is false).
        return reasonForLogin(reasonForFault);
    }


    /**
     * Method to be used with the reasonForFault integer in the login method. If 0 is reasonForFault we know that
     * an invalid email was entered. If 1 is reasonForFault, we know the email is valid, but the password entered does not
     * go with the email entered. If 2 is reasonForFault, we can login!
     *
     * @param loginReason the integer reasonForFault to help us decide if the credentials entered will allow for a
     *                    login.
     * @return A map with a single key and value. The key is a boolean saying if the credentials allow for a login,
     * and the String is an explanation of why they could not login. If the key is true, the String is not
     * important(The String has the word poop in it if you care to know).
     * @author George Black
     */
    private HashMap<Boolean, String> reasonForLogin(int loginReason) {

        HashMap<Boolean, String> resultToAdd = new HashMap<Boolean, String>();

        if (loginReason == 0) {
            resultToAdd.put(false, "Error! Invalid Email, try again");
            System.out.println("Email reason");
        } else if (loginReason == 1) {
            resultToAdd.put(false, "Error! Invalid Password, try again");
            System.out.println("password reason");
        } else {
            resultToAdd.put(true, "We are in this message doesnt mean anything. " +
                    "It can say anything. PPPPOOOP");
        }
        return resultToAdd;
    }


}


