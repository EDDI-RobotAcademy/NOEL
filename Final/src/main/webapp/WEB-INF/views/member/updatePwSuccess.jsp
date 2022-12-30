<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/member/searchMember.css">
</head>
<body>
	<div class="pwResult-wrap">
		<div>변경 완료</div>
		<button type="button" class="closeBtn" onclick="closeWindow();">닫기</button>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script>
	function closeWindow(){
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
</html>