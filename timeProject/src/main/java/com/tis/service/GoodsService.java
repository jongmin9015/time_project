package com.tis.service;

import java.util.List;

import com.tis.domain.GoodsVO;

public interface GoodsService {

	// 상품 조회
	List<GoodsVO> getList(GoodsVO vo);
}
