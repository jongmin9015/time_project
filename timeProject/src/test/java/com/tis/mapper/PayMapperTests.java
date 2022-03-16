package com.tis.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tis.domain.CategoryVO;
import com.tis.domain.Criteria;
import com.tis.domain.GoodsVO;
import com.tis.domain.OrderVO;
import com.tis.domain.PayVO;
import com.tis.service.GoodsService;
import com.tis.service.OrderService;
import com.tis.service.PayService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class PayMapperTests {
	
	@Autowired
	private PayService payService;
	@Autowired
	private PayMapper mapper;

	@Autowired
	private OrderService orderService;
	
//	@Test
//	public void getNo() {
//		goodsMapper.getGoodsDetail(101L);
//	}
	

//	@Test
//	public void test() {
//	
//		PayVO pay = new PayVO();
//		pay.setAddress("dsdsd");
//		pay.setAddressSub("dsds");
//		pay.setDeliveryLocation("dsdsd");
//		pay.setDeliveryMessage("dsdsd");
//		pay.setDeliveryPhone("dsdsd");
//		pay.setDeliveryName("2332");
//		pay.setMemberId("2323");
//		pay.setOrderEmail("dsdsd");
//		pay.setOrderGoodsName("dsdsd");
//		pay.setOrderPhone("dsdsd");
//		pay.setOrderName("232");
//		pay.setTotalPrice(23232L);
//		pay.setZipcode("2323");
//		pay.setEntrancePw("2323");
//		pay.setEtcLocation("2323");	
//		
//		
//	}
	

	@Test
	public void getNo() {
		
		OrderVO order = new OrderVO();
		
	
		orderService.deleteOrder("07F2DF83F1A2DEDFA4B0E561D6C051EF");

	}
	

}
