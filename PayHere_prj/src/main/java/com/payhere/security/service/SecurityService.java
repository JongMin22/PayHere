package com.payhere.security.service;

import com.payhere.user.domain.UserVO;

public interface SecurityService {
	
	// ■ 회원가입 정보 DB에 적재
	public void insertMember(UserVO vo);
	
	
}