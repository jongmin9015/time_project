package com.tis.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.tis.domain.GoodsVO;
import com.tis.service.GoodsService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@AllArgsConstructor
@SessionAttributes("sessionId")
public class HomeController {
	
	private final GoodsService goodsService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request) {
		
		String sessionId = request.getSession().getId();
		
		
		
		List<GoodsVO> goodsList = goodsService.getMainGoodsList();
		
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("sessionId", sessionId);
		
		log.info("main index home............................." );
		return "index";
	}
	
}
