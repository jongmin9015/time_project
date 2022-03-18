package com.tis.service;

import org.springframework.stereotype.Service;

import com.tis.domain.MemberVO;
import com.tis.mapper.MemberMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	private final MemberMapper memberMapper;
	
	// 회원 조회  WITH ID
	@Override
	public MemberVO getMemberWithId(String memberId) {
		return memberMapper.getMemberWithId(memberId);
	}

	// 회원 조회  WITH EMAIL
	@Override
	public MemberVO getMemberWithEmail(String email) {
		// TODO Auto-generated method stub
		return memberMapper.getMemberWithEmail(email);
	}
	
	// 회원 등록
	@Override
	public int insertMember(MemberVO member) {
		return memberMapper.insertMember(member);
	}

}
