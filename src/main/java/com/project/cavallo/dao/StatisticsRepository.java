package com.project.cavallo.dao;

import com.project.cavallo.domain.iceCreamOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Objects;

@Repository
public class StatisticsRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private LocalDate now=LocalDate.now();

    public int getTotalOrders() {
        String sql = "SELECT COUNT(*) FROM iceCreamOrder";
        int total = jdbcTemplate.queryForObject(sql, Integer.class);
        return total;
    }

    public int getOrdersToday() {


        String sql = "SELECT COUNT(*)FROM iceCreamOrder o WHERE o.date = ?";

        int total = jdbcTemplate.queryForObject(sql, new Object[]{now}, Integer.class);
        return total;
    }

    public int getOrdersThisWeek(){
        LocalDate lastWeek = now.minusWeeks(1);
        String sql="SELECT COUNT(*) FROM iceCreamOrder o " +
                "WHERE o.`date` BETWEEN '"+lastWeek+"' and '"+now+"'";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    public int getOrdersPastThirty(){
        LocalDate lastThirty=now.minusDays(30);
        String sql="SELECT COUNT(*) FROM iceCreamOrder o WHERE o.`date` BETWEEN '"+lastThirty+"' and '"+now+"'";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }



}
