package com.tis.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tis.domain.GoodsVO;
import com.tis.domain.OrderVO;
import com.tis.mapper.OrderMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class OrderServiceImpl implements OrderService {

	private final OrderMapper orderMapper;
	
	// 오더 작성
	@Override
	public int insertOrder(OrderVO order) {
		return orderMapper.insertOrder(order);
	}
	
	// 오더 리스트 조회
	@Override
	public List<GoodsVO> getOrderList(String memberId) {
		return orderMapper.getOrderList(memberId);
	}
	
	// 오더 생성전 삭제
	@Override
	public int deleteOrder(String memberId) {
		return orderMapper.deleteOrder(memberId);
	}

}
