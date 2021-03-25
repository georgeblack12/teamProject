package com.project.cavallo;

import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.project.cavallo.dao.CustomerRepository;
import com.project.cavallo.domain.Customer;
/**
 * Customer
 * @author jiwei
 *
 */
@SpringBootTest
public class CustomerTest {
	@Autowired
	private CustomerRepository customerRepository;
	@Test
	public void getCustomerFromEmail() {
		String email = "tom@qq.com";
		Optional<Customer> customer = customerRepository.getCustomerFromEmail(email);
		System.out.println(customer);
		System.out.println("Get complete!");
	}
	@Test
	public void addUserAndCustomer() {
		String email = "jerry@qq.com";
		String name = "jerry";
		String phoneNo = "123456";
		String password = "123456";
		Customer customer = new Customer();
		customer.setEmail(email);
		customer.setName(name);
		customer.setPhoneNo(phoneNo);
		customer.setPassWord(password);		
		customerRepository.addUserAndCustomer(customer);
		System.out.println("Add complete！");
	}
}
