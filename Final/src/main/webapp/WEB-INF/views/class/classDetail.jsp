<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>classDetail</title>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <script src ="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<style>
    /*datepicer 버튼 롤오버 시 손가락 모양 표시*/
    .ui-datepicker-trigger {
        cursor: pointer;
    }

    /*datepicer input 롤오버 시 손가락 모양 표시*/
    .hasDatepicker {
        cursor: pointer;
    }

    .hidden{
        display:none;
    }


</style>
<body>
<jsp:include page="/WEB-INF/views/layouts/header.jsp"/>
<link rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,1,200"/>
<link rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"/>
<link rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"/>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link rel="stylesheet" href="/resources/demos/store/style.css">
<link rel="stylesheet" href="/resources/css/class/classDetail.css">
<link rel="stylesheet" href="/resources/css/map.css">


<div class="content-wrap2" style="width:1200px; margin: 0 auto; background-color: rgba(255, 255, 255, 0.06);">
    <div class="content-wrap2-1">
        <!-- 사진 슬라이드 영역 -->
        <div class="photo-wrap">
            <ul class="storeImgUl" style="height: 460px; width: 100%;">
                <img src="resources/upload/class/${s.thumNail }">
            </ul>
        </div>

        <div class="info-reserve-wrap">
            <table class="w3-table w3-bordered" id="infoTable" style="font-family:Gowun Dodum; width: 550px;">
                <tr>
                    <th style="width:120px;">주소</th>
                    <td colspan="3" class="addressTd" style="color:black;">${s.classAddr }</td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td colspan="3" class="phoneTd" style="color:black;">010-2278-2357</td>
                </tr>
                <tr>
                    <th>운영시간</th>
                    <td colspan="3" class="openHourTd" style="color:black;">${s.classResTime }</td>
                </tr>
                <tr>
                    <th>휴일</th>
                    <td colspan="3" class="closedDayTd" style="color:black;">목</td>
                </tr>

                <tr style="height: 47px;">
                    <th style="height: 47px;">일자</th>
                    <td class="calTd">
                        <div style="height: fit-content;">
                            <label for="datePicker">
                                <span class="material-symbols-outlined pointer"
                                      style="height: fit-content; line-height: 1.2;">calendar_month</span>
                            </label>
                        </div>
                    </td>
                    <td colspan="2">
                        <input type="text" id="datePicker" style="border:none;" placeholder="예약날짜선택">
                    </td>
                </tr>
                <tr style="height: 47px;">
                    <th>인원</th>
                    <td>
                        <button class="w3-button w3-circle" id="down"
                                style="width: 35px; height: 35px; padding: 0; background-color: red; color:white;">-
                        </button>
                    </td>
                    <td class="peopleTd" style="width:30px; text-align: center;">
                        <span class="people">1</span>
                    </td>
                    <td>
                        <button class="w3-button w3-circle" id="up"
                                style="width: 35px; height: 35px; padding: 0; background-color: red; color:white;">+
                        </button>
                    </td>
                </tr>
                <tr>
                    <th>예약가능시간</th>
                    <td colspan="3" class="buttonTd">

                    </td>
                </tr>
            </table>



            <c:choose>
                <c:when test="${empty sbm}">
                    <c:choose>
                        <c:when test="${bookmarkId == mlolw2}">
                            <button name="reserveBtn" class="reserveBtn2" style="font-family:Gowun Dodum;  width:280px; height:50px; background-color: rgb(51,51,51); color: white;
                                 margin-top: 10px;">예약하기
                            </button>
                            <button  name="reserveBtn" id="wishlist"   style="font-family:Gowun Dodum;  width:280px; height:50px; background-color: white; color: black;
                                 margin-top: 10px; padding: 17.3px;"  onclick="addWishlist(this, ${s.classNo}, 'mlolw2')">
                                <img  style = "width: 15px;" src="/resources/img/index/heart.svg">
                            </button>
                            <button  name="reserveBtn" id="wishlist1"   style="font-family:Gowun Dodum;  width:280px; height:50px; background-color: white; color: black;
                                 margin-top: 10px; padding: 17.3px; display: none;"  onclick="deleteWishlist(this, ${s.classNo}, 'mlolw2')">
                                <img  style = "width: 15px;" src="/resources/img/index/heart-fill.svg">
                            </button>
                        </c:when>
                        <c:otherwise>
                        </c:otherwise>
                    </c:choose>
                </c:when>

                <c:otherwise>
                    <c:choose>
                        <c:when test="${bookmarkId == mlolw2}">
                            <button name="reserveBtn" class="reserveBtn2" style="font-family:Gowun Dodum;  width:280px; height:50px; background-color: rgb(51,51,51); color: white;
                                 margin-top: 10px;">예약하기
                            </button>
                            <button  name="reserveBtn" id="wishlist1"   style="font-family:Gowun Dodum;  width:280px; height:50px; background-color: white; color: black;
                                 margin-top: 10px; padding: 17.3px;"  onclick="deleteWishlist(this, ${s.classNo}, 'mlolw2')">
                                <img  style = "width: 15px;" src="/resources/img/index/heart-fill.svg">
                            </button>

                            <button  name="reserveBtn" id="wishlist"   style="font-family:Gowun Dodum;  width:280px; height:50px; background-color: white; color: black;
                                 margin-top: 10px; padding: 17.3px; display: none;"   onclick="addWishlist(this, ${s.classNo}, 'mlolw2')">
                                <img  style = "width: 15px;" src="/resources/img/index/heart.svg">
                            </button>
                        </c:when>
                        <c:otherwise>
                            <a href="#">
                                <button id="loginBtn" style="font-family:Gowun Dodum; border-radius: 15px; width:550px; height:50px; background-color: rgb(51,51,51); color: white;
                         margin-top: 10px;">로그인
                                </button>
                            </a>
                        </c:otherwise>
                    </c:choose>
                </c:otherwise>
            </c:choose>







        </div>
    </div>
</div>




<%-- 클래스 활동 --%>

<div class="content-wrap4"
     style="font-family:Gowun Dodum; margin-top:30px; height:100%; width:1200px; margin-bottom:100px; margin:0 auto;">
    <div class="testDiv" style="width: 1200px; margin:0 auto;">
        <!----- 메뉴판 부분 ----->
        <div class="menuWrap" style="font-family:Gowun Dodum;">
            <p class="menuTitle" style="margin-top: 20px;">CLASS</p>
            <p class="menuSubTitle">대표 클래스</p>
            <table class="w3-table w3-bordered" id="menuTable">
                <c:forEach items="${list }" var="me">
                    <tr>
                        <td style="text-align:left;">${me.menuName }</td>
                        <td style="text-align:right;">${me.menuPrice }</td>
                    </tr>
                </c:forEach>
            </table>
        </div>


        <!----- 메뉴 부분 ----->
        <div class="food-wrap"
             style="width:1200px; overflow:hidden; height:400px; margin: 0 auto; text-align:center; margin:50px 0;">
            <c:forEach items="${list }" var="me">
                <div class="w3-card" id="photoWrap"
                     style="font-family:Gowun Dodum; width:350px; height:300px; margin: 10px 25px;">
                    <img src=/resources/upload/menu/${me.menuImg} style='width: 100%; height: 200px;'>
                    <div class="w3-container" style="font-family:Gowun Dodum;">
                        <p style="font-weight: bolder; font-size: 20px; margin-top:10px;">${me.menuName}</p>
                    </div>
                </div>
            </c:forEach>
        </div>


        <hr style="border: 1px">

        <%-- 상세정보 --%>
        <p class="menuTitle" style="margin-top: 20px;">CONTENT</p>
        <p class="menuSubTitle">클래스 설명</p><br><br>
        <div class="contentWrap2" style="font-family:Gowun Dodum;">
            ${s.classContent}
        </div>

        <hr style="border: 1px">


        <%-- 리뷰 --%>
        <c:choose>
        <c:when test="${!empty rList }">
        <div class="review-wrap" style="margin:50px 0;">
            <p class="menuTitle" style="margin-top: 20px;">REVIEW</p>
            <p class="menuSubTitle">클래스 리뷰</p><br><br>
            <ul class="w3-ul w3-card-4" id="reviewWrapUl" style="height:content-fit;">
                <c:forEach items="${rList }" var="r">
                    <li class="w3-bar" style="height:content-fit;">
                        <div class="w3-bar-1" style="margin:0; height: content-fit;">
                            <img src="/resources/upload/review/${r.clReviewImg }" class="w3-hide-small"
                                 style="float: left; width:35%; height:100%;">
                            <div class="w3-bar-item" id="w3-bar-item"
                                 style="width:60%; height: content-fit; padding:0; margin-left:5%; position: relative;">
                                <div style="color: rgb(255, 83, 86); float:left;"><c:forEach begin="1" step="1" end="${r.clReviewRating }" varStatus="i">★</c:forEach></div>
                                <div>${r.clReviewRating }</div>
                                <div class="w3-large" style="font-weight: 700;">${r.marketerId }</div>
                                <div class="reviewContent" style="display: inline; float: left; height:150px; overflow: auto;">${r.clReviewContent}</div>
                                <div class="regDate" style="position: absolute; bottom: 0px; right: 0px;">${r.clReviewDate }</div>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
        </c:when>
        </c:choose>
    </div>
    <jsp:include page="/WEB-INF/views/layouts/footer.jsp"/>
</div>

<!-- 모달 부분 -->
<div class="modal-wrap hidden" id="modal">
    <div class="modal-box">
        <div class="modal-title">예약 정보</div>
        <div class="modal-content">
            <form id="order-form" action="/reserve?userId='mlolw'&classNo=${s.classNo}">
                <table class="w3-table w3-bordered" id="reserveCheckTbl">
                    <tr>
                        <th>클래스명</th>
                        <td class="storeNameTd">${s.className}</td>
                    </tr>
                    <tr>
                        <th>일자</th>
                        <td class="dateTd"></td>
                    </tr>
                    <tr>
                        <th>시간</th>
                        <td class="timeTd"></td>
                    </tr>

                    <tr>
                        <th>인원</th>
                        <td class="peopleNumTd"></td>
                    </tr>
                    <tr>
                        <th>가격</th>
                        <td class="price"></td>
                    </tr>
                </table>

                <input type="hidden" name="userId" value="mlolw2">
                <input type="hidden" name="classNo" value="${s.classNo}">
                <input type="hidden" name="bookName" value="${s.className}">
                <input type="hidden" name="bookDate" class="bookDate">
                <input type="hidden" name="bookTime" class="bookTime">
                <input type="hidden" name="bookNum" class="bookNum">
                <input type="hidden" name="bookTel" class="bookTel">
                <div class="explanation">* 가게에서 최종 확정 시 예약이 확정됩니다.</div>
                <button class="closeModal pointer" onclick="hideModal();" type="button" >닫기</button>
                <button class="reserveBtn pointer" id="reserveBtn" type="button">예약하기</button>


            </form>
        </div>
    </div>








</div>

<!-- 시간 날짜 미입력 모달 -->
<div class="w3-container" style="font-family:Gowun Dodum;">
    <div id="timeDateModal" class="w3-modal" style="font-family:Gowun Dodum; z-index:2000;">
        <div class="w3-modal-content w3-animate-top w3-card-4" style="width:30%; height: 40%;">
            <header class="w3-container" style="height:10%; background-color: #ffc107;">
                 <span onclick="document.getElementById('timeDateModal').style.display='none'"
                       class="w3-button w3-display-topright" style="width:5%; height:10%;">&times;</span>
            </header>
            <p style="width:100%; height:100%;padding:0; margin:0;display:flex; justify-content: center; align-items: center; color:black;">예약하실 날짜와 시간을 선택해주세요.</p>
        </div>
    </div>
</div>




            <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
            <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

            <%-- dateficker --%>
            <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
            <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

            <script>

                <%-- dateficker --%>
                $.datepicker.setDefaults({
                    dateFormat: 'yy-mm-dd',
                    prevText: '이전 달',
                    nextText: '다음 달',
                    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
                    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
                    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                    showMonthAfterYear: true,
                    yearSuffix: '년',
                    beforeShowDay: disabledDays
                });

                $(function () {
                    //데이트피커 생성 및 당일 선택 불가
                    $("#datePicker").datepicker({minDate: 1});
                });

                //---------- 휴일 데이터피커 비활성화
                let dayArr = new Array();
                let daysArr = new Array();
                let closedDay = "목";

                function disabledDays(date) {

                    let day = date.getDay();
                    dayArr = closedDay.split(",");

                    for (let i = 0; i < dayArr.length; i++) {
                        if (dayArr[i] == "월") {
                            daysArr.push("1");
                        }
                        if (dayArr[i] == "화") {
                            daysArr.push("2");
                        }
                        if (dayArr[i] == "수") {
                            daysArr.push("3");
                        }
                        if (dayArr[i] == "목") {
                            daysArr.push("4");
                        }
                        if (dayArr[i] == "금") {
                            daysArr.push("5");
                        }
                        if (dayArr[i] == "토") {
                            daysArr.push("6");
                        }
                        if (dayArr[i] == "일") {
                            daysArr.push("0");
                        }
                    }//for문 종료

                    //데이트피커 휴일 비활성화 코드
                    let result = true;
                    for (let i = 0; i < daysArr.length; i++) {
                        result = result && (day != Number(daysArr[i]));
                    }
                    return [result];
                }//함수 disabledDays종료

                // 예약 날짜
                var classNo = "${s.classNo}";
                var btnVal = new Array();
                var checkTimeBtn = new Array();

                var hour = "${s.classResTime}";
                var hourArr = new Array();
                hourArr = hour.split("~");
                var openTime = new Array();
                openTime = hourArr[0].split(":");
                var closeTime = new Array();
                closeTime = hourArr[1].split(":");
                var realOpenTime = openTime[0]; //실오픈시간
                var realCloseTime = closeTime[0]; //실폐점시간
                var selectTime;
                var selectDate = $("#datePicker").val();
                var disabledTime = new Array();


                //---------- 날짜 input 클릭 시 시간 버튼 삭제
                $("#datePicker").on("click", function () {
                    $(".timeBtn").remove();
                    disabledTime = new Array();
                });


                $("#datePicker").on("change", function () {
                    $.ajax({
                        url: "/checkReserve",
                        type: "post",
                        data: {classNo: classNo},
                        success: function (data) {
                            //삭제하고 생성
                            $(".timeBtn").remove();
                            //시간 버튼 생성
                            for (let i = realOpenTime; i < realCloseTime; i++) {
                                $(".buttonTd").append("<button class=timeBtn style=margin-right:1%;background-color:white;color:rgb(51,51,51); value=" + i + ">" + i + ":00" + "</button>");
                            }
                            //버튼 클릭
                            const timeBtns = $(".timeBtn");
                            timeBtns.on("click", function () {
                                timeBtns.css("color", "rgb(51,51,51)").css("background-color", "white");
                                $(this).css("color", "white").css("background-color", "rgb(51,51,51)");
                                const index = timeBtns.index(this);
                                selectTime = $(this).text();

                                //예약불가 시간의 버튼 비활성화
                                for (let i = 0; i < btnVal.length; i++) {
                                    for (let j = 0; j < disabledTime.length; j++) {
                                        if (btnVal[i] == disabledTime[j]) {
                                            checkTimeBtn[i].style.color = "red";
                                            checkTimeBtn[i].style.background = "pink";
                                            checkTimeBtn[i].setAttribute("disabled", true);
                                        }
                                    }
                                }
                            });
                            var selectDate = $("#datePicker").val();
                            checkTimeBtn = document.getElementsByClassName('timeBtn');


                            //btnVal 이란 배열에 버튼의 value값 넣기
                            for (let i = 0; i < checkTimeBtn.length; i++) {
                                btnVal.push(document.getElementsByClassName('timeBtn')[i].value + ":00");
                            }

                            var maxNum = "4";
                            var selectDate = $("#datePicker").val();

                            $.ajax({
                                url: "/checkReserveTime",
                                type: "post",
                                data: {classNo: classNo, selectDate: selectDate, maxNum: maxNum},
                                success: function (data) {
                                    console.log(data);
                                    for (let i = 0; i < data.length; i++) {
                                        disabledTime.push(data[i].bookTime);
                                    }

                                    for (let i = 0; i < btnVal.length; i++) {
                                        for (let j = 0; j < disabledTime.length; j++) {
                                            if (btnVal[i] == disabledTime[j]) {
                                                checkTimeBtn[i].style.color = "red";
                                                checkTimeBtn[i].style.background = "pink";
                                                checkTimeBtn[i].setAttribute("disabled", true);
                                            }
                                        }
                                    }
                                }
                            }); //--------------내부 ajax종료
                        }//--------success문 종료
                    }); //--------------ajax종료
                });//데이트 피커 눌렀을 떄 함수 종료


                <%-- 인원수 늘리기 --%>
                let count = 1;
                $("#up").on("click", function (e) {
                    if (count == 4) {
                        return false;
                    }
                    count++;
                    $(".people").text(count);
                });

                $("#down").on("click", function (e) {
                    if (count == 1) {
                        return false;
                    }
                    count--;
                    $(".people").text(count);
                });

                const modal = document.querySelector(".modal-wrap");
                var ownerId = "";
                var memberId = ""
                var selectedDate;



                //예약하기 모달 열기
                $(".reserveBtn2").on("click",function(){

                    var price = count * Number(100);
                    let tel = "010-2278-2357";
                    const name = "전민우";
                    const d = new Date();
                    const date = d.getFullYear() +""+ (d.getMonth()+1) +""+ d.getDate() +""+ d.getHours() +""+ d.getMinutes() +""+ d.getSeconds(); // 문자열덧셈을 위해 빈 문자열 넣음


                    modal.classList.remove("hidden");
                    if(ownerId != ""){
                        modal.classList.add("hidden");
                        document.getElementById('ownerModal').style.display='block';
                    }
                    selectedDate =$("#datePicker").val();
                    $(".bookDate").attr("value",selectedDate);
                    $(".bookTime").attr("value",selectTime);
                    $(".bookNum").attr("value",count);
                    $(".dateTd").text(selectedDate);
                    $(".peopleNumTd").text(count);
                    $(".timeTd").text(selectTime);
                    $(".price").text(price);
                    $(".bookTel").text(tel);

                    $("#reserveBtn").on("click",function(){
                        console.log(price);
                        console.log(name);
                        console.log(date);

                        IMP.init("imp87554320");
                        IMP.request_pay({
                            pg: "html5_inicis",
                            merchat_uid : "bonjour"+date, 			// 거래ID
                            name : "봉쥬르노엘",						// 결제 이름
                            amount : 100,							// 결제 금액
                            buyer_name : name					// 구매자 이름
                            // buyer_tel : "010-1234-1234", 			// 구매자 전화번호
                            // buyer_addr : "서울시 영등포구 당산동",			// 구매자 주소
                            // buyer_postcode : "12345"				// 구매자 우편번호
                        }, function(rsp){
                            if(rsp.success) {
                                console.log(rsp);
                                const input = $("<input type='hidden' name='impUid' value='"+rsp.imp_uid+"'>");
                                $("#order-form").append(input);
                                $("#order-form").submit();
                            } else {
                                var msg = '결제에 실패하였습니다.';
                                msg += '에러내용 : ' + rsp.error_msg;
                                alert(msg);
                                alert("결제 실패");
                            }
                        })
                    })

                    //날짜를 선택하지 않았을 때
                    if($("#datePicker").val() == "" || selectTime== null){
                        document.getElementById('timeDateModal').style.display='block';
                        modal.classList.add("hidden");
                    }
                });

                function hideModal(){
                    modal.classList.add("hidden");
                }

                function addWishlist(obj, classNo, userId){
                    $("#wishlist").hide();
                    $("#wishlist1").show();

                    $.ajax({
                        url : "/insertClassWishlist",
                        type : "post",
                        data : {classNo : classNo, userId : userId},
                        success : function(data){
                            console.log(data);
                        }
                    })
                }

                function deleteWishlist(obj, classNo, userId){
                    $("#wishlist1").hide();
                    $("#wishlist").show();

                    $.ajax({
                        url : "/deleteClassWishlist",
                        type : "post",
                        data : {classNo : classNo, userId : userId},
                        success : function(data){
                            console.log(data)
                        }
                    })
                }

            </script>


</body>
</html>

