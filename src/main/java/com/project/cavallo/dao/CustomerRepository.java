package com.project.cavallo.dao;

import com.project.cavallo.domain.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CustomerRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;


    public List<Customer> findAll() {
        String sql = "select * from customer";
        RowMapper<Customer> rowMapper = new BeanPropertyRowMapper<>(Customer.class);
        return jdbcTemplate.query(sql, rowMapper);
    }



    public Customer login(String username, String password) throws Exception {

        RowMapper<Customer> rowMapper = new BeanPropertyRowMapper<>(Customer.class);

        String sql = "select * from customer where customerName=? and password=?";

        Customer customer = jdbcTemplate.queryForObject(sql, rowMapper, username, password);


        return customer;
    }




    //get the customerId of the person that logs in.
    public int getLoginId(String username,String password) throws Exception {
        Customer customer= this.login(username,password);
        return customer.getCustomerID();
    }







}
