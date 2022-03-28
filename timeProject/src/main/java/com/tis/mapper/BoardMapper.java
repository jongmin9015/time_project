package com.tis.mapper;

import java.util.List;

import com.tis.domain.BoardVO;
import com.tis.domain.Criteria;
import com.tis.domain.GoodsVO;

public interface BoardMapper {
	//게시글 목록
	List<BoardVO> getBoardList(Criteria cri);	
	
	//게시글 작성
	void boardWrite(BoardVO board);
	
	//게시글 조회
	BoardVO boardView(BoardVO board);
	
	//게시글 수정
	void boardmodify(BoardVO board);
	
	//게시글 삭제
	int boardDelete(int bno);
	
	//게시글 총 갯수
	int getBoardTotal(Criteria cri);
	
	//조회수 올리기
	int updateViewCnt(int bno);
	
	//관리 상품리스트
	List<GoodsVO> boardGetGoodsList();
	
	//상품등록
	void goodsInsert(GoodsVO goods);
	
	//상품삭제
	void goodsDelete(long goodsNo);
}
