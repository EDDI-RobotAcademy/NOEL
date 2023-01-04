<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/resources/css/member/marketer.css">
<h2>마이페이지</h2>
<aside id="aside" class="sidebar" style="padding-top: 0px;">
	<div class="sidebar-1">
		<ul class="category">
			<li>
				<c:if test="${sessionScope.mk.marketerAuth eq 1}">
				<div>
					<a href="/marketerMypage">내 정보 수정</a>
				</div>
				<div>
					<a href="/deleteMarketer?marketerId=${sessionScope.mk.marketerId }" class="delMember">회원 탈퇴</a>
				</div>
				<div>
					<a href="/class/addClassFrm">클래스 등록</a>
				</div>
				<div>
					<a href="/market/marketerProductMypage">상품 관리</a>
				</div>
				<div>
					<a href="/market/orderManagement">주문 관리</a>
				</div>
				</c:if>

			</li>
		</ul>
	</div>

</aside>
<script>
	$(".delMember").on("click", function(e) {
		if (confirm("탈퇴 하시겠습니까?") == true) {
			alert("탈퇴되었습니다.");
		} else {
			e.preventDefault();
			return;
		}
	});
</script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>