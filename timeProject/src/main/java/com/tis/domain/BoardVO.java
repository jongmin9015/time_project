package com.tis.domain;


import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private int viewcnt;
	private String categoryNo;
	
	//boardCategoryVO
	private BoardCategoryVO boardCategoryVO;
	
	//페이징 처리
	private Criteria cri;
	
	//게시판 분류
	private int bgno;

	public BoardVO() {
	}

	public BoardVO(Criteria cri) {
		this.cri = cri;
	}
	
	
	
}
