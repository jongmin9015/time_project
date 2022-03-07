package com.tis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tis.domain.CategoryVO;
import com.tis.domain.Criteria;
import com.tis.domain.GoodsVO;

public interface GoodsMapper {

	// 상품 리스트 WITH PAGING
	public List<GoodsVO> getGoodsListWithPaging(GoodsVO goods);
	
	// 서브 상품 조회
	public List<GoodsVO> getGoodsSubListWithPaging(GoodsVO goods);
	
	// 상품 상세 조회
	public GoodsVO getGoodsDetail(Long goodsNo);
	
	// 상품 카테고리 조회
	public List<CategoryVO> getCategory(CategoryVO category);
	
	// 상품 총 갯수
	public int getGoodsTotalMain(String categoryTitle);
	public int getGoodsTotalSub(String categorySubTitle);
	
}
