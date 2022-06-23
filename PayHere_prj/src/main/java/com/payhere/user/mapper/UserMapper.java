package com.payhere.user.mapper;

import com.payhere.user.domain.UserVO;

public interface UserMapper {	
	
	// ■ 해당 유저 정보 가져오기
	public UserVO getUserInfo(String userId);
	
	// ■ 회원가입 로직 - 회원정보 기입
	public void insertMemberTbl(UserVO vo);
				
	// ■ 회원가입 로직 - 권한 목록 기입 ( ★ 다중 insert 구문은 update 태그로 처리한다 )
	public void insertMemberAuth(UserVO vo); // MemberVO 내부에 authList가 있기 때문에 MemberVO로 받는다.
	


	
	
}
