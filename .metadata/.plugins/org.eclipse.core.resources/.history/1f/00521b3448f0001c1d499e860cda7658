<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>    
<!DOCTYPE html>
<html>
<head>
<style>
		.social-part .fa{
		    	padding-right:20px;
			}
			
			ul li a{
		    	margin-right: 20px;
			}
			.header{
				height:100px;
			}
			.container{
				height:1000px;
			}
			.footer{
				height:150px;
			}
			#headerfLi,#headerwLi,#headerrLi,#headermLi{
				list-style-type:none;
				float:left;
				margin-left:20px;
				font-size:30px;
				outline:solid 1px;
			}
			.fantasyLi , .romanceLi , .wuxiaLi , .mysteryLi{
				list-style-type:none;
				float:left;
				margin-left:20px;
				outline:solid 1px;
			}
			.writebtn,.List,.series{
				float:right;
				margin-right:10px;
			}
			.articleInfo{
				float:right;
			}
			.articleMain{
				text-align:center;
			} 
	
.menubar li ul {
list-style:none;
background: yellowgreen;
display:none;  /* 평상시에는 서브메뉴가 안보이게 하기 */
height:auto;
padding:0px;
margin:0px;
border:0px;
position:absolute;
width:200px;
z-index:200;
}
.menubar li:hover ul {
display:block;   /* 마우스 커서 올리면 서브메뉴 보이게 하기 */
}


	</style>
<meta charset="UTF-8">
<!--<link rel="styleshett" href="header-navi.css"> ◀ 헤더 네비바 css -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Raleway:400,500,500i,700,800i" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<!-- ■ 상단 네비바 -->
	<div class="header">
	    <nav class="navbar navbar-expand-sm   navbar-light bg-light">
	        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
	          <span class="navbar-toggler-icon"></span>
	        </button>
	
        	<div class="collapse navbar-collapse" id="navbarTogglerDemo03">
		          <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
			            <li class="nav-item">
			            	<a class="nav-link" href="/">홈 <span class="sr-only">(current)</span></a>
			            </li>
			            <li class="nav-item">
			              	<a class="nav-link" href="#">About</a>
			            </li>
			            <li class="nav-item dropdown dmenu">
			           		<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
			              		소설 선택
			            	</a>
			            	<div class="dropdown-menu sm-menu">
			              		<a class="dropdown-item" href="/free/novelList">무료소설</a>
			              		<a class="dropdown-item" href="/paid/novelList">유료소설</a>
			              	</div>
			          	</li>
			          <li class="nav-item">
				            <a class="nav-link" href="/enroll/list">작가 신청 게시판</a>
			          </li>
			          <li class="nav-item">
				            <a class="nav-link" href="/tourna/list2">토너먼트</a>
			          </li>
		          </ul><!-- ul 태그 끝 -->
		          <div class="menubar">
	   		
    	 	<ul> 	
    	  	<li style="list-style:none;"><a href="#" id="current">내정보</a>
        	 <ul>
           <li><a href="/mypage/myInfo">계정정보</a></li>
           <li><a href="/mypage/myFavor">선호작</a></li>
           <li><a href="/mypage/bookmark">책갈피</a></li>
           <li><a href="/customLogout">로그아웃</a></li>
           
     	    </ul>
   			   </li>
      			</ul>
      
   
</div>
	

	        </div><!-- div 끝 -->
	    </nav><!-- 네비바 끝 -->
     </div><!-- header 끝 --> 
<script>
     
		  // 네비 메뉴바 마우스 호버하는 경우 (소설 선택 -> 유료/무료 소설 페이지 뜨도록)
		     $(document).ready(function () {
		     $('.navbar-light .dmenu').hover(function () {
		             $(this).find('.sm-menu').first().stop(true, true).slideDown(150);
		         }, function () {
		             $(this).find('.sm-menu').first().stop(true, true).slideUp(105)
		         });
		     });
     
     </script>

<div class="container contact-form">

	<form action="/secu/update" method="post">
                <h3>회원정보</h3>
               <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="hidden" name="user_num" class="form-control" value="<sec:authentication property="principal.user.user_num"/>"/>
                        </div>
                        <br/>
                        <div class="form-group">
                            아이디  <input type="text" name="user_id" class="form-control" value="<sec:authentication property="principal.user.user_id"/>"/>
                        </div>
                        <br/>
                        <div class="form-group">
                            비밀번호  <input type="password" name="user_pw" class="form-control" value=""/>
                        </div>
                        <br/>
                        <div class="form-group">
                            이름  <input type="text" name="user_name" class="form-control" value="<sec:authentication property="principal.user.user_name"/>" />
                        </div>
                        <br/>
                        <div class="form-group">
                            핸드폰 <input type="text" name="user_phone" class="form-control" value="<sec:authentication property="principal.user.user_pnum"/>" />
                        </div>
                        <br/>
                        <div class="form-group">
                            이메일 <input type="email" name="user_email" class="form-control" value="<sec:authentication property="principal.user.user_email"/>" />
                        </div>
                        <br/>
                        <div class="form-group">
                            보유 코인<input type="text" name="user_coin" class="form-control" value="<sec:authentication property="principal.user.user_coin"/>" readonly/>
                        </div>
                        <br/>
                        <div class="form-group">
                            보유 쿠폰 <input type="text" name="user_coupon" class="form-control" value="<sec:authentication property="principal.user.user_coupon"/>" readonly/>
                        </div>
                        <br/>
                        <div class="form-group">
                            가입일 <input type="text" name="user_rdate" class="form-control" value="<sec:authentication property="principal.user.user_rdate"/>" readonly/>
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <br/>
                        <div class="form-group">
                            <input type="submit" name="Modify" class="btnModify" value="수정하기" onclick="location.href='http://localhost:8181/mypage/myinfo'"//>
                        </div>
                    </div>
                   
                </div>
            </form>
</div>            

</body>
</html>