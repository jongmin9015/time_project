package com.tis.service;

import java.util.List;

import com.tis.domain.CategoryVO;
import com.tis.domain.GoodsVO;

public interface GoodsService {

	// 상품 리스트 조회
	List<GoodsVO> getGoodsList(GoodsVO goods);
	
	// 상품 서브 리스트 조회
	List<GoodsVO> getGoodsSubList(GoodsVO goods);
	
	// 상품 상세 조회
	GoodsVO getGoodsDetail(Long goodsNo);
	
	// 상품 카테고리 조회
	List<CategoryVO> getCategory(CategoryVO category);
	

}
