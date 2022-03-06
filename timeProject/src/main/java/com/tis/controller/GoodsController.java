package com.tis.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tis.domain.GoodsVO;
import com.tis.service.GoodsService;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/shop/goods")
@AllArgsConstructor
public class GoodsController {
	
	private GoodsService goodsService;
	
	// 상품 리스트
	@RequestMapping(value = 
		{"/goods_salad", "/goods_health", "/goods_noodle"}, 
		method = RequestMethod.GET)
	public void goodsList(Model model, HttpServletRequest request) {

		String path =  request.getServletPath();
		String category = path.substring(path.indexOf("_") + 1); 

		GoodsVO vo = new GoodsVO();
		vo.setGoodsCategory(category);
		
		model.addAttribute("goodsList", goodsService.getList(vo));
		log.info("get goods_list......................" + category);
	}

}
