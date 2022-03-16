package com.tis.domain;

import lombok.Data;

@Data
public class PayVO {
	
	private String memberId;	
	private String orderGoodsName; 
	private String orderName; 
	private String orderPhone; 
	private String orderEmail;	 
	private String deliveryName;
	private String deliveryPhone;
	private String deliveryLocation;
	private String deliveryMessage;
	private String entrancePw;
	private String etcLocation;
	private Long totalPrice;
	private String address;
	private String addressSub;
	private String zipcode;
	private String payMethod;
	private String payId;
}
