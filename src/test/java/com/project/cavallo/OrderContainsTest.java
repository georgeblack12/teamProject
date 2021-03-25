package com.project.cavallo;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.project.cavallo.dao.OrderContainsRepository;
/**
 * OrderContains
 * @author jiwei
 *
 */
@SpringBootTest
public class OrderContainsTest {
	@Autowired
	private OrderContainsRepository orderContainsRepository;
	@Test
	public void enterOrderContains() {
		int orderID = 2;
		int iceCreamID = 3;
		int quantity = 4;
		orderContainsRepository.enterOrderContains(orderID, iceCreamID, quantity);
		System.out.println("Enter complete!");
	}
}
