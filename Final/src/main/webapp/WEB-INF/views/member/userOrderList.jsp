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
<link rel="stylesheet" href="/resources/css/product/marketDetailView.css">
<link rel="stylesheet" href="/resources/css/member/owner.css">
<link rel="stylesheet" href="/resources/css/member/updateOwner.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

</head>

<body>
<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<div class="content-wrap" style="height: 1030px;">
   <jsp:include page="/WEB-INF/views/common/memberHeader.jsp" />
   <article id="content" class="content">
      <div class="contents">
         <div class="membership-form">
            <div class="form-write">
               <h4>주문 내역</h4>
            </div>
            
            <c:choose>
               <c:when test="${empty list}">
                  <div class="warningMark">
                     <span class="material-symbols-outlined" style="font-size: 30px;"> 
                        주문 내역이 없습니다.
                     </span>
                  </div>
               </c:when>
               
               <c:otherwise>
                  <table class="table" style="text-align: center; vertical-align: middle;">
                     <tr>
                        <th class="th" scope="col">주문번호</th>
                        <th class="th" scope="col">상품명</th>
                        <th class="th" scope="col">수량</th>
                        <th class="th" scope="col">가격</th>
                        <th class="th" scope="col">주문날짜</th>
                        <th class="th" scope="col">주문상태</th>
                        <th class="th" scope="col">처리</th>
                     </tr>
                     
                     <c:forEach items="${list}" var="list" varStatus="modal">
                     <tr>
                        <td scope="row">${list.orderNo }</td>
                        <td scope="row">
                           <a href="marketDetailView?prdNo=${list.prdNo}&bookmarkId=${sessionScope.m.userId}&num=1&rnum=1&qnum=1"
                              style="text-decoration:none;">
                           ${list.prdName}
                           </a>
                        </td>
                        
                        <td scope="row">${list.orderQuan }</td>
                        <td scope="row">
                           <fmt:formatNumber value="${list.prdPrice}" pattern="#,###"/> <span>원</span> 
                        </td>
                        <td scope="row">${list.orderDate }</td>
                        <td scope="row" class="orderStatus">${list.orderStatus }</td>
                        <c:choose>
                           <c:when test="${list.orderStatus eq '배송완료'}">
                              <td scope="row">
                          		 <button type="button" class="orderReviewBtn" data-bs-toggle="modal"
									data-bs-target="#modal-review${modal.index}">구매평 작성</button>
                              </td>
                           </c:when>
                           
                           <c:otherwise>
								<td scope="row">
									<c:if test="${list.orderStatus eq '배송준비중' }">
										<button type="button" class="ordercancleBtn">주문취소</button>
									</c:if>
								</td>
						   </c:otherwise>
                        </c:choose>
                     </tr>
                     
                     <form name="reviewForm" id="reviewForm" method="post" action="/market/reviewInsert" >
					   <div class="modal fade" id="modal-review${modal.index}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					      <div class="modal-dialog modal-dialog-centered">
					         <div class="modal-content">
					            <div class="modal-header">
					               <h5 class="modal-title" id="exampleModalLabel" style="font-family: Gowun Dodum;">구매평 작성</h5>
					               <button type="button" class="btn-close btn btn-brand" data-bs-dismiss="modal"aria-label="Close"></button>
					            </div>
					            <div class="modal-body mb-3">
					               <h4>상품은 어떠셨나요?</h4>
					               <fieldset>
					                  <input type="hidden" name="userId" value="${sessionScope.m.userId}">
					                  <input type="hidden" name="prdNo" value="${list.prdNo}">
					                  <input type="hidden" name="prdName" value="${list.prdName}">
					                  <input type="hidden" name="marketerId" value="${list.marketerId}">
					                  <input type="hidden" name="orderNo" value="${list.orderNo}">
					                  <input type="radio" name="rating" value="5" id="rate1" checked>
					                  <label for="rate1">♥</label>
					                  <input type="radio" name="rating" value="4" id="rate2">
					                  <label for="rate2">♥</label>
					                  <input type="radio" name="rating" value="3" id="rate3">
					                  <label for="rate3">♥</label>
					                  <input type="radio" name="rating" value="2" id="rate4">
					                  <label for="rate4">♥</label>
					                  <input type="radio" name="rating" value="1" id="rate5">
					                  <label for="rate5">♥</label>
					               </fieldset>
					               <textarea name="prdReviewcontent" class="chk1 form-control" id="message-text" title="어떤점이 좋으셨나요?"
					                         style="height:15em; resize:none;" ></textarea>
					            </div>
					            <div class="modal-footer">
					               <button type="submit" class="reviewsave btn btn-brand">저장</button>
					               <button type="button" class="reviewcancel btn btn-brand" data-bs-dismiss="modal">취소</button>
					            </div>
					         </div>
					      </div>
					   </div>
					</form> 
                     
                     </c:forEach>
                  </table>
                  </c:otherwise>
            </c:choose>
            
         </div>
         <div class="page">${pageNavi }</div>
      </div>
   </article>
</div>

<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
<script>
   $(".ordercancleBtn").on("click", function(e) {
      const orderStatus = $(this).parent().parent().children().eq(6).text();
       if(orderStatus == "배송중") {
         alert("발송중인 상품입니다. 업체에 문의해주세요.");
         e.preventDefault();
         
       }else {
          if (confirm("주문을 취소 하시겠습니까?")) {
             const orderNo = $(this).parent().parent().children().eq(0).text();
             $(location).attr('href', "/cancleOrder?orderNo=" + orderNo);
          }
       }
    });
</script>
</body>
</html>