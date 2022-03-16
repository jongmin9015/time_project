package com.tis.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sun.org.apache.bcel.internal.generic.NEW;
import com.tis.domain.BoardVO;
import com.tis.domain.Criteria;
import com.tis.domain.PageDTO;
import com.tis.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	private final BoardService boardService;
	
	//게시글 목록
	@RequestMapping(value = "/board_list", method = RequestMethod.GET)
	public void boardList(Model model, @RequestParam("num")int num){
		
		//게시물 총 갯수
		int count = boardService.getBoardTotal();
		
		//한 페이지에 출력할 게시물 갯수
		int postNum = 10;
		
		//하단 페이징 번호
		int pageNum = (int)Math.ceil((double)count/postNum);
		
		//출력할 게시물
		int displayPost = (num-1)*postNum;
		
		
		List<BoardVO> boardList = boardService.getBoardList(displayPost, postNum);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageNum", pageNum);
		
		log.info("get board_list......................" + "board_list");
	}
	//게시글 작성 GET
	@RequestMapping(value = "/boardwrite", method = RequestMethod.GET)
	public void boardGetWrite() {
		log.info("get board_list......................" + "boardWrite_GET");
	}
	
	
	//게시글 작성
	@RequestMapping(value = "/boardwrite", method = RequestMethod.POST)
	public String boardWrite(BoardVO board) {
		boardService.boardWrite(board);
		log.info("get board_list......................" + "boardWrite_POST");
		return "redirect:/board/board_list";
	}
	
	//게시글 조회
	@RequestMapping(value = "/boardView", method = RequestMethod.GET)
	public void boardGetView(Model model, @RequestParam("bno")int bno) {
		BoardVO board = boardService.boardView(bno);
		model.addAttribute("boardView", board);
		log.info("get board_list......................" + "boardView");
	}
	
	//게시글 수정 GET
	@RequestMapping(value = "/boardmodify", method = RequestMethod.GET)
	public void boardGetmodify(Model model, @RequestParam("bno")int bno) {
		BoardVO board = boardService.boardView(bno);
		model.addAttribute("boardView", board);
		log.info("get board_list......................" + "boardmodify_GET");
	}
	
	//게시글 수정
	@RequestMapping(value = "/boardmodify", method = RequestMethod.POST)
	public String boardmodify(BoardVO board) {
		boardService.boardmodify(board);
		log.info("get board_list......................" + "boardmodify_POST");
		return "redirect:/board/boardView?bno=" + board.getBno();
	}
	
	//게시물 목록 + 페이징
//	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
//	public void getBoardPage(Model model, @RequestParam("num")int num) {
//		//게시물 총 갯수
//		int count = boardService.getBoardTotal();
//		
//		//한 페이지에 출력할 게시물 갯수
//		int postNum = 10;
//		
//		//하단 페이징 번호
//		int pageNum = (int)Math.ceil((double)count/postNum);
//		
//		//출력할 게시물
//		int displayPost = (num-1)*postNum;
//		
//		List<BoardVO> list = boardService.listPage(displayPost, postNum);
//		model.addAttribute("PageList", list);
//		model.addAttribute("pageNum", pageNum);
//		log.info("get board_list......................" + "boardList+page");
//	}
}
