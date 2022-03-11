package com.tis.domain;

import lombok.Data;

@Data
public class CartVO {
	
	private Long cartNo;
	private String memberId;
	private Long goodsNo;
	private int cartCount;
	
	private GoodsVO goods;

}
