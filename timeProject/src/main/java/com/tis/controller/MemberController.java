package com.tis.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.tis.domain.MemberVO;
import com.tis.security.CustomUserDetailService;
import com.tis.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {
	private final MemberService memberService;
	private final CustomUserDetailService customUser;
	BCryptPasswordEncoder encoder;
	
	//유저 비밀번호 확인 GET
	
	 @RequestMapping(value="/memberPwCheck", method = RequestMethod.GET) 
	 public void getMemberPwCheck(Principal principal) {
		 
		 log.info("member......................" + "getMemberPwCheck GET"); 
	 
	 }
	 
	
	//유저 비밀번호 확인 POST
	@RequestMapping(value="/memberPwCheck", method = RequestMethod.POST)
	public String memberPwCheck(Principal principal, @RequestParam("memberPw")String pw, Model model) {
		log.info("member......................" + "memberPwCheck POST");
		UserDetails custUser = customUser.loadUserByUsername(principal.getName());
		if(encoder.matches(pw, custUser.getPassword())) {
			 return "redirect:/member/memberUpdate";
		 }else {
			 return "redirect:/member/memberPwCheck?fail=true";
		 }
		
	}
	
	//유저 개인정보수정	- GET
	@RequestMapping(value="/memberUpdate", method = RequestMethod.GET) 
	public void getMemberUpdate(MemberVO member, Model model, Principal principal) {
		String memberId = principal.getName();
		model.addAttribute("member", memberService.getMemberWithId(memberId));
		log.info("member......................" + "memberUpdate GET");
	}
	
	
	
	//유저 개인정보수정	- POST
	@RequestMapping(value="/memberUpdate", method = RequestMethod.POST) 
	public String memberUpdate(MemberVO member,Principal principal, Model model) {	 
		String memberPw = encoder.encode(member.getMemberPw());
		member.setMemberPw(memberPw);
		
		memberService.updateMember(member);		
		model.addAttribute("member", member);
		log.info("member......................" + "memberUpdate POST");
	 
		return "redirect:/member/memberInfo"; 
	}
	
	//유저 정보
	@RequestMapping(value="/memberInfo", method = RequestMethod.GET)
	public void memberView(MemberVO member, Principal principal, Model model) {
		String memberId = principal.getName();
		member = memberService.getMemberWithId(memberId);
		model.addAttribute("member", member);
		log.info("member......................" + "memberView");
	}
	
	//회원탈퇴
	@RequestMapping(value="/memberDelete")
	public String memberDelete(Principal principal, SessionStatus sessionStatus) {
		String memberId = principal.getName();
		memberService.memberDelete(memberId);
		if(sessionStatus.isComplete()==false) sessionStatus.isComplete();
		SecurityContextHolder.clearContext();
		return "redirect:/";
	};
	 
}
