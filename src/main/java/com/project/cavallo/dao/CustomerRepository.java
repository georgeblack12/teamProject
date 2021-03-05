package com.project.cavallo.dao;

import com.project.cavallo.domain.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public class CustomerRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;


    public List<Customer> findAll() {
        String sql = "select * from customer";
        RowMapper<Customer> rowMapper = new BeanPropertyRowMapper<>(Customer.class);
        return jdbcTemplate.query(sql, rowMapper);
    }



    public Optional<Customer> login(String username, String password) throws Exception {

        RowMapper<Customer> rowMapper = new BeanPropertyRowMapper<>(Customer.class);
        Customer customer = null;

        try {
            String sql = "select * from customer where customerName=? and password=?";

            customer = jdbcTemplate.queryForObject(sql, rowMapper, username, password);



        } catch (DataAccessException ex){
            System.out.println("User does not exist");
        }
        return Optional.ofNullable(customer);
    }




    //get the customerId of the person that logs in.
    public int getLoginId(String username,String password) throws Exception {
        Customer customer= this.login(username,password).orElse(new Customer());
        System.out.println(customer);
        return customer.getCustomerID();
    }







}
