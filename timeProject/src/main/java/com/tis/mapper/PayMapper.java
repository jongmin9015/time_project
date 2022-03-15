package com.tis.mapper;

import com.tis.domain.PayVO;

public interface PayMapper {
	
	// 결제 정보 조회
	PayVO getPay(String memberId);
	
	// 결제 정보 입력
	int insertPay(PayVO pay);
	
	// 결제 정보 삭제
	int deletePay(String memberId);

}
