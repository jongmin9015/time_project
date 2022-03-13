package com.tis.service;

import com.tis.domain.MemberVO;

public interface MemberService {
	
	// 회원 조회
	MemberVO getMember(String memberId);

}
