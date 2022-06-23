package com.payhere.user.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class UserVO {	// ◀ 유저 테이블
	
	private long user_num;			// 유저 번호
	private String user_id;			// 유저 아이디
	private String user_pw;			// 비밀번호
	private String user_name;		// 이름
	private String user_pnum;		// 폰번호
	private String user_email;		// 이메일
	private Date user_rdate;		// 가입일
	private boolean user_enabled;	// 인증
	
	// 조인을 대비한 authList
	private List<AuthVO> authList;  // 등급 리스트

}