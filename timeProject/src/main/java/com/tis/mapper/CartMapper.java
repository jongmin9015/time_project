package com.tis.mapper;

import java.util.List;

import com.tis.domain.CartVO;
import com.tis.domain.GoodsVO;

public interface CartMapper {
	
	// 장바구니 담기
	void insertCart(CartVO cart);

	// 장바구니 중복 조회
	CartVO getCartForCheck(CartVO cart);
	
	// 장바구니 리스트 조회
	List<GoodsVO> getCartList(CartVO cart);
	
	// 장바구니 총 갯수
	int getCartTotal(CartVO cart);
	
}
