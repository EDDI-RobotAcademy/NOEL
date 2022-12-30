<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/member/searchMember.css">
</head>
<body>
	<div class="result-wrap">
		<c:choose>
			<c:when test="${result }">
				<div class="noSearch">조회된 ID가 없습니다.</div>
				<button type="button" class="closeBtn" onclick="closeWindow();">닫기</button>
			</c:when>
			<c:when test="${result == false}">
				<c:choose>
					<c:when test="${not empty userId}">
						<div class="searchSuccess">
							<div>조회된 ID</div>
							<div>[ <span>${userId }</span> ]</div>
							<button type="button" class="closeBtn" onclick="closeWindow();">닫기</button>
						</div>
					</c:when>
					<c:when test="${not empty marketerId }">
						<div class="searchSuccess">
							<div>조회된 ID</div>
							<div>[ <span>${marketerId }</span> ]</div>
							<button type="button" class="closeBtn" onclick="closeWindow();">닫기</button>
						</div>
					</c:when>
				</c:choose>
			</c:when>
		</c:choose>
		<div></div>
	</div>
	
	
	<script>
		function closeWindow(checkId){
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
	</script>
</body>
</html>