<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
pageContext.setAttribute("newLine", "\n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="/resources/img/index/favicon (1).ico" />
<title>bonjour noël</title>
<!-- <link rel="stylesheet" href="/resources/css/header.css"> -->
<link rel="stylesheet" href="/resources/css/notice/noticeList.css">
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style type="text/css">
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layouts/header.jsp"/>
	<div class="notice-wrap">
		<div class="notice-title" style="padding-bottom: 50px;">
			<h1>공지사항</h1>
		</div>
		<c:if
			test="${not empty sessionScope.m and sessionScope.m.userLevel eq 2}">
			<div class="notice-write-btn">
				<a href="/goNoticeFrm">글쓰기</a>
			</div>
		</c:if>
		
		<c:choose>
			<c:when test="${empty list }">
				<div class="warningMark">
					<span class="material-symbols-outlined" style="font-size: 70px;">
						error </span>
				</div>
				<div class="noMsg">${msg}</div>
			</c:when>

			<c:otherwise>
				<div class="notice-tbl-wrap">
					<table class="notice-tbl" style="border-top: 1px solid gray;">
						<tr style="height: 70px;">
							<th>등록일</th>
							<th>제목</th>
							<th>글쓴이</th>
						</tr>
						<c:forEach items="${list }" var="n">
							<tr>
								<td>${n.noticeDate }</td>
								<td><a href="/noticeDetail?noticeNo=${n.noticeNo }">${n.noticeTitle }</a></td>
								<td style="color: red;">${n.noticeWriter}</td>
							</tr>
						</c:forEach>

					</table>
				</div>
			</c:otherwise>
		</c:choose>


	</div>

	<div class="paging">
		<!-- <a href="#"><span class="material-symbols-outlined" style="font-size: 30px;">
        chevron_left
        </span>
    </a>
    <a href="#"><span>1</span></a>
    <a href="#"><span>2</span></a>
    <a href="#"><span>3</span></a>
    <a href="#"><span class="material-symbols-outlined"  style="font-size: 30px;">
        chevron_right
        </span></a> -->
		${pageNavi }
	</div>

	<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />

	<script type="text/javascript">
		$("#searchBtn").on("click", function() {
			if ($("[name=keyword]").val() == "") {
				alert("검색어를 입력하세요");
				$("#searchBtn").attr("type", "button");
			} else {
				$("#searchBtn").attr("type", "submit");
			}
			console.log(1);
		})
	</script>
</body>
</html>





















