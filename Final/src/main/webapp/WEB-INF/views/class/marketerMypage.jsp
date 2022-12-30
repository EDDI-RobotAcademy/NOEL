<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/member/updateMarketer.css">
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
<div class="content-wrap" style="height: 900px;">
	<jsp:include page="/WEB-INF/views/common/marketerHeader.jsp" />
	<article id="content" class="content">
		<div class="contents">
			<form action="/updateOwner.do" method="post">
				<input type="hidden" name="ownerNo"
					   value="${sessionScope.mk.marketerId }">
				<div class="membership-form">
					<div class="form-write">
						<h4>회원 정보</h4>
						<ul>
							<li><span class="tit">이름</span>
								<div class="cnt">
									<div class="input01">
										<input type="text" id="memberName" name="memberName"
											   value="${sessionScope.mk.marketerName }" disabled>
									</div>
								</div></li>
							<li><span class="tit">아이디</span>
								<div class="cnt">
									<div class="input01" id="input01">
										<input type="text" id="memberId" name="memberId"
											   value="${sessionScope.mk.marketerId}" disabled>
									</div>
								</div></li>
							<li><span class="tit">비밀번호</span>
								<div class="cnt">
									<div class="input01">
										<label class="label" for="ownerPw">대/소문자와 숫자를 포함한 최소
											8자리를 입력해주세요.(특수문자 제외)</label> <input type="password" id="ownerPw"
																				 name="ownerPw" style="outline: none;">
									</div>
									<p class="text-note"></p>
								</div></li>
							<li><span class="tit">비밀번호 확인</span>
								<div class="cnt">
									<div class="input01">
										<label class="label" for="ownerPw2">비밀번호를 한 번 더 입력해
											주세요.</label> <input type="password" id="ownerPw2" name="ownerPw2"
																style="outline: none;">
									</div>
									<p class="text-note"></p>
								</div></li>
							<li><span class="tit">전화번호</span>
								<div class="cnt">
									<div class="input02">
										<input type="text" id="memberPhone1" name="memberPhone1"
											   value="${sessionScope.mk.marketerTel }" disabled>
									</div>
								</div></li>
							<li><span class="tit">가입일</span>
								<div class="cnt">
									<div class="input01">
										<input  type="text" id="ownerEnrollDate" value="<fmt:formatDate value="${sessionScope.mk.marketerRegdate }"    pattern="yyyy-MM-dd" />"
												name="ownerEnrollDate" disabled>

									</div>
								</div></li>
							<li><span class="tit">승인 여부</span>
								<div class="cnt">
									<div class="input01">
										<input type="hidden" id="ownerStatus1" name="ownerStatus1"
											   value="${sessionScope.mk.marketerAuth }" disabled> <input
											type="text" id="ownerStatus" name="ownerStatus" disabled>
									</div>
								</div></li>
						</ul>
					</div>
				</div>
				<div class="joinBtn">
					<input type="submit" id="updateBtn" value="정보 수정">
				</div>
			</form>
		</div>

	</article>
</div>

<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />

<script>
	$("input").on("focus", function() {
		const label = $(this).prev();
		label.css("display", "none");
	});
	$("input").on("blur", function() {
		const label = $(this).prev();
		if ($(this).val() == "") {
			label.css("display", "");
		}
	});

	var selLevel = $("[name=ownerLevel]").children().first();
	var selLevelVal = selLevel.val();
	if (selLevelVal == 1) {
		selLevel.text("매장이용");
	} else if (selLevelVal == 2) {
		selLevel.text("매장 및 마켓 이용");
	}

	/*유효성 검사*/
	$("#updateBtn").on("click", function() {
		//비밀번호 유효성 검사
		const pwReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
		const pw = $("#ownerPw");
		pwValue = pw.val();
		const pwComment = pw.parent().next();
		if (pwReg.test(pwValue)) {
			pwComment.text("");
		} else {
			pwComment.text("* 대/소문자와 숫자를 포함한 최소 8자리를 입력해 주세요.(특수문자x)");
			pwComment.css("color", "red");
			event.preventDefault();
		}
		// 비밀번호 확인 검사
		const pwVal = pw.val();
		const pwChk = $("#ownerPw2");
		const pwChkVal = pwChk.val();
		const pwChkComment = pwChk.parent().next();
		if (pwChkVal == pwVal) {

		} else {
			pwChkComment.text("* 비밀번호가 일치하지 않습니다.");
			pwChkComment.css("color", "red");
			event.preventDefault();
		}
	});

	$("#updateBtn").on("mouseover", function() {
		$(this).css("background-color", "#fff");
		$(this).css("border", "1px solid black");
		$(this).css("color", "#000000");
	})
	$("#updateBtn").on("mouseleave", function() {
		$(this).css("background-color", "");
		$(this).css("color", "");
	})

	//업주 승인여부 텍스트 변환
	const status = $("#ownerStatus1").val();
	const statusText = $("#ownerStatus");
	if (status == 1) {
		statusText.val("승인 대기중");
	} else {
		statusText.val("승인 완료");
	}

	<!--
    function callFunction() {
       var storeInfo = $(".storeInfo").val();
       console.log(storeInfo);
       $.ajax({
          type : "POST",
          url : "/menuFrm.do",
          data : {
             s : storeInfo
          },
          success : function(data) {

          }
       });
    }
    -->
</script>
</body>
</html>