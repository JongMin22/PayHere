<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>페이히어 로그인</h1>
	<h2><c:out value="${error}"/></h2>
	<h2><c:out value="${logout}"/></h2>
	
	<form action="/login" method="post">
		아이디 : <input type="text" name="username" value="user"><br/>
		비밀번호: <input type="text" name="password" value="pw"><br/><br/>
		자동로그인 : <input type="checkbox" name="remember-me"/> &nbsp;&nbsp;
		<input type="submit" value="로그인하기"/>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> <!-- 이것을 넣어야 scrf 공격에 안전함. --> 
	</form>


</body>
</html>