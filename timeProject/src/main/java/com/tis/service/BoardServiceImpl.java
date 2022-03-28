package com.tis.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tis.domain.BoardVO;
import com.tis.domain.Criteria;
import com.tis.domain.GoodsVO;
import com.tis.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	private final BoardMapper boardMapper;
	
	//게시글 목록
	@Override
	public List<BoardVO> getBoardList(Criteria cri) {
		return boardMapper.getBoardList(cri);
	}
	
	
	//게시글 조회
	@Override
	public BoardVO boardView(BoardVO board) {
		return boardMapper.boardView(board);
	}

	//게시글 작성
	@Override
	public void boardWrite(BoardVO board) {
		boardMapper.boardWrite(board);
	}

	//게시글 수정
	@Override
	public void boardmodify(BoardVO board) {
		boardMapper.boardmodify(board);
	}
	
	//게시글 삭제
	@Override
	public int boardDelete(int bno) {		
		return boardMapper.boardDelete(bno);
	}

	//게시글 총 갯수
	@Override
	public int getBoardTotal(Criteria cri) {
		return boardMapper.getBoardTotal(cri);
	}

	//조회수 올리기
	@Override
	public int updateViewCnt(int bno) {
		return boardMapper.updateViewCnt(bno);
	}

	//관리 상품리스트
	@Override
	public List<GoodsVO> boardGetGoodsList() {
		return boardMapper.boardGetGoodsList();
	}

	//상품등록
	@Override
	public void boardGoodsInsert(GoodsVO goods) {
		boardMapper.goodsInsert(goods);
	}

	//상품삭제
	@Override
	public void boardGoodsDelete(long goodsNo) {
		boardMapper.goodsDelete(goodsNo);
	}

	
	
	
}
