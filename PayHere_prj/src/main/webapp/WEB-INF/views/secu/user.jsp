<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>  user.jsp : 회원이면 접근 가능</h1>
	
	<p>principal : <sec:authentication property="principal"/></p>							
	<p>UserVO : <sec:authentication property="principal.user"/></p>					
	<p>user_id : <sec:authentication property="principal.user.user_id"/></p>					
	<p>user_pw : <sec:authentication property="principal.user.user_pw"/></p>					
	<p>user_name : <sec:authentication property="principal.user.user_name"/></p>					
	<p>user_pnum : <sec:authentication property="principal.user.user_pnum"/></p>					
	<p>user_email : <sec:authentication property="principal.user.user_email"/></p>					
	<p>user_coin : <sec:authentication property="principal.user.user_coin"/></p>					
	<p>user_coupon : <sec:authentication property="principal.user.user_coupon"/></p>					
	<p>user_rdate : <sec:authentication property="principal.user.user_rdate"/></p>					
	<p>user_auth_mdate : <sec:authentication property="principal.user.user_auth_mdate"/></p>					
	<p>user_enabled : <sec:authentication property="principal.user.user_enabled"/></p>					
	<p>authList : <sec:authentication property="principal.user.authList"/></p>					
	
	
	<script> <!-- 스크립트에 변수로 받아서 사용하는 방법 -->
		let user_id = "<sec:authentication property="principal.user.user_id"/>";
		console.log(user_id);
	</script>
	
	<a href="/customLogout">로그아웃 페이지 이동</a><!-- 얘는 get 방식으로 단순히 로그아웃 페이지로 이동한다 -->
	
</body>
</html>