package com.tis.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tis.domain.CategoryVO;
import com.tis.domain.Criteria;
import com.tis.domain.GoodsVO;
import com.tis.domain.PageDTO;
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
	@RequestMapping(value = "goods_list", method = RequestMethod.GET)
	public String goodsList(Model model, @RequestParam("category")String categoryTitle, Criteria cri) {


		GoodsVO goods = new GoodsVO();
		goods.setGoodsCategory(categoryTitle);
		
		CategoryVO category = new CategoryVO();
		category.setCategoryTitle(categoryTitle);
		
		
		model.addAttribute("goodsList", goodsService.getGoodsList(goods));
		model.addAttribute("categorys", goodsService.getCategory(category));
		model.addAttribute("categoryMainTitle", categoryTitle);
//		model.addAttribute("pageMaker", new PageDTO(cri, 120));
		log.info("get goods_list......................" + categoryTitle);
		return "shop/goods/goods_list";
	}
	
	// 상품 서브 리스트
	@RequestMapping(value = "goods_sublist", method = RequestMethod.GET)
	public String goodsSubList(Model model,@RequestParam("category")String categorySubTitle) {


		GoodsVO goods = new GoodsVO();
		goods.setCategorySubTitle(categorySubTitle);
		
		List<GoodsVO> goodsList = goodsService.getGoodsSubList(goods);
	
		Optional<GoodsVO> vo = goodsList.stream().findAny();
		if(vo.isPresent()) {
			String categoryTitle = goodsList.stream().findAny().get().getCategoryTitle();
			CategoryVO category = new CategoryVO();
			category.setCategoryTitle(categoryTitle);
			model.addAttribute("categorys", goodsService.getCategory(category));
			model.addAttribute("categoryMainTitle", categoryTitle);
			model.addAttribute("categorySubTitle", categorySubTitle);
		}
		
		model.addAttribute("goodsList", goodsList);
	
		log.info("get goods_sublist......................" + categorySubTitle);
		return "shop/goods/goods_list";
	}
	
	// 상품 상세 조회
	@RequestMapping(value = "/goods_detail", method = RequestMethod.GET)
	public String goodsDetail(Model model, @RequestParam("goodsNo")Long goodsNo) {
		
		model.addAttribute("goods", goodsService.getGoodsDetail(goodsNo));
		log.info("get goods_detail....................." + goodsNo);
		return "shop/goods/goods_detail";
	}
	
	


}
