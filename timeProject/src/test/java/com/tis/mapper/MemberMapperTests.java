package com.tis.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tis.domain.MemberVO;
import com.tis.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)

@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberMapperTests {
	
	@Autowired
	private  MemberService memberService;
	
//	@Test
//	public void getNo() {
//		goodsMapper.getGoodsDetail(101L);
//	}
	

	@Test
	public void test() {
		MemberVO member = new MemberVO();
		member.setMemberId("kimjisoo1122");
		member.setMemberPw("azsxd1122");
		MemberVO vo = memberService.getMemberWithId("kimjisoo3653");
		vo.getAuthList().forEach(auth -> log.info(auth));
	}
}
