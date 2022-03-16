package com.tis.domain;
//create table tbl_board(
//	    bno     number not null,        --게시물 번호
//	    title   varchar2(200) not null, --제목
//	    content varchar2(4000),         --내용
//	    writer  varchar2(50) not null,  --이름
//	    regdate date default sysdate,   --작성일자
//	    viewcnt number default 0,       --조회수
//	    PRIMARY key(bno)                --게시물 번호 기본키설정
//	);

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class BoardVO {
	private int bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private int viewcnt;
	
	//페이징 처리
	private Criteria cri;
	
	

	public BoardVO() {
	}



	public BoardVO(Criteria cri) {
		super();
		this.cri = cri;
	}

	
	
	
	
}
