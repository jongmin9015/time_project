package com.tis.service;

import com.tis.domain.AddressVO;

public interface AddressService {

	// 배송지 저장 
	int insertAddress(AddressVO address);
	
	// 배송지 조회
	AddressVO getAddress(String memberId);
	
	// 배송지 삭제
	int deleteAddress(String memberId);
	
	// 배송지 수정
	int updateAddress(AddressVO address);
	
	// 회원 배송지 조회
	AddressVO getAddressWithMember(String memberId);
}
