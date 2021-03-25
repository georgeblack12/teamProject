package com.project.cavallo.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


/**
 * Repository to enter values into the orderContains Table of the database.
 *
 * @author George Black
 */
@Repository
public class OrderContainsRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;


    /**
     * Method that allows you to enter a value into the orderContains Table of the database.
     *
     * @param orderID    The orderID from an iceCreamOrder value to be added to an orderContains value.
     * @param iceCreamID the iceCreamID of an iceCream value to be added to an orderContains value.
     * @param quantity   The number of iceCreams with the entered iceCreamID that are in the entered iceCreamOrder with
     *                   the entered orderID.
     * @author George Black
     */
    public void enterOrderContains(int orderID, int iceCreamID, int quantity) {
        String sql = "INSERT INTO OrderContains(orderID,iceCreamID,quantity) values(?,?,?)";
        jdbcTemplate.update(sql, orderID, iceCreamID, quantity);
    }
}
