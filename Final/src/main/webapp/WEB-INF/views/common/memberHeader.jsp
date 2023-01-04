<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/resources/css/member/memberHeader.css">
<h2>마이페이지</h2>
<aside id="aside" class="sidebar" style="padding-top: 0px;">
    <div class="sidebar-1">
        <ul class="category">
            <li>
                <div>
                    <a href="#">예약 내역</a>
                    <!-- <a href="/reserveList.do?reqPage=1">예약 내역</a> -->
                </div>
                <div>
                    <a href="#">주문 내역</a>
                    <!-- <a href="/orderList.do?reqPage=1">주문 내역</a> -->
                </div>
                <div>
                    <a href="/myPrdWishList?reqPage=1">위시리스트</a>
                </div>
                <div>
                    <a href="#">Q&A</a>
                </div>
                <div>
                    <a href="/myPage">내 정보 수정</a>
                    <!-- <a href="/updateMemberFrm.do">내 정보 수정</a> -->
                </div>
                <div>
                    <a href="/deleteMember?userId=${sessionScope.m.userId }" class="delMember">회원 탈퇴</a>
                </div>
            </li>
        </ul>
    </div>
    <div class="sidebar-2">
        <ul class="category">
            <li>
                <h4>공지사항</h4>
                <%--    <c:forEach items="${ncList " var="n">
                      <div class="list-wrap">
                         <a href="/noticeDetail.do?noticeNo=${n.noticeNo }" class="titleShow">${n.noticeTitle }</a>
                      </div>
                   </c:forEach> --%>
            </li>
        </ul>
    </div>
</aside>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>

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