package com.tis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/shop/order")
public class OrderController {
	
	@RequestMapping(value = "/move", method = RequestMethod.GET)
	public String moveOrder(@RequestParam("memberId") String memberId) {
		
		log.info("move to order..........................");
		return "shop/order/shop_order";
	}
	
	@RequestMapping(value = "/move", method = RequestMethod.POST)
	public String payment() {
		
		log.info("payment request..........................");
		return "redirect:/shop/order/shop_order";
	}
	

}
