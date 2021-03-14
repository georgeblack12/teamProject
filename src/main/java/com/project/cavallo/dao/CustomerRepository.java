package com.project.cavallo.dao;

import com.project.cavallo.domain.Customer;
import com.project.cavallo.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Repository
public class CustomerRepository{

    @Autowired
    JdbcTemplate jdbcTemplate;


    public Optional<Customer> getCustomerFromEmail(String email) {
        RowMapper<Customer> rowMapper = new BeanPropertyRowMapper<>(Customer.class);
        Customer customer = null;

        try {
            String sql = "SELECT * FROM Customer where email=?";

            customer = jdbcTemplate.queryForObject(sql, rowMapper, email);
        } catch(DataAccessException ex){
            System.out.println("customer does not exist");
        }
        return Optional.ofNullable(customer);
    }
}
