<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="./resources/img/index/favicon (1).ico" /> 
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="/resources/css/member/searchMember.css">
</head>
<body>
	<div class="updatePw-wrap">
		<div class="updatePwContent">
		<c:choose>
			<c:when test="${result }">
				<div class="updatePwTitle">조회 결과가 없습니다.</div>
			</c:when>
			<c:otherwise>
				<div class="updatePwTitle">비밀번호 변경</div>
				<form action="/updateNormalPw" method="post">
					<input type="hidden" class="userId" name="userId" value="${userId }">
					<div class="updatePwBox">
						<label class="label" for="userPw">대/소문자/숫자 포함 최소 8자리(특수기호 제외)</label>
						<input type="password" name="userPw" id="userPw">
					</div>
					<p class="text-note"></p>
					<div class="updatePwBox">
						<label class="label" for="reMemberPw">한번 더 입력해 주세요.</label>
					<input type="password" name="reMemberPw" id="reMemberPw">
					</div>
					<p class="text-note"></p>
					<br>
					<br>
					<button type="submit" class="updatePwBtn">비밀번호 변경</button>
				</form>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</body>

<script>
	$(".updatePwBtn").on("mouseover",function(){
		$(this).css("background-color","rgb(97, 76, 76)");
		$(this).css("border","1px solid black");
		
	})
	$(".updatePwBtn").on("mouseleave",function(){
		$(this).css("background-color","");
		$(this).css("color","");
	})
	$(".updatePwBtn").on("click", function(e){
		
		const userPw = $("#userPw").val();
		const reMemberPw = $("#reMemberPw").val();
		if(userPw == "" || reMemberPw == ""){
			alret("변경하실 비밀번호를 입력 해주세요.");
			e.preventDefault();
		}
		
		//비밀번호 유효성 검사
		const pwReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
		const pw = $("#userPw");
		const pwValue = pw.val();
		const pwComment = pw.parent().next();
		if(pwReg.test(pwValue)){
			pwComment.text("");
		}else {
			pwComment.text("* 대/소문자와 숫자를 포함한 최소 8자리를 입력해주세요.");
			pwComment.css("color","red");
			e.preventDefault();
		}
		// 비밀번호 확인 검사
		const pwVal = pw.val();
		const pwChk = $("#reMemberPw");
		const pwChkVal = pwChk.val();
		const pwChkComment = pwChk.parent().next();
		if(pwChkVal == pwVal) {
			
		}else {
			pwChkComment.text("* 비밀번호가 일치하지 않습니다.");
			pwChkComment.css("color","red");
			e.preventDefault();
		}
	});
	
	$("input").on("focus",function(){
	    const label = $(this).prev();
	    label.css("display","none");
	});
	$("input").on("blur",function(){
	    const label = $(this).prev();
	    if($(this).val() == ""){
		    label.css("display","");
	    }
	});
</script>
</html>