package com.project.cavallo.dao;

import com.project.cavallo.domain.Customer;
import com.project.cavallo.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.support.DataAccessUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.servlet.http.HttpSession;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Repository
public class UserRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;


//    public List<Customer> findAll() {
//        String sql = "select * from customer";
//        RowMapper<Customer> rowMapper = new BeanPropertyRowMapper<>(Customer.class);
//        return jdbcTemplate.query(sql, rowMapper);
//    }


    /**
     * Method to return a Optional Customer in the database that has the specified Username and Password.Optional<Customer> is used
     * so we do not have to deal with a return of Null.
     * <p>
     * Original author: Hanxiong Wang
     * Modifying author: George Black
     *
     * @param username The email of the Customer
     * @param password the password of the Customer
     * @return an Optional<Customer> in the database with the specified username (email) and password.
     * @throws Exception Exception thrown if the values entered for username and password cause a bad sql statement to occur.
     */
    public Optional<User> login(String username, String password) {

        RowMapper<User> rowMapper = new BeanPropertyRowMapper<>(User.class);
        User user= null;

        try {
            String sql = "select * from `User` where email=? and password=?";

            //get the customer with the specified username(email) and password.
            user = jdbcTemplate.queryForObject(sql, rowMapper, username, password);


            //If Customer is not in the database display the user does not exist in the database
        } catch (DataAccessException ex) {
            System.out.println("User does not exist");
        }
        return Optional.ofNullable(user);
    }




    public Optional<String> checkEmail(String email){
        RowMapper<User> rowMapper = new BeanPropertyRowMapper<>(User.class);
        String result=null;
        try {
            String sql = "SELECT email from `User` WHERE email =?";
            result = jdbcTemplate.queryForObject(sql, new Object[]{email}, String.class);
        } catch(DataAccessException ex){
            System.out.println("Email does not exist in the system");

        }

        return Optional.ofNullable(result);
    }













}

