package com.tis.mapper;

import com.tis.domain.MemberVO;

public interface MemberMapper {

	// 회원 조회
	MemberVO getMemberWithId(String memberId);
	
	// 회원 조회  WITH EMAIL
	MemberVO getMemberWithEmail(String email);
	
	// 회원 등록
	int insertMember(MemberVO member); 
}
