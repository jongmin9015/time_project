package com.tis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/delivery")
public class DeliveryController {

	@GetMapping("/address")
	public String address() {
		return "delivery/deliveryAddress";
	}
}
