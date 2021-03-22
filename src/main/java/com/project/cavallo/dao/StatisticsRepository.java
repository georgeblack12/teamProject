package com.project.cavallo.dao;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


import java.lang.reflect.Array;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.*;

@Repository
public class StatisticsRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;


    private LocalDate now = LocalDate.now();

    private LocalDate adminDate = LocalDate.now();

    public int getTotalOrders() {
        String sql = "SELECT COUNT(*) FROM iceCreamOrder";
        int total = jdbcTemplate.queryForObject(sql, Integer.class);
        return total;
    }

    public int getTotalOrdersFromDate(LocalDate date) {
        String sql = "SELECT COUNT(*)FROM iceCreamOrder o WHERE o.date = ?";

        int total = jdbcTemplate.queryForObject(sql, new Object[]{date}, Integer.class);
        return total;
    }

    public int getTotalOrdersThisWeek() {
        LocalDate lastWeek = now.minusWeeks(1);
        String sql = "SELECT COUNT(*) FROM iceCreamOrder o " +
                "WHERE o.`date` BETWEEN '" + lastWeek + "' and '" + now + "'";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    public int getTotalOrdersPastThirty() {
        LocalDate lastThirty = now.minusDays(30);
        String sql = "SELECT COUNT(*) FROM iceCreamOrder o WHERE o.`date` BETWEEN '" + lastThirty + "' and '" + now + "'";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    public List<Integer> getYForOrderGraph(LocalDate date) {
        String sql = "SELECT EXTRACT(HOUR FROM o.`time`), COUNT(*) FROM iceCreamOrder o " +
                "WHERE o.`date` = '" + date + "' GROUP BY EXTRACT(HOUR FROM o.`time`)";
        List<Map<String, Object>> hours = jdbcTemplate.queryForList(sql);

        return getProperOrderValues(getMapFromList(hours));
    }


    public String getMostPopularFlavor(){
        String sql="SELECT Flavour FROM (SELECT ic.flavour Flavour, SUM(oc.quantity) SumQuantity " +
                "FROM IceCream ic, OrderContains oc WHERE ic.iceCreamID = oc.iceCreamID " +
                "GROUP BY ic.flavour) a WHERE a.SumQuantity = (SELECT MAX(s.SumQuantity) " +
                "FROM (SELECT ic.flavour, SUM(oc.quantity) SumQuantity FROM IceCream ic, OrderContains oc " +
                "WHERE ic.iceCreamID = oc.iceCreamID GROUP BY ic.flavour) s)";

        String mostPopularFlavor=jdbcTemplate.queryForObject(sql,String.class);
        return mostPopularFlavor;
    }

    public List<Integer> getYForCreamGraph(){
        String sql="SELECT ic.flavour, SUM(oc.quantity) FROM IceCream ic, OrderContains oc " +
                "WHERE ic.iceCreamID = oc.iceCreamID GROUP BY ic.flavour";

        List<Map<String, Object> >iceCream=jdbcTemplate.queryForList(sql);

        return getProperIceCreamValues(getMapFromList(iceCream));
    }


    private <K> Map<K, Integer> getMapFromList(List<Map<String, Object>> list) {
        HashMap<K, Integer> mapToReturn = new HashMap<>();

        for (int i = 0; i < list.size(); i++) {

            if(list.get(i).values().toArray()[1] instanceof Long){
                mapToReturn.put((K) list.get(i).values().toArray()[0],
                        Math.toIntExact((long) list.get(i).values().toArray()[1]));
            }else{
                mapToReturn.put((K) list.get(i).values().toArray()[0],((BigDecimal) list.get(i).values().toArray()[1]).intValue());
            }





        }

        return mapToReturn;
    }

    private List<Integer> getProperIceCreamValues(Map<String, Integer> ourMap){



        LinkedHashMap<String, Integer> mapForCreamGraph = new LinkedHashMap<>();


         String[] iceCream={"Vanilla","Dairy Free Vanilla","Honeycomb","Rum and Raisin",
        "Mint","Cherry","Chocolate","Salted Caramel","Strawberry"};

         for(int i=0; i< iceCream.length; i++){
             if(ourMap.containsKey(Array.get(iceCream,i))){
                 mapForCreamGraph.put((String) Array.get(iceCream,i), ourMap.get(Array.get(iceCream,i)));
             }else{
                 mapForCreamGraph.put((String) Array.get(iceCream,i),0);
             }
         }
         return new ArrayList<>(mapForCreamGraph.values());

    }




    private List<Integer> getProperOrderValues(Map<Integer, Integer> ourMap) {
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
