<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <link rel="shortcut icon" href="./resources/img/index/favicon (1).ico" /> 
   <title>bonjour noël</title>
   <link rel="stylesheet" href="/resources/css/index/owl.theme.default.min.css">
   <link rel="stylesheet" href="/resources/css/index/owl.carousel.min.css">
   <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
   <link rel="stylesheet" href="/resources/css/product/prd_add.css">
   <link rel="stylesheet" href="/resources/css/product/reviewDetail.css">

</head>
<body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="70">

<jsp:include page="/WEB-INF/views/layouts/header.jsp" />

<div class="review-detail-wrap">
   <form name="reviewupdateForm" role="form" method="post" action="/market/reviewUpdate">
      <input type="hidden" id="prdReviewno" name="prdReviewno" value="${reviewdetail.prdReviewno}"/>
      <input type="hidden" id="prdNo" name="prdNo" value="${reviewdetail.prdNo}"/>
      <c:choose>
         <c:when test="${sessionScope.m.userId eq reviewdetail.userId}">
            <table>
               <tbody>
               <tr height="40px">
                  <td colspan="2" style="text-align:center;">
                     <h3>구매평</h3>
                     <hr  style="height:2px;">
                  </td>
               </tr>
               <tr height="40px">
                  <td width="35%" style="text-align:center;"> 상품명 </td>
                  <td> ${reviewdetail.prdName}</td>
               </tr>
               <tr height="40px">
                  <td style="text-align:center;"> 작성자 </td>
                  <td> ${reviewdetail.userId}</td>
               </tr>
               <tr height="40px">
                  <td style="text-align:center;"> 평점 </td>
                  <td>
                     <div style="color: rgb(255, 83, 86); float: center;">
                        <c:forEach begin="1" step="1" end="${reviewdetail.rating}"
                                   varStatus="i">♥</c:forEach>
                     </div>
                  </td>
               </tr>
               <tr height="80px">
                  <td style="text-align:center;"> 구매평 </td>
                  <td>
                      <textarea name="prdReviewcontent" class="form-control" id="message-text"
                                style="height:10em; width:500px; resize:none;" autofocus>${reviewdetail.prdReviewcontent}</textarea>
                  </td>
               </tr>
               </tbody>
            </table>
            <br>
            <div class="reviewDetail_btn">
               <button type="submit" class="btn btn-brand">수정</button>
               <a href="/market/reviewDelete?prdReviewno=${reviewdetail.prdReviewno}&prdNo=${reviewdetail.prdNo}"
                  onclick="return confirm('정말 삭제하시겠습니까??');"><button type="button" class="btn btn-brand">삭제</button></a>
               <button type="button" onclick="javascript:history.go(-1);" class="btn btn-brand">취소</button>
            </div>
         </c:when>
         <c:otherwise>
            <table>
               <tbody>
               <tr height="40px">
                  <td colspan="2" style="text-align:center;">
                     <h3>구매평</h3>
                     <hr>
                  </td>
               </tr>
               <tr height="40px">
                  <td width="35%" style="text-align:center;"> 상품명 </td>
                  <td> ${reviewdetail.prdName}</td>
               </tr>
               <tr height="40px">
                  <td style="text-align:center;"> 작성자 </td>
                  <td> ${reviewdetail.userId2}</td>
               </tr>
               <tr height="40px">
                  <td style="text-align:center;"> 평점 </td>
                  <td>
                     <div style="color: rgb(255, 83, 86); float: center;">
                        <c:forEach begin="1" step="1" end="${reviewdetail.rating}"
                                   varStatus="i">♥</c:forEach>
                     </div>
                  </td>
               </tr>
               <tr height="80px">
                  <td style="text-align:center;"> 구매평 </td>
                  <td>
                      <textarea name="prdReviewcontent" class="form-control" id="message-text"
                                style="height:10em; width:500px; resize:none;" readonly="readonly">${reviewdetail.prdReviewcontent}</textarea>
                  </td>
               </tr>
               </tbody>
            </table>
         </c:otherwise>
      </c:choose>
   </form>
</div>

<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />

<script src="/resources/js/index/jquery.min.js"></script>
<script src="/resources/js/index/owl.carousel.min.js"></script>
<script src="/resources/js/index/app.js"></script>
</body>
</html>