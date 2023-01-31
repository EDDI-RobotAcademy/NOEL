<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<link rel="shortcut icon" href="./resources/img/index/favicon (1).ico" /> 
<title>bonjour noël</title>
<link rel="stylesheet" href="/resources/css/loginFrm.css">
</head>
<body>

					<!-- Modal -->
	<div id="login-modal" class="modal fade" tabindex="-1" role="dialog">
   		<div class="modal-dialog">
       		 <div class="modal-content login-wrap login-wrap-img">
        		<div class="modal-header">
        	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="login-input">
            <div>Login</div>
            <div>가입하신 아이디로 로그인 하세요.</div>
            
            <input type="radio" name="selLogin" id="normal" value="1">
            <label for="normal">일반회원</label>
            <input type="radio" name="selLogin" id="owner" value="2">
            <label for="owner">사업자</label>
            <input type="hidden" class="radio" name="radio">
  
            <form action="/login" method="post" id="normalLoginFrm">
                <div class="login">
                    <ul id="login-ul">
                        <li>         
                            <div class="Linput01">
                                <div>
                                    <label class="Llabel" for="memberId">아이디</label>
                                    <input type="text" name="userId" id="memberId">
                                </div>
                            </div>                
                        </li>
                        <li>
                            <div class="Linput01">
                                <label class="Llabel" for="memberPw">비밀번호</label>
                                <input type="password" name="userPw" id="memberPw">
                            </div>
                        </li>
                        <button class="login-btn" type="submit">로그인</button>
                    </ul>
                </div>
            </form>
            
            
            
            <form action="/marketerLogin" method="post" id="ownerLoginFrm">
                <div class="login">
                    <ul id="login-ul">
                        <li>         
                            <div class="Linput01">
                                <div>
                                    <label class="Llabel" for="ownerId">아이디</label>
                                    <input type="text" name="marketerId" id="ownerId">
                                </div>
                            </div>                
                        </li>
                        <li>
                            <div class="Linput01">
                                <label class="Llabel" for="ownerPw">비밀번호</label>
                                <input type="password" name="marketerPw" id="ownerPw">
                            </div>
                        </li>
                        <button class="login-btn" type="submit">로그인</button>
                    </ul>
                </div>
            </form>
        <div class="member-box">
            <a href="javascript:void()" class="e">아이디/비밀번호 찾기 |</a>
            <a href="/sj">회원가입 하기</a>
        </div>
    </div> 
	<form name="searchMemberFrm" action="/searchMemberFrm"></form>
      </div>
    </div>
</div>




    <script>
        const input = $(".Llabel").next();
        input.on("focus",function(){
		    const Llabel = $(this).prev();
		    Llabel.css("display","none");
		});
		input.on("blur",function(){
		    const Llabel = $(this).prev();
		    if($(this).val() == ""){
			    Llabel.css("display","");
		    }
		});
		
        $(".login-btn").on("mouseover",function(){
			$(this).css("background-color","rgb(97, 76, 76)");
			
		});
		$(".login-btn").on("mouseleave",function(){
			$(this).css("background-color","");
			$(".login-btn").css("color","");
		});
		var selLogin = 1;
		
		/*일반, 사업자 로그인 구분*/
		$("#normal").click();
		$("#ownerLoginFrm").css("display","none");
		$("[name=selLogin]").on("click",function(){
			selLogin = $("input[name=selLogin]:checked").val();
			if(selLogin == 1) {
				$("#ownerLoginFrm").css("display","none");
				$("#normalLoginFrm").css("display","block");
			}else if(selLogin == 2){
				$("#normalLoginFrm").css("display","none");
				$("#ownerLoginFrm").css("display","block");
			}
		});
		
		
		//아이디/ 비번찾기
		$(".e").on("click", function(){
			const popup = window.open("","searchMemberFrm","left=600px, top=300px, width=490px, height=350px, menubar=no, status=no, scrollbars=yes");
			$("[name=searchMemberFrm]").attr("target","searchMemberFrm");
			$("[name=searchMemberFrm]").submit();
		});
		
		
		$(".login-btn").on("click",function(e){
			if(selLogin == 1) {
				var userId = $("#userId").val();
				var userPw = $("#userPw").val();
				if(userId == "" || userPw == "") {
					alert("정보를 입력해주세요.");
					e.preventDefault();
				}
				
			}else if(selLogin == 2){
				var ownerId = $("#ownerId").val();
				var ownerPw = $("#ownerPw").val();
				if(ownerId == "" || ownerPw == "") {
					alert("정보를 입력해주세요.");
					e.preventDefault();
				}
			}
		});
		
		
    </script>
</body>
</html>