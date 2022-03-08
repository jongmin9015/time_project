package com.tis.service;

import com.tis.domain.CartVO;

public interface CartService {
	
	// 장바구니 담기
	void insertCart(CartVO cart);

	// 장바구니 조회 WITH MEMBER
	CartVO getCartWithMember(CartVO cart);
}
