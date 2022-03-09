package com.tis.mapper;

import com.tis.domain.CartVO;

public interface CartMapper {
	
	// 장바구니 담기
	void insertCart(CartVO cart);

	// 장바구니 조회 WITH MEMBER
	CartVO getCartWithMember(CartVO cart);
}
