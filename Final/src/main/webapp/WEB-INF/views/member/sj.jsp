<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/joinFrm.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
   <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
	
		<div class="selectTitleWrap">
		<h1 style="font-family:Gowun Dodum; font-weight: 900;">회원유형 선택</h1>
		</div>
		
        <div class="select-wrap">
			<div class="memberWrap">
			<a href="/joinFrm.do" style="text-decoration: none;">
				<img src="/resources/img/index/003.png" style="height:90%;">
				<h3 style="text-align: center; font-family:Gowun Dodum; font-weight: bolder;">일반회원</h3>
			</a>
			</div>
			
			
			<div class="ownerWrap">
			<a href="/marketerJoinFrm.do" style="text-decoration: none;">
				<img src="/resources/img/index/004.png" style="height:90%;">
				<h3 style="text-align: center; font-family:Gowun Dodum; font-weight: bolder;">사업자</h3>
			</a>
			</div>
			
  	   </div>
    
<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
</body>
</html>