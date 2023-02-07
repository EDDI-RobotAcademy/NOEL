<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="/resources/img/index/favicon (1).ico" /> 
<title>bonjour noël</title>
</head>
<link rel="stylesheet" href="/resources/css/member/owner.css">
<link rel="stylesheet" href="/resources/css/member/updateOwner.css">
<link rel="stylesheet" href="/resources/css/class/reserveList.css">

<body>
<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<div class="content-wrap" style="height: 1030px;">
   <jsp:include page="/WEB-INF/views/common/memberHeader.jsp" />
   <article id="content" class="content">
      <div class="contents">
         <div class="membership-form">
            <div class="form-write">
                <h4>예약 내역</h4>
            </div>
            <table class="table" style="text-align: center; vertical-align: middle;">
                <tr>
                    <th scope="col">예약 번호</th>
                    <th scope="col">클래스 이름</th>
                    <th scope="col" colspan="2">예약 날짜 ( 시간 )</th>
                    <th scope="col">예약 인원</th>
                    <th scope="col">예약 상태</th>
                    <th scope="col">예약 처리</th>
                </tr>
                <c:forEach items="${list }" var="rs">
                    <tr>
                        <td>${rs.bookNo }</td>
                        <td><a href="/classDetail?classNo=${rs.classNo }">
                        ${rs.bookName }</a></td>
                        <td colspan="2">${rs.bookDate } ( ${rs.bookTime } )</td>
                        <td>${rs.bookNum }</td>
                        <td>
                        <c:if test="${rs.bookStatus == 1}">예약대기</c:if>
                        <c:if test="${rs.bookStatus == 2}">예약확정</c:if>
                        <c:if test="${rs.bookStatus == 3}">방문완료</c:if>
                        <c:if test="${rs.bookStatus == 4}">예약취소</c:if>
                        </td>
                        <td>
                        	<c:choose>
                        		<c:when test="${rs.bookStatus == 1}">
                        			<button type="button" class="cancleBtn">예약취소</button>
                        		</c:when>
                        		<c:otherwise>
                        			<c:choose>
                        				<c:when test="${rs.bookStatus == 2}">
                        					<button type="button" class="cancleBtn2">취소불가</button>
                        				</c:when>
                        				<c:when test="${rs.bookStatus == 4}">
                        					<button type="button" class="cancleBtn2">취소완료</button>
                        				</c:when>
                        				<c:otherwise>
                        					<a href="/class/classReviewAdd?classNo=${rs.classNo}&bookName=${rs.bookName}" class="btn reviewBtn" id="font1">후기작성</a>
                        				</c:otherwise>
                        			</c:choose>
                        		</c:otherwise>
                        	</c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <div id="pageNavi">${pageNavi }</div>
      </div>
   </article>
</div>

<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
<script>

    function WirteReview(obj,reserveNo, storeNo, storeName) {
        var win = window.open("/writeReviewFrm.do?storeNo="+storeNo+"&storeName="+storeName+"&reserveNo="+reserveNo, "_blank", "toolbar=yes,scrollbars=yes,top=200,left=600,width=520,height=500");
    };

    function updateReview(obj,reserveNo, storeNo, storeName) {
        var win = window.open("/updateReviewFrm.do?storeNo="+storeNo+"&storeName="+storeName+"&reserveNo="+reserveNo, "_blank", "toolbar=yes,scrollbars=yes,top=200,left=600,width=520,height=500");
    };

    $(".cancleBtn").on("click", function() {
        if (confirm("예약을 취소 하시겠습니까?")) {
            const reserveNo = $(this).parent().parent().children().eq(0).text();
            console.log(reserveNo);
            $(location).attr('href', "/cancleReserve?reserveNo=" + reserveNo);
        }
    });
    const nullChk = $(".nullChk").val();
    if(nullChk == "") {
        alert("예약 내역이 존재하지 않습니다.");
    }
</script>
</body>
</html>