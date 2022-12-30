<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>bonjour noël</title>
    <link rel="stylesheet" href="/resources/css/cart/cart.css">
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="70">
<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
<section id="services" class="text-center">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="intro" id="font">
                    <h1 id="font">My Cart</h1>
                    <h2 id="font">장바구니</h2>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="page-content">
    <div class="cart">
        <div class="cart-table">
            <table>
                <tr id="font">
                    <th style="width: 5%;">
                        <label></label>
                        <input type="checkbox" name="productCheck" onclick="selectAll(this)" style="width: 15px; height: 15px;"></th>
                    <th style="width: 20%;">이미지</th>
                    <th style="width: 20%;" class="cart-product-title">상품명</th>
                    <th style="width: 15%;">가격</th>
                    <th style="width: 10%;">수량</th>
                    <th style="width: 15%;">배송비</th>
                    <th style="width: 15%;">총 금액</th>
                </tr>
                <tbody>
                <c:forEach items="${list }" var="Cart">
                    <tr class="showCartList" id="font">
                        <td style="text-align: center">
                            <input type="checkbox" name="productCheck" class="deleteBtn">
                            <input type="hidden" name="useId" value="${sessionScope.m.userId }" >
                            <input type="hidden" name="cartNo" value="${Cart.cartNo }" >
                            <input class="pNo" type="hidden" name="prdNo" value="${Cart.prdNo }">
                        </td>
                        <td class="pImg" style="text-align: center">이미지 불러오기<%-- <img src="/resources/upload/prd_add/${Cart.PImg }" > --%></td>
                        <td style="text-align: center">
                            <input type="hidden" name="prdName" value="${Cart.prdName }">
                                ${Cart.prdName }
                        </td>
                        <td class="pPrice" style="text-align: center">
                            <fmt:formatNumber value="${Cart.prdPrice }" pattern="#,###" />
                        </td>
                        <td style="text-align: center">${Cart.cartQuan }</td>
                        <td class="shipping" style="text-align: center">무료</td>
                        <td style="text-align: center; display: none;"
                            class="cartTotalPrice">${Cart.prdPrice*Cart.cartQuan }</td>
                        <td style="text-align: center;">
                            <fmt:formatNumber value="${Cart.prdPrice*Cart.cartQuan }" pattern="#,###" />
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <table id="priceTb">
        <tr>
            <td>
                <div class="cart-checks-btn">
                    <button type="button" class="deleteCheck" id="font">선택   삭제</button>
                </div>
            </td>
            <td colspan="5" > </td>
            <td style="font-weight: 600;text-align: right;">
                <div  id="priceTd">
                    <input type="hidden" style="border: none;" class="hiddenPayPrice payPrice" name="productsPrice" readonly>
                    <p style="float: left; margin-right: 5px;">총 합계 :</p>
                    <p id="font" class="lastPrice" style="float: left;"></p>
                    <p id="font" style="float: left;">원</p>
                </div>
            </td>
        </tr>
    </table>
    <br><br>
    <div class="cart-btn">
        <button type="button" id="font"
                onclick="location.href='/marketListFrm?reqPage=1'">계속 쇼핑하기</button>
        <button type="button" class="payBtn"
                onclick="goToOrder('${sessionScope.m.userId }');">주문하러가기</button>
    </div>
</div>
<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
<script>
    function selectAll(selectAll)  { // 전체선택
        const checkboxes
            = document.getElementsByName("productCheck");

        checkboxes.forEach((checkbox) => {
            checkbox.checked = selectAll.checked;
        })
    }

    function sum(){
        const cartTotalPrice = $(".cartTotalPrice");
        let result = 0;
        for(let i=0; i<cartTotalPrice.length; i++){
            result += Number(cartTotalPrice.eq(i).text());
        }
        $(".payPrice").val(result);
        const lastPrice = $(".lastPrice");
        const ViewPrice = result.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
        lastPrice.text(ViewPrice);
    }
    sum();


    function goToOrder(userId){
        console.log(userId);
        location.href = "/ordercart?userId="+userId;
    }

    $(".deleteCheck").on("click", function(){
        // 체크한것 삭제
        const check = $(".deleteBtn:checked");
        if(check.length == 0) {
            alert("선택된 상품이 없습니다.")
            return;
        }

        const delCartArr = new Array();
        const userId = check.next().val();
        console.log(userId); //콘솔 1

        for(let i=0; i<check.length; i++) {
            // 체크된 카트 번호
            const cartNo = check.eq(i).next().next().val();
            console.log(cartNo); //콘솔
            delCartArr.push(cartNo);
        }
        console.log(delCartArr);
        location.href="/deleteCart.do?userId="+userId+"&delCartArr="+delCartArr.join("/");
    });

</script>
</body>
</html>