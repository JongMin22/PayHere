<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<sec:authorize access="isAuthenticated()">
<a href="http://localhost:8181/account/List">가계부 이동</a><br/>
<a href="http://localhost:8181/customLogout">로그아웃</a>
</sec:authorize>

<sec:authorize access="isAnonymous()">
	<h3>가계부 이용을 위해선 로그인이 필요합니다.</h3> 
<a href="http://localhost:8181/customLogin">로그인</a><br/>
<a href="http://localhost:8181/secu/join">회원가입</a>

</sec:authorize>



</body>
</html>