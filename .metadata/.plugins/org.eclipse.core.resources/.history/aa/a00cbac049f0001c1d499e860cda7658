<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>회원가입창</h1>
	<form action="/secu/join" method="post">
		<input type="text" name="user_id" placeholder="아이디"/><br/> <!-- UserVO 내부의 변수명과 같게 해야함 -->
		<input type="password" name="user_pw" placeholder="비밀번호"/><br/>
		<input type="text" name="user_name" placeholder="이름"/><br/>
		<input type="text" name="user_pnum" maxlength="13" placeholder="핸드폰 번호"/><br/>
		<input type="email" name="user_email" placeholder="이메일"/><br/><br/>
		
		권한 선택 : 
		<input type="checkbox" name="role" value="ROLE_ADMIN"/> 관리자  &nbsp;&nbsp; 	
		<input type="checkbox" name="role" value="ROLE_PAID_WRITER"/> 유료 작가  &nbsp;&nbsp; 	<!-- 실제로 이렇게 권한 체크 안함. -->
		<input type="checkbox" name="role" value="ROLE_FREE_WRITER"/> 무료 작가 &nbsp;&nbsp;	<!-- 작업할 때 만들기 편하라고 체크박스 만듦 -->
		<input type="checkbox" name="role" value="ROLE_USER"/> 일반 회원 <br/>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/><br/>
		<input type="submit" value="가입하기"/>
	</form>

</body>
</html>