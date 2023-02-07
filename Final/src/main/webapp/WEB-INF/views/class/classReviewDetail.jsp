<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <link rel="shortcut icon" href="./resources/img/index/favicon (1).ico" /> 
	<title>bonjour noël</title>
</head>

<style>
.image-box {
    width:470px;
    height:470px;
    overflow:hidden;
    margin:0 auto;
    margin-left: 25%;
    margin-right: 75%;
}

.image-thumbnail {
    width:100%;
    height:100%;
    object-fit:cover;
}
</style>
<body>
<jsp:include page="/WEB-INF/views/layouts/header.jsp"/>


<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,1,200"/>
<link rel="stylesheet" href="/resources/css/class/classDetail.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<div class="content-wrap2" style="width:1200px; background-color: rgba(255, 255, 255, 0.06);">
    <div class="content-wrap2-1">
    <div class="directoryDiv">home > review > review detail</div>
        <!-- 사진 슬라이드 영역 -->
        <div class="notice-title" style="padding-bottom: 50px; width:1200px; padding:10px;">
			<h4 style="font-family: 'Gowun Dodum', sans-serif; font-weight: bold; 
				color:var(--body); text-align:center;">${s.className }</h4>
		</div>
        <div class="image-box">
                <img class="image-thumbnail" src="resources/upload/classReview/${s.thumNail }">
        </div>
    </div>
</div>
<Br><Br><br><Br><Br>

<div class="content-wrap4"
     style="font-family:Gowun Dodum; margin-top:30px; height:auto; width:1200px; margin-bottom:100px; margin:0 auto;">
	<p class="menuTitle" style="margin-top: 20px;">Review</p>
	<table class="table" style="width: 1200px; color: var(--body);">
	<tr >
		<th scope="col" style="text-align: left; border-style: none;">리뷰 제목 : ${s.classReviewName }</th>
		<th scope="col" style="text-align: right; border-style: none;"> 작성자 : ${s.userId }</th>
		<th scope="col" style="text-align: right; width:100px; border-style: none;"> 별점 : </th>
		<th style="color: rgb(255 83 86 / 99%); width:30px; border-style: none;">
			<c:forEach begin="1" step="1" end="${s.rating }" varStatus="i">♥</c:forEach></th>
	</tr>
	</Table>
	<Br>
	<div class="contentWrap2" style="font-family:Gowun Dodum; text-algin:center;" >${s.classReviewContent}</div>
	<hr style="border: 1px">
</div>
<c:choose>
	<c:when test="${sessionScope.m.userId eq s.userId}">
		<div class="qnaDetail_btn" style="float:right; margin-right:160px;"
		>
		<a href="/class/classReviewUpdate?classReviewNo=${s.classReviewNo}">
		<button type="submit" class="btn btn-brand">수정</button></a>
		<a href="/class/reviewDelete?classReviewNo=${s.classReviewNo}" onclick="return confirm('정말 삭제하시겠습니까??');">
		<button type="button" class="btn btn-brand">삭제</button></a>
		<button type="button" onclick="javascript:history.go(-1);" class="btn btn-brand">취소</button><br>
		</div>
	</c:when>
</c:choose>

<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
<script src="/resources/js/index/jquery.min.js"></script>
<script src="/resources/js/index/owl.carousel.min.js"></script>
<script src="/resources/js/index/app.js"></script>
</body>
</html>