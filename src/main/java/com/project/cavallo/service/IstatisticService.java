package com.project.cavallo.service;


import com.project.cavallo.Response.IceCreamRes;
import com.project.cavallo.domain.Order;

import java.util.List;

public interface IstatisticService {

    List<IceCreamRes> getXlByCw();

    List<Order> getOrderNumByDate();
}



