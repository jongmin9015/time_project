package com.tis.domain;

import lombok.Data;

@Data
public class Criteria {
	//게시판 분류
	private int bgno;		
	//검색 키워드
	private String keyword;
	//검색 타입
	private String type;
	//검색 타입 배열 변환
	private String[] typeArr;
	
	private int pageNum;
	private int amount;
	
	public Criteria() {
		this(1,9);
	}
	
	//type변수에 데이터 들어왔을 때 자동으로 배열로
	public void setType(String type) {
		this.type = type;
		this.typeArr = type.split("");
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
}
