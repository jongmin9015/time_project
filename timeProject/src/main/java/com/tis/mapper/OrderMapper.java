package com.tis.mapper;

import java.util.List;

import com.tis.domain.GoodsVO;
import com.tis.domain.OrderVO;

public interface OrderMapper {

	// 오더 작성
	int insertOrder(OrderVO order);
	
	// 오더 리스트 조회
	List<GoodsVO> getOrderList(String memberId);
	
	// 오더 리스트에 배송지 설정추가
	int updateOrder(OrderVO order);
}
