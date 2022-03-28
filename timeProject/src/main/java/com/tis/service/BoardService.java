package com.tis.service;

import java.util.List;

import com.tis.domain.BoardVO;
import com.tis.domain.Criteria;
import com.tis.domain.GoodsVO;

public interface BoardService {
	//게시글 목록
	List<BoardVO> getBoardList(Criteria cri);	
	
	//게시글 작성
	void boardWrite(BoardVO board);
	
	//게시물 조회
	BoardVO boardView(BoardVO board);
	
	//게시물 수정
	void boardmodify(BoardVO board);
	
	//게시물 삭제
	int boardDelete(int bno);
	
	//게시물 총 갯수
	int getBoardTotal(Criteria cri);
	
	//조회수 올리기
	int updateViewCnt(int bno);
	
	//관리 상품리스트
	List<GoodsVO> boardGetGoodsList();
	
	//상품등록
	void boardGoodsInsert(GoodsVO goods);
	
	//상품삭제
	void boardGoodsDelete(long goodsNo);
	
}
