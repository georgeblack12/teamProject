package com.project.cavallo.dao;

import com.project.cavallo.domain.HorsePayClass.HorsePayResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;


/**
 * Repository to store iceCreamOrders in the database if the payment goes through as well as pull information from the
 * iceCreamOrders table.
 *
 * @author George Black
 */
@Repository
public class OrderRepository {


    //autowired so we do not have to worry about creating the jdbcTemplate to use
    @Autowired
    private JdbcTemplate jdbcTemplate;

    /**
     * Assuming HorsePay JSON (with paymentSuccess) that is to be sent has Status=true, the iceCreamOrder is stored into
     * the database. Otherwise, nothing happens. The value for address in the iceCreamOrder is decided based on the
     * type of order
     * IMPORTANT NOTE: we did not put  StoreID in the order table because we viewed it as unnecessary.
     *
     * @param hResponse The HorsePay JSON (with paymentSuccess) to be sent back to the client.
     * @author George Black
     */
    public int createOrderFromHResponse(HorsePayResponse hResponse, String address) throws ParseException {

        //formatters used to enter in the date/time values in the database properly.
        SimpleDateFormat timeFormat = new java.text.SimpleDateFormat("HH:mm");

        SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("dd/MM/yyyy");

        //if the (with paymentSuccess) that is to be sent has Status=true, store the order in the
        //database
        int insert = 0;
        if (hResponse.getPaymentResult().isStatus()) {
            String sql = "INSERT INTO iceCreamOrder(customerID,`date`,`time`,`type`,address,cost)" +
                    " values(?,?,?,?,?,?)";

            //NA Is the set value for the address if the order is for carry out.
            if (address.equals("NA")) {
                System.out.println(hResponse.getCustomerID());
                insert = jdbcTemplate.update(sql, hResponse.getCustomerID(),
                        dateFormat.parse(hResponse.getDate()), timeFormat.parse(hResponse.getTime()), "Pick up", "NA",
                        hResponse.getTransactionAmount());
            } else {

                //If the address is not NA, then we know it was for Delivery.
                insert = jdbcTemplate.update(sql, hResponse.getCustomerID(),
                        dateFormat.parse(hResponse.getDate()), timeFormat.parse(hResponse.getTime()), "Delivery",
                        address, hResponse.getTransactionAmount());
            }

            //display the order was successful in console
            if (insert == 1) {
                System.out.println("order added into order table");
            }
        }
        //otherwise nothing will happen
        return insert;
    }

    /**
     * Method that gets the orderID of the iceCreamOrder just made by the Customer. This is used to add the needed
     * values into the orderContains table. This method will be used in the checkHorsePay method located in the
     * HorsePayController.
     *
     * @param hResponse the HorsePayResponse object to be sent back to the client after they tried using horse pay.
     * @return The iceCreamOrder just made by the Customer.
     * @author George Black
     */
    public int getOrderID(HorsePayResponse hResponse) {

        //the orderIDs are unique numbers that keep increasing. The max value of orderID returned will be the most
        // recent orderID that the customer placed with the customerID inside the HorsePayResponse object. This
        //will be used to update the orderContains table appropriately as soon as a customer places an order.

        String sql = "SELECT max(orderID) from iceCreamOrder where customerID= ?";

        //Note: we are not planning on update to a new API so so using queryForObject will be fine.
        int orderId = jdbcTemplate.queryForObject(sql, new Object[]{hResponse.getCustomerID()}, Integer.class);

        return orderId;
    }
}
