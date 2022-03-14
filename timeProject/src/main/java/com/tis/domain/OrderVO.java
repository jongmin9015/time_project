package com.tis.domain;

import lombok.Data;

@Data
public class OrderVO {

	private String memberId;
	private Long goodsNo;
	private int goodsCount;
	private String orderName;
	private String orderPhone;
	private String deliveryName;
	private String deliveryPhone;
	private String deliveryLocation;
	private String deliveryMessage;
	private String entrancePw;
	private int deliveryFee;
}
