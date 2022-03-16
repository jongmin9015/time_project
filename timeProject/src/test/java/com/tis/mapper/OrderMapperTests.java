package com.tis.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.tis.domain.OrderVO;
import com.tis.service.OrderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@AllArgsConstructor
public class OrderMapperTests {
	
	
	private OrderService orderService;
	
	

	@Test
	public void getNo() {
		
		OrderVO order = new OrderVO();
		
	
		orderService.deleteOrder("07F2DF83F1A2DEDFA4B0E561D6C051EF");

	}
	

	

}
