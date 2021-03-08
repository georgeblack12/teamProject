package com.project.cavallo.dao;

import com.project.cavallo.HorsePayClass.HorsePayResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import static java.lang.Integer.parseInt;

/**
 * Repository to store the Order in the database if the payment goes through.
 * @author George Black
 */
@Repository
public class OrderRepository {

    //autowired so we do not have to worry about creating the jdbcTemplate to use
    @Autowired
    private JdbcTemplate jdbcTemplate;

    /**
     * Assuming HorsePay JSON (with paymentSuccess) that is to be sent has Status=true, the iceCreamorder is stored into
     * the database. Otherwise, nothing happens. Note: There are currently some dummy values used to enter the
     * iceCreamOrder in the database. This is because I need more info/code to get these values correctly
     *
     * @author George Black
     * @param hResponse The HorsePay JSON (with paymentSuccess) that is to be sent.
     * @param totalCost The total cost of the order the Customer wants to complete.
     *
     */
    public void createOrderFromHResponse(HorsePayResponse hResponse, float totalCost){
        //if the (with paymentSuccess) that is to be sent has Status=true, store the order in the
        //database
        if(hResponse.getPaymentResult().isStatus()){
            String sql="INSERT INTO iceCreamOrder(orderType,date,iceCreamID,customerID,cost) values(?,?,?,?,?)";

            //Dummy values of delivery and 1 currently.
            //Note: if this is sent properly 1 row will be affected causing insert to have a value of 1. Otherwise
            //insert will have a value of 0.
            int insert = jdbcTemplate.update(sql,"Delivery",hResponse.getDate(),1,
                    parseInt(hResponse.getCustomerID()),totalCost);

            //display the order was successful in console
            if(insert==1){
                System.out.println("order added into order table");
            }
        }
        //otherwise nothing will happen

    }


}
