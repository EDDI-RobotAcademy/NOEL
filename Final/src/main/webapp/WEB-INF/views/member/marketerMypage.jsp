<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
    
<body>
	<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
	<link rel="stylesheet" href="/resources/css/header/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/css/header/style.css">
	<link rel="stylesheet" href="/resources/css/member/marketer.css">
	<link rel="stylesheet" href="/resources/css/member/updateMarketer.css">
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<div class="content-wrap" style="height: 900px;">
		<jsp:include page="/WEB-INF/views/common/marketerHeader.jsp" />
		<article id="content" class="content">
			<div class="contents">
				<form action="/updateMarketer" method="post">
					<input type="hidden" name="marketerId" value="${sessionScope.mk.marketerId }">
					<div class="membership-form">
						<div class="form-write">
							<h4>회원 정보</h4>
							<ul>
								<li>
									<span class="tit">이름</span>
									<div class="cnt">
										<div class="input01">
											<input type="text" id="marketerName" name="marketerName" value="${sessionScope.mk.marketerName }" disabled>
										</div>
									</div>
								</li>
								<li>
									<span class="tit">아이디</span>
									<div class="cnt">
										<div class="input01" id="input01">
											<input type="text" id="marketerId" name="marketerId" value="${sessionScope.mk.marketerId }" disabled>
										</div>
									</div>
								</li>
								<li>
									<span class="tit">비밀번호</span>
									<div class="cnt">
										<div class="input01">
											<label class="label" for="marketerPw">대/소문자와 숫자를 포함한 최소 8자리를 입력해주세요.(특수문자 제외)</label>
											<input type="password" id="marketerPw" name="marketerPw" style="outline: none;">
										</div>
										<p class="text-note"></p>
									</div>
								</li>
								<li>
									<span class="tit">비밀번호 확인</span>
									<div class="cnt">
										<div class="input01">
											<label class="label" for="marketerPw2">비밀번호를 한 번 더 입력해 주세요.</label>
											<input type="password" id="marketerPw2" name="marketerPw2" style="outline: none;">
										</div>
										<p class="text-note"></p>
									</div>
								</li>
								<li>
									<span class="tit">이메일</span>
									<div class="cnt">
										<div class="input02">
											<input type="text" id="marketerEmail" name="marketerEmail" value="${sessionScope.mk.marketerEmail }" disabled>
										</div>
									</div>
								</li>
								<li>
								<li>
									<span class="tit">전화번호</span>
									<div class="cnt">
										<div class="input02">
											<input type="text" id="marketerTel1" name="marketerTel1" value="${sessionScope.mk.marketerTel }" disabled>
										</div>
									</div>
								</li>
								<li>
									<span class="tit">가입일</span>
									<div class="cnt">
										<div class="input01">
											<input type="text" id="marketerRegdate" name="marketerRegdate" value="<fmt:formatDate value="${sessionScope.mk.marketerRegdate }" pattern="yyyy-MM-dd"/>" disabled>
										</div>
									</div>
								</li>
								<li>
									<span class="tit">승인 여부</span>
									<div class="cnt">
										<div class="input01">
											<input type="hidden" id="marketerAuth0" name="marketerAuth0" value="${sessionScope.mk.marketerAuth }" disabled>
											<input type="text" id="marketerAuth" name="marketerAuth" disabled>
										</div>
									</div>
								</li>
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

		/*유효성 검사*/
		$("#updateBtn").on("click", function() {
			//비밀번호 유효성 검사
			const pwReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
			const pw = $("#marketerPw");
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
			const pwChk = $("#marketerPw2");
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
		const status = $("#marketerAuth0").val();
		const statusText = $("#marketerAuth");
		if(status == 0) {
			statusText.val("승인 대기중");
		}else {
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