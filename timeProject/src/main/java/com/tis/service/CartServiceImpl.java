package com.tis.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tis.domain.CartVO;
import com.tis.domain.GoodsVO;
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
	
	// 장바구니 조회 FOR CHECK
	@Override
	public CartVO getCartForCheck(CartVO cart) {
		return cartMapper.getCartForCheck(cart);
	}

	// 장바구니 리스트 조회
	@Override
	public List<GoodsVO> getCarList(CartVO cart) {
		return cartMapper.getCartList(cart);
	}

	// 장바구니 총 갯수
	@Override
	public int getCartTotal(CartVO cartVO) {
		return cartMapper.getCartTotal(cartVO);
	}
	
	// 장바구니 상품 삭제
	@Override
	public int deleteCart(Long cartNo) {
		return cartMapper.deleteCart(cartNo);
	}
	
	// 장바구니 수량 업데이트
	@Override
	public int updateCount(CartVO cart) {
		return cartMapper.updateCount(cart);
	}
	
	
	

}
