package com.tis.mapper;

import java.util.List;

import com.tis.domain.GoodsVO;

public interface GoodsMapper {
	
	// 상품 조회
	public List<GoodsVO> goodsList(GoodsVO vo);

}
