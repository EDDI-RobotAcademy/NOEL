<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
   <link rel="shortcut icon" href="./resources/img/index/favicon (1).ico" /> 
<title>bonjour noël</title>
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="/resources/css/product/marketList.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/layouts/header.jsp" />

<div class="prdList-content-wrap">
    <div class="prdList-tag">
        <div class="prdList-tag-content" id="font">
            <ul>
                <li><input type="hidden" name="category" value="${category}">
                    <a href="/marketListFrm?reqPage=1">All</a></li>
                <li><a href="/selectTag?category=1&reqPage=1">Bread</a></li>
                <li><a href="/selectTag?category=2&reqPage=1">Cake</a></li>
                <li><a href="/selectTag?category=3&reqPage=1">Jam</a></li>
                <li><a href="/selectTag?category=4&reqPage=1">Soap</a></li>
                <li><a href="/selectTag?category=5&reqPage=1">Candle</a></li>
            </ul>
			<div class="prdList-sort">
				<form action="/sortList?category=${category}&reqPage=1" method="post" id="sortList">
					<select onchange="this.form.submit()" name="sortList" >
						<option value="" selected disabled>정렬</option>
						<option value="wish" <c:if test="${sortList eq 'wish'}">selected</c:if>>wish♥</option>
						<option value="reviewCount" <c:if test="${sortList eq 'reviewCount'}">selected</c:if>>review</option>
					</select>
				</form>
			</div>
        </div>
    </div>
    <!-- 마켓 리스트 생성 -->
    <div class="prdList-list">
        <div class="prdList-list-content">
            <c:forEach items="${list}" var="s">
                <div class="showList">
                    <c:choose>
                    	<c:when test="${not empty sessionScope.m }">
	                    	<a href="marketDetailView?prdNo=${s.prdNo }&bookmarkId=${sessionScope.m.userId}&num=1&rnum=1&qnum=1">
	                    </c:when>
	
	                    <c:when test="${not empty sessionScope.o }">
                        	<a href="marketDetailView?prdNo=${s.prdNo }&bookmarkId=${sessionScope.m.userId}&num=1&rnum=1&qnum=1">
                        </c:when>
                        
                        <c:otherwise>
                            <a href="marketDetailView?prdNo=${s.prdNo }&num=1&rnum=1&qnum=1">
                        </c:otherwise>
                    </c:choose>
                    <div>
                        <img src="resources/upload/product/${s.prdthumNail }" width="300px"
                             height="300px">
                    </div>
                    <div id="font">
                        <div style="display: none">${s.prdNo }</div>
                        <div id="prd_name">${s.prdName }</div>
                        <div style="text-align: center">
                            <span>${s.prdPrice }원</span> <span id="sale_pay"></span>
                        </div>
                        <div style="text-align: center">
                            <div class="prod_icon new" style="align-content: center">NEW</div>
                            <div class="prod_icon sale">SALE</div>
                        </div>
                    </div>
                	</a>
                </div>
            </c:forEach>
        </div>
    </div>
    <!-- 페이지 네비 -->
    <div class="page">${pageNavi }</div>
</div>
<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
</body>
</html>