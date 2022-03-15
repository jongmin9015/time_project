package com.tis.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tis.domain.BoardVO;
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
	public List<BoardVO> getBoardList(int displayPost, int postNum) {
		return boardMapper.getBoardList(displayPost, postNum);
	}
	
	//게시글 조회
	@Override
	public BoardVO boardView(int bno) {
		return boardMapper.boardView(bno);
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

	//게시글 총 갯수
	@Override
	public int getBoardTotal() {
		return boardMapper.getBoardTotal();
	}
	
	//게시글 목록 + 페이징
//	@Override
//	public List<BoardVO> listPage(int displayPost, int postNum) {
//		return boardMapper.listPage(displayPost, postNum);
//	}
	
}