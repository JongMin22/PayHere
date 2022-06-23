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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <div id="header">
 </div>
 <div id="container">
 <h1>가계부</h1>
 <div id="account">
 <ul id="deletedList" style="list-style:None;">
 </ul>
 
 

 <div id="accountList">
 <button>가계부 리스트</button>
 </div> 
 
 
 <!-- 
 <div class="insert">
 <input/>
 </div>
  -->
 
 
 
 </div>
 <div id="footer">
 </div>
 </div>
 
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
 <script type="text/javascript">
 var csrfHeaderName ="${_csrf.headerName}";
 var csrfTokenValue ="${_csrf.token}";

 let id = "<sec:authentication property="principal.user.user_id"/>";
 let user_num = "<sec:authentication property="principal.user.user_num"/>";
 console.log("▼▼▼▼▼▼▼▼");
 console.log(id);
 console.log(user_num);
 
	// ■ 삭제된 가계부 리스트 가져오기.
 function DeletedList(){
 	  
 	$.getJSON("/payhere/deleted/", function(data){
 			
 						
 		let str = "";
 		
 		console.log(data);
 		
 		$(data).each(
 				function(){
 					let timestamp = this.accountRdate;
 					let date = new Date(timestamp);
 					let formattedTime = date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate();
 					
 			str += "<li id='deletedTitle'>"+this.accountTitle+"<li>"
 				+  "<p>지출 : "+this.money +" 날짜 : "+formattedTime+"</p><button id='restoreAccount' data-accountBookNum='"+this.accountBookNum+"'>복구</button>";
 			
				
 			$("#deletedList").html(str);
 		});
 	});

 	
 	
 	
	
 	
 }
DeletedList();



$("#account").on("click","#restoreAccount",function(){	
	var accountBookNum = $(this).attr("data-accountBookNum");
	accountBookNum = Number(accountBookNum);
	console.log(typeof(accountBookNum));
	
	$.ajax({
		type : 'put',
		url: '/payhere/restore',
		beforeSend : function(xhr){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		headers:{
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "PUT"
		},
		dataType : 'text',
		data : JSON.stringify({
			
			accountBookNum : accountBookNum
	}),
		success : function(result){
			if(result == 'SUCCESS'){
				alert("가계부가 복구되었습니다.");  
				
				DeletedList();

		} 
		}	// success 끝나는부분 
});	// ajax 끝나는부분 
	
});

$("#accountList").on("click",function(){	
	
	location.href="http://localhost:8181/account/List/";	
	
});
 
 </script>
 
 

</body>
</html>