package com.tis.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	private final GoodsService goodsService;
	private final CartService cartService;
	private final MemberService memberService;
	private final AddressService addressService;
	
	@RequestMapping(value = "/move", method = RequestMethod.POST)
	public String getOrder(Model model, String memberId, int deliveryFee) {
		
		
		List<GoodsVO> orderGoodsList = orderService.getOrderList(memberId);
		MemberVO member = memberService.getMember(memberId);
		AddressVO address = addressService.getAddress(memberId);

		model.addAttribute("orderGoodsList", orderGoodsList);
		model.addAttribute("member", member);
		model.addAttribute("address", address);
		model.addAttribute("deliveryFee", deliveryFee);
		
		log.info("move to order.........................." + memberId);
		return "/shop/order/shop_order";
	}
	
	//
    @RequestMapping(value = "/insert", method = RequestMethod.POST,
			  		 consumes = MediaType.APPLICATION_JSON_UTF8_VALUE) 
	public ResponseEntity<String> insertOrder(@RequestBody OrderVO order) {
	  
	    orderService.insertOrder(order);
        log.info("insert order.........................."); 
	    return new ResponseEntity<String>("success", HttpStatus.OK);
    }
	 
	

}
