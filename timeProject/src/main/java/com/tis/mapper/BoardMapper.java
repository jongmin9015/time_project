package com.tis.mapper;

import java.util.List;

import com.tis.domain.BoardVO;
import com.tis.domain.Criteria;

public interface BoardMapper {
	//게시글 목록
	List<BoardVO> getBoardList(Criteria cri);	
	
	//게시글 작성
	void boardWrite(BoardVO board);
	
	//게시글 조회
	BoardVO boardView(int bno);
	
	//게시글 수정
	void boardmodify(BoardVO board);
	
	//게시글 총 갯수
	int getBoardTotal(Criteria cri);
}
