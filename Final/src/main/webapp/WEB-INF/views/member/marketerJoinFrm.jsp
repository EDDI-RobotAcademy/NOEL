<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!--부트스트랩은 트위터에서 자주 사용하는 각종 레이아웃, 버튼, 입력창 등의 디자인을 css와 JavaScript로 만들어 놓은것이다.
	. Easy to use : HTML 과 CSS 기본 지식을 가진 누구나 쉽게 접근 가능 (+ JavaScript)
	. Resoinsive features : 반응형 CSS 를 포함한 단일코드로 모든 디바이스에 적용 할 수 있음
	. Browser compatibility : 모든 최신 브라우저와 호환
	
		부트스트랩의 CSS와 Java Script, 관련 이미지만 설치하고 미리 지정된 CSS 클래스나
		JavaScript 함수만 불러오면 트위터에서 쓰는 것과 비슷한 디자인이 뚝딱 만들어진다.
  -->
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">

<title>회원 가입</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		//목록 이동
		$(".cancel").on("click", function() {
			
			location.href = "/member/loginFrm";
		})
		$("#submit").on("click", function() {
			
			if($("#userId").val()==""){
				alert("아이디를 입력해 주세요.");
				$("#userId").focus();
				return false;
			}
			if($("#userPass").val()==""){
				alert("비밀번호를 입력해 주세요.");
				$("#userPass").focus();
				return false;
			}
			if ($("#userName").val()=="") {
				alert("성명을 입력해주세요.");
				$("#userName").focus();
				return false;
			}
			if ($("#userTel").val()=="") {
				alert("번호를 입력해주세요.");
				$("#userTel").focus();
				return false;
			}
			if ($("#userBirth").val()=="") {
				alert("생년월일을 입력해주세요.");
				$("#userBirth").focus();
				return false;
			}
		});
	});
</script>
<body>
<section id = "container">
<form action="/marketerJoin.do" method="post">

<div class = "form-group has-feedback">
<label class = "control-label" for = "userId">아이디</label>
<input class = "form-control" type = "text" id = "userId" name = "marketerId"/>
</div> 

<div class = "from-group has-feedback">
<label class = "control-label" for = "userPw">패스워드</label>
<input class = "form-control" type = "password" id = "userPw" name = "marketerPw"/>
</div>

<div class = "from-group has-feedback">
<label class = "control-label" for = "userName">성명</label>
<input class = "form-control" type = "text" id = "userName" name = "marketerName"/>
</div>

<div class = "from-group has-feedback">
<label class = "control-label" for = "userTel">전화번호</label>
<input class = "form-control" type = "text" id = "userTel" name = "marketerTel"/>
</div>

<div class = "from-group has-feedback">
<label class = "control-label" for = "userBirth">이메일</label>
<input class = "form-control" type = "text" id = "userBirth" name = "marketerEmail"/>
</div>


<div class = "from-group has-feedback">
<button class = "btn btn-success" type = "submit" id = "submit">회원가입</button>
<button class = "cancel btn btn-danger" type = "button">목록 이동</button>

</div>
</form>


</section>

</body>
</html>