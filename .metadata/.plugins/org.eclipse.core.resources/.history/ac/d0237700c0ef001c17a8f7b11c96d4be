package com.novel.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.novel.user.domain.CustomUser;
import com.novel.user.domain.UserVO;
import com.novel.user.mapper.UserMapper;

import lombok.extern.log4j.Log4j;

@Log4j	 
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private UserMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		log.warn("유저 이름 확인 -> " + username);
		
		UserVO vo = mapper.getUserInfo(username);
		
		log.warn("확인된 유저 이름으로 얻어온 정보 -> " + vo);
		
		return vo == null? null : new CustomUser(vo);
		
		// 순서
			// 1. UserVO를 받아온다
			// 2. vo가 null이 아닌 경우 CustomUser 생성자를 이용해 vo를 변환
			
			// UserVO를 CustomUser로 변환 -> CustomUser(user를 상속) > User(UserDetail을 상속) > UserDetail : 스프링 시큐리티에서 사용
			// 즉, UserVO를 스프링 시큐리티에서 사용할 수 있도록 바꾼 것
			
	}

}
