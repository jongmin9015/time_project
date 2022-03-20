package com.tis.service;

import org.springframework.stereotype.Service;

import com.tis.domain.AddressVO;
import com.tis.mapper.AddressMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AddressServiceImpl implements AddressService {

	private final AddressMapper addressMapper;
	
	// 배송지 저장
	@Override
	public int insertAddress(AddressVO address) {
		return addressMapper.insertAddress(address);
	}
	
	// 배송지 조회
	@Override
	public AddressVO getAddress(String memberId) {
		return addressMapper.getAddress(memberId);
	}

	// 배송지 삭제
	@Override
	public int deleteAddress(String memberId) {
		return addressMapper.deleteAddress(memberId);
	}
	
	// 배송지 수정
	@Override
	public int updateAddress(AddressVO address) {
		return addressMapper.updateAddress(address);
	}
	
	// 회원 배송지 조회
	@Override
	public AddressVO getAddressWithMember(String memberId) {
		return addressMapper.getAddressWithMember(memberId);
	}

	
}
