package com.tis.controller;

import java.text.DecimalFormat;
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
import org.springframework.web.bind.annotation.RequestBody;
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
@AllArgsConstructor
public class CartController {

	private final GoodsService goodsService;
	private final CartService cartService;
	
	// 장바구니 이동
	@RequestMapping(value = "/move", method = RequestMethod.GET)
	public String moveCart(Model model) {
		
		CartVO cart = new CartVO();
		cart.setMemberId("guest");
		int deliveryFee = 3000;
		int totalPrice = 0;
		
		List<GoodsVO> cartList = cartService.getCarList(cart);
		if (cartList.isEmpty()) {
			deliveryFee = 0;
		}
	
		for (GoodsVO goods : cartList) {
			totalPrice += goods.getGoodsPrice() * goods.getCartCount();
		}
			
		if (totalPrice < 20000 && totalPrice > 0) {
			int freeDelivery = 20000 - totalPrice;
			DecimalFormat df = new DecimalFormat("###,###,###");		
			model.addAttribute("deliveryMessage", df.format(freeDelivery) +"원 추가 주문 시, 무료배송");
		} else {
			deliveryFee = 0;
		}
		
		model.addAttribute("cartTotal", cartService.getCartTotal(cart));
		model.addAttribute("cartList", cartList);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("deliveryFee", deliveryFee);
		
		
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
	@RequestMapping(value = "/put", method = RequestMethod.POST,
			        consumes = "application/json", produces = "application/text; charset=utf8")
	public ResponseEntity<String> put(@RequestBody CartVO cart, Model model) {
		
		if (cartService.getCartForCheck(cart) == null) {
			cartService.insertCart(cart);
			log.info("post goods in cart........................" + cart.getGoodsNo());
		} else {
			return new ResponseEntity<String>("이미 장바구에 있습니다.", HttpStatus.OK);
		}

		return new ResponseEntity<String>("장바구니에 담겼습니다.", HttpStatus.OK);
	}
	
	// 장바구니 삭제
	@RequestMapping(value = "/{cartNo}", method = RequestMethod.DELETE,
					produces = "application/text; charset=utf8")
	public ResponseEntity<String> remove(@PathVariable("cartNo")Long cartNo){
		
			cartService.deleteCart(cartNo);
			log.info("delete goods at cart........................" + cartNo);
		return new ResponseEntity<String>("장바구니에서 상품을 삭제했습니다.", HttpStatus.OK);
	}
}
