package com.project.cavallo.dao;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


import java.lang.reflect.Array;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.*;

/**
 * Repository to be pull out data from the database to be used in the analytics.jsp page.
 *
 * @author George Black, Maddie Towes (Maddie wrote all the needed SQL making my life very easy).
 */
@Repository
public class StatisticsRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    //the date of now is used often so I made it an attribute.
    private LocalDate now = LocalDate.now();


    /**
     * Method that gets the total number of orders that have been placed on the website.
     *
     * @return The total number of orders that have been placed on the website.
     * @author George Black
     */
    public int getTotalOrders() {
        String sql = "SELECT COUNT(*) FROM iceCreamOrder";
        int total = jdbcTemplate.queryForObject(sql, Integer.class);
        return total;
    }

    /**
     * Method that gets the total number of iceCreamOrders that have been placed on the website on a specified date.
     *
     * @param date The date we want to know the total number of iceCreamOrders on the website that occurred.
     * @return
     * @author George Black
     */
    public int getTotalOrdersFromDate(LocalDate date) {
        String sql = "SELECT COUNT(*)FROM iceCreamOrder o WHERE o.date = ?";

        //Note: we are not planning on update to a new API so so using queryForObject will be fine.
        int total = jdbcTemplate.queryForObject(sql, new Object[]{date}, Integer.class);
        return total;
    }

    /**
     * Method that gets the total number of iceCreamOrders that have been placed on the website the past 7 days.
     *
     * Original author: Hanxiong Wang
     * Modifying author: George Black
     *
     * @return The total number of iceCreamOrders that have been placed on the website the past 7 days.
     */
    public int getTotalOrdersThisWeek() {
        LocalDate lastWeek = now.minusWeeks(1);
        String sql = "SELECT COUNT(*) FROM iceCreamOrder o " +
                "WHERE o.`date` BETWEEN '" + lastWeek + "' and '" + now + "'";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    /**
     * Method that gets the total number of iceCreamOrders that have been placed on the website the past 30 days.
     *
     * Original author: Hanxiong Wang
     * Modifying author: George Black
     *
     * @return he total number of iceCreamOrders that have been placed on the website the past 30 days.
     */
    public int getTotalOrdersPastThirty() {
        LocalDate lastThirty = now.minusDays(30);
        String sql = "SELECT COUNT(*) FROM iceCreamOrder o WHERE o.`date` BETWEEN '" + lastThirty + "' and '" + now + "'";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }


    /**
     * Method that gets the ice cream flavor that has been purchased the most on the website.
     *
     * @return The ice cream flavor that has been purchased the most on the website.
     * @author George Black
     */
    public String getMostPopularFlavor() {

        //shout out to Maddie for this sql statement.
        String sql = "SELECT Flavour FROM (SELECT ic.flavour Flavour, SUM(oc.quantity) SumQuantity " +
                "FROM IceCream ic, OrderContains oc WHERE ic.iceCreamID = oc.iceCreamID " +
                "GROUP BY ic.flavour) a WHERE a.SumQuantity = (SELECT MAX(s.SumQuantity) " +
                "FROM (SELECT ic.flavour, SUM(oc.quantity) SumQuantity FROM IceCream ic, OrderContains oc " +
                "WHERE ic.iceCreamID = oc.iceCreamID GROUP BY ic.flavour) s)";

        String mostPopularFlavor = jdbcTemplate.queryForObject(sql, String.class);
        return mostPopularFlavor;
    }

    /**
     * Method that returns a list where each value is the number of iceCreamOrders that occurred during a related
     * time on the date entered. For example, the first number in the list is the number of iceCreamOrders
     * that occurred between 11-12 on the entered date, the second number in the list is the number of iceCreamOrders
     * that occurred between 12-1 on the entered date,..., the last number in the list is the number of iceCreamOrders
     * that occurred between 17-18 on the entered date. NOTE: Using a list instead of a map made using JSPs easier, so
     * that is why I am using a list.
     *
     * @param date The specified date we want know the orders of iceCreams that occurred throughout it.
     * @return A List where each value relates to the number of iceCreamOrders that have occurred during the related
     * time of the date entered by the admin.
     * @author George Black
     */
    public List<Integer> getYForOrderGraph(LocalDate date) {
        String sql = "SELECT EXTRACT(HOUR FROM o.`time`), COUNT(*) FROM iceCreamOrder o " +
                "WHERE o.`date` = '" + date + "' GROUP BY EXTRACT(HOUR FROM o.`time`)";


        //Using List<Map<,>> was generally considered the best option online to get results from a query that returned
        // multiple rows. There may have been another approach, but this seemed like the best approach. This way, I could
        // nicely write methods that each perform specific tasks making the code easier to read.
        List<Map<String, Object>> hours = jdbcTemplate.queryForList(sql);

        //convert the List of maps to a list of Integers.
        return getProperOrderValues(getMapFromList(hours));
    }


    /**
     * Method that returns a list where each value is the number of purchases there have been for an ice
     * cream flavor. The first number relates to vanilla, the second relates to dairy free vanilla, etc.
     * NOTE: Using a list instead of a map made using JSPs easier, so that is why I am using a list.
     *
     * @return A list where each value is the the number of purchases there have been for an ice
     * cream flavor.
     * @author George Black
     */
    public List<Integer> getYForCreamGraph() {
        String sql = "SELECT ic.flavour, SUM(oc.quantity) FROM IceCream ic, OrderContains oc " +
                "WHERE ic.iceCreamID = oc.iceCreamID GROUP BY ic.flavour";

        //Using List<Map<,>> was generally considered the best option online to get results from a query that returned
        // multiple rows. There may have been another approach, but this seemed like the best approach. This way, I could
        // nicely write methods that each perform specific tasks making the code easier to read.
        List<Map<String, Object>> iceCream = jdbcTemplate.queryForList(sql);

        //convert the List of maps to a list of Integers.
        return getProperIceCreamValues(getMapFromList(iceCream));
    }


    /**
     * A generic method that takes a list of Maps and returns a list where the nth key is the first value in the first
     * map in a nth index of the list and the corresponding value is the value of the second map in the nth index of the
     * list.
     *
     * @param list The List of maps that will be used to create a map.
     * @param <K>  The generic value that the key value of the returned map will be.
     * @return A map where the nth key is the first value in the first map in a
     * nth index of the list and the corresponding value is the value of the second map in the nth index of the
     * list.
     * @author George Black
     */
    private <K> Map<K, Integer> getMapFromList(List<Map<String, Object>> list) {


        HashMap<K, Integer> mapToReturn = new HashMap<>();

        for (int i = 0; i < list.size(); i++) {

            //for some reason some times the value of list.get(i).values().toArray()[1] would be considered a long
            //other times, it would be considered a BigDecimal. This was based on if were using the method in
            //getYForCreamGraph or getYForOrderGraph. The following code was an easy fix to this issue.

            if (list.get(i).values().toArray()[1] instanceof Long) {
                mapToReturn.put((K) list.get(i).values().toArray()[0],
                        Math.toIntExact((long) list.get(i).values().toArray()[1]));
            } else {
                mapToReturn.put((K) list.get(i).values().toArray()[0], ((BigDecimal) list.get(i).values().toArray()[1])
                        .intValue());
            }
        }
        return mapToReturn;
    }

    //Note I separated the following methods to make things easier to read. Thanks, George Black.

    /**
     * Method that goes through a map where the keys are an iceCream flavor that has been purchased on the website, and the values are the
     * number of times the ice cream was purchased. A list is created based on these values. If an iceCream is not
     * in the map, a value of 0 is added to the list. This list's ordering is essential because the list is
     * used in analytics.jsp to create a graph.
     *
     * @param ourMap A map where the keys are an iceCream flavor that was purchased, and the values are the
     *               number of times the ice cream was purchased.
     * @return A list where each value is the number of purchases there has been for an ice
     * cream flavor. The first number relates to vanilla, the second dairy-free vanilla, etc. NOTE: Using a list
     * instead of a map made using JSPs easier, so that is why I am using a list.
     * @author George Black
     */
    private List<Integer> getProperIceCreamValues(Map<String, Integer> ourMap) {

        //ordering is important so we are using a LinkedHashMap
        LinkedHashMap<String, Integer> mapForCreamGraph = new LinkedHashMap<>();

        String[] iceCream = {"Vanilla", "Dairy Free Vanilla", "Honeycomb", "Rum and Raisin",
                "Mint", "Cherry", "Chocolate", "Salted Caramel", "Strawberry"};

        //if the key contains the iceCream get the vale that corresponds to it and add it to the list, otherwise add
        //a zero to the list.
        for (int i = 0; i < iceCream.length; i++) {
            if (ourMap.containsKey(Array.get(iceCream, i))) {
                mapForCreamGraph.put((String) Array.get(iceCream, i), ourMap.get(Array.get(iceCream, i)));
            } else {
                mapForCreamGraph.put((String) Array.get(iceCream, i), 0);
            }
        }
        return new ArrayList<>(mapForCreamGraph.values());
    }


    /**
     * Method that goes through a map where the keys are an hour of the day and the values are the number of times an
     * order was placed during that hour. A list is created based on these values. If an hour is not in the map, a
     * value of 0 is added to the list. This list's ordering is essential because the list is
     * used in analytics.jsp to create a graph.
     *
     * @param ourMap a map where the keys are an hour of the day, and the values are the number of times an
     *               order was placed during that hour.
     * @return A list where each value is the number of iceCreamOrders that occurred during a related
     * time on the date entered. For example, the first number in the list is the number of iceCreamOrders
     * that occurred between 11-12 on the entered date, the second number in the list is the number of iceCreamOrders
     * that occurred between 12-1 on the entered date,..., the last number in the list is the number of iceCreamOrders
     * that occurred between 17-18 on the entered date. NOTE: Using a list instead of a map made using JSPs easier, so
     * that is why I am using a list.
     * @author George Black
     */
    private List<Integer> getProperOrderValues(Map<Integer, Integer> ourMap) {

        //ordering is important so we are using a LinkedHashMap
        LinkedHashMap<Integer, Integer> mapForOrdGraph = new LinkedHashMap<>();

        for (int i = 11; i <= 17; i++) {
            if (ourMap.containsKey(i)) {
                mapForOrdGraph.put(i, ourMap.get(i));
            } else {
                mapForOrdGraph.put(i, 0);
            }
        }
        return new ArrayList<>(mapForOrdGraph.values());
    }


}
