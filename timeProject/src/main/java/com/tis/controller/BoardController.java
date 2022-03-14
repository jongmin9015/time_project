package com.tis.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
public class BoardController {
	
	//게시글 목록
	@RequestMapping("board_list")
	public ModelAndView list() throws Exception{
		List<BoardVO> boardlist = boardService.listAll();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/board");
		mav.addObject("boardlist", boardlist);
		log.info("get board_list......................" + boardlist);
		return mav;
	}
	
	//게시글 작성
	
	
	//게시글 상세내용 조회, 게시글 조회수 증가
	
}
