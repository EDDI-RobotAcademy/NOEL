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
<link rel="stylesheet"
	href="/resources/css/member/orderManagementView.css">
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
								<div class="directoryDiv">mypage > 주문관리</div>
								<br>
								<h1>주문 관리</h1>
								<div class="category1">
									<a href="/market/orderManagementView?reqPage=1"
										id="category_class">상품 별 주문</a> <a
										href="/market/orderAll?reqPage=1" id="category_market">전체
										주문</a>
								</div>

								<c:choose>
									<c:when test="${empty list }">
										<div class="warningMark">
											<span class="material-symbols-outlined"
												style="font-size: 30px;"> 주문내역이 없습니다. </span>
											</div>
									</c:when>

									<c:otherwise>
										<div class="bookmark-content-list">
											<form action="/searchOrderOwnerList.do?reqPage=1"
												method="post">
												<div id="type">
													<select class="type" name="type">
														<option value="orderNo">상품명</option>
														<option value="id">아이디</option>
													</select> <input type="text" name="keyword" class="keywork">
													<input type="submit" value="조회" class="submitInput ">
												</div>
											</form>
											<table class="table" style="width: 800px;">
												<tr>
													<th scope="col">상품명</th>
													<th scope="col">상품 총 재고</th>
													<th scope="col">주문 수량</th>
													<th scope="col">남은 재고</th>
												</tr>
												<c:forEach items="${list }" var="ol">
													<tr>
														<td><a
															href="/market/orderPrd?reqPage=1&prdNo=${ol.prdNo}">${ol.prdName}</a></td>
														<td>${ol.prdAllStock}</td>
														<td>${ol.prdStock}</td>
														<td>남은 재고 넣을 것</td>

													</tr>
												</c:forEach>
											</table>
											<div id="pageNavi">${pageNavi }</div>
										</div>
									</c:otherwise>
								</c:choose>
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