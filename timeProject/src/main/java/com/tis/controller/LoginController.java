package com.tis.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.tis.domain.MemberVO;
import com.tis.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/login")
@RequiredArgsConstructor
public class LoginController {
	
	private final MemberService memberService;
	
	// 로그인 페이지
	@RequestMapping(value = "/move", method = RequestMethod.GET)
	public String move(Model model) {
		
		log.info("move to login .........................");
		return "/member/login";
	}
	
}
