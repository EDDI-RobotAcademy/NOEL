<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/resources/css/member/updateMarketer.css">
<link rel="stylesheet"
      href="/resources/css/product/marketProductMypage.css">
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<head>
    <meta charset="UTF-8">
    <title>bonjour noël</title>
</head>

<body>
<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
<div class="content-wrap" style="height: 900px;">
    <jsp:include page="/WEB-INF/views/common/marketerHeader.jsp" />
    <article id="content" class="content">
        <div class="contents">
            <div class="col-12 grid-margin stretch-card"
                 style="margin-bottom: 200px;">
                <div class="card">
                    <div class="card-body">
                        <div class="directoryDiv">mypage > 상품관리</div>
                        <br>
                        <h1>판매자 상품관리</h1>
                        <br> <a href="/market/prd_add" class="btn btn-brand"
                                id="font">상품등록</a> <br> <br>
                        <div id="list-tb">
                            <table>

                                <thead>
                                <tr>
                                    <td colspan="6"></td>
                                    <td><input type="hidden" name="marketerId" value="${sessionScope.mk.marketerId }" >
                                    </td>
                                </tr>
                                <tr height="50">
                                    <th width="5%">번호</th>
                                    <th width="10%">카테고리</th>
                                    <th width="25%">상품이름</th>
                                    <th width="10%">상품재고</th>
                                    <th width="10%">상품가격</th>
                                    <th width="15%">등록일</th>
                                    <th width="15%"></th>
                                </tr>
                                </thead>
                                <c:forEach items="${prdlist}" var="prdlist">
                                    <tr>
                                        <td width="5%">${prdlist.prdNo}</td>
                                        <td width="10%">${prdlist.cateGory}</td>
                                        <td width="25%"><a
                                                href="/market/prd_update?prdNo=${prdlist.prdNo}" id="font">${prdlist.prdName}</a></td>
                                        <td width="10%">${prdlist.prdStock}&nbsp;개</td>
                                        <td width="10%">${prdlist.prdPrice}&nbsp;원</td>
                                        <td width="15%"><fmt:formatDate
                                                value="${prdlist.regDate }" pattern="yyyy-MM-dd" />&nbsp;&nbsp;</td>
                                        <td width="15%">&nbsp;&nbsp;&nbsp;&nbsp; <a
                                                href="/market/prd_update?prdNo=${prdlist.prdNo}" id="font">수정</a>&nbsp;&nbsp;|&nbsp;
                                            <a href="/market/prd_delete?prdNo=${prdlist.prdNo}"
                                               id="font" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                </tr>
                            </table>
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