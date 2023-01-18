<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 관리</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style>
.updateBtn {
	background-color: rgb(51, 51, 51) !important;
	color: #fff !important;
	padding: 0 10px 0 10px !important;
}

.deleteBtn {
	background-color: rgb(230, 83, 20) !important;
	color: #fff !important;
	padding: 0 10px 0 10px !important;
}

.updateBtn:hover {
	font-weight: 600;
}

.deleteBtn:hover {
	font-weight: 600;
	border: 1px solid rgb(230, 83, 20) !important;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
	<link rel="stylesheet" href="/resources/css/product/marketProductMypage.css">
	<link rel="stylesheet" href="/resources/css/member/owner.css">
	<div class="content-wrap">
		<jsp:include page="/WEB-INF/views/common/marketerHeader.jsp" />
		<article id="content" class="content">
		<div class="contents">
			<div class="wish-form">
					<div class="bookmarkList-wrap">
					<div class="card">
							<div class="card-body">
							<div class="directoryDiv">mypage > 클래스 관리 > 메뉴 관리</div>
							<BR>
							<h1>메뉴 관리</h1>
						<input type="hidden" name="marketerId" value="${sessionScope.mk.marketerId }">
						<input type="hidden" name="classNo" value="${classNo }">
						<table class="table" style="text-align: center; vertical-align: middle;">
							<tr>
								<th scope="col">메뉴사진</th>
								<th scope="col">메뉴명</th>
								<th scope="col">가격(&#8361;)</th>
								<th scope="col">수정</th>
								<th scope="col">삭제</th>
							</tr>
							<c:forEach items="${ menuList}" var="me">
							<input type="hidden" id="manuNo" name="menuNo" value="${me.menuNo }">
								<tr>
									<td>
										<img src="/resources/upload/menu/${me.menuImg }" style="width: 50px; height: 50px;">
									</td>
									<td>${me.menuName }</td>
									<td>
										<fmt:formatNumber value="${me.menuPrice}" pattern="#,###" />
									</td>
									<td>
										<a href="/class/updateMenuFrm?menuNo=${me.menuNo}" id="font">수정</a>
									</td>
									<td>
										<a href="/deleteMenu?menuNo=${me.menuNo}" id="font" 
										onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					</div></div>
				</div>
				</div>
		</article>
	</div>
	<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
</body>
</html>