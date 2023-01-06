<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
								<div class="directoryDiv">mypage > 주문관리 > 주문상세</div>
								<br>
								<h1>주문 상세</h1>
								<h5>&nbsp;&nbsp;모든상품</h5>
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
													<th scope="col">주문번호</th>
													<th scope="col">아이디</th>
													<th scope="col">상품명</th>
													<th scope="col">주문일자</th>
													<th scope="col">수량</th>
													<th scope="col">주문금액</th>
													<th scope="col">주문상태</th>
													<th scope="col">처리</th>
												</tr>
												<c:forEach items="${list }" var="ol">
													<tr>
														<td>${ol.orderNo}</td>
														<td>${ol.userId}</td>
														<td>${ol.prdName}</td>
														<td>${ol.orderDate}</td>
														<td>${ol.orderQuan}</td>
														<td><fmt:formatNumber value="${ol.orderPrice}" pattern="#,###"/></td>

														<form
															action="/updateOrderLevel.do?orderNo=${ol.orderNo}&reqPage=1"
															method="post">
														<td class="orderStatusTd"><c:choose>
																<c:when test="${ol.orderStatus eq '배송준비중'}">
																	<select name="orderStatus" class="selectbox">
																		<option value="배송준비중" selected>배송준비중</option>
																		<option value="배송중">배송중</option>
																		<option value="배송완료">배송완료</option>
																		<option value="주문취소">주문취소</option>
																	</select>
																</c:when>
																<c:when test="${ol.orderStatus eq  '배송중'}">
																	<select name="orderStatus" class="selectbox">
																		<option value="배송준비중">배송준비중</option>
																		<option value="배송중" selected>배송중</option>
																		<option value="배송완료">배송완료</option>
																		<option value="주문취소">주문취소</option>
																	</select>
																</c:when>
																<c:when test="${ol.orderStatus eq '배송완료'}">
																	<select name="orderStatus" class="selectbox">
																		<option value="배송준비중">배송준비중</option>
																		<option value="배송중">배송중</option>
																		<option value="배송완료" selected>배송완료</option>
																		<option value="주문취소">주문취소</option>
																	</select>
																</c:when>
															</c:choose></td>
														<td><button class="saveBtn" type="submit">확정</button></td>
														</form>
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