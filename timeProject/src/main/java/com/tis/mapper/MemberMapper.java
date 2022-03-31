package com.tis.mapper;

import com.tis.domain.AddressVO;
import com.tis.domain.MemberVO;

public interface MemberMapper {

	// 로그인
	MemberVO getLogin(MemberVO user);
	
	// 회원 조회
	MemberVO getMemberWithId(String memberId);
	
	// 회원 조회  WITH EMAIL
	MemberVO getMemberWithEmail(String email);
	
	// 회원 등록
	int insertMember(MemberVO member); 
	
	// 권한 부여
	int insertAuth(String memberId);

	//회원정보수정
	int updateMember(MemberVO member);

	//회원탈퇴
	void memberDelete(String memberId);
	
	//회원탈퇴 - auth
	void authDelete(String memberId);
}
