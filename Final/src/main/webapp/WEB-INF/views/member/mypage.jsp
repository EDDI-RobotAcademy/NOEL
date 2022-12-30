<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/resources/css/member/owner.css">
<link rel="stylesheet" href="/resources/css/member/updateOwner.css">
<body>
<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<div class="content-wrap">
		<jsp:include page="/WEB-INF/views/common/memberHeader.jsp" />
		<article id="content" class="content">
			<div class="contents">
		        <form action="/updateMember" method="post">
		        <input type="hidden" name="userId" value="${sessionScope.m.userId }">
		        <div class="membership-form">
		            <div class="form-write">
		                <h4>회원 정보 수정</h4>
		                    <ul>
		                    	<li>
		                            <span class="tit">이름</span>
		                            <div class="cnt">
		                                <div class="input01">
		                                    <input type="text" id="userName" name="userName" value="${sessionScope.m.userName }" disabled>
		                                </div>
		                            </div>
                       			</li>
                       			<li>
		                            <span class="tit">아이디</span>
		                            <div class="cnt">
		                                <div class="input01" id="input01">
		                                    <input type="text" id="userId" name="userId" value="${sessionScope.m.userId }" disabled>
		                                </div>
		                            </div>
                        		</li>
		                        <li>
		                            <span class="tit">비밀번호</span>
		                            <div class="cnt">
		                                <div class="input01">
		                                    <label class="label" for="userPw">대/소문자와 숫자를 포함한 최소 8자리를 입력해주세요.(특수문자 제외)</label>
		                                    <input type="password" id="userPw" name="userPw" style="outline: none;">
		                                </div>
		                                <p class="text-note"></p>
		                            </div>
		                        </li>
		                        <li>
		                            <span class="tit">비밀번호 확인</span>
		                            <div class="cnt">
		                                <div class="input01">
		                                    <label class="label" for="userPw2">비밀번호를 한 번 더 입력해주세요.</label>
		                                    <input type="password" id="userPw2" name="userPw2" style="outline: none;">
		                                </div>
		                                <p class="text-note"></p>
		                            </div>
		                        </li>
		                        <li>
		                            <span class="tit">휴대폰</span>
		                            <div class="cnt">
		                                <div class="input02">
	                                        <input type="number" id="userTel1" name="userTel1" value="${sessionScope.m.userTel }" disabled>
		                                </div>
		                            </div>
		                        </li>
		                        <li>
		                            <span class="tit">가입일</span>
		                            <div class="cnt">
		                                <div class="input01">
		                                    <input type="text" id="userName" name="userRegdate" value="<fmt:formatDate value="${sessionScope.m.userRegdate }" pattern="yyyy-MM-dd"/>" disabled>
		                                	 
		                                </div>
		                            </div>
                       			</li>
		                    </ul>
		                </div>
		            </div>
		            <div class="joinBtn">
		                <input type="submit" id="updateBtn" value="정보수정">
		            </div>
		        </form>
		    </div>
		</article>
	</div>
	
	
	<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
	
	<script>
		$("input").on("focus",function(){
		    const label = $(this).prev();
		    label.css("display","none");
		});
		$("input").on("blur",function(){
		    const label = $(this).prev();
		    if($(this).val() == ""){
			    label.css("display","");
		    }
		});
		
		/*유효성 검사*/
		$("#updateBtn").on("click", function(){
			//비밀번호 유효성 검사
			const pwReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
			const pw = $("#userPw");
			pwValue = pw.val();
			const pwComment = pw.parent().next();
			if(pwReg.test(pwValue)){
				pwComment.text("");
			}else {
				pwComment.text("* 대/소문자와 숫자를 포함한 최소 8자리를 입력해주세요.(특수문자x)");
				pwComment.css("color","red");
				event.preventDefault();
			}
			// 비밀번호 확인 검사
			const pwVal = pw.val();
			const pwChk = $("#userPw2");
			const pwChkVal = pwChk.val();
			const pwChkComment = pwChk.parent().next();
			if(pwChkVal == pwVal) {
				
			}else {
				pwChkComment.text("* 비밀번호가 일치하지 않습니다.");
				pwChkComment.css("color","red");
				event.preventDefault();
			}
		});
		
		
		$("#updateBtn").on("mouseover",function(){
			$(this).css("background-color","rgb(97, 76, 76)");
			$(this).css("border","1px solid black");
			$(this).css("color","#ffc107");
		})
		$("#updateBtn").on("mouseleave",function(){
			$(this).css("background-color","");
			$(this).css("color","");
		})
	</script>
</body>
</html>
