<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="icon" type="image/x-icon" href="favicon.ico">
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="/resources/css/header/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/header/style.css">

<!-- 로그인 폼  -->
<jsp:include page="/WEB-INF/views/member/loginFrm.jsp" />

<!-- BOTTOM NAV -->
<nav class="navbar navbar-expand-lg navbar-light bg-white sticky-top">
	<div class="container">
		<a class="navbar-brand" href="/">bonjour noël<span class="dot">!</span></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link" href="#">About us</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/marketListFrm?reqPage=1">Market</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/classList.do?reqPage=1">Class</a>
				</li>

				<li class="nav-item">
					<a class="nav-link" href="#">Review</a>
				</li>

				<li class="nav-item">
					<a class="nav-link" href="#">Contact us</a>
				</li>
			</ul>


			<c:choose>
				<c:when test="${empty sessionScope.m && empty sessionScope.mk }">
					<ul class="navbar-nav ms-auto">
						<li class="nav-item">
							<a class="nav-link" href = "login-modal" data-bs-toggle="modal" data-bs-target="#login-modal">login</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/sj">Register</a>
						</li>
					</ul>


					<!--일반 회원-->
				</c:when>
				<c:otherwise>
					<ul class="navbar-nav ms-auto">
						<c:if test="${sessionScope.m.userLevel eq 1}">
							<li class="nav-item">
								<a href="/myPage" class="nav-link" id="font"> ${sessionScope.m.userName }</a>
							</li>
							<li class="nav-item">
								<a href="/logout" class="nav-link" id="font">Logout</a>
							</li>
							<li class="nav-item">
								<a href="/myPage" class="nav-link" id="font"> Mypage</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="/Cart">장바구니</a>
							</li>
						</c:if>

						<!--관리자 -->
						<c:if test="${sessionScope.m.userLevel eq 2}">
							<li class="nav-item">
								<a href="memberManage?reqPage=1" id="font"  class="nav-link">[최고관리자] ${sessionScope.m.userName }</a>
							</li>
							<li class="nav-item">
								<a href="/logout" class="nav-link" id="font">Logout</a>
							</li>
							<li class="nav-item">
								<a href="memberManage?reqPage=1" class="nav-link" id="font"> adminPage</a>
							</li>
						</c:if>

						<!--판매자 회원  -->
						<c:if test="${not empty sessionScope.mk }">
							<li class="nav-item">
								<a href="#" class="nav-link" id="font">${sessionScope.mk.marketerName }</a>
							</li>
							<li class="nav-item">
								<a href="/logout" class="nav-link" id="font">Logout</a>
							</li>
							<c:if test="${sessionScope.mk.marketerAuth eq 1}">
								<li class="nav-item">
									<a class="nav-link" href="/marketerMypage">상품&클래스등록</a>
								</li>
							</c:if>
							<c:if test="${sessionScope.mk.marketerAuth eq 0}">
								<li class="nav-item">
									<a class="nav-link" href="/marketerMypage">Mypage</a>
								</li>
							</c:if>

						</c:if>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</nav>