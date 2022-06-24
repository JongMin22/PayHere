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
<style>
#updateDiv,#detailDiv{
	width:300px;
	height:100px;
	background-color:pink;
	position:absolute;
	top:50%;
	left:50%;
	margin-top:-50px;
	margin-left:-150px;
	padding:10px;
	z-index:1000;
	}
	
</style>
</head>
<body>
 <div id="header">
 </div>
 <div id="container">
 <h1>가계부</h1>
 <div id="account">
 <ul id="accountList" style="list-style:None;">
 </ul>
 <div id="total"></div>
 </div>
 
 
 
<!-- 가계부 작성란 -->
<div class="insert">
<strong>제목</strong>
<input type="text" id="insertTitle" />
<strong>지출액</strong>
<input type="number" id="money" />
<strong>지출 내역</strong>
<input type="text" id="insertContent"/>
</div>
<div> 
	<button type="button" id="insertAccount">가계부 작성</button>
</div>

<!-- =============================여기까지 가계부 작성================================= -->


<!-- ■ 가계부 내역창  -->
	<div id="detailDiv" style="display:none;">
	<div class="detailTitle"></div>
	<div>
		<strong>제목</strong>
		<input type="text" id="detailTitle" value="" readonly/><br/>
		<strong>지출액</strong>
		<input type="number" id="detailMoney" value="" readonly/><br/>
		<strong>지출 내역</strong>
		<input type="text" id="detailContent" value="" readonly/><br/>
		

	</div>
	<div>
		<button type="button" id="closeBtn">닫기</button>
	</div>
	</div>

<!-- =====================■ 여기까지 가계부 내역창 ■ =========================== -->

<!-- ■ 가계부 수정창  -->
	<div id="updateDiv" style="display:none;">
	<div class="updateTitle"></div>
	<div>
		<input type="hidden" id="updateBookNum" value=""/>
		<strong>제목</strong>
		<input type="text" id="updateTitle" value=""/><br/>
		<strong>지출액</strong>
		<input type="number" id="updateMoney" value=""/><br/>
		<strong>지출 내역</strong>
		<input type="text" id="updateContent" value=""/><br/>
		

	</div>
	<div>
		<button type="button" id="updateBtn">수정</button>
		<button type="button" id="closeBtn">닫기</button>
	</div>
	</div>

<!-- =====================■ 여기까지 가계부 수정창 ■ =========================== -->	
	


<!-- ■ 삭제한 가계부 리스트 목록  -->
 <div id="deletedAccount">
 <button>삭제된 가계부 리스트</button>
 </div>
 <!-- ===================================================================== --> 
 </div>
 <div id="footer">
 </div>

 
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
 <script type="text/javascript">

 // ■ csrf 토큰을 이용한 로그인한 사용자 관련 정보 받아오기.
 var csrfHeaderName ="${_csrf.headerName}";
 var csrfTokenValue ="${_csrf.token}";
 let id = "<sec:authentication property="principal.user.user_id"/>";
 let user_num = "<sec:authentication property="principal.user.user_num"/>";
 console.log("▼▼▼▼▼▼▼▼");
 console.log(id);
 console.log(user_num);
 // ========================================================================================
 

 // ■ 가계부 리스트 가져오기.
 function accountBookList(){
 	  
 	$.getJSON("/payhere/account/", function(data){
 			
 						
 		let str = "";
 		
 		console.log(data);
 		
 		$(data).each(
 				function(){
 					let timestamp = this.accountRdate;
 					let date = new Date(timestamp);
 					let formattedTime = date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate();
 					
 			str += "<li id='accountTitle' data-accountBookNum='"+this.accountBookNum+"'>"+this.accountTitle+"<li>"
 				+  "<p>지출 : "+this.money +" 작성일 : "+formattedTime+"</p>"
 				+  "<button id='update' data-accountBookNum='"+this.accountBookNum+"' data-accountTitle='"+this.accountTitle+"' data-accountContent='"+this.accountContent+"' data-money='"+this.money+"'>수정</button>"
 				+  "<button id='delete' data-accountBookNum='"+this.accountBookNum+"'>삭제</button>";
 			
				
 			$("#accountList").html(str);
 		});
 	});
 	
 	// ■ 가계부 총 지출액 받아오기
 	$.getJSON("/payhere/total/", function(totalAccount){
			
	 		
	 		console.log("받아온 totalAccount : " + totalAccount);	
	 		
	 			let str1 ="";
	 			
	 			str1="<strong>총 지출액 : " + totalAccount + "원<strong>"
	 			
	 		
	 		$("#total").html(str1)
	 		
	 		
	 		});
 	
 	
 	
	
 	
 }
// ==================================◆ 가계부 가져오기 ◆===========================================


// ■ 가계부 등록하기.
 $("#insertAccount").on("click",function(){
	
	var accountTitle = $("#insertTitle").val();
	var accountContent = $("#insertContent").val();
	var money= $("#money").val();
	money = Number(money);
	console.log("accountTitle : " + accountTitle);
	$.ajax({
		type : 'post',
		url: '/payhere/insert',
		beforeSend : function(xhr){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		headers:{
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : 'text',
		data : JSON.stringify({
			userId : id,
			accountTitle : accountTitle,
			accountContent : accountContent,
			money : money
		}),
		success : function(result){
			if(result == 'SUCCESS'){
				alert("가계부가 등록 되었습니다.");
				$("#insertTitle").val(null);
				$("#insertContent").val(null);
				$("#money").val(null);
				
				accountBookList();
				
			}
		}
		});
	
	
});
//==================================◆ 가계부 등록하기 ◆===========================================


 // ■ 삭제된 가계부 리스트 보러가기 
$("#deletedAccount").on("click",function(){	
	
	location.href="http://localhost:8181/account/DeletedList/";	
	
});
//==================================◆ 삭제된 가계부 보러가기 ◆===========================================
 
 

 // ■ 가계부 삭제하기 	
$("#account").on("click","#delete",function(){	
	var accountBookNum = $(this).attr("data-accountBookNum");
	accountBookNum = Number(accountBookNum);
	console.log(typeof(accountBookNum));
	
	$.ajax({
		type : 'put',
		url: '/payhere/delete',
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
				
				alert("가계부가 삭제되었습니다.");  
				accountBookList();
				

		} 
		}	// success 끝나는부분 
});	// ajax 끝나는부분 
	
});

//==================================◆ 가계부 삭제하기 ◆===========================================

// ■ 가계부 수정 버튼 클릭시 수정창을 띄워줌 
$("#account").on("click","#update",function(){	
	var accountBookNum = $(this).attr("data-accountBookNum");
	var accountTitle   = $(this).attr("data-accountTitle");
	var accountContent = $(this).attr("data-accountContent");
	var money    	   = $(this).attr("data-money");
	accountBookNum = Number(accountBookNum);
	money = Number(money);
	console.log(typeof(accountBookNum));
	$("#updateBookNum").attr('value',accountBookNum);
	$("#updateTitle").attr('value',accountTitle);
	$("#updateMoney").attr('value',money);
	$("#updateContent").attr('value',accountContent);

	$("#updateDiv").show();
	
});
//==================================◆ 가계부 수정창 띄워주기 ◆===========================================


// ■ 수정창에서 수정 클릭시 수정해줌.
$("#updateDiv").on("click","#updateBtn",function(){
	
	var accountBookNum = $("#updateBookNum").val();
	var accountTitle   = $("#updateTitle").val();
	var accountContent = $("#updateContent").val();
	var money    	   = $("#updateMoney").val();
	
	$.ajax({
		type : 'put',
		url: '/payhere/update',
		beforeSend : function(xhr){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		headers:{
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "PUT"
		},
		dataType : 'text',
		data : JSON.stringify({
			
			accountBookNum : accountBookNum,
			accountTitle : accountTitle,
			accountContent : accountContent,
			money : money
	}),
		success : function(result){
			if(result == 'SUCCESS'){
				
				alert("가계부가 수정되었습니다.");
				$("#updateDiv").hide("slow");
				accountBookList();
				

		} 
		}	// success 끝나는부분 
});	// ajax 끝나는부분 
	
});
//==================================◆ 가계부 수정하기 ◆===========================================


// ■ 수정창에서 닫기 클릭시 수정창을 닫아줌. 	
$("#updateDiv").on("click","#closeBtn",function(){ // #closeBtn 클릭시
	$("#updateDiv").hide("slow"); // #modDiv를 닫습니다.
	
});
//==================================◆ 수정창 닫기 ◆===========================================


// ■ 가계부 제목 클릭시 그에 해당하는 지출내역(세부사항)을 보여줌  	
$("#account").on("click","#accountTitle",function(){
	
	var accountBookNum = $(this).attr("data-accountBookNum");
	
	$.getJSON("/payhere/details/" + accountBookNum , function(data){
		
 		
		$(data).each(
 				function(){
 				
 					$("#detailTitle").attr('value',this.accountTitle);
 					$("#detailMoney").attr('value',this.money);
 					$("#detailContent").attr('value',this.accountContent);
 					
 					
 		});
 		
		$("#detailDiv").show("slow");
		
 		});
	
});

//==================================◆ 지출내역(세부사항) 보여줌 ◆===========================================

// ■ 지출내역(세부사항)창에서 닫기를 클릭시 창을 닫아줌.
$("#detailDiv").on("click","#closeBtn",function(){ // #closeBtn 클릭시
	$("#detailDiv").hide("slow"); // #modDiv를 닫습니다.
	
});

//==================================◆ 지출내역 닫음 ◆===========================================

accountBookList();
</script>
 
 

</body>
</html>