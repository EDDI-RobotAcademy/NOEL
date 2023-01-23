<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="/resources/img/index/favicon (1).ico" />
<title>bonjour noël</title>
<link rel="stylesheet" href="/resources/css/notice/noticeDetail.css">
<link rel="stylesheet" href="/resources/css/header.css">
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layouts/header.jsp"></jsp:include>

	<c:choose>
		<c:when test="${empty n}">
        ${msg }
    </c:when>

		<c:otherwise>
			<div class="noticeDetail-wrap">
				<div class="notice-title-wrap">
					<div class="notice-title">
						<h1>공지사항</h1>
					</div>

					<div class="notice-title" style="text-align: left;">
						<h1 style="margin-bottom: 0; margin-top: 50px;">${n.noticeTitle }</h1>
					</div>

					<div class="notice-enrollDate">
						<span style="margin-right: 20px;">${n.noticeDate }</span> <span>조회수
							: ${n.readCnt }</span>
					</div>
				</div>

				<div class="notice-detail-content" style="padding-top: 20px;">
					${n.noticeContent }</div>



				<div class="notice-detail-btn">
					<c:choose>
						<c:when
							test="${not empty sessionScope.m and sessionScope.m.userLevel eq 2}">
							<button type="button" class="btn-update"								
								onclick="updateNoticeFrm(${n.noticeNo});">수정</button>
							<button type="button" class="btn-delete"
								style="margin-left: 10px;"
								onclick="deleteNotice(${n.noticeNo});">삭제</button>
							<button type="button" class="btn-list"
								style="margin-left: 10px;" onclick="goNoticeList()">목록으로</button>
						</c:when>

						<c:otherwise>
							<button type="button" class="btn-list"
								style="width: 200px;" onclick="goNoticeList()">목록으로</button>
						</c:otherwise>
					</c:choose>

				</div>
			</div>
		</c:otherwise>
	</c:choose>

	<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />

	<script>
    function deleteNotice(noticeNo){
        location.href="/deleteNotice?noticeNo=" + noticeNo;
    }

    function updateNoticeFrm(noticeNo){
        location.href="/updateNoticeFrm?noticeNo=" + noticeNo;
    }

    function goNoticeList(){
        location.href="/selectNoticeList?reqPage=1";
    }


</script>
</body>
</html>









