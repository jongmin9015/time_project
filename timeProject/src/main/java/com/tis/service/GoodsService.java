package com.tis.service;

import java.util.List;

import com.tis.domain.CategoryVO;
import com.tis.domain.GoodsVO;

public interface GoodsService {

	// 상품 리스트 조회 WITH PAGING
	List<GoodsVO> getGoodsListWithPaging(GoodsVO goods);
	
	// 상품 서브 리스트 조회
	List<GoodsVO> getGoodsSubListWithPaging(GoodsVO goods);
	
	// 상품 상세 조회
	GoodsVO getGoodsDetail(Long goodsNo);
	
	// 상품 리스트 총 개수
	int getGoodsTotalMain(String categoryTitle);
	int getGoodsTotalSub(String categorySubTitle);
	

}
