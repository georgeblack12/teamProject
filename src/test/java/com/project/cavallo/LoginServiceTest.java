package com.project.cavallo;

import javax.annotation.Resource;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import com.project.cavallo.service.ILoginService;
/**
 * loginTest
 * @author jiwei
 *
 */
@SpringBootTest
public class LoginServiceTest {
	@Resource
	private ILoginService loginService;
	@Test
	public void login() {
		String email = "tom@qq.com";
		String password = "123456";
		try {
			loginService.login(email, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("loginTest complete!");	
	}
}
