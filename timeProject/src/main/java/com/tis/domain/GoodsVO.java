package com.tis.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
	 @DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date goodsRegdate;
	 @DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date goodsUpdatedate;
	 	
	// CategoryVO
	private String categoryTitle;
	private String categoryMain;
	private String categorySub;
	private String categorySubTitle;
	
	// CartVO
	private Long cartNo;
	private String memberId;
	private int cartCount;
	
	// OrderVO
	private int goodsCount;
	
	// 페이징 처리
	private Criteria cri;
	
	// 상품 리스트 정렬
	private String priceSort;
	
	// 상품 검색
	private String keyword;
	
	public GoodsVO() {
		
	}

	public GoodsVO(Criteria cri) {
		this.cri = cri;
	}
}
