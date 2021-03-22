package com.project.cavallo.dao;

import com.project.cavallo.domain.HorsePayClass.HorsePayResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;


/**
 * Repository to store the Order in the database if the payment goes through.
 *
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
     * @param hResponse The HorsePay JSON (with paymentSuccess) that is to be sent.
     * @author George Black
     */
    public int createOrderFromHResponse(HorsePayResponse hResponse, String address) throws ParseException {
        SimpleDateFormat timeFormat = new java.text.SimpleDateFormat("HH:mm");

        SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("dd/MM/yyyy");



        //if the (with paymentSuccess) that is to be sent has Status=true, store the order in the
        //database
        int insert=0;
        if (hResponse.getPaymentResult().isStatus()) {


            String sql = "INSERT INTO iceCreamOrder(customerID,`date`,`time`,`type`,address,cost)" +
                    " values(?,?,?,?,?,?)";

            System.out.println(hResponse.getTransactionAmount());

           //Used as delivery right now
            System.out.println(hResponse.getDate());
            System.out.println(LocalDateTime.now());

            if(address.equals("NA")) {
                System.out.println(hResponse.getCustomerID());
                insert = jdbcTemplate.update(sql, hResponse.getCustomerID(),
                        dateFormat.parse(hResponse.getDate()), timeFormat.parse(hResponse.getTime()), "Pick up", "NA", hResponse.getTransactionAmount());
            }else{
                insert = jdbcTemplate.update(sql, hResponse.getCustomerID(),
                        dateFormat.parse(hResponse.getDate()), timeFormat.parse(hResponse.getTime()), "Delivery", address, hResponse.getTransactionAmount());

            }

            //display the order was successful in console
            if (insert == 1) {
                System.out.println("order added into order table");
            }
        }
        //otherwise nothing will happen
        return insert;
    }

    //went with this for safety reason avoids issues
    public int getOrderID(HorsePayResponse hResponse) throws ParseException {

        String sql="SELECT max(orderID) from iceCreamOrder where customerID= ?";

        int orderId=jdbcTemplate.queryForObject(sql,new Object[]{hResponse.getCustomerID()},Integer.class);

        return orderId;
    }


}
