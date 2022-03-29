package com.tis.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.tis.domain.MemberVO;
import com.tis.mapper.MemberMapper;
import com.tis.security.domain.CustomUser;

import lombok.Data;
import lombok.extern.log4j.Log4j;
@Log4j
@Data
public class CustomUserDetailService implements UserDetailsService {
	
	@Autowired
	private MemberMapper memberMapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.info("load user by username = " + username );
		MemberVO member = memberMapper.getMemberWithId(username);		
		log.info("load user by member = " + member );
		return member == null ? null : new CustomUser(member);
	}

}
