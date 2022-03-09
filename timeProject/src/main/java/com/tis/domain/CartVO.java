package com.tis.domain;

import lombok.Data;

@Data
public class CartVO {
	
	private String cartId;
	private String memberId;
	private Long goodsNo;
	private int cartCount;
	
	private GoodsVO goods;

}
