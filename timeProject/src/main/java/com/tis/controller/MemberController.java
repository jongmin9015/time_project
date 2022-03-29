package com.tis.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tis.domain.MemberVO;
import com.tis.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {
	private final MemberService memberService;
	
	//유저 비밀번호 확인 GET
	@RequestMapping(value="/memberPwCheck", method = RequestMethod.GET)
	public void getMemberPwCheck(Principal principal, Model model) {
		
		log.info("member......................" + "getMemberPwCheck GET");
	}
	
	//유저 비밀번호 확인 POST
	@RequestMapping(value="/memberPwCheck", method = RequestMethod.POST)
	public String memberPwCheck(MemberVO member, Principal principal, Model model) {
		
		if(memberService.getLogin(member) == null) {
			return "/member/memberPwCheck";
		}
			
		
		
		
		log.info("member......................" + "memberPwCheck POST");
		return "redirect:/member/memberUpdate";
		
	}
	
	//유저 개인정보수정
	/*
	 * @RequestMapping(value="/memberPwCheck", method = RequestMethod.POST) public
	 * String memberPwCheck1() {
	 * 
	 * 
	 * 
	 * log.info("member......................" + "memberPwCheck POST");
	 * 
	 * return "redirect:/member/memberInfo"; }
	 */
}
