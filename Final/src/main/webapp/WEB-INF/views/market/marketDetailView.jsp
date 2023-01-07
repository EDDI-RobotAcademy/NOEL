<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bonjour noël</title>
<link rel="stylesheet"
	href="/resources/css/product/marketDetailView.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="70">

	<jsp:include page="/WEB-INF/views/layouts/header.jsp" />

	<div class="container text-left" id="product_wrap">
		<div class="directoryDiv">home > market > detail</div>
		<div class="infoDiv1">
			<img src="/resources/upload/product/${prd.prdthumNail }" class="pImg">
			<!-- ///////////////////////////////////////////////////////////////////// -->
			<div class="tableDiv">
				<table class="productTable">
					<tr>
						<th>상품명</th>
						<td colspan="4">${prd.prdName }</td>
					</tr>
					<tr>
						<th>배송</th>
						<td colspan="4">무료배송</td>
					</tr>
					<tr>
						<th>알레르기 정보</th>
						<td colspan="4">${prd.prdNote}</td>
					</tr>
					<tr>
						<th>금액</th>
						<td colspan="4"><fmt:formatNumber value="${prd.prdPrice}"
								pattern="#,###" /></td>
					</tr>
					<tr>
						<th>수량 선택</th>
						<td style="width: 30px;">
							<button class="w3-button w3-circle" id="down">-</button>
						</td>
						<td class="peopleTd"><span class="countNum">1</span></td>
						<td style="width: 30px;">
							<button class="w3-button w3-circle" id="up">+</button>
						</td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>
			<div class="priceDiv">
				<div class="priceDiv1">
					<span>총 금액: </span> <span class="priceSpan"></span> <span>원</span>
				</div>
			</div>
			<div class="btnWrap">
				<form action="/insertCart">
					<c:choose>
						<c:when test="${empty sessionScope.m}">
							<button type="button" class="loginBtn" id="cartBtn"
								onclick="loginCh()">장바구니</button>
						</c:when>
						<c:otherwise>
							<button type="submit" class="cartBtn">장바구니</button>
						</c:otherwise>
					</c:choose>
					<input type="hidden" name="prdPrice" class="allPrice" value="${prd.prdPrice }"> 
					<input type="hidden" name="prdNo" class="pNumber" value="${prd.prdNo }"> 
					<input type="hidden" name="prdName" class="pNumber" value="${prd.prdName }">
					<input type="hidden" name="cartQuan" class="count"> <input type="hidden" name="userId" value="${sessionScope.m.userId }">
				</form>
        
         <form action="/insertOrder">
            <c:choose>
               <c:when test="${empty sessionScope.m}">
                  <button type="button" class="loginBtn" id="cartBtn"
                          onclick="loginCh()">구매하기</button>
               </c:when>
               <c:otherwise>
                  <button type="submit" class="buyBtn">구매</button>
               </c:otherwise>
            </c:choose>
            <input type="hidden" name="prdPrice" class="allPrice" value="${prd.prdPrice }">
            <input type="hidden" name="prdNo" class="pNumber" value="${prd.prdNo }">
            <input type="hidden" name="prdName" value="${prd.prdName}">
            <input type="hidden" name="cartQuan" class="count">
            <input type="hidden" name="userId" value="${sessionScope.m.userId }">
        </form>
			<c:choose>
				<c:when test="${empty sessionScope.m.userId}">
					<button type="button" id="wishBtn" name="reserveBtn" onclick="wishCh()">
						<img style="width: 21px;" src="/resources/img/index/heart.png">
					</button>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${param.bookmarkId == marketwish.userId}">
							<button type="button" name="reserveBtn" id="wishlist" style="display: none; "
								onclick="addWishlist(this, ${prd.prdNo }, '${sessionScope.m.userId}')">
								<img style="width: 21px;" src="/resources/img/index/heart.png">
							</button>
							<button type="button" name="reserveBtn" id="wishlist1" 
								onclick="deleteWishlist(this, ${prd.prdNo }, '${sessionScope.m.userId}')">
								<img style="width: 25px;" src="/resources/img/index/heart-fill.png">
							</button>
						</c:when>
						<c:otherwise>
							<button type="button" name="reserveBtn" id="wishlist"
									onclick="addWishlist(this, ${prd.prdNo }, '${sessionScope.m.userId}')">
								<img style="width: 21px;" src="/resources/img/index/heart.png">
							</button>
							<button type="button" name="reserveBtn" id="wishlist1" style="display: none;"
								onclick="deleteWishlist(this, ${prd.prdNo }, '${sessionScope.m.userId}')">
								<img style="width: 25px;" src="/resources/img/index/heart-fill.png">
							</button>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<div class="content-wrap4">
		<div class="testDiv">
			<%-- 상세정보 --%>
			<p class="menuTitle">CONTENT</p>
			<p class="menuSubTitle">상품 설명</p>
			<br>
			<div class="contentWrap2">${prd.prdContent}</div>
			<hr style="border: 1px">
		</div>

	</div>
	<!-- 리뷰 목록 -->
	<div class="review-wrap" id="review-wrap">
		<div class="review-title">
			<div>
				<b>구매평</b>
			</div>
			<br>
			<button type="button" class="btn btn-brand" data-bs-toggle="modal"
				data-bs-target="#modal-review">구매평 작성</button>
		</div>
		<section>
			<table class="review-list">
				<tbody>
					<c:choose>
						<c:when test="${empty reviewlist}">
							<p>" 등록된 구매평이 없습니다. "</p>
						</c:when>
						<c:otherwise>
							<c:forEach items="${reviewlist}" var="reviewlist">
								<input type="hidden" name="prdNo" value="${reviewlist.prdNo}">
								<tr height="80px">
									<td width="80%">
										<div style="color: rgb(255, 83, 86); float: center;">
											<c:forEach begin="1" step="1" end="${reviewlist.rating}"
												varStatus="i">♥</c:forEach>
										</div> <a
										href="/market/reviewDetail?prdReviewno=${reviewlist.prdReviewno}">
											<c:out value="${reviewlist.prdReviewcontent}" />
									</a>
									</td>
									<td width="20%"><c:out value="${reviewlist.userId}" /><br>
										<fmt:formatDate value="${reviewlist.prdReviewregdate}"
											pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</section>
	</div>

	<div align="center">
		<!-- 리뷰 목록 페이지 번호 -->
		<c:forEach begin="1" end="${reviewpageNum}" var="rnum">
			<span> <a
				href="/marketDetailView?prdNo=${param.prdNo}&bookmarkId=mlolw2&rnum=${rnum}&qnum=1#review-wrap">
					${rnum} </a>
			</span>
		</c:forEach>
	</div>

<!-- 리뷰 모달 시작 -->
<form name="reviewForm" id="reviewForm" method="post" action="/market/reviewInsert" >
   <div class="modal fade" id="modal-review" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                  <input type="hidden" name="prdNo" value="${prd.prdNo}">
                  <input type="hidden" name="prdName" value="${prd.prdName}">
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
                         style="height:20em; resize:none;" ></textarea>
            </div>
            <div class="modal-footer">
               <button type="submit" class="reviewsave btn btn-brand">저장</button>
               <button type="button" class="reviewcancel btn btn-brand" data-bs-dismiss="modal">취소</button>
            </div>
         </div>
      </div>
   </div>
</form>
<!-- 리뷰 모달 끝 -->

	<!-- QNA 목록 시작 -->
	<%-- <c:if test="${user != null}"></c:if> //유저일때 모달창 오픈--%>
	<div class="qna-wrap" id="qna-wrap">
		<div class="qna-title">
			<br> <br> <br>
			<div>
				<b>QnA</b>
			</div>
			구매하시려는 상품에 대한 궁금점이 있으면 문의주세요.<br> <br>
			<c:choose>
				<c:when test="${empty sessionScope.m}"></c:when>
				<c:otherwise>
					<button type="button" class="btn btn-brand" data-bs-toggle="modal"
						data-bs-target="#modal-qna">상품문의</button>
				</c:otherwise>
			</c:choose>
		</div>
		<section>
			<table class="qna-list">
				<tbody>
					<c:choose>
						<c:when test="${empty qnalist}">
							<p>" 등록된 QNA가 없습니다. "</p>
						</c:when>
						<c:otherwise>
							<tr height="50">
								<th width="10%">상태</th>
								<th width="60%">제목</th>
								<th width="15%">작성자</th>
								<th width="15%">등록일</th>
							</tr>
							<c:forEach items="${qnalist}" var="qnalist">
								<tr height="50">
									<td><c:choose>
											<c:when test="${qnalist.prdQnastatus == 1}">
                              답변대기
                           </c:when>
											<c:otherwise>
                              답변완료
                           </c:otherwise>
										</c:choose></td>
									<td><a
										href="/market/qnaDetail?prdQnano=${qnalist.prdQnano}"> <c:out
												value="${qnalist.prdQnacontent}" />
									</a></td>
									<td><c:out value="${qnalist.userId}" /></td>
									<td><fmt:formatDate value="${qnalist.prdQnaregdate}"
											pattern="yyyy-MM-dd" /></td>
								</tr>

							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</section>
	</div>
	<div align="center">
		<!-- qna 목록 페이지 번호 -->
		<c:forEach begin="1" end="${qnapageNum}" var="qnum">
			<span> <a
				href="/marketDetailView?prdNo=${param.prdNo}&bookmarkId=mlolw2&num=1&qnum=${qnum}#qna-wrap">
					${qnum} </a>
			</span>
		</c:forEach>
	</div>
	<!-- QnA 목록 끝 -->

	<!-- QnA 모달 시작 -->
	<form name="prdqnaForm" method="post" action="/market/pqnawrite">
		<div class="modal fade" id="modal-qna" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel"
							style="font-family: Gowun Dodum;">Q&A</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body mb-3">
						<input type="hidden" name="userId"
							value="${sessionScope.m.userId}"> <input type="hidden"
							name="prdNo" value="${prd.prdNo}"> <label
							for="message-text" class="col-form-label">문의할 내용을 작성해주세요.</label>
						<textarea name="prdQnacontent" class="chk2 form-control"
							id="message-text" title="내용을 입력하세요"
							style="height: 20em; resize: none;"></textarea>
						<br>
						<div>
							<input class="form-check-input" type="checkbox" name="secret"
								id="secret"> <label class="form-check-label">비밀글
								설정</label>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="qnasave btn btn-brand">저장</button>
						<button type="button" class="qnacancel btn btn-brand"
							data-bs-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- QNA 모달 끝 -->

	<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />

	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<script src="/resources/js/index/jquery.min.js"></script>
	<script src="/resources/js/index/owl.carousel.min.js"></script>
	<script src="/resources/js/index/app.js"></script>

	<script type="text/javascript">
//리뷰 & qna 내용 미입력시 alert
$(document).ready(function() {
   var formObj1 = $("form[name='prdreviewForm']");
   var formObj2 = $("form[name='prdqnaForm']");

   $(".reviewsave").on("click", function() {
      if (fn_valiChk1()) {
         return false;
      }
      formObj1.attr("action", "/market/reviewInsert");
      formObj1.attr("method", "post");
      formObj1.submit();
   });

   $(".qnasave").on("click", function() {
      if (fn_valiChk2()) {
         return false;
      }
      formObj2.attr("action", "/market/qnaInsert");
      formObj2.attr("method", "post");
      formObj2.submit();
   });
})
function fn_valiChk1() {
   var regForm = $("form[name='prdreviewForm'] .chk1").length;

   if ($(".chk1").val() == "" || $(".chk1").val() == null) {
      alert($(".chk1").attr("title"));
      return true;
   }
}
function fn_valiChk2() {
   var regForm = $("form[name='prdqnaForm'] .chk2").length;

   if ($(".chk2").val() == "" || $(".chk2").val() == null) {
      alert($(".chk2").attr("title"));
      return true;
   }
}

//장바구니,구매하기 클릭시 로그인 체크
var login = $("button[class='loginBtn']");
var marketer = "${sessionScope.mk}";
function loginCh() {
	if(marketer){
		alert('판매자는 사용 할 수 없습니다. 일반회원으로 로그인해주세요');
	}
	else{
	   login.attr("data-bs-toggle", "modal");
	   login.attr("data-bs-target", "#login-modal");
	   login.attr("location.href", "login-modal");
	}
}


//---------- 수량 늘리기
var countNumVal = $(".peopleTd").text();
var price = "${prd.prdPrice}";
$(".priceSpan").text((countNumVal * price).toLocaleString('ko-KR'));
let count = 1;

$("#up").on("click", function(e) {
   count++;
   $(".countNum").text(count);
   var countNumVal = $(".peopleTd").text();
   const sumPrice = (countNumVal * price).toLocaleString('ko-KR');
   $(".priceSpan").text(sumPrice);
});

$("#down").on("click", function(e) {
   if (count == 1) {
      return false;
   }
   count--;
   $(".countNum").text(count);
   var countNumVal = $(".peopleTd").text();
   const sumPrice = (countNumVal * price).toLocaleString('ko-KR');
   $(".priceSpan").text(sumPrice);

});

//장바구니 클릭 시 hidden으로 넘겨주는 값
var pNo = "${prd.prdNo}"
$(".cartBtn").on("click", function() {
   $(".count").attr("value", count);
});
//구매하기 클릭 시 hidden으로 넘겨주는 값
$(".buyBtn").on("click", function() {
   $(".count").attr("value", count);
});


//비회원 상품 위시 > 로그인모달
var wishBtn = $("button[id='wishBtn']");
function wishCh() {
	wishBtn.attr("data-bs-toggle", "modal");
	wishBtn.attr("data-bs-target", "#login-modal");
	wishBtn.attr("location.href", "login-modal");
}
//상품 위시
function addWishlist(obj, prdNo, userId){
    $("#wishlist").hide();
    $("#wishlist1").show();

    $.ajax({
        url : "/insertMarketWish",
        type : "post",
        data : {prdNo : prdNo, userId : userId},
        success : function(data){
            console.log(data);
        }
    })
}
//상품 위시 취소
function deleteWishlist(obj, prdNo, userId){
    $("#wishlist1").hide();
    $("#wishlist").show();

    $.ajax({
        url : "/deleteMarketWish",
        type : "post",
        data : {prdNo : prdNo, userId : userId},
        success : function(data){
            console.log(data)
        }
    })
}

</script>
</body>
</html>