package com.tis.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tis.domain.GoodsVO;
import com.tis.mapper.GoodsMapper;
import com.tis.service.GoodsService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@AllArgsConstructor
public class HomeController {
	
	private final GoodsService goodsService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		List<GoodsVO> goodsList = goodsService.getMainGoodsList();
		
		model.addAttribute("goodsList", goodsList);
		
		log.info("main index home.............................");
		return "index";
	}
	
}
