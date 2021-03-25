package com.project.cavallo;

import java.text.ParseException;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.project.cavallo.dao.OrderRepository;
import com.project.cavallo.domain.HorsePayClass.HorsePay;
import com.project.cavallo.domain.HorsePayClass.HorsePayResponse;

@SpringBootTest
public class OrderTest {
	@Autowired
	private OrderRepository orderRepository;
	@Test
	public void createOrderFromHResponse() {
		try {
			int insert = orderRepository.createOrderFromHResponse(new HorsePayResponse(
					new HorsePay("5","5","06/03/2021","08:00:00","Asia/Shanghai",15,"4")), "NewYork");
			System.out.println("insert:"+insert);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	@Test
	public void getOrderID() {
		HorsePayResponse horsePayResponse = new HorsePayResponse(new HorsePay("1","1","15/03/2021","15:00:00","Asia/Shanghai",20,"1"));
		int orderID = orderRepository.getOrderID(horsePayResponse);
		System.out.println("orderID:"+orderID);
	}
	
}
