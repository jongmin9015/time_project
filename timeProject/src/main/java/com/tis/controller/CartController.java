package com.tis.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.tis.domain.CartVO;
import com.tis.domain.GoodsVO;
import com.tis.mapper.GoodsMapper;
import com.tis.service.CartService;
import com.tis.service.GoodsService;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/shop/cart")
@SessionAttributes("goods")
@AllArgsConstructor
public class CartController {

	
	private final GoodsService goodsService;
	private final CartService cartService;
	
	// 장바구니 이동
	@RequestMapping(value = "/move", method = RequestMethod.GET)
	public String moveCart() {
		
		
		
		log.info("move to cart..........................");
		return "shop/cart/shop_cart";
	}
	
	// 장바구니 모달창
	@RequestMapping(value = "/{goodsNo}", method = RequestMethod.GET, 
			        produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<GoodsVO> get(@PathVariable("goodsNo") Long goodsNo){
		
		log.info("get goodsList modal....................." + goodsNo);
		return new ResponseEntity<GoodsVO>(goodsService.getGoodsDetail(goodsNo), HttpStatus.OK);
	}
	
	// 장바구니 담기
	@RequestMapping(value = "/put", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public ResponseEntity<String> put(@RequestParam("goodsNo")Long goodsNo,CartVO cart, Model model) {
		
		cart.setGoodsNo(goodsNo);
		cart.setCartCount(1);
		if(cart.getMemberId() == null)
		cart.setCartId("guest");
		cartService.insertCart(cart);
		log.info("post goods in cart........................" + goodsNo);
		return new ResponseEntity<String>("장바구니에 담겼습니다.", HttpStatus.OK);
	}
}
