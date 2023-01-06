<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>
</head>
<link rel="stylesheet" href="/resources/css/member/owner.css">
<link rel="stylesheet" href="/resources/css/member/updateOwner.css">

<body>
<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<div class="content-wrap">
	<jsp:include page="/WEB-INF/views/common/memberHeader.jsp" />
	<article id="content" class="content">
		<div class="contents">
			<div class="membership-form">
				<div class="form-write">
					<h4>주문 내역</h4>
				</div>
				<c:choose>
					<c:when test="${empty list}">
						<div class="warningMark">
	                 		<span class="material-symbols-outlined" style="font-size: 30px;"> 
	                 			주문 내역이 없습니다.
	                 		</span>
	                    </div>
					</c:when>
					<c:otherwise>
						<table class="table" style="text-align: center; vertical-align: middle;">
							<tr>
								<th class="th" scope="col">주문번호</th>
								<th class="th" scope="col">상품명</th>
								<th class="th" scope="col">수량</th>
								<th class="th" scope="col">가격</th>
								<th class="th" scope="col">주문날짜</th>
								<th class="th" scope="col">주문상태</th>
								<th class="th" scope="col">처리</th>
							</tr>
							<c:forEach items="${list }" var="orList" varStatus="i">
							<tr>
								<td scope="row">${orList.orderNo }</td>
								
								<td scope="row">
									<a href="marketDetailView?prdNo=${orList.prdNo }&bookmarkId=${sessionScope.m.userId}&num=1&rnum=1&qnum=1"
										style="text-decoration:none;">
									${orList.prdName}
									</a>
								</td>
								
								<td scope="row">${orList.orderQuan }</td>
								<td scope="row">
									<fmt:formatNumber value="${orList.prdPrice}" pattern="#,###"/>	
								</td>
								<td scope="row">${orList.orderDate }</td>
								<td scope="row" class="orderStatus">${orList.orderStatus }</td>
								<c:choose>
									<c:when test="${orList.orderStatus eq '배송완료' }">
									</c:when>
									<c:otherwise>
										<td scope="row">
											<button type="button" class="cancleBtn">취소</button>
										</td>
									</c:otherwise>
								</c:choose>
							</tr>
							</c:forEach>
						</table>
						</c:otherwise>
				</c:choose>
			</div>
			<div class="page">${pageNavi }</div>
		</div>
	</article>
</div>


<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
<script>
	
	$(".cancleBtn").on("click", function(e) {
		const orderStatus = $(this).parent().parent().children().eq(6).text();
	    if(orderStatus == "배송중") {
		   alert("발송중인 상품입니다. 업체에 문의해주세요.");
		   e.preventDefault();
	      
	    }else {
	       if (confirm("주문을 취소 하시겠습니까?")) {
	          const orderNo = $(this).parent().parent().children().eq(1).text();
	          $(location).attr('href', "/cancleOrder?orderNo=" + orderNo);
	       }
	    }
    });
</script>
</body>
</html>
