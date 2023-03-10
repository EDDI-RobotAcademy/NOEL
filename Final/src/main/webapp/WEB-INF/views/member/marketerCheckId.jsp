<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="./resources/img/index/favicon (1).ico" /> 
<title>bonjour noël</title>
<link rel="stylesheet" href="/resources/css/member/member.css">
</head>
<body>
	<style>
		
	</style>
	
	<div id="check-container">
		<c:choose>
			<c:when test="${result}">
				<div>[ <span>${marketerCheckId} </span> ]는 사용 가능합니다.</div>
				<br><br>
				<button type="button" class="closeBtn" onclick="closeWindow('${marketerCheckId}');">닫기</button>
			</c:when>
			<c:otherwise>
				<div>[ <span>${marketerId}</span> ]는 이미 사용중입니다.</div>
				<br>
				<form action="/marketerCheckId">
					<div class="id-wrap">
						<input type="text" name="marketerCheckId" class="marketerCheckId"><br>
						<button class="searchIdBtn" type="submit">조회</button>
					</div>
				</form>
			</c:otherwise>
		</c:choose>
	</div>
	<script>
		function closeWindow(checkId){
			const idInput = $("#marketerId",opener.document);
			idInput.val(checkId);
			self.close();
		}
		$(".closeBtn").on("mouseover",function(){
			$(this).css("background-color","rgb(97, 76, 76)");
			$(this).css("border","1px solid black");
		})
		$(".closeBtn").on("mouseleave",function(){
			$(this).css("background-color","");
			$(this).css("color","");
		})
		$(".searchIdBtn").on("mouseover",function(){
			$(this).css("background-color","rgb(97, 76, 76)");
			$(this).css("border","1px solid black");
		})
		$(".searchIdBtn").on("mouseleave",function(){
			$(this).css("background-color","");
			$(this).css("color","");
		})
		
		$(".searchIdBtn").on("click",function(e){
			const checkId = $(".ownerCheckId").val();
			if(checkId == "") {
				alert("조회할 아이디를 입력해주세요.");
				e.preventDefault();
			}
		});
	</script>
</body>
</html>