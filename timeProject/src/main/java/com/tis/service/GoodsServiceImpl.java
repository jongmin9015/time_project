package com.tis.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tis.domain.CategoryVO;
import com.tis.domain.GoodsVO;
import com.tis.mapper.CategoryMapper;
import com.tis.mapper.GoodsMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class GoodsServiceImpl implements GoodsService {
	
	private final GoodsMapper goodsMapper;
	
	// 상품 리스트 조회 WITH PAGING
	@Override
	public List<GoodsVO> getGoodsListWithPaging(GoodsVO goods) {
		return goodsMapper.getGoodsListWithPaging(goods);
	}
	
	// 상품 서브 리스트 조회
	@Override
	public List<GoodsVO> getGoodsSubListWithPaging(GoodsVO goods) {
		return goodsMapper.getGoodsSubListWithPaging(goods);
	}

	// 상품 상세 조회
	@Override
	public GoodsVO getGoodsDetail(Long goodsNo) {
		return goodsMapper.getGoodsDetail(goodsNo);
	}
		
	// 상품 총 갯수 조회
	@Override
	public int getGoodsTotalMain(String categoryTitle) {
		return goodsMapper.getGoodsTotalMain(categoryTitle);
	}
	@Override
	public int getGoodsTotalSub(String categorySubTitle) {
		return goodsMapper.getGoodsTotalSub(categorySubTitle);
	}

	// 메인 홈페이지 상품 리스트
	@Override
	public List<GoodsVO> getMainGoodsList() {
		// TODO Auto-generated method stub
		return goodsMapper.getMainGoodsList();
	}

	// 상품 검색
	@Override
	public List<GoodsVO> getSearchList(GoodsVO goods) {
		return goodsMapper.getSearchList(goods);
	}
	
	// 상품 검색 총 게시물 수
	@Override
	public int getSearchListTotal(String keyword) {
		return goodsMapper.getSearchListTotal(keyword);
	}
	
	
	

}
