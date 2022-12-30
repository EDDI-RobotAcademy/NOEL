<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/member/member.css">
</head>
<body>
	<div id="check-container">
		<c:choose>
			<c:when test="${result}">
				<div>[ <span>${checkId } </span> ]는 사용 가능한 ID입니다.</div>
				<br>
				<button type="button" class="closeBtn" onclick="closeWindow('${checkId}');">닫기</button>
			</c:when>
			<c:otherwise>
				<div>[ <span>${userId }</span> ]는 이미 사용중입니다.</div>
				<br>
				<form action="/checkId">
					<div class="id-wrap">
						<input type="text" name="checkId" class="checkId"><br>
						<button class="searchIdBtn" type="submit">조회</button>
					</div>
				</form>
			</c:otherwise>
		</c:choose>
	</div>
	<script>
		function closeWindow(checkId){
			const idInput = $("#userId",opener.document);
			idInput.val(checkId);
			self.close();
		}

		$(".closeBtn").on("mouseover",function(){
			$(this).css("background-color","rgb(97, 76, 76)");
			$(this).css("border","1px solid black");
			$(this).css("color","#ffc107");
		})
		$(".closeBtn").on("mouseleave",function(){
			$(this).css("background-color","");
			$(this).css("color","");
		})
		$(".searchIdBtn").on("mouseover",function(){
			$(this).css("background-color","rgb(97, 76, 76)");
			$(this).css("border","1px solid black");
			$(this).css("color","#ffc107");
		})
		$(".searchIdBtn").on("mouseleave",function(){
			$(this).css("background-color","");
			$(this).css("color","");
		})
		
		$(".searchIdBtn").on("click",function(e){
			const checkId = $(".checkId").val();
			if(checkId == "") {
				alert("조회할 아이디를 입력해주세요.");
				e.preventDefault();
			}
		});
		
	</script>
</body>
</html>