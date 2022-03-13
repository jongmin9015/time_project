package com.tis.mapper;

import com.tis.domain.MemberVO;

public interface MemberMapper {

	// 회원 조회
	MemberVO getMember(String memberId);
}
