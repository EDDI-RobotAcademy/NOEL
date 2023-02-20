<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="/resources/img/index/favicon (1).ico" />
<title>bonjour noël</title>

<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>


<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,1,200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/class/classDetail.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/layouts/header.jsp"/>
<div class="content-wrap2" style="width:1200px; margin: 0 auto; background-color: rgba(255, 255, 255, 0.06);">
    <div class="content-wrap2-1">
    <div class="directoryDiv">home > class > detail</div>
        <!-- 사진 슬라이드 영역 -->
        <div class="photo-wrap">
            <ul class="storeImgUl" style="height: 460px; width: 100%;">
                <img src="resources/upload/class/${s.thumNail }">
            </ul>
        </div>

        <div class="info-reserve-wrap">
            <table class="w3-table w3-bordered" id="infoTable" style="font-family:Gowun Dodum; width: 550px;">
			<tr>
				<th style="width: 120px;">주소</th>
					<td colspan="3" class="addressTd" style="color: black;">${s.classAddr }</td>
			</tr>
			<tr>
                <th>운영시간</th>
                    <td colspan="3" class="openHourTd" style="color:black;">${s.classResTime }</td>
            </tr>
            <tr>
                <th>금액</th>
                    <td colspan="3" class="priceTd" style="color:black;">
					<fmt:formatNumber value="${s.classPrice }" pattern="##,###" />원
					</td>
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
                    <td colspan="3" class="buttonTd"></td>
                </tr>
                <tr>
                	<th>이용 총 금액</th>
                	<td colspan="3" class="phoneTd" style="color: black;">
                	<span class="price" style="color: red; font-weight: bolder;"></span>원</td>
                </tr>
            </table>
			<div class="btnWrap">
			<c:choose>
				<c:when test="${s.clStatus eq 0}">
					<button type="button" name="closeBtn">클래스 오픈 전입니다.</button>
				</c:when>
				<c:otherwise>
		            <c:choose>
		                <c:when test="${empty sbm}">
		                    <c:choose>
		                        <c:when test="${empty sessionScope.m}">
		                            <button name="reserveBtn" class="loginBtn" onclick="loginCh()">예약하기
		                            </button>
		                        </c:when>
		                        <c:otherwise>
		                        	<button name="reserveBtn" class="reserveBtn2" >예약하기
		                            </button>
		                            <button  name="wishBtn" id="wishlist" onclick="addWishlist(this, ${s.classNo}, '${m.userId}')">
		                                <img style = "width: 21px;" src="/resources/img/index/heart.png">
		                            </button>
		                            <button  name="wishBtn" id="wishlist1"   style="display: none;"  onclick="deleteWishlist(this, ${s.classNo}, '${m.userId}')">
		                                <img style = "width: 25px;" src="/resources/img/index/heart-fill.png">
		                           </button>
		                        </c:otherwise>
		                    </c:choose>
		                </c:when>
		
		                <c:otherwise>
		                    <c:choose>
		                        <c:when test="${!empty sessionScope.m}">
		                            <button name="reserveBtn" class="reserveBtn2" >예약하기
		                            </button>
		                            <button  name="wishBtn" id="wishlist1" onclick="deleteWishlist(this, ${s.classNo}, '${m.userId}')">
		                                <img style = "width: 25px;" src="/resources/img/index/heart-fill.png">
		                            </button>
		                            <button  name="wishBtn" id="wishlist" style="display: none;" onclick="addWishlist(this, ${s.classNo}, '${m.userId}')">
		                                <img style = "width: 21px;" src="/resources/img/index/heart.png">
		                            </button>
		                        </c:when>
		                        
		                        <c:otherwise>
		                        	<button name="reserveBtn" class="loginBtn" onclick="loginCh()">예약하기
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


<%-- 클래스 활동 --%>

<div class="content-wrap4"
     style="font-family:Gowun Dodum; margin-top:30px; height:100%; width:1200px; margin-bottom:100px; margin:0 auto;">
    <div class="testDiv" style="width: 1200px; margin:0 auto;">
        <!----- 메뉴 부분 ----->
        <div class="menuWrap" style="font-family:Gowun Dodum;">
            <p class="menuTitle" style="margin-top: 20px;">대표 클래스</p>
        </div>
        <div class="food-wrap"
             style="width:1200px; overflow:hidden; height:auto; margin: 0 auto; text-align:center;">
            <c:forEach items="${ menuList}" var="me">
            <input type="hidden" name="marketerId" value="${me.marketerId}">
                <div class="w3-card" id="photoWrap"
                     style="font-family:Gowun Dodum; width:300px; height:300px; margin: 10px 25px;">
                    <img src="/resources/upload/menu/${me.menuImg}" style='width: 100%; height: 250px;'>
                    <div class="w3-container" style="font-family:Gowun Dodum;">
                        <p style="font-weight: bold; font-size: 18px; margin-top:10px;">${me.menuName}</p>
                    </div>
                </div>
            </c:forEach>
        </div>

        <hr style="border: 1px">

        <%-- 상세정보 --%>
        <p class="menuTitle" style="margin-top: 20px;">CONTENT</p>
        <div class="contentWrap2" style="font-family:Gowun Dodum;">
            ${s.classContent}
        </div>

        <hr style="border: 1px">

<!-- QNA 목록 시작 -->
<div class="qna-wrap" id="qna-wrap">
	<div class="qna-title">
	<br>
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
									<c:when test="${qnalist.classQnaStatus == '0'}">
		                              답변대기
		                            </c:when>
									<c:otherwise>
		                              답변완료
		                            </c:otherwise>
								</c:choose>
							</td>
							<td width="55%">
								<c:choose>
									<c:when test="${qnalist.classSecret == 'on' and empty sessionScope.mk}">
										<p class="material-symbols-outlined">
						                    lock
						                </p>
										<span onclick="modalMan(this)" style="cursor:pointer"> 
											비밀글입니다.
										</span>
									</c:when>
									<c:when test="${qnalist.classSecret == 'on' and sessionScope.mk.marketerId ne s.marketerId}">
										<p class="material-symbols-outlined">
						                    lock
						                </p>
										<span onclick="modalMan(this)" style="cursor:pointer"> 
											비밀글입니다. 
										</span>
									</c:when>
									<c:when test="${qnalist.classSecret == 'on' and sessionScope.mk.marketerId eq s.marketerId}">
										<p class="material-symbols-outlined">
						                    lock
						                </p>
										<span onclick="location.href='/class/qnaDetail?classQnaNo=${qnalist.classQnaNo}'" style="cursor:pointer"> 
											비밀글입니다. 
										</span>
									</c:when>
										
									<c:otherwise>
										<a href="/class/qnaDetail?classQnaNo=${qnalist.classQnaNo}"> 
											<c:out value="${qnalist.classQnaContent}" />
										</a>
									</c:otherwise>				
								</c:choose>
							</td>
							<td width="15%">
								<c:out value="${qnalist.userId}" />
							</td>
							<td >
								<fmt:formatDate value="${qnalist.classQnaRegdate}" pattern="yyyy-MM-dd" />
							</td>
						</tr>					
					</tbody>
					</table>
					<!-- 비밀번호 확인 모달 -->
					<div id="id01" class="w3-modal w3-animate-opacity">
					    <div class="w3-modal-content w3-card-4" style="top: 15%; width: 300px;">
					      <header class="w3-container w3-teal" style="background-color: #fff!important;"> 
					        <span onclick="delModal(this);" style="overflow:visible; color:black;"
					        	class="w3-button w3-large w3-display-topright" >X</span>
					        <h5 style="margin-top:13px;">비밀번호 확인</h5>
					      </header>
					      <div class="w3-container" style="margin-top: 15px; height: 120px;">
					        <form action="/class/qnaSecretDetail" method="post" class="pwFrm">
					        	<input type="hidden" name="classNo" value="${qnalist.classNo}">
					        	<input type="hidden" name="classQnaNo" value="${qnalist.classQnaNo}">
						        <input class="w3-input w3-border w3-round-large" type="password" name="classQnaPw" style="width: 250px; margin-left: 10px;"><br>
						        <button class="btn btn-brand" style="margin-left: 10px; color:white; float:right;" onclick="pwChk(this)">확인</button>
					        </form>
					      </div>
					    </div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</section>
</div>

<div align="center">
	<!-- qna 목록 페이지 번호 -->
	<c:forEach begin="1" end="${qnapageNum}" var="qnum">
		<span> 
			<a href="/classDetail?classNo=${param.classNo}&rnum=1&qnum=${qnum}#qna-wrap">
				${qnum} </a>
		</span>
	</c:forEach>
</div>

<!-- QnA 모달 시작 -->
<form name="classqnaForm" id="classqnaForm" method="post" action="/class/qnaInsert">
	<div class="modal fade" id="modal-qna" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title1" id="exampleModalLabel"
						style="font-family: Gowun Dodum;">Q&A</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body mb-3">
					<input type="hidden" name="userId" value="${sessionScope.m.userId}"> 
					<input type="hidden" name="classNo" value="${s.classNo}"> 
					<input type="hidden" name="marketerId" value="${s.marketerId}"> 
					<input type="hidden" name="className" value="${s.className}"> 
					<label
						for="message-text" class="col-form-label">문의할 내용을 작성해주세요.</label>
					<textarea name="classQnaContent" class="chk2 form-control" id="message-text" 
							style="height: 15em; resize: none;" autofocus="autofocus" title="문의할 내용을 작성해주세요."></textarea>
					<br>
					<div>
						<input class="checkbox" type="checkbox" name="classSecret" id="classSecret" style="accent-color: #dc3545;"> 
						<label class="form-check-label">비밀글 </label>
					</div>
					<div style="display:none; float:left;" class="secretPw">
						<input class="chk3 w3-input w3-border w3-round-large" id="classQnaPw" name="classQnaPw" 
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

    </div>
    <jsp:include page="/WEB-INF/views/layouts/footer.jsp"/>
</div>

<!-- 모달 부분 -->
<div class="modal-wrap hidden" id="modal">
    <div class="modal-box">
        <div class="modal-title">예약 정보</div>
        <div class="modal-content">
            <form id="order-form" action="/reserve?userId='mlolw'&classNo=${s.classNo}">
            <input type="hidden" name="marketerId" value="${s.marketerId }">
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

                <input type="hidden" name="userId" value="${m.userId }">
                <input type="hidden" name="classNo" value="${s.classNo}">
                <input type="hidden" name="bookName" value="${s.className}">
                <input type="hidden" name="bookDate" class="bookDate">
                <input type="hidden" name="bookTime" class="bookTime">
                <input type="hidden" name="bookNum" class="bookNum">
                <input type="hidden" name="bookTel" class="bookTel" value="${m.userTel }">
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
            <header class="w3-container" style="height:10%; background-color: #dc3545;">
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
                let closedDay = "${s.closedDay}";

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

                            var maxNum = "${s.maxNum}";
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
                var countNumVal = $(".peopleTd").text();
                var price = "${s.classPrice }";
                
                $(".price").text((countNumVal * price).toLocaleString('ko-KR'));
                let count = 1;
                $("#up").on("click", function (e) {
                    if (count == "${s.maxNum}") {
                    	alert('한번에 최대 ${s.maxNum}명 예약만 가능합니다.');
                        return false;
                    }
                    count++;
                    $(".peopleTd").text(count);
                    var countNumVal = $(".peopleTd").text();
                    const sumPrice = (countNumVal * price).toLocaleString('ko-KR');
                    $(".price").text(sumPrice);
                });

                $("#down").on("click", function (e) {
                    if (count == 1) {
                        return false;
                    }
                    count--;
                    $(".peopleTd").text(count);
                    var countNumVal = $(".peopleTd").text();
                    const sumPrice = (countNumVal * price).toLocaleString('ko-KR');
                    $(".price").text(sumPrice);
                });

                const modal = document.querySelector(".modal-wrap");
                var ownerId = "";
                var memberId = ""
                var selectedDate;



                //예약하기 모달 열기
                $(".reserveBtn2").on("click",function(){

                    var price = count * "${s.classPrice }";
                    let tel = "${sessionScope.m.userTel}";
                    const name = "${sessionScope.m.userName}";
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
                            amount : price,							// 결제 금액
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
                
                var marketer = "${sessionScope.mk}";
                function loginCh() {
                	if(marketer){
                		alert('판매자는 사용 할 수 없습니다. 일반회원으로 로그인해주세요.');
                	}
                	else{
                		alert('비회원은 사용 할 수 없습니다. 로그인해주세요.');
                	}
                 }
                </script>
                
                
                
                
                
                <Script>
                
              //리뷰 & qna 내용 미입력시 alert
                $(document).ready(function() {
                   var formObj2 = $("form[name='classqnaForm']");

                   $(".qnasave").on("click", function() {
                      if (fn_valiChk2()) {
                         return false;
                      }
                      formObj2.attr("action", "/class/qnaInsert");
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
                	if($("[name=classSecret]").prop("checked")){
                       $("[name=classSecret]").attr("value", 'on');
                       if ($(".chk3").val() == "" || $(".chk3").val() == null) {
                    	      alert($(".chk3").attr("title"));
                    	      return true;
                    		}
                   }else{
                       $("[name=classSecret]").attr("value", null);
                   }
                   
                   if ($(".chk2").val() == "" || $(".chk2").val() == null) {
                      alert($(".chk2").attr("title"));
                      return true;
                   }
                }
                
              //qna 모달 > 비밀글 체크 > 비밀번호입력폼

                var marketer = "${sessionScope.mk}";

                $("[name=classSecret]").on("click", function(){
                	if($("[name=classSecret]").prop("checked")){
                    	$(".secretPw").slideDown();
                    }else{
                    	$(".secretPw").slideUp();
                    }
                });
                
              //qna 비밀글 비밀번호 확인
                function modalMan(obj){
                	$(obj).parents(".qna-list").next().css("display", "block");
                }

                //qna 비밀글 비밀번호 확인 모달창 끄기
                function delModal(obj){
                	$("[name=classQnaPw]").val('');
                	$(".w3-animate-opacity").css("display", "none");
                }

                function pwChk(obj){
                	if($("[name=classQnaPw]").eq(obj).val().trim() == ""){
                		alert("비밀번호를 입력해주세요.");
                		$(obj).attr("type", "button");
                	}else{
                		$(this).attr("type", "submit");
                	}
                }

                

                //---------- 주소 * 없애기
                var addr;
                function addrSlice() {
                       addr = $(".addressTd");
                       splitWord = addr.text().split("*");
                          addr.text(splitWord[1] + " " +splitWord[2]);
                }// addrSlice 함수 종료
                addrSlice();
                
                
            </script>
</body>
</html>

