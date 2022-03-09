package com.tis.domain;

import java.util.Date;

import lombok.Data;

@Data
public class GoodsVO {
	
	private Long goodsNo;
	private String goodsName;
	private String goodsCategory;
	private String goodsContent;
	private Long goodsPrice;
	private String goodsUnit;
	private String goodsWeight;
	private String goodsDelivery;
	private String goodsPackage;
	private String goodsAllergy;
	private String goodsImage;
	private Date goodsRegdate;
	private Date goodsUpdatedate;
	 	
	// CategoryVO
	private String categoryTitle;
	private String categoryMain;
	private String categorySub;
	private String categorySubTitle;
	
	// CartVO
	private String cartId;
	private String memberId;
	private int cartCount;
	
	// 페이징 처리
	private Criteria cri;
	
	// 상품 리스트 정렬
	private String priceSort;
	
	public GoodsVO() {
		
	}

	public GoodsVO(Criteria cri) {
		this.cri = cri;
	}
}
