package com.project.cavallo.service.impl;

import com.project.cavallo.Response.IceCreamRes;
import com.project.cavallo.dao.StatisticsRepository;
import com.project.cavallo.domain.Order;
import com.project.cavallo.service.IstatisticService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class StatisticsServiceImpl implements IstatisticService {

    @Autowired
    private StatisticsRepository statisticsRepository;

    @Override
    public List<IceCreamRes> getSalesBytaste() {

        return statisticsRepository.getSalesBytaste();
    }

    @Override
    public List<Order> getOrderNumByDate() {
        return statisticsRepository.getOrderNumByDate();
    }
}
