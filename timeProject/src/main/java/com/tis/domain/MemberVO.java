package com.tis.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;
	 @DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date regDate;
}
