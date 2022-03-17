package com.tis.service;

import com.tis.domain.MemberVO;

public interface MemberService {
	
	// 회원 조회
	MemberVO getMember(String memberId);
	
	// 회원 등록
	int insertMember(MemberVO member);

}
