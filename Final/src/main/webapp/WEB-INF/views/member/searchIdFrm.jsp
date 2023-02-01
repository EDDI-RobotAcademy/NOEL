<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="./resources/img/index/favicon (1).ico" /> 
<title>아이디 찾기</title>
<link rel="stylesheet" href="/resources/css/member/searchMember.css">
</head>
<body>
	<div class="searchId-wrap">
		<div class="searchContent">
			<fieldset style = "border-color: #dc3545">
				<legend>아이디 찾기</legend>
					<input type="radio" name="selSearch" id="normal" value="1">
		            <label for="normal">일반회원</label>
		            <input type="radio" name="selSearch" id="owner" value="2">
		            <label for="owner">사업자</label>
					
		            <div class="searchMember">
		            <form action="/searchNormalId" method="post">
						이 름 : <input type="text" id="userName" name="userName">
						<br><br>
						<label class="label" for="userTel">ex)01012345678 (- 생략)</label>
						전화번호 : <input type="text" id="userTel" class="inputPhone" name="userTel">
		            	<div>
			            	<button type="submit" id="searchMemberBtn">찾기</button>
			            </div>
		            </form>
		            </div>
		            
		            <div class="searchOwner">
		            <form action="/searchMarketerId" method="post">
		            	이 름 : <input type="text" id="marketerName" name="marketerName">
		            	<br><br>
		            	<label class="label" for="marketerTel">ex)01012345678 (- 생략)</label>
		            	전화번호 : <input type="text" id="marketerTel" class="inputPhone" name="marketerTel">
			            <div>
			            	<button type="submit" id="searchMemberBtn">찾기</button>
			            </div>
		            </form>
		            </div>
				
			</fieldset>
		</div>
	</div>
	
	<script>
		/*일반, 사업자  구분*/
		$("#normal").click();
		$(".searchOwner").css("display","none");
		$("[name=selSearch]").on("click",function(){
			var selSearch = $("input[name=selSearch]:checked").val();
			if(selSearch == 1) {
				$(".searchOwner").css("display","none");
				$(".searchMember").css("display","block");
			}else if(selSearch == 2){
				$(".searchMember").css("display","none");
				$(".searchOwner").css("display","block");
			}
		});
		
		$(".inputPhone").on("focus",function(){
		    const label = $(this).prev();
		    label.css("display","none");
		});
		$(".inputPhone").on("blur",function(){
		    const label = $(this).prev();
		    if($(this).val() == ""){
			    label.css("display","");
		    }
		});
		$("#searchMemberBtn").on("mouseover",function(){
			$(this).css("background-color","rgb(97, 76, 76)");
			$(this).css("border","1px solid black");
		})
		
		$("#searchMemberBtn").on("mouseleave",function(){
			$(this).css("background-color","");
			$(this).css("color","");
		})
	</script>
</body>
</html>