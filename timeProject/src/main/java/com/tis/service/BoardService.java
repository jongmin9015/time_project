package com.tis.service;

import java.util.List;

import com.tis.domain.BoardVO;

public interface BoardService {
	//게시글 목록 + 페이징
	List<BoardVO> getBoardList(int displayPost, int postNum);
	
	//게시글 작성
	void boardWrite(BoardVO board);
	
	//게시물 조회
	BoardVO boardView(int bno);
	
	//게시물 수정
	void boardmodify(BoardVO board);
	
	//게시물 총 갯수
	int getBoardTotal();
	
	//게시물 목록 + 페이징
//	List<BoardVO> listPage(int displayPost, int postNum);
}
