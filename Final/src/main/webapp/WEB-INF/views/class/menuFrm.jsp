<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="/resources/img/index/favicon (1).ico" /> 
<title>bonjour noël</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
<link rel="stylesheet" href="/resources/css/class/menuList.css">

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
						
						<div class="bookmark-content-list">
						<table class="table" style="width: 800px;"">
							<tr>
								<th scope="col" style="width:33%">메뉴사진</th>
								<th scope="col" style="width:33%">메뉴명</th>
								<th scope="col" style="width:33%">처리</th>
							</tr>
							<c:forEach items="${ menuList}" var="me">
							<input type="hidden" id="manuNo" name="menuNo" value="${me.menuNo }">
								<tr>
									<td>
										<img src="/resources/upload/menu/${me.menuImg }" style="width: 50px; height: 50px;">
									</td>
									<td>${me.menuName }</td>
									<td>
										<a href="/class/updateMenuFrm?menuNo=${me.menuNo}" class="btn btn-brand" id="font">수정</a>
										<a href="/deleteMenu?menuNo=${me.menuNo}" id="font" class="btn btn-brand"
										onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
									</td>
								</tr>
							</c:forEach>
						</table>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</article>
</div>
<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
</body>
</html>