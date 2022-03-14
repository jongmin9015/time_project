package com.tis.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tis.domain.CategoryVO;
import com.tis.domain.Criteria;
import com.tis.domain.GoodsVO;
import com.tis.domain.OrderVO;
import com.tis.service.GoodsService;
import com.tis.service.OrderService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class OrderMapperTests {
	
	@Autowired
	private OrderService orderService;
	
	

	@Test
	public void getNo() {
		OrderVO order = new OrderVO();
		order.setMemberId("C45F744B2D5A1F0A8891BBAFCC85E17A");
		order.setDeliveryFee(3000);
		order.setDeliveryLocation("door");
		order.setDeliveryMessage("seven");
		order.setDeliveryName("김지수");
		order.setDeliveryPhone("91923823");
		order.setOrderName("김지수");
		order.setOrderPhone("0202131");
		order.setEntrancePw("12324");
		orderService.updateOrder(order);
		System.out.println(order);
	}
	

	

}
