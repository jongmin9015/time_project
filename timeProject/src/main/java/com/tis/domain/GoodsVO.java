package com.tis.domain;

import java.util.Date;

import lombok.Data;

@Data
public class GoodsVO {

	private Long goodsNo;
	private String goodsName;
	private String goodsCategory;
	private String goodsContent;
	private Long goodsPrice;
	private String goodsUnit;
	private String goodsWeight;
	private String goodsDelivery;
	private String goodsPackage;
	private String goodsAllergy;
	private String goodsImage;
	private Date goodsRegdate;
	private Date goodsUpdatedate;
}
