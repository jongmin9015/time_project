package com.tis.domain;

import lombok.Data;

@Data
public class AddressVO {

	private String address;
	private String addressSub;
	private int zipcode;
	private String memberId;
}
