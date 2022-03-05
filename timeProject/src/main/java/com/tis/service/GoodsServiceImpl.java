package com.tis.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tis.domain.GoodsVO;
import com.tis.mapper.GoodsMapper;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class GoodsServiceImpl implements GoodsService {
	
	private final GoodsMapper goodsMapper;
	

	// 상품 조회
	@Override
	public List<GoodsVO> getList(GoodsVO vo) {
		return goodsMapper.goodsList(vo);
	}

}
