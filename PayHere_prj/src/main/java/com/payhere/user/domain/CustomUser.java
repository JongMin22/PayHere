package com.payhere.user.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;

@Getter		// ★ 아이디, 비밀번호, 권한이라는 핵심 정보 세 개를 넘겨주면 됨 ( 나머지는 필요 없음 )
public class CustomUser extends User{
	
	private static final long serialVersionUID = 1L;
	
	// 내부에 유저vo가 있음 
	private UserVO user;

	
	// ■ 이것을 쓰든 (직접 입력을 받든지 )
	// 입력 받을 것들
		// 아이디, 비번, 권한 목록을 받아서 DB에 있는 것과 비교해서 최종 로그인을 결정함.!?
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	// ■ 이것을 쓰든 상관 없음 ( vo를 이용해서 getter로 가져오게 하든지 ) 
	public CustomUser(UserVO vo) {
		super(vo.getUser_id(), 
			  vo.getUser_pw(), 
			  vo.getAuthList().stream().map(author -> new SimpleGrantedAuthority(author.getAuth())).collect(Collectors.toList()));
		this.user = vo;
	}



	
}