package com.tis.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tis.domain.CategoryVO;
import com.tis.domain.GoodsVO;
import com.tis.mapper.GoodsMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class GoodsServiceImpl implements GoodsService {
	
	private final GoodsMapper goodsMapper;
	

	// 상품 리스트 조회
	@Override
	public List<GoodsVO> getGoodsList(GoodsVO goods) {
		return goodsMapper.getGoodsList(goods);
	}
	
	// 상품 서브 리스트 조회
	@Override
	public List<GoodsVO> getGoodsSubList(GoodsVO goods) {
		return goodsMapper.getGoodsSubList(goods);
	}

	// 상품 상세 조회
	@Override
	public GoodsVO getGoodsDetail(Long goodsNo) {
		return goodsMapper.getGoodsDetail(goodsNo);
	}
	
	// 상품 카테고리 조회
	public List<CategoryVO> getCategory(CategoryVO category) {
		return goodsMapper.getCategory(category);
	}





}
