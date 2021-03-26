package com.project.cavallo.dao;


import com.project.cavallo.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**
 * Repository used to get data from the User table in the database.
 */
@Repository
public class UserRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;


    /**
     * Method to return an Optional User in the database that has the specified Username and Password.
     *
     * Original author: Hanxiong Wang
     * Modifying author: George Black
     *
     * @param username The email of the User
     * @param password the password of the User
     * @return an Optional<User> in the database with the specified username (email) and password.
     * @throws Exception Exception thrown if the values entered for username and password cause a bad sql statement to
     * occur.
     */
    public Optional<User> login(String username, String password) {

        RowMapper<User> rowMapper = new BeanPropertyRowMapper<>(User.class);
        User user = null;

        try {
            String sql = "select * from `User` where email=? and password=?";

            //get the customer with the specified username(email) and password.
            user = jdbcTemplate.queryForObject(sql, rowMapper, username, password);
            //If Customer is not in the database display the user does not exist in the database
        } catch (DataAccessException ex) {
            //do nothing User with null values will be returned
        }
        return Optional.ofNullable(user);
    }

    /**
     * Method That returns the String of the email entered if the String entered is an email in the User table.
     * Otherwise, an empty String is returned.
     *
     * @author George Black
     *
     * @param email The email we want to see if it is in the User table.
     * @return A String that is either empty or an email in the User table based on if the value entered in the
     * parameter is an email in the User table.
     */
    public Optional<String> checkEmail(String email) {
        String result = null;
        try {
            String sql = "SELECT email FROM `User` WHERE email =?";
            //Note: we are not planning on update to a new API so so using queryForObject will be fine.

            result = jdbcTemplate.queryForObject(sql, new Object[]{email}, String.class);
        } catch (DataAccessException ex) {
            //do nothing an empty String is returned will be returned
        }
        return Optional.ofNullable(result);
    }
}

