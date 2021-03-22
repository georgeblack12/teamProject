package com.project.cavallo.dao;


import com.project.cavallo.domain.IceCream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


@Repository
public class IceCreamRepository {

    @Autowired
    JdbcTemplate jdbcTemplate;

    public int getIceCreamId(IceCream iceCream){


        String sql="SELECT iceCreamID FROM IceCream WHERE (flavour=? AND size=? AND price=?)";
        return jdbcTemplate.queryForObject(sql,new Object[]{iceCream.getFlavour(),
                iceCream.getSize(),iceCream.getPrice()},Integer.class);
    }




}
