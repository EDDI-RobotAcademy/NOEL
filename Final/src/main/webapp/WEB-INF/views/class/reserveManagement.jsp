<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="/resources/css/class/reserveManagement.css">
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
<div class="content-wrap" style="height: 900px;">
<jsp:include page="/WEB-INF/views/common/marketerHeader.jsp" />
	<article id="content" class="content">
	<div class="contents">
	<div class="wish-form">
	<div class="bookmarkList-wrap">
		<div class="card">
		<div class="card-body">
			<div class="directoryDiv">mypage > 예약 관리 </div>
			<br>
			<h1>예약 관리</h1>
			<form action="/searchReserve" method="post">
				<div class="searchWrap-reserve">
					<div class="search-area">
						<span class="searchName">아이디</span>
						<input type="text" name="keyword" placeholder="아직 미구현" >
						<input type="hidden" name="reqPage" value="1">
						<input type="submit" class="searchBtn" value="조회">
					</div>
				</div>
			</form>
			<div class="bookmark-content-list">
				<table class="table" style="width: 800px;">
				<tr>
					<th scope="col">예약번호</th>
					<th scope="col">아이디</th>
					<th scope="col">예약일자</th>
					<th scope="col">예약시간</th>
					<th scope="col">예약인원</th>
					<th scope="col">예약상태</th>
					<th scope="col">처리</th>
				</tr>
				<c:forEach items="${list }" var="Reserve">
					<tr>
						<td>${Reserve.bookNo}</td>
						<td>${Reserve.userId}</td>
						<td>${Reserve.bookDate}</td>
						<td>${Reserve.bookTime}</td>
						<td>${Reserve.bookNum}</td>
						<form action="/class/updateReserveLevel?bookNo=${Reserve.bookNo}&reqPage=1"" method="post">
						<input type="hidden" value="${Reserve.bookNo}" name="bookNo">
						<td class="couponNoTd">
							<c:choose>
								<c:when test="${Reserve.couponNo eq '1'}">
									<select name="couponNo" class="selectbox">
										<option value="1" selected>예약대기</option>
										<option value="2">예약확정</option>
										<option value="3">방문완료</option>
									</select>
								</c:when>
								<c:when test="${Reserve.couponNo eq  '2'}">
									<select name="couponNo" class="selectbox">
										<option value="1">예약대기</option>
										<option value="2" selected>예약확정</option>
										<option value="3">방문완료</option>
									</select>
								</c:when>
								<c:when test="${Reserve.couponNo eq '3'}">
									<select name="couponNo" class="selectbox">
										<option value="1">예약대기</option>
										<option value="2">예약확정</option>
										<option value="3" selected>방문완료</option>
									</select>
								</c:when>
								</c:choose>
							</td>
							<td><button class="saveBtn" type="submit">확정</button></td>				
							</form>
						</tr>
					</c:forEach>		
					</table>
				</div>
				<div class="paging">
					<div id="pageNavi">${pageNavi }</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	</article>
</div>
<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
<script type="text/javascript">
$(".saveBtn").on("click",function(){
	var selectValue= $(".selectbox").val();
});
</script>
</body>
</html>