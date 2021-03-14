package com.project.cavallo.service.impl;

import com.project.cavallo.dao.UserRepository;
import com.project.cavallo.domain.User;
import com.project.cavallo.service.ILoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class LoginService implements ILoginService {

    @Autowired
    private UserRepository userRepository;

    public HashMap<Boolean, String> login(String email, String password) {
        User isUser = new User();

        int reasonForFault = 0;

        String possibleEmail = userRepository.checkEmail(email).
                orElse(new String());
        System.out.println(possibleEmail);

        if (possibleEmail.length() != 0) {
            reasonForFault += 1;
            System.out.println("we have a valid email");
        }

        if (reasonForFault == 1) {
            isUser = userRepository.login(email, password).orElse(new User());

        }
        System.out.println(isUser);

        if (isUser.getEmail() != null) {
            reasonForFault += 1;
        }

        return reasonForLogin(reasonForFault);
    }


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
            System.out.println("We are in");
        }
        return resultToAdd;
    }


}


