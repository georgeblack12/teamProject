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


    /**
     * Method to return a Optional Customer in the database that has the specified Username and Password.Optional<Customer> is used
     * so we do not have to deal with a return of Null.
     *
     * Original author: Hanxiong Wang
     * Modifying author: George Black
     *
     * @param username The email of the Customer
     * @param password the password of the Customer
     * @return an Optional<Customer> in the database with the specified username (email) and password.
     * @throws Exception Exception thrown if the values entered for username and password cause a bad sql statement to occur.
     */
    public Optional<Customer> login(String username, String password) throws Exception {

        RowMapper<Customer> rowMapper = new BeanPropertyRowMapper<>(Customer.class);
        Customer customer = null;

        try {
            String sql = "select * from customer where customerName=? and password=?";

            //get the customer with the specified username(email) and password.
            customer = jdbcTemplate.queryForObject(sql, rowMapper, username, password);


        //If Customer is not in the database display the user does not exist in the database
        } catch (DataAccessException ex){
            System.out.println("User does not exist");
        }
        return Optional.ofNullable(customer);
    }


    /**
     * Gets the CustomerID of the Customer in the database with the specified username and password.
     *
     * @author George Black
     * @param username The email of the Customer in the database
     * @param password The password of the Customer in the database
     * @return the CustomerID of the Customer with the specified username and login.
     * @throws Exception thrown if the values entered for username and password cause a bad sql statement to occur.
     */
    //get the customerId of the person that logs in.
    public int getLoginId(String username,String password) throws Exception {
        Customer customer= this.login(username,password).orElse(new Customer());
        return customer.getCustomerID();
    }
}
