package com.tis.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tis.domain.BoardVO;
import com.tis.domain.Criteria;
import com.tis.domain.GoodsVO;
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
	public void boardList(Model model, Criteria cri, @RequestParam("bgno")int bgno){		
		cri.setBgno(bgno);
		List<BoardVO> boardList = boardService.getBoardList(cri);
		List<GoodsVO> boardGetGoodsList = boardService.boardGetGoodsList();
		int total = boardService.getBoardTotal(cri);
		PageDTO pageMake = new PageDTO(cri, total);
		
		model.addAttribute("goodsList", boardGetGoodsList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageMaker", pageMake);
		
		log.info("get board_list......................" + "board_list");
	}

	
	
	//게시글 작성 GET
	@RequestMapping(value = "/boardwrite", method = RequestMethod.GET)
	public void boardGetWrite(Model model, @RequestParam("bgno")int bgno) {
		model.addAttribute("bgno", bgno);
		log.info("get board_list......................" + "boardWrite_GET");
	}
	
	//게시글 작성
	@RequestMapping(value = "/boardwrite", method = RequestMethod.POST)
	public String boardWrite(Model model, BoardVO board, @RequestParam("bgno")int bgno) {
		boardService.boardWrite(board);
		model.addAttribute("bgno", bgno);
		log.info("get board_list......................" + "boardWrite_POST");
		return "redirect:/board/board_list";
	}
	
	//게시글 조회
	@RequestMapping(value = "/boardView", method = RequestMethod.GET)
	public void boardGetView(Model model, BoardVO board, @RequestParam("bno")int bno, @RequestParam("bgno")int bgno) {
		//조회수 증가
		boardService.updateViewCnt(bno);
		
		board.setBno(bno);
		board.setBgno(bgno);
		model.addAttribute("boardView", boardService.boardView(board));
		model.addAttribute("bgno", bgno);
		log.info("get board_list......................" + "boardView");
	}
	
	//게시글 수정 GET
	@RequestMapping(value = "/boardmodify", method = RequestMethod.GET)
	public void boardGetmodify(Model model, BoardVO board, @RequestParam("bno")int bno, @RequestParam("bgno")int bgno) {
		
		board.setBno(bno);
		board.setBgno(bgno);
		model.addAttribute("boardView", boardService.boardView(board));
		model.addAttribute("bgno", bgno);
		log.info("get board_list......................" + "boardmodify_GET");
	}
	
	//게시글 수정
	@RequestMapping(value = "/boardmodify", method = RequestMethod.POST)
	public String boardmodify(Model model, BoardVO board, @RequestParam("bgno")int bgno) {
		boardService.boardmodify(board);
		model.addAttribute("bgno", bgno);
		log.info("get board_list......................" + "boardmodify_POST");
		return "redirect:/board/boardView?bno=" + board.getBno();
	}
	
	//게시글 삭제
	@RequestMapping(value="/boardDelete")
	public String boardDelete(Model model,int bno, @RequestParam("bgno")int bgno) {
		boardService.boardDelete(bno);
		model.addAttribute("bgno", bgno);
		log.info("get board_list......................" + "boardDelete");
		return "redirect:/board/board_list";
	}
	
	//상품 등록 GET
	@RequestMapping(value="/boardGoodsInsert", method = RequestMethod.GET)
	public void boardGoodsGetInsert(@RequestParam("bgno")int bgno, Model model) {
		model.addAttribute("bgno", bgno);
		log.info("get board_list......................" + "boardGoodsGetInsert_GET");
	}
	
	//상품 등록 POST
	@RequestMapping(value = "/boardGoodsInsert", method = RequestMethod.POST)	
	public String boardGoodsInsert(Model model, GoodsVO goods, @RequestParam("bgno")int bgno) throws Exception{
		
		model.addAttribute("bgno", bgno);
		boardService.boardGoodsInsert(goods);
		
		log.info("get board_list......................" + "boardmodify_POST");
		return "redirect:/board/board_list?bno=0";
	}
	
	//상품 삭제
	@RequestMapping(value="/boardGoodsDelete")
	public String boardGoodsDelete(Model model, long goodsNo, @RequestParam("bgno")int bgno) {
		boardService.boardGoodsDelete(goodsNo);
		model.addAttribute("bgno", bgno);
		log.info("get board_list......................" + "boardGoodsDelete");
		return "redirect:/board/board_list";
	}
	
}
