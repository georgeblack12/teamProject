package com.project.cavallo.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class OrderContainsRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void enterOrderContains(int orderID,int iceCreamID,int quantity){
        String sql="INSERT INTO OrderContains(orderID,iceCreamID,quantity) values(?,?,?)";
        int insert=jdbcTemplate.update(sql,orderID,iceCreamID,quantity);
    }

}
