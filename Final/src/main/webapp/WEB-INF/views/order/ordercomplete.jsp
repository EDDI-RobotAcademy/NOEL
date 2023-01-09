<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>bonjour noël</title>
    <link rel="stylesheet"
          href="/resources/css/index/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/css/index/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/css/order/ordercomplete.css">

</head>
<body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="70">
<jsp:include page="/WEB-INF/views/layouts/header.jsp" />

<section id="services" class="text-center">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="intro" id="font">
                    <h1 id="font">My Cart</h1>
                    <h2 id="font">주문/결제</h2>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="done">

    <div class="done1" id="font">
        <div id="order-msg">
            <br>주문이 완료되었습니다.<br>감사합니다.<br><br>
            <div id="order-msg1">*주문 내역은 마이페이지에서 확인 할 수 있습니다.</div>
        </div>

        <div class="back">
            <div class="back-main" id="font">
                <a href="/">HOME</a>
            </div>
            <div class="back-mypage" id="font">
                <a href="/userOrderList?&reqPage=1">MyPage</a>

            </div>

        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />

</body>
</html>