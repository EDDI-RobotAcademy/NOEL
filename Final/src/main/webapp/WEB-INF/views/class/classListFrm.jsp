<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="./resources/img/index/favicon (1).ico" /> 
<title>bonjour noël</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
<link rel="stylesheet" href="/resources/css/class/classList.css">

<jsp:include page="/WEB-INF/views/layouts/header.jsp" />

<div class="classList-content-wrap">
    <!-- 리스트 생성 -->
    <div class="classList-list">
        <div class="classList-list-content">
            <c:forEach items="${list}" var="s">
                <div class="showList">
                    <c:choose>
                    	<c:when test="${not empty sessionScope.m }">
                    	<a href="/classDetail?classNo=${s.classNo }&userId=${m.userId}">
                    	</c:when>
						<c:otherwise>
							<a href="/classDetail?classNo=${s.classNo }">
						</c:otherwise>
					</c:choose>
				<div>
					<img src="resources/upload/class/${s.thumNail }">
				</div>
				<div id="font">
					<div style="display: none">${s.classNo }</div>
					<div id = "class_name" style="text-align: center"> ${s.className }</div>
					<div style="text-align: center">
						<span><fmt:formatNumber value="${s.classPrice}" pattern="#,###" />원</span>
					</div>
				<c:choose>
					<c:when test="${s.clStatus eq 0}">
					<div style="text-align: center">
						<div class="prod_icon sale" style="align-content: center">오픈 전</div>
					</div>
					</c:when>
				</c:choose>        
				</div>
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