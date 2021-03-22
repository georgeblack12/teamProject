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
import java.util.Random;

@Repository
public class CustomerRepository{

    @Autowired
    JdbcTemplate jdbcTemplate;


    public Optional<Customer> getCustomerFromEmail(String email) {
        RowMapper<Customer> rowMapper = new BeanPropertyRowMapper<>(Customer.class);
        Customer customer = null;

        try {
            String sql = "SELECT * from Customer where email=?";

            customer = jdbcTemplate.queryForObject(sql, rowMapper, email);
            System.out.println(customer);
        } catch(DataAccessException ex){
            System.out.println("customer does not exist");
        }
        return Optional.ofNullable(customer);
    }

    public void addUserAndCustomer(Customer customer){
        String sqlUser="INSERT INTO User (email,password) values (?,?)";
        int insertUser=jdbcTemplate.update(sqlUser,customer.getEmail(),customer.getPassword());

        if(insertUser==1){
            System.out.println("User added");
        }

        String sqlCustomer="INSERT INTO Customer (email,customerID,`name`,phoneNo) values (?,?,?,?)";
        int insertCustomer=jdbcTemplate.update(sqlCustomer,customer.getEmail(),getUniqueCustID(),
                customer.getName(),customer.getPhoneNo());

        if(insertCustomer==1){
            System.out.println("");
        }
    }

    private String getUniqueCustID(){
        while(true){
            String custID=generateCustomerID();

            if(!getEmailFromID(custID).isPresent()){
                return custID;
            }
        }
    }

    private Optional<String> getEmailFromID(String custID){
        String email=null;
        try {
            String sql = "SELECT email FROM Customer where customerID="+custID;

            email = jdbcTemplate.queryForObject(sql,String.class);
        } catch(DataAccessException ex){
            System.out.println("customer does not exist with the given ID");
        }
        return Optional.ofNullable(email);
    }







    /**
     * Generating a random string, found here
     * https://www.programiz.com/java-programming/examples/generate-random-string
     * Original Author - Programiz
     * Modifying Author - Madeleine Towes, 14/03/21
     *
     * Generates a random customer ID consisting of a String of length 3
     * and a random three digit number.
     *
     * From a String of the alphabet and Random, uses a StringBuilder to
     * create a String with the length of 3
     * Uses Random to generate a number between 100 and 999
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
