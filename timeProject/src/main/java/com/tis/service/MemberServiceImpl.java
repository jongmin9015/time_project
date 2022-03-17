package com.tis.service;

import org.springframework.stereotype.Service;

import com.tis.domain.MemberVO;
import com.tis.mapper.MemberMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	private final MemberMapper memberMapper;
	
	// 회원 조회
	@Override
	public MemberVO getMember(String memberId) {
		return memberMapper.getMember(memberId);
	}

	// 회원 등록
	@Override
	public int insertMember(MemberVO member) {
		return memberMapper.insertMember(member);
	}

}
