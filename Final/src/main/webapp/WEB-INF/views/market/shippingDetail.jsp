<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="/resources/img/index/favicon (1).ico" />
<title>bonjour noël</title>
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
								<div class="directoryDiv">mypage > 주문관리 > 주문상세 > 배송상세</div>
								<br>
								<h1>배송 상세</h1>
								<h5>&nbsp;&nbsp;주문번호 : ${orderNo}</h5>
								<div class="category1">
									<a href="/market/orderManagementView?reqPage=1"
										class="category_orderPrd" id="category_class"> <span>상품
											별 주문</span></a> <a href="/market/orderAll?reqPage=1"
										id="category_market" class="category_orderPrd"><span>전체
											주문</span> </a>
								</div>
								<div class="bookmark-content-list">
									<c:choose>
										<c:when test="${empty list }">
											<table class="table" style="width: 800px;">
												<tr style="font-size: 50px;">
													<td>주문내역이 없습니다.</td>
												</tr>
											</table>
										</c:when>

										<c:otherwise>

											<table class="table" style="width: 800px;">
												<tr>
													<th scope="col">상품명</th>
													<th scope="col">주문수량</th>
													<th scope="col">아이디</th>
													<th scope="col">수령인 명</th>
													<th scope="col">수령자 전화번호</th>
													<th scope="col">주소</th>
												</tr>
												<c:forEach items="${list }" var="ol">
													<tr>
														<td>${ol.prdName}</td>
														<td>${ol.orderQuan}</td>
														<td>${ol.userId}</td>
														<td>${ol.shippingName}</td>
														<td>${ol.shippingPhone}</td>
														<td>${ol.shippingAddr}</td>

													</tr>
												</c:forEach>
											</table>
								</div>
								</c:otherwise>
								</c:choose>

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
</body>
</html>