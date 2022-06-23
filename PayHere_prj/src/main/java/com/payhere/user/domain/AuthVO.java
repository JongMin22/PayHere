package com.payhere.user.domain;

import lombok.Data;

@Data
public class AuthVO {	// ◀ 등급 테이블
	
	private long auth_num;		// 등급 넘버
	private String user_id;		// 유저 아이디			- 유저
	private String auth;		// 권한

}
