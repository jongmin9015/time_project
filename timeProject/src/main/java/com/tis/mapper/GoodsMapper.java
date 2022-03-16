package com.tis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tis.domain.CategoryVO;
import com.tis.domain.Criteria;
import com.tis.domain.GoodsVO;

public interface GoodsMapper {

	// 상품 리스트 WITH PAGING
	List<GoodsVO> getGoodsListWithPaging(GoodsVO goods);
	
	// 서브 상품 조회
	List<GoodsVO> getGoodsSubListWithPaging(GoodsVO goods);
	
	// 상품 상세 조회
	GoodsVO getGoodsDetail(Long goodsNo);
	
	// 상품 총 갯수
	int getGoodsTotalMain(String categoryTitle);
	int getGoodsTotalSub(String categorySubTitle);
	
	// 메인 홈페이지 상품 리스트
	List<GoodsVO> getMainGoodsList();
	
	// 상품 검색
	List<GoodsVO> getSearchList(GoodsVO goods);

	// 상품 검색 총 게시물 수
	int getSearchListTotal(String keyword);
	
}
