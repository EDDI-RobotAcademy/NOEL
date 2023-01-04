<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        .reviewBtn {
            background-color: rgb(51, 51, 51) !important;
            border: 1px solid rgb(51, 51, 51) !important;
            color: #fff !important;
            padding: 0 10px 0 10px !important;
            border-radius: 5px;
        }

        .cancleBtn {
            background-color: rgb(230, 83, 20) !important;
            border: 1px solid rgb(230, 83, 20) !important;
            color: #fff !important;
            padding: 0 10px 0 10px !important;
            border-radius: 5px;
        }

        .reviewBtn:hover {
            font-weight: 600;
        }

        .cancleBtn:hover {
            font-weight: 600;
            border: 1px solid rgb(230, 83, 20) !important;
        }

        #pageNavi{
            width: 700px;
            text-align: center;
            margin: 0 auto;
            display: flex;
            justify-content: center;
            margin-top: 50px;
            margin-bottom: 50px;
        }

        #pageNavi>a{
            display: inline-block;
            width: 30px;
            height: 30px;
            text-decoration: none;
            font-size: 20px;
        }

        #pageNavi>a:hover{
            color: #212529;
        }

        #pageNavi>span{
            display: inline-block;
            width: 30px;
            line-height:30px;
            text-decoration: none;
            font-size: 20px;
        }

        .numberDeco{
            background-color: gray;
            color: white;
            border-radius: 100%;
            text-align: center;
            padding:0;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="/resources/css/member/owner.css">
<link rel="stylesheet" href="/resources/css/member/updateOwner.css">
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<div class="content-wrap">
    <jsp:include page="/WEB-INF/views/common/memberHeader.jsp" />
    <article id="content" class="content">
        <div class="page-content">
            <div class="reserve-wrap">
                <div id="menuList">
                    <div class="content-head">
                        <h2>예약 내역</h2>
                    </div>
                    <table class="table" style="text-align: center; vertical-align: middle;">
                        <tr>
                            <th scope="col">예약 번호</th>
                            <th scope="col">클래스 이름</th>
                            <th scope="col">예약일</th>
                            <th scope="col">예약 시간</th>
                            <th scope="col">예약 인원</th>
                            <th scope="col">예약 취소</th>

                        </tr>
                        <c:forEach items="${list }" var="rs">
                            <tr>
<%--                                <input type="hidden" class="nullChk" value="${rs.reserveNo }">--%>
                                <td>${rs.bookNo }</td>
                                <td>${rs.bookName }</td>
                                <td>${rs.bookDate }</td>
                                <td>${rs.bookTime }</td>
                                <td>${rs.bookNum }</td>
                                <td><button type="button" class="cancleBtn">취소</button></td>
<%--                                <td>--%>
<%--                                    <c:choose>--%>
<%--                                    <c:when test="${rs.visitStatus == 1 || rs.visitStatus == 2}">--%>
<%--                                    <c:choose>--%>
<%--                                    <c:when test="${0 eq rs.RStatus }">--%>
<%--                                    <button type="button" class="reviewBtn" onclick="WirteReview(this,${rs.reserveNo},${rs.storeNo},'${rs.storeName }')">리뷰쓰기</button>--%>
<%--                                    </c:when>--%>
<%--                                    <c:otherwise>--%>
<%--                                    <button type="button" class="reviewBtn" onclick="updateReview(this,${rs.reserveNo},${rs.storeNo},'${rs.storeName }')">리뷰수정</button>--%>
<%--                                    </c:otherwise>--%>
<%--                                    </c:choose>--%>
<%--                                    </c:when>--%>
<%--                                    </c:choose>--%>
<%--                                <td>--%>

                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    <div id="pageNavi">${pageNavi }</div>
                </div>
            </div>
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