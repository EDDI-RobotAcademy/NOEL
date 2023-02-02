<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="./resources/img/index/favicon (1).ico" />
<title>bonjour noël</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="/resources/css/product/marketDetailView.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="70">

	<jsp:include page="/WEB-INF/views/layouts/header.jsp" />

	<div class="content-wrap2" style="width: 1200px; margin: 0 auto;">
		<div class="content-wrap2-1">
			<div class="directoryDiv">home > market > detail</div>
			<!-- 사진 슬라이드 영역  -->
			<div class="photo-wrap">
				<ul class="storeImgUl" style="height: 450px; width: 450px;">
					<img src="/resources/upload/product/${prd.prdthumNail }">
				</ul>
			</div>

			<div class="tableDiv">
				<table class="w3-table w3-bordered" id="productTable"
					style="font-family: Gowun Dodum; width: 600px;">
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
								pattern="#,###" /> <span>원</span></td>
					</tr>
					<tr>
						<th>수량 선택</th>
						<td style="width: 30px;">
							<button class="w3-button w3-circle" id="down"
								style="width: 35px; height: 35px; padding: 0; background-color: red; color: white;">
								-</button>
						</td>
						<td class="peopleTd"  ><span class="countNum" style=" text-align: center;">1</span></td>
						<td style="width: 30px;">
							<button class="w3-button w3-circle" id="up"
								style="width: 35px; height: 35px; padding: 0; background-color: red; color: white;">
								+</button>
						</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th>상품 총 금액</th>
						<td colspan="4"><span class="priceSpan"></span> <span>원</span>
						</td>
					</tr>
				</table>
				
				
				<div class="btnWrap">
					<c:choose>
						<c:when test="${prd.prdStock-prd.prdAllStock eq 0}">
							<button type="button" class="soldoutBtn">품절된 상품입니다.</button>
						</c:when>
						<c:when test="${prd.prdStatus eq 0}">
							<button type="button" class="soldoutBtn">판매중지된 상품입니다.</button>
						</c:when>
						<c:otherwise>
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
								<input type="hidden" name="prdPrice" class="allPrice"
									value="${prd.prdPrice }"> 
								<input type="hidden" name="prdNo" class="pNumber" value="${prd.prdNo }"> 
								<input type="hidden" name="prdName" class="pNumber"	value="${prd.prdName }">
								<input type="hidden" name="cartQuan" class="count"> 
								<input type="hidden" name="userId" value="${sessionScope.m.userId }">
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
								<input type="hidden" name="prdPrice" class="allPrice"
									value="${prd.prdPrice }"> 
								<input type="hidden" name="prdNo" class="pNumber" value="${prd.prdNo }">
								<input type="hidden" name="prdthumNail" class="prdthumNail" value="${prd.prdthumNail }">
								 <input type="hidden" name="prdName" value="${prd.prdName}"> 
								<input type="hidden" name="cartQuan" class="count"> 
								<input
									type="hidden" name="userId" value="${sessionScope.m.userId }">
							</form>
							<c:choose>
								<c:when test="${empty sessionScope.m.userId}">
									<button type="button" id="wishBtn" name="reserveBtn"
										onclick="wishCh()">
										<img style="width: 21px;" src="/resources/img/index/heart.png">
									</button>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${param.bookmarkId == marketwish.userId}">
											<button type="button" name="reserveBtn" id="wishlist"
												style="display: none;"
												onclick="addWishlist(this, ${prd.prdNo }, '${sessionScope.m.userId}')">
												<img style="width: 21px;" src="/resources/img/index/heart.png">
											</button>
											<button type="button" name="reserveBtn" id="wishlist1"
												onclick="deleteWishlist(this, ${prd.prdNo }, '${sessionScope.m.userId}')">
												<img style="width: 25px;"
													src="/resources/img/index/heart-fill.png">
											</button>
										</c:when>
										<c:otherwise>
											<button type="button" name="reserveBtn" id="wishlist"
												onclick="addWishlist(this, ${prd.prdNo }, '${sessionScope.m.userId}')">
												<img style="width: 21px;" src="/resources/img/index/heart.png">
											</button>
											<button type="button" name="reserveBtn" id="wishlist1"
												style="display: none;"
												onclick="deleteWishlist(this, ${prd.prdNo }, '${sessionScope.m.userId}')">
												<img style="width: 25px;"
													src="/resources/img/index/heart-fill.png">
											</button>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
					
				</div>
			</div>
		</div>
	</div>
	<%-- 상세정보 --%>
	<div class="content-wrap4"
		style="font-family: Gowun Dodum; margin-top: 30px; height: 100%; width: 1200px; margin-bottom: 100px; margin: 0 auto;">
		<div class="testDiv" style="width: 1200px; margin: 0 auto;">
			<div class="menuWrap" style="font-family: Gowun Dodum;">
				<p class="menuTitle" style="margin-top: 20px;">PRODUCT DETAIL</p>
				<br>
				<div class="contentWrap2">${prd.prdContent}</div>
			</div>
		</div>
	</div>
  
	<!-- 리뷰 목록 -->
	<div class="review-wrap" id="review-wrap">
		<div class="review-title">
			<div>
				<b>구매평</b>
			</div>
		<c:choose>
			<c:when test="${empty sessionScope.m}"></c:when>
			<c:otherwise><br><br>
				<c:if test="${!empty orderlist}">
					<button type="button" class="btn btn-brand" 
							data-bs-toggle="modal" data-bs-target="#modal-review">구매평 작성</button>
				</c:if>
			</c:otherwise>
		</c:choose>
		</div>
		<section>
		<hr>
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
				href="/marketDetailView?prdNo=${param.prdNo}&rnum=${rnum}&qnum=1#review-wrap">
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
                  <input type="hidden" name="marketerId" value="${prd.marketerId}">
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
<!-- 리뷰 모달 끝 -->

<!-- QNA 목록 시작 -->
<div class="qna-wrap" id="qna-wrap">
	<div class="qna-title">
		<br> <br> <br>
		<div>
			<b>QnA</b><br>
		</div>
		구매하시려는 상품에 대한 궁금점이 있으면 문의주세요.
		<c:choose>
			<c:when test="${empty sessionScope.m}"></c:when>
			<c:otherwise>
				<br><br>
				<button type="button" class="btn btn-brand" data-bs-toggle="modal"
					data-bs-target="#modal-qna">상품문의</button>
			</c:otherwise>
		</c:choose>
	</div>
	
	<section><hr>
		<c:choose>
			<c:when test="${empty qnalist}">
				<p>" 등록된 QNA가 없습니다. "</p>
			</c:when>
			<c:otherwise>
				<c:forEach items="${qnalist}" var="qnalist" varStatus="i">
					<table class="qna-list">
					<tbody>						
						
						<tr height="60px">
							<td width="15%">
								<c:choose>
									<c:when test="${qnalist.prdQnastatus == 0}">
		                              답변대기
		                            </c:when>
									<c:otherwise>
		                              답변완료
		                            </c:otherwise>
								</c:choose>
							</td>
							<td width="55%">
								<c:choose>
									<c:when test="${qnalist.secret == 1 and empty sessionScope.mk}">
										<p class="material-symbols-outlined">
						                    lock
						                </p>
										<span onclick="modalMan(this)" style="cursor:pointer"> 
											비밀글입니다.
										</span>
									</c:when>
									<c:when test="${qnalist.secret == 1 and sessionScope.mk.marketerId ne prd.marketerId}">
										<p class="material-symbols-outlined">
						                    lock
						                </p>
										<span onclick="modalMan(this)" style="cursor:pointer"> 
											비밀글입니다. 
										</span>
									</c:when>
									<c:when test="${qnalist.secret == 1 and sessionScope.mk.marketerId eq prd.marketerId}">
										<p class="material-symbols-outlined">
						                    lock
						                </p>
										<span onclick="location.href='/market/qnaDetail?prdQnano=${qnalist.prdQnano}'" style="cursor:pointer"> 
											비밀글입니다. 
										</span>
									</c:when>
										
									<c:otherwise>
										<a href="/market/qnaDetail?prdQnano=${qnalist.prdQnano}"> 
											<c:out value="${qnalist.prdQnacontent}" />
										</a>
									</c:otherwise>				
								</c:choose>
							</td>
							<td width="15%">
								<c:out value="${qnalist.userId}" />
							</td>
							<td >
								<fmt:formatDate value="${qnalist.prdQnaregdate}" pattern="yyyy-MM-dd" />
							</td>
						</tr>					
					</tbody>
					</table>
					<!-- 비밀번호확인 모달 시작-->
					<div id="id01" class="w3-modal w3-animate-opacity">
					    <div class="w3-modal-content w3-card-4" style="top: 15%; width: 300px;">
					      <header class="w3-container w3-teal" style="background-color: #fff!important;"> 
					        <span onclick="delModal(this);" style="overflow:visible; color:black;"
					        	class="w3-button w3-large w3-display-topright" >X</span>
					        <h5 style="margin-top:13px;">비밀번호 확인</h5>
					      </header>
					      <div class="w3-container" style="margin-top: 15px; height: 120px;">
					        <form action="/market/qnaSecretDetail" method="post" class="pwFrm">
					        	<input type="hidden" name="prdNo" value="${prd.prdNo}">
					        	<input type="hidden" name="prdQnano" value="${qnalist.prdQnano}">
						        <input class="w3-input w3-border w3-round-large" type="password" name="prdQnapw" style="width: 250px; margin-left: 10px;"><br>
						        <button class="btn btn-brand" style="margin-left: 10px; color:white; float:right;" onclick="pwChk(this)">확인</button>
					        </form>
					      </div>
					    </div>
					</div>
					<!-- 비밀번호확인 모달 끝-->
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</section>
</div>

<div align="center">
	<!-- qna 목록 페이지 번호 -->
	<c:forEach begin="1" end="${qnapageNum}" var="qnum">
		<span> 
			<a href="/marketDetailView?prdNo=${param.prdNo}&rnum=1&qnum=${qnum}#qna-wrap">
				${qnum} </a>
		</span>
	</c:forEach>
</div>
<!-- QnA 목록 끝 -->

<!-- QnA 모달 시작 -->
<form name="prdqnaForm" method="post" action="/market/qnaInsert">
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
					<input type="hidden" name="userId" value="${sessionScope.m.userId}"> 
					<input type="hidden" name="prdNo" value="${prd.prdNo}"> 
					<input type="hidden" name="marketerId" value="${prd.marketerId}"> 
					<input type="hidden" name="prdName" value="${prd.prdName}"> 
					<label
						for="message-text" class="col-form-label">문의할 내용을 작성해주세요.</label>
					<textarea name="prdQnacontent" class="chk2 form-control" id="message-text" 
							style="height: 15em; resize: none;" autofocus="autofocus" title="문의할 내용을 작성해주세요."></textarea>
					<br>
					<div>
						<input class="checkbox" type="checkbox" name="secret" id="secret"> 
						<label class="form-check-label">비밀글 </label>
					</div>
					<div style="display:none; float:left;" class="secretPw">
						<input class="chk3 w3-input w3-border w3-round-large" id="prdQnapw" name="prdQnapw" 
								type="text" style="width: 100px; margin: 0 auto;" placeholder=" 비밀번호"
								title="비밀번호를 입력해주세요.">
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="qnasave btn btn-brand">저장</button>
					<button type="button" class="qnacancel btn btn-brand" data-bs-dismiss="modal">취소</button>
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
   if ($(".chk1").val() == "" || $(".chk1").val() == null) {
      alert($(".chk1").attr("title"));
      return true;
   }
}

function fn_valiChk2() {
	if($("[name=secret]").prop("checked")){
       $("[name=secret]").attr("value", 1);
       if ($(".chk3").val() == "" || $(".chk3").val() == null) {
    	      alert($(".chk3").attr("title"));
    	      return true;
    		}
   }else{
       $("[name=secret]").attr("value", 0);
   }
   
   if ($(".chk2").val() == "" || $(".chk2").val() == null) {
      alert($(".chk2").attr("title"));
      return true;
   }
}


//qna 모달 > 비밀글 체크 > 비밀번호입력폼

var marketer = "${sessionScope.mk}";

$("[name=secret]").on("click", function(){
	if($("[name=secret]").prop("checked")){
    	$(".secretPw").slideDown();
    }else{
    	$(".secretPw").slideUp();
    }
});


//장바구니,구매하기 클릭시 로그인 체크
var marketer = "${sessionScope.mk}";
function loginCh() {
	if(marketer){
		alert('판매자는 사용 할 수 없습니다. 일반회원으로 로그인해주세요.');
	}
	else{
		alert('비회원은 사용 할 수 없습니다. 로그인해주세요.');
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

//비회원이 상품 위시 클릭시 로그인모달창, 판매자가 상품위시 클릭시 일반회원 로그인 alert창
var wishBtn = $("button[id='wishBtn']");
var marketer = "${sessionScope.mk}";

function wishCh() {
	if(marketer){
		alert('판매자는 사용 할 수 없습니다. 일반회원으로 로그인해주세요');
	}
	else{
		alert('비회원은 사용 할 수 없습니다. 로그인해주세요.');
	}
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

//qna 비밀글 비밀번호 확인
function modalMan(obj){
	$(obj).parents(".qna-list").next().css("display", "block");
}

//qna 비밀글 비밀번호 확인 모달창 끄기
function delModal(obj){
	$("[name=prdQnapw]").val('');
	$(".w3-animate-opacity").css("display", "none");
}

function pwChk(obj){
	if($("[name=prdQnapw]").eq(obj).val().trim() == ""){
		alert("비밀번호를 입력해주세요.");
		$(obj).attr("type", "button");
	}else{
		$(this).attr("type", "submit");
	}
}
</script>
</body>
</html>