<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/resources/css/product/marketProductMypage.css">
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="/resources/img/index/favicon (1).ico" /> 
<title>bonjour noël</title>
</head>

<body>
	<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
	<div class="content-wrap">
		<jsp:include page="/WEB-INF/views/common/marketerHeader.jsp" />
		<article id="content" class="content">
			<div class="contents">
				<div class="col-12 grid-margin stretch-card"
					style="margin-bottom: 200px;">
					<div class="card">
						<div class="card-body">
							<div class="directoryDiv">mypage > 상품관리</div>
							<br>
							<h1>상품 관리</h1>
							<input type="hidden" name="marketerId"
								value="${sessionScope.mk.marketerId }"> <br> <a
								href="/market/prd_add" class="btn btn-brand" id="font">상품등록</a>
							<br> <br>
							<p class="prdList-list-content">
								<c:forEach items="${prdlist}" var="prdlist">
								<div class="showList">
									<a href="/market/prd_update?prdNo=${prdlist.prdNo}" id="font">
										<div>
											<img id="prd_thumNail"
												src="/resources/upload/product/${prdlist.prdthumNail }">
										</div>
										<div style="display: none">${prdlist.prdNo }</div>
										<div id="prd_name">${prdlist.prdName }</div>
										<div style="text-align: center">
											<span><fmt:formatNumber value="${prdlist.prdPrice }"
																pattern="#,###" />원</span>
										</div>
										<div style="text-align: center">총 재고 : ${prdlist.prdStock}개</div>
										<div style="text-align: center">  
											등록일 :
											<fmt:formatDate value="${prdlist.regDate }"
												pattern="yyyy-MM-dd" />
										</div>
										<c:choose>
											<c:when test="${prdlist.prdStatus eq 0 }">
												<div style="text-align: center">판매중지 된 상품입니다.</div>
											</c:when>
										</c:choose>
									</a>
									<div  style="text-align: center">
									</div>
									</div>
								</c:forEach>
							</p>
						</div>
							<div class="paging">
									<div id="pageNavi">${pageNavi }</div>
					</div>
				</div>
			</div>
		</article>
	</div>
	<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
</body>
</html>