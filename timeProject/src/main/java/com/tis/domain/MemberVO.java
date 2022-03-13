package com.tis.domain;

import lombok.Data;

@Data
public class MemberVO {

	private String memberId;
	private String memberPw;
	private String memberName;
	private String phone;
	private String email;
}
