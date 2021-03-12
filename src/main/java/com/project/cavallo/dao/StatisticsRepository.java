package com.project.cavallo.dao;

import com.project.cavallo.Response.IceCreamRes;
import com.project.cavallo.domain.Customer;
import com.project.cavallo.domain.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class StatisticsRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;


    public List<IceCreamRes> getXlByCw(){
        String sql = "SELECT a.iceCreamName as name,count(b.iceCreamID) as num from icecream a LEFT JOIN `order` b ON a.iceCreamID=b.iceCreamID GROUP BY a.iceCreamName";
        RowMapper<IceCreamRes> rowMapper = new BeanPropertyRowMapper<>(IceCreamRes.class);
        return jdbcTemplate.query(sql, rowMapper);
    }

    public List<Order> getOrderNumByDate(){
        String sql = "SELECT COUNT(orderID) AS num, date FROM `order` GROUP BY date";
        RowMapper<Order> rowMapper = new BeanPropertyRowMapper<>(Order.class);
        return jdbcTemplate.query(sql, rowMapper);
    }

}
