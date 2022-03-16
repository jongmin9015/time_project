package com.tis.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tis.domain.CartVO;
import com.tis.service.CartService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CartMapperTests {
	
	@Autowired
	private CartService cartService;
	
//	@Test
//	public void test1() {
//		CartVO cart = new CartVO();
//		cart.setGoodsNo(85L);
//		cart.setCartCount(1);
//		if(cart.getMemberId() == null) {
//		cart.setMemberId("guest");
//		}
//		cartService.insertCart(cart);
//	}
	@Test
	public void test2() {
		CartVO cart = new CartVO();
		cart.setMemberId("guest");
		
		

	}

}
