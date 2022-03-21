package com.tis.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tis.domain.CategoryVO;
import com.tis.domain.Criteria;
import com.tis.domain.GoodsVO;
import com.tis.domain.PageDTO;
import com.tis.service.CategoryService;
import com.tis.service.GoodsService;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/shop/goods")
@AllArgsConstructor
public class GoodsController {
	
	private final GoodsService goodsService;
	private final CategoryService categoryService;
	
	// 상품 리스트
	@RequestMapping(value = "goods_list", method = RequestMethod.GET)
	public String goodsList(@RequestParam("category")String categoryTitle, Criteria cri, String priceSort, Model model) {
		
		GoodsVO goods = new GoodsVO(cri);
		goods.setPriceSort(priceSort);
		goods.setGoodsCategory(categoryTitle);
	
		CategoryVO category = new CategoryVO();
		category.setCategoryTitle(categoryTitle);
		
		model.addAttribute("goodsList", goodsService.getGoodsListWithPaging(goods));
		model.addAttribute("categorys", categoryService.getCategory(category));
		model.addAttribute("categoryMainTitle", categoryTitle);
		model.addAttribute("pageMaker", new PageDTO(cri, goodsService.getGoodsTotalMain(categoryTitle)));
		model.addAttribute("total", goodsService.getGoodsTotalMain(categoryTitle));
		model.addAttribute("priceSort",priceSort);
		log.info("get goods_list......................" + categoryTitle);
		return "shop/goods/goods_list";
	}
	
	// 상품 서브 리스트
	@RequestMapping(value = "goods_sublist", method = RequestMethod.GET)
	public String goodsSubList(@RequestParam("category")String categorySubTitle, Criteria cri, String priceSort, Model model) {

		GoodsVO goods = new GoodsVO(cri);
		goods.setCategorySubTitle(categorySubTitle);
		goods.setPriceSort(priceSort);
		List<GoodsVO> goodsList = goodsService.getGoodsSubListWithPaging(goods);
	
		Optional<GoodsVO> vo = goodsList.stream().findAny();
		
		if(vo.isPresent()) {
			String categoryTitle = goodsList.stream().findAny().get().getCategoryTitle();
			CategoryVO category = new CategoryVO();
			category.setCategoryTitle(categoryTitle);
			model.addAttribute("goodsList", goodsList);
			model.addAttribute("categorys", categoryService.getCategory(category));
			model.addAttribute("categoryMainTitle", categoryTitle);
			model.addAttribute("categorySubTitle", categorySubTitle);
			model.addAttribute("pageMaker", new PageDTO(cri, goodsService.getGoodsTotalSub(categorySubTitle)));
			model.addAttribute("total", goodsService.getGoodsTotalSub(categorySubTitle));
			model.addAttribute("priceSort", priceSort);
		}		
		log.info("get goods_sublist......................" + categorySubTitle);
		return "shop/goods/goods_list";
	}
	
	// 상품 검색
	@RequestMapping(value = "/search_list", method = RequestMethod.GET)
	public String search(String keyword, Criteria cri, String priceSort, Model model) {
		
		GoodsVO goods = new GoodsVO(cri);
		goods.setKeyword(keyword);
		goods.setPriceSort(priceSort);
		
		int total = goodsService.getSearchListTotal(keyword);	
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("goodsList", goodsService.getSearchList(goods));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("total", total);
		model.addAttribute("priceSort",goods.getPriceSort());
		
		log.info("search goodsList......................" + keyword);
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
