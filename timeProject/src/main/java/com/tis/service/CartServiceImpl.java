package com.tis.service;

import org.springframework.stereotype.Service;

import com.tis.domain.CartVO;
import com.tis.mapper.CartMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CartServiceImpl implements CartService {

	private final CartMapper cartMapper;
	
	// 장바구니 담기
	@Override
	public void insertCart(CartVO cart) {
		cartMapper.insertCart(cart);
	}
	
	// 장바구니 조회 WITH MEMBER
	@Override
	public CartVO getCartWithMember(CartVO cart) {
		return cartMapper.getCartWithMember(cart);
	}

}
