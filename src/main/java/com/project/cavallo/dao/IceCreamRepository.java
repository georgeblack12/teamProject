package com.project.cavallo.dao;


import com.project.cavallo.domain.IceCream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


/**
 * Repository to connect to the iceCream table in the database and pull information from said table.
 *
 * @author George Black
 */
@Repository
public class IceCreamRepository {

    @Autowired
    JdbcTemplate jdbcTemplate;

    /**
     * Gets the iceCreamID of the iceCream entered. This method is essential when we are getting iceCream JSONS
     * from the client that are a part of the customer's iceCreamOrder. (It is used in the iceCreamRepository).
     *
     * @author George Black
     *
     * @param iceCream The iceCream we want to get the iceCreamID of.
     * @return The iceCreamID of the ice cream entered as a parameter.
     */
    public int getIceCreamId(IceCream iceCream){

        //Note: we are not planning on update to a new API so so using queryForObject will be fine.
        String sql="SELECT iceCreamID FROM IceCream WHERE (flavour=? AND size=? AND price=?)";
        return jdbcTemplate.queryForObject(sql,new Object[]{iceCream.getFlavour(),
                iceCream.getSize(),iceCream.getPrice()},Integer.class);
    }




}
