package com.project.cavallo.service.impl;

import com.project.cavallo.dao.CustomerRepository;
import com.project.cavallo.domain.Customer;
import com.project.cavallo.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.HashMap;


//@Service
//@Transactional(rollbackFor = RuntimeException.class)
//public class CustomerService implements ICustomerService {
//
//    @Autowired
//    private CustomerRepository customerRepository;
//
//    public boolean login(String username, String password) {
//
//        //not necessary due to the the html
//        if (username == null || password == null) {
//            System.out.println("1");
//
//            return false;
//        }
//        try {
//            Customer customer = customerRepository.login(username, password);
//
//            boolean u = username.equals(customer.getCustomerName());
//            boolean p = password.equals(customer.getPassword());
//            System.out.println("2");
//            return u && p;
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        System.out.println("3");
//        return false;
//
//    }
//
//
//}

@Service
@Transactional(rollbackFor = RuntimeException.class)
public class CustomerService implements ICustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    public HashMap<Boolean,String> login(String email, String password) {

        int reasonForFault=0;

        Customer isEmail=customerRepository.getStringOrUsername("CustomerName",email).
                orElse(new Customer());
        System.out.println(isEmail);

        Customer isPassword=customerRepository.getStringOrUsername("password",password).
                orElse(new Customer());
        System.out.println(isPassword);



        if(isEmail.getCustomerID() != null){
            reasonForFault +=1;
        }

        if(isPassword.getCustomerID()!=null){
            reasonForFault+=2;
        }
        return reasonForLogin(reasonForFault,email,password);
    }



    private HashMap<Boolean,String> reasonForLogin(int loginReason,String email,String password) {

        HashMap<Boolean,String> resultToAdd = new HashMap<Boolean,String>();

        if(loginReason==0){
            resultToAdd.put(false,"Error! Invalid Entries, try again");
            System.out.println("login reason");
        } else if(loginReason==1){
            resultToAdd.put(false,"Error! Invalid Password, try again");
            System.out.println("password reason");
        } else if(loginReason==2){
            resultToAdd.put(false,"Error! Invalid Email, try again");
            System.out.println("login reason");
        } else{
            resultToAdd=getLoginID(email,password);
            System.out.println("possible entry");
        }
        return resultToAdd;
    }

    private HashMap<Boolean,String> getLoginID(String email,String password)  {
        HashMap<Boolean,String> resultToAdd = new HashMap<Boolean,String>();


        Customer customer = customerRepository.login(email,password).orElse(new Customer());
        if(customer.getCustomerID() == null){
            resultToAdd.put(false,"Error! invalid password try again");
        } else{
            resultToAdd.put(true,"We are in this message doesnt mean anything. " +
                    "It can say anything. PPPPOOOP");
        }
        return resultToAdd;

    }

















}
