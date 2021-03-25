package com.project.cavallo.dao;

import com.project.cavallo.domain.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;


import java.util.Optional;
import java.util.Random;


/**
 * Repository that pulls data and enters data in the Customer table of the database.
 *
 * authors: George Black, Maddie Towes
 */
@Repository
public class CustomerRepository {

    //so we can perform out commands on the database
    @Autowired
    JdbcTemplate jdbcTemplate;


    /**
     * Method that gets the Customer from the Customer table with the entered email. Optional is returned in case
     * a user does not exist with the entered email.
     *
     * @param email The email we want to see if it belongs to a Customer in the Customer table.
     * @return An optional Customer with the given email.
     *
     * Note: If there is not a Customer with the given email, we will use
     * the value null to show this later on in the program.
     */
    public Optional<Customer> getCustomerFromEmail(String email) {
        RowMapper<Customer> rowMapper = new BeanPropertyRowMapper<>(Customer.class);
        Customer customer = null;

        try {
            String sql = "SELECT * from Customer where email=?";

            customer = jdbcTemplate.queryForObject(sql, rowMapper, email);
            System.out.println(customer);
        } catch (DataAccessException ex) {
            //do nothing person is not in the database so that is we return Customer with null values
        }
        return Optional.ofNullable(customer);
    }


    /**
     * Method that adds a Customer to the Customer table and takes the Customer's email and password to add a User. This is
     * done because a Customer isa User.
     *
     * @param customer The customer to be added to the databases Customer and User tables.
     * @author George Black
     */
    public void addUserAndCustomer(Customer customer) {

        //add needed customer values to the User table
        String sqlUser = "INSERT INTO User (email,password) values (?,?)";
        jdbcTemplate.update(sqlUser, customer.getEmail(), customer.getPassword());


        //add customer to the database
        String sqlCustomer = "INSERT INTO Customer (email,customerID,`name`,phoneNo) values (?,?,?,?)";
        jdbcTemplate.update(sqlCustomer, customer.getEmail(), getUniqueCustID(),
                customer.getName(), customer.getPhoneNo());

    }

    /**
     * Method that keeps generating a customerID until the customerID generated does not belong to a Customer
     * in the database. This method is to be used in the addUserAndCustomer method.
     *
     * @return The uniquely generated customerID that is not located in the database.
     * @author George Black
     */
    private String getUniqueCustID() {


        while (true) {
            String custID = generateCustomerID();

            //if the customerID does not belong to a customer in the database return the generated customerID
            if (!getEmailFromID(custID).isPresent()) {
                return custID;
            }
        }
    }

    /**
     * Method that gets the email of the customer with the given customerID. Optional is returned in case there does
     * not exist a customer with the entered customerID.
     *
     * @param custID The customerID we want to know which email corresponds to (in any).
     * @return an Optional email that corresponds to the entered customerID. Optional in case the customerID does not
     * belong to any Customer.
     * @author George Black
     */
    private Optional<String> getEmailFromID(String custID) {
        String email = null;
        try {
            String sql = "SELECT email FROM Customer where customerID=" + custID;

            email = jdbcTemplate.queryForObject(sql, String.class);
        } catch (DataAccessException ex) {
            //do nothing, no email corresponds to the given ID. return a String containing null
        }

        return Optional.ofNullable(email);
    }


    /**
     * Generating a random string, found here
     * https://www.programiz.com/java-programming/examples/generate-random-string
     *
     * Original Author - Programiz
     * Modifying Author - Madeleine Towes, 14/03/21
     *
     * Generates a random customer ID consisting of a String of length 3
     * and a random three digit number.
     *
     * From a String of the alphabet and Random, uses a StringBuilder to
     * create a String with the length of 3
     * Uses Random to generate a number between 100 and 999
     *
     * @return String of the random String and random number
     */
    private String generateCustomerID() {
        //generates String
        String alphabet = "abcdefghijklmnopqrstuvwxyz";
        StringBuilder s = new StringBuilder();
        Random r = new Random();
        for (int i = 0; i < 3; i++) {
            int index = r.nextInt(alphabet.length());
            char randomChar = alphabet.charAt(index);
            s.append(randomChar);
        }

        //generates digits
        Random r2 = new Random();
        int i = r2.nextInt(999 - 100) + 100;

        return String.valueOf(s.append(i));
    }

}
