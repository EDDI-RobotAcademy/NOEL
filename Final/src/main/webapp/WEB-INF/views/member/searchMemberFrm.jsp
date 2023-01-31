<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="./resources/img/index/favicon (1).ico" /> 
<title>아이디/비밀번호 찾기</title>
<link rel="stylesheet" href="/resources/css/member/searchMember.css">
</head>
<body>
	<div class="search-wrap">
		<div class="search-content">
			<a href="/searchIdFrm" class="searchBtn">
				<div>아이디 찾기</div>
			</a>
			<a href="/searchPwFrm" class="searchBtn">
				<div>비밀번호 찾기</div>
			</a>
		</div>
	</div>
	
	
	<script>
		$(".searchBtn").on("mouseover",function(){
			$(this).css("background-color","rgb(97, 76, 76)");
			$(this).css("border","1px solid black");
		})
		$(".searchBtn").on("mouseleave",function(){
			$(this).css("background-color","");
			$(this).css("color","");
		})
	</script>
</body>
</html>