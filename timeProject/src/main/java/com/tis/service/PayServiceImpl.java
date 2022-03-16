package com.tis.service;

import org.springframework.stereotype.Service;
import com.tis.domain.PayVO;
import com.tis.mapper.PayMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class PayServiceImpl implements PayService {

	private final PayMapper payMapper;
	
	// 결제 정보 조회
	@Override
	public PayVO getPay(String memberId) {
		return payMapper.getPay(memberId);
	}

	// 결제 정보 입력
	@Override
	public int insertPay(PayVO pay) {
		return payMapper.insertPay(pay);
	}
	
	// 결제 정보 삭제
	@Override
	public int deletePay(String memberId) {
		return payMapper.deletePay(memberId);
	}
	


}
