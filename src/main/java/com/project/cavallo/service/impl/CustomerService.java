package com.project.cavallo.service.impl;

import com.project.cavallo.dao.CustomerRepository;
import com.project.cavallo.domain.Customer;
import com.project.cavallo.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional(rollbackFor = RuntimeException.class)
public class CustomerService implements ICustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    public boolean login(String username, String password) {
        if (username == null || password == null) {
            System.out.println("1");
            return false;
        }
        try {
            Customer customer = customerRepository.login(username, password);

            boolean u = username.equals(customer.getCustomerName());
            boolean p = password.equals(customer.getPassword());
            System.out.println("2");
            return u && p;
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("3");
        return false;

    }


}
