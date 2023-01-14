<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>bonjour noël</title>
  <link rel="stylesheet" href="/resources/css/order/order.css">
  <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
  <script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="70">
<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
<section id="services" class="text-center">
  <div class="container">
    <div class="row">
      <div class="col-12" >
        <div class="intro" id="font">
          <h1 id="font">My Order</h1>
          <h2 id="font">주문/결제</h2>
        </div>
      </div>
    </div>
  </div>
</section>
<div class="page-content">
  <div class="order">
    <div class="cart-table order-info">
      <table>
        <tr id="font">
          <th style="width: 20%;">이미지</th>
          <th style="width: 20%;">상품명</th>
          <th style="width: 15%;">가격</th>
          <th style="width: 10%;">수량</th>
          <th style="width: 15%;">배송비</th>
          <th style="width: 20%;">총 금액</th>
        </tr>

        <tbody>

        <tr class="showCartList" id="font">

          <td class="pImg" style="text-align: center">
          <img src="resources/upload/product/${Order.prdthumNail }"></td>
          <td class="pName" style="text-align: center">${Order.prdName }</td>
          <td class="pPrice" style="text-align: center"><fmt:formatNumber
                  value="${Order.prdPrice}" pattern="#,###" /> 원</td>
          <td style="text-align: center">${Order.cartQuan }</td>
          <td class="shipping">무료</td>
          <td style="text-align: center;" class="cartTotalPrice"><fmt:formatNumber
                  value="${Order.prdPrice*Order.cartQuan }" pattern="#,###" /> 원</td>
        </tr>
        <tr>
          <td colspan="4"></td>

          <td>
            <input type="hidden" style="border: none;"
                   class="hiddenPayPrice payPrice" name="productsPrice" readonly>
            <p class="lastPrice"></p>
          </td>
          <td id="font">총 합계 : <fmt:formatNumber
                  value="${Order.prdPrice*Order.cartQuan }" pattern="#,###" />원
            <input type="hidden" class="totalp"
                   value=" ${Order.prdPrice*Order.cartQuan }">
          </td>
        </tr>
        </tbody>
      </table>
    </div>
  </div>

  <form id="order-form" action="/orderDirect" method="post"
        autocomplete="off">

    <h4 id="font">주문정보</h4><br>
    <div class="order-info" id="font">
      <div class="order-box">
        <label for="name" class="order-label">주문자명</label>
        <input type="text" id="orderName" class="order-input medium"
               value="${sessionScope.m.userName }">
        <input type="hidden" name="userId" value="${sessionScope.m.userId }">
      </div>
      <div class="order-box">
        <label for="phone" class="order-label">전화번호</label>
        <input type="text" id="orderPhone" class="order-input medium"
               value="${sessionScope.m.userTel}">
      </div>

    </div>
    <input type="hidden" id="cart-quantity-sum" name="orderQuan" value="${Order.cartQuan }">
    <input type="hidden" id="cart-price-sum" name="orderPrice" value="${Order.prdPrice*Order.cartQuan }">
    <input type="hidden" id="cart-price-sum" name="prdNo" value="${Order.prdNo }">

    <br><h4 id="font">배송정보</h4><br>
    <div class="order-info shipping" id="font">
      <div id="same-check">
        <label for="order-same"> 
        <input type="checkbox" id="order-same">&nbsp;주문자와 동일</label>
      </div>
      <div class="order-box">
        <label for="shippingName" class="order-label">수령인명</label>
        <input type="text" name="shippingName" id="shippingName"
               class="order-input medium view-order-info" required>
        <input type="text" class="order-input medium hidden-order-info"
               value="${sessionScope.m.userName }" style="display: none;">
        <span class="comment"></span>
      </div>
      <div class="order-box">
        <label for="shippingPhone" class="order-label">전화번호</label>
        <input type="text" name="shippingPhone" id="shippingPhone"
               class="order-input medium view-order-info" placeholder="숫자만 입력해주세요" required>
        <input type="text" class="order-input medium hidden-order-info"
               value="${sessionScope.m.userTel }" style="display: none;">
        <span class="comment"></span>
      </div>
      <div class="order-box">
        <label for="shippingAddr1" class="order-label">주소</label>
        <input type="text" name="shippingAddr1" id="shippingAddr1"
               class="order-input long" readonly="readonly">
        <input type="text" style="display: none;" readonly>
        <button type="button" id="addr-btn" onclick="searchAddr();">주소찾기</button>
        <span class="comment"></span>
      </div>
      <div class="order-box">
        <label for="shippingAddr2" class="order-label">상세 주소<span
                class="comment"></span>
        </label>
        <input type="text" name="shippingAddr2" id="shippingAddr2" class="order-input llong">
        <input type="text" style="display: none;">
        <span class="comment"></span>
      </div>
    </div>

    <div class="order-info" style="padding-top: 80px;">
      <div id="agree-box">
        <label for="info-agree" id="font">
        	<input type="checkbox" id="info-agree" class="info-agree">&nbsp;주문 내용을 확인하였으며, 정보 제공 등에 동의합니다.</label>
      </div>
      <div class="order-btn" id="font">
        <button type="button" id="payBtn">결제하기</button>
      </div>
    </div>
  </form>
</div>

<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />

<script>
  //주소 찾기 api
  function searchAddr() {
    new daum.Postcode({
      oncomplete : function(data) {
        console.log(data);
        //주소 합치기
        $("#shippingAddr1").val(
                data.zonecode + " " + data.roadAddress);
        $("#shippingAddr2").focus();
      }
    }).open();}

  //배송정보와 주문자 정보 일치할때 (체크박스 체크 할 때)
  $("#order-same").on("change", function() {
    if ($(this).prop("checked")) {
      $(".view-order-info").hide();
      $(".view-order-info").attr("name", "");
      $(".hidden-order-info").show();
      $(".hidden-order-info").eq(0).attr("name", "shippingName");
      $(".hidden-order-info").eq(1).attr("name", "shippingPhone");

    } else {
      $(".hidden-order-info").hide();
      $(".hidden-order-info").attr("name", "");
      $(".view-order-info").show();
      $(".view-order-info").eq(0).attr("name", "shippingName");
      $(".view-order-info").eq(1).attr("name", "shippingPhone");
      $(".view-order-info").eq(2).attr("name", "shippingAddr1");
      $(".view-order-info").eq(3).attr("name", "shippingAddr2");
    }
  });

  $("#payBtn").on("click",
          function() {
            const shipInfo = $(".shipping").find(".view-order-info");
            if (!$("#order-same").prop("checked")) {
              for (let i = 0; i < shipInfo.length; i++) { // 배송정보 빈 칸인지 확인
                if (shipInfo.eq(i).val() == "") {
                  shipInfo.eq(i).siblings(".comment").text("정보를 입력해주세요.");
                  return;
                } else {
                  shipInfo.eq(i).siblings(".comment").text("");
                }

                if (i == 0) { // 수령인명 정규식
                  const nameReg = /^[가-힣]{2,4}$/;
                  const val0 = shipInfo.eq(0).val();
                  if (!(nameReg.test(val0))) {
                    shipInfo.eq(0).siblings(".comment")
                            .text("한글 2~4자로 입력");
                    //event.preventDefault();
                    return;
                  }
                } else if (i == 1) { // 수령인 연락처 정규식
                  const phoneReg = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/;
                  const val1 = shipInfo.eq(1).val();
                  if (!(phoneReg.test(val1))) {
                    shipInfo
                            .eq(1)
                            .siblings(".comment")
                            .text("010-0000-0000 형식으로 입력");
                    //event.preventDefault();
                    return;
                  }
                }
              } // 배송정보 빈 칸인지 확인 끝
            } else {
              shipInfo.siblings(".comment").text("");
            }//주소 빈칸인지 확인
            if($('#shippingAddr1').val().trim()=='' || $('#shippingAddr1')==null){
				alert("주소를 입력해주세요");
				return;
			}else if($('#shippingAddr2').val().trim()=='' || $('#shippingAddr2')==null){
				alert("상세주소를 입력해주세요");
				return;
			}
            if (!$("#info-agree").prop("checked")) {
              alert("정보 제공에 동의해주세요.");
              return;
            }

            const price = $(".totalp").val();
            console.log(price);
            const name1 = $("#orderName").val();
            const d = new Date();
            const date = d.getFullYear() + ""
                    + (d.getMonth() + 1) + "" + d.getDate()
                    + "" + d.getHours() + "" + d.getMinutes()
                    + "" + d.getSeconds(); // 문자열덧셈을 위해 빈 문자열 넣음

            IMP.init('imp87554320');
            IMP.request_pay({
                      pg : "html5_inicis",
                      //pay_method:'card',
                      merchat_uid : "bonjour" + date, // 거래ID
                      name : '봉쥬르노엘', // 결제 이름
                      amount : price, // 결제 금액
                      buyer_name : name1,

                    },
                    function(rsp) {
                      if (rsp.success) {
                        const input = $("<input type='hidden' name='impUid' value='"+rsp.imp_uid+"'>" );
                        $("#order-form").append(input);
                        $("#order-form").submit();
                      } else {
                        var msg = '결제에 실패하였습니다.';
                        msg += '에러내용 : ' + rsp.error_msg;
                        alert(msg+" 결제 실패");
                      }
                    })
          });
</script>
</body>
</html>