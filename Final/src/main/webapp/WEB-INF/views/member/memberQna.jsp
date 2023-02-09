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
<Style>
.category1 
{
    width: 500px;
    margin: 0 auto;
    text-align: center;
    margin-top: 30px;
    margin-bottom: 30px;
    font-size: 20px;
}
#category_class, #category_market 
{
    display: inline-block;
    text-decoration: none;
    color: lightgray;
    font-weight: bold;
}
.category1>a:first-child {
    margin-right: 30px;
}
</Style>
</head>
<link rel="stylesheet" href="/resources/css/member/owner.css">
<link rel="stylesheet" href="/resources/css/member/updateOwner.css">
<link rel="stylesheet" href="/resources/css/product/marketDetailView.css">

<body>
<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<div class="content-wrap" style="height: 1030px;">
   <jsp:include page="/WEB-INF/views/common/memberHeader.jsp" />
   <article id="content" class="content">
      <div class="contents">
         <div class="membership-form">
         	<div class="category1">
				<a href="/memberQna?reqPage=1" id="category_market">Market</a>
				<a href="/memberClassQna?reqPage=1" id="category_class">Class</a> 
			</div>
            <div class="form-write">
               <h4>[Market] Q&A</h4>
            </div>
            <c:choose>
               <c:when test="${empty list}">
               	  <input type="hidden" name="userId" value="${sessionScope.m.userId }">
                  <div class="warningMark">
                     <span class="material-symbols-outlined" style="font-size: 30px;"> 
                        등록한 문의글이 없습니다.
                     </span>
                  </div>
               </c:when>
               <c:otherwise>
                  <table class="table" style="text-align: center; vertical-align: middle;">
                     <tr>
                        <th>상품명</th>
                        <th>내용</th>
                        <th>작성일</th>
                        <th>답변상태</th>
                     </tr>
                     
                     <c:forEach items="${list}" var="list" varStatus="i">
                     <tr>                      
                        <td scope="row">${list.prdName}</td>
                        <td>
                        	<a href="/market/qnaDetail?prdQnano=${list.prdQnano}"> 
								<c:out value="${list.prdQnacontent}" />
							</a>
                        </td>
                        <td scope="row">
                        	<fmt:formatDate value="${list.prdQnaregdate}" pattern="yyyy-MM-dd" />
                        </td>
                        <td scope="row">
                       		<c:choose>
								<c:when test="${list.prdQnastatus == 0}">
	                              답변대기
	                            </c:when>
								<c:otherwise>
	                              답변완료
	                            </c:otherwise>
							</c:choose>
                        </td>
                     </tr>
                     </c:forEach>
                  </table>
                  </c:otherwise>
            </c:choose>
         </div>
         <div class="page">${pageNavi}</div>
      </div>
   </article>
</div>
   
</body>
</html>