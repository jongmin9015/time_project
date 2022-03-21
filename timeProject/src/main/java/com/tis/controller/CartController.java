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

import com.tis.domain.AddressVO;
import com.tis.domain.CartVO;
import com.tis.domain.GoodsVO;
import com.tis.mapper.GoodsMapper;
import com.tis.service.AddressService;
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
@SessionAttributes("sessionId")
public class CartController {

	private final GoodsService goodsService;
	private final CartService cartService;
	private final AddressService addressService;
	
	// 장바구니 이동
	@RequestMapping(value = "/move", method = RequestMethod.GET)
	public String moveCart(Model model, CartVO cart,HttpServletRequest request) {
		
		// 세션 정보 받아오기
		String sessionId = request.getSession().getId();
		request.getSession().setAttribute("sessionId", sessionId);
		model.addAttribute("sessiondId");
		String memberId = (String) request.getSession().getAttribute("sessionId");

		// 비회원일때 세션아이디로 배송지 설정
		if(cart.getMemberId() == null) {
			cart.setMemberId(memberId);		
		}	
		
		// 기본 배송비 OR 총가격 설정
		int deliveryFee = 3000;
		int totalPrice = 0;
		
		// 해당 ID로 조회하여  주소지를 가져옵니다 (없을시 배송지 설정)
		AddressVO address = addressService.getAddress(cart.getMemberId());
		
		// 상품이 없다면 배송비 0원
		List<GoodsVO> cartList = cartService.getCarList(cart);
		if (cartList.isEmpty()) {
			deliveryFee = 0;
		} 	
		// 장바구니 총가격 설정
		for (GoodsVO goods : cartList) {
			totalPrice += goods.getGoodsPrice() * goods.getCartCount();
		}
		// 가격이 2만원이 넘어가면 배송지 0원 설정	
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
		model.addAttribute("address", address);
				
		log.info("move to cart..........................");
		return "shop/cart/shop_cart";
	}
	
	// 장바구니 모달창
	@RequestMapping(value = "/{goodsNo}", method = RequestMethod.GET, 
			        produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<GoodsVO> getCartModal(@PathVariable("goodsNo") Long goodsNo){
		
		log.info("get goodsList modal....................." + goodsNo);
		return new ResponseEntity<GoodsVO>(goodsService.getGoodsDetail(goodsNo), HttpStatus.OK);
	}
	
	// 장바구니 담기
	@RequestMapping(value = "/put", method = RequestMethod.POST,
			        consumes = "application/json", produces = "application/text; charset=utf8")
	public ResponseEntity<String> insertCart(@RequestBody CartVO cart, Model model) {
		
		if (cartService.getCartForCheck(cart) == null) {
			cartService.insertCart(cart);
			log.info("post goods in cart........................" );
		} else {
			return new ResponseEntity<String>("이미 장바구에 있습니다.", HttpStatus.OK);
		}

		return new ResponseEntity<String>("장바구니에 담겼습니다.", HttpStatus.OK);
	}	
	
	// 장바구니 삭제
	@RequestMapping(value = "/{cartNo}", method = RequestMethod.DELETE,
					produces = "application/text; charset=utf8")
	public ResponseEntity<String> deleteCart(@PathVariable("cartNo")Long cartNo){
		
		cartService.deleteCart(cartNo);
		log.info("delete goods at cart........................");
		return new ResponseEntity<String>("장바구니에서 상품을 삭제했습니다.", HttpStatus.OK);
	}
	
	// 장바구니 수량 업데이트
	@RequestMapping(value = "/update", method = RequestMethod.PUT,
					consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<String> updateCount(@RequestBody CartVO cart){
		
		cartService.updateCount(cart);
		log.info("update cart count........................" + cart.getCartNo());
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
}
