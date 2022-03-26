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
	private String category;
	
	private int nextno;
	private int preno;
	private String nexttit;
	private String pretit;
	
	
	//페이징 처리
	private Criteria cri;
	
	//게시판 분류
	private int bgno;

	public BoardVO() {
	}

	public BoardVO(Criteria cri) {
		this.cri = cri;
	}
	
	//글 상세보기에서 이전글 다음글 위해 bgno 받음
	public BoardVO(int bno, int bgno) {
		this.bno = bno;
		this.bgno = bgno;
	}
	
	
	
	
	
}
