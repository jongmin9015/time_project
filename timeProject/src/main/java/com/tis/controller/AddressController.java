package com.tis.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tis.domain.AddressVO;
import com.tis.service.AddressService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/address")
@AllArgsConstructor
public class AddressController {
	
	private final AddressService addressService;

	// 배송지 입력폼 이동
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cartAddress(@ModelAttribute("memberId") String memberId, @ModelAttribute("form")String update) {
		
		log.info("address in cart......................" + memberId);
		return "shop/cart/cart_address";
	}
	
	// 배송지 생성
	@RequestMapping(value = "/cart", method = RequestMethod.POST)
	public ResponseEntity<String> insertAddress(@RequestBody AddressVO address) {
				
		addressService.insertAddress(address);
		log.info("insert address......................" + address.getMemberId());
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	// 배송지 변경
	@RequestMapping(value = "/cart", method = {RequestMethod.PUT},
					consumes = {MediaType.APPLICATION_JSON_UTF8_VALUE},
					produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> updateAddress(@RequestBody AddressVO address) {
		
		addressService.updateAddress(address);
		log.info("update address......................" + address.getMemberId());
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	
}
