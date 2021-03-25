package com.project.cavallo;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.project.cavallo.dao.IceCreamRepository;
import com.project.cavallo.domain.IceCream;

@SpringBootTest
public class IceCreamTest {
	@Autowired
	private IceCreamRepository iceCreamRepository;
	@Test
	public void getIceCreamId() {		
		 
	}
	
}
