package com.tis.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {

	private String memberId;
	private String memberPw;
	private String memberName;
	private String phone;
	private String email;
	private String address;
	private String addressSub;
	private String zipcode;
	private String gender;
	private Date birth;
}
