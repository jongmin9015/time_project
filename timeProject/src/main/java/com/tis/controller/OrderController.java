package com.tis.controller;

import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tis.domain.AddressVO;
import com.tis.domain.GoodsVO;
import com.tis.domain.MemberVO;
import com.tis.domain.OrderVO;
import com.tis.service.AddressService;
import com.tis.service.CartService;
import com.tis.service.GoodsService;
import com.tis.service.MemberService;
import com.tis.service.OrderService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/shop/order")
@AllArgsConstructor
public class OrderController {
	
	private final OrderService orderService;
	private final MemberService memberService;
	private final AddressService addressService;
	
	// 결제 페이지 이동
	@RequestMapping(value = "/move", method = RequestMethod.POST)
	public String moveOrderCart(Model model, OrderVO order) {
		
		
		List<GoodsVO> orderGoodsList = orderService.getOrderList(order.getMemberId());
		
		MemberVO member = memberService.getMember(order.getMemberId());
		AddressVO address = addressService.getAddress(order.getMemberId());

		model.addAttribute("orderGoodsList", orderGoodsList);
		model.addAttribute("member", member);
		model.addAttribute("address", address);
		model.addAttribute("memberId", order.getMemberId());
		model.addAttribute("deliveryFee", order.getDeliveryFee());
		
		log.info("move to order.........................." + order.getMemberId());
		return "/shop/order/shop_order";
	}
	
	// 오더 생성
    @RequestMapping(value = "/insert", method = RequestMethod.POST,
			  		 consumes = MediaType.APPLICATION_JSON_UTF8_VALUE) 
	public ResponseEntity<String> insertOrder(@RequestBody OrderVO order) {
	  
	    orderService.insertOrder(order);
        log.info("insert order.........................."); 
	    return new ResponseEntity<String>("success", HttpStatus.OK);
    }
    
    // 배송지 상세입력 폼 이동
    @RequestMapping(value = "/delivery", method = RequestMethod.GET)
    public String deliveryAddress(Model model, OrderVO order) {
    	
    	model.addAttribute("order", order);
    	log.info("move to delivery.........................."); 
    	return "/shop/order/order_delivery";
    }
    
    // 배송지 상세입력 폼 이동
    @RequestMapping(value = "/delivery", method = RequestMethod.POST,
    				consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public String insertAddress(@ModelAttribute("orderName") String orderName,@ModelAttribute("orderPhone") String orderPhone) {
    	
    	log.info("insert delivery location.........................."); 
    	return "/shop/order/order_delivery";
    }
    
	 
	

}
