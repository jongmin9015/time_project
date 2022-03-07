package com.tis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tis.domain.CategoryVO;
import com.tis.domain.Criteria;
import com.tis.domain.GoodsVO;

public interface GoodsMapper {
	
	// 상품 리스트 조회
	public List<GoodsVO> getGoodsList(GoodsVO goods);
	
	// 상품 리스트 WITH PAGING
	public List<GoodsVO> getGoodsListWithPaging(@Param("goods")GoodsVO goods,@Param("cri")Criteria cri);
	
	// 서브 상품 조회
	public List<GoodsVO> getGoodsSubList(GoodsVO goods);
	
	// 상품 상세 조회
	public GoodsVO getGoodsDetail(Long goodsNo);
	
	// 상품 카테고리 조회
	public List<CategoryVO> getCategory(CategoryVO category);
	
}
