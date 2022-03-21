package com.tis.controller;

import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tis.domain.PayVO;
import com.tis.service.PayService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/shop/pay")
@Log4j
@AllArgsConstructor
public class PayController {

	private final PayService payService;
	
	// 결제 정보 입력하면서 결제페이지로 이동
	@Transactional
    @RequestMapping(value = "/info", method = RequestMethod.POST)
    public String movePay(PayVO pay, Model model) {
  	
    	UUID payUUID = UUID.randomUUID();
    	
    	pay.setPayId(payUUID.toString());
    	
    	payService.deletePay(pay.getMemberId());
    	payService.insertPay(pay);
    	PayVO payInfo = payService.getPay(pay.getMemberId());
    	model.addAttribute("payInfo", payInfo);
    	log.info("pay page.........................");
    	return "/shop/pay/pay_page";
    }
    
    
}
