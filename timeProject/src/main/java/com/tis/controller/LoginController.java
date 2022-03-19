package com.tis.controller;

import java.util.Random;

import org.apache.http.protocol.HTTP;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tis.domain.MemberVO;
import com.tis.service.MemberService;
import com.tis.service.MesseageService;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/login")
@RequiredArgsConstructor
public class LoginController {
	
	private final MesseageService messageService;
	private final MemberService memberService;
	
	// 로그인 페이지
	@RequestMapping(value = "/move", method = RequestMethod.GET)
	public String login() {
		
		log.info("move to login .........................");
		return "/member/login";
	}
	
	// 회원가입 페이지
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String join() {
		
		log.info("move to signup .........................");
		return "/member/signup";
	}

	// 아이디 중복 체크
	@RequestMapping(value = "/check_id/{memberId}", method = RequestMethod.GET,
			        produces = "application/text; charset=UTF-8")
	public ResponseEntity<String> idCheck(@PathVariable("memberId")String memberId){
		
		MemberVO member = memberService.getMemberWithId(memberId);
		if(member == null) {
			log.info("usable Id...........................");
			return new ResponseEntity<String>("사용 가능한 아이디입니다", HttpStatus.OK);
		} else {
			log.info("already used Id...........................");
			return new ResponseEntity<String>("이미 존재하는 아이디입니다", HttpStatus.BAD_REQUEST);							
		}				
	}
	
	// 아이디 중복 체크
	@RequestMapping(value = "/check_email/{email:.+}", method = RequestMethod.GET,
					produces = "application/text; charset=UTF-8")
	public ResponseEntity<String> emailCheck(@PathVariable("email")String email){
			
		if (email.indexOf(".co") > 0) {
			email += "m";
		}
		
		MemberVO member = memberService.getMemberWithEmail(email);
		if(member == null) {
			log.info("usable Email...........................");
			return new ResponseEntity<String>("사용 가능한 이메일입니다", HttpStatus.OK);
		} else {
			log.info("already used Email...........................");
			return new ResponseEntity<String>("이미 존재하는 이메일입니다", HttpStatus.BAD_REQUEST);							
		}				
	}
	
	// 핸드폰 인증번호 API
	@RequestMapping(value = "/sms/{phoneNumber}", method = RequestMethod.GET)
	@ResponseBody
	public String sms(@PathVariable("phoneNumber")String phoneNumber) {
		
		String numStr = "";
		
		Random ran = new Random();
		for(int i = 0; i < 4; i++) {
			numStr += Integer.toString(ran.nextInt(10));		
		}
		
		log.info("수신자 핸드폰번호 : " + phoneNumber);
		log.info("인증번호 : " + numStr);
		/* messageService.sendMessage(phoneNumber, numStr); */
		return numStr;
	}
	
	// 회원가입 진행 
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signUp(MemberVO member) {
		
		memberService.insertMember(member);
		log.info("sign up .............................. " + member );
		return "redirect:/";
	}
}