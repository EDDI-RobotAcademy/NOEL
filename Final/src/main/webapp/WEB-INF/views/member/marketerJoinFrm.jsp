<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/resources/css/joinFrm.css">
	
</head>
<body>
<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
    <div class="contents">
        <form name="marketerCheckIdFrm" action="/marketerCheckId">
			<input type="hidden" name="marketerCheckId">
		</form>
        <form action="/marketerJoin" method="post">
        <div class="membership-form">
            <div class="form-write">
                <h4>사업자 정보</h4>
                    <ul>
                        <li>
                            <span class="tit">이름</span>
                            <div class="cnt">
                                <div class="Jinput01">
                                    <label class="label" for="marketerName">한글로 2~5자리 이내로 입력해주세요.</label>
                                    <input type="text" id="marketerName" name="marketerName">
                                </div>
                                <p class="text-note"></p>
                            </div>
                        </li>
                        <li>
                            <span class="tit">아이디</span>
                            <div class="cnt">
                                <div class="Jinput01" id="Jinput01">
                                    <label class="label" for="marketerId">영문 4~20자리 이내로 입력해주세요.</label>
                                    <input type="text" id="marketerId" name="marketerId">
                                </div>
                                <p class="text-note"></p>
                                <button type="button" id="idChkBtn">중복체크</button>
                            </div>
                        </li>
                        <li>
                            <span class="tit">비밀번호</span>
                            <div class="cnt">
                                <div class="Jinput01">
                                    <label class="label" for="marketerPw">대/소문자와 숫자를 포함한 최소 8자리를 입력해주세요.(특수문자 제외)</label>
                                    <input type="password" id="marketerPw" name="marketerPw">
                                </div>
                                <p class="text-note"></p>
                            </div>
                        </li>
                        <li>
                            <span class="tit">비밀번호 확인</span>
                            <div class="cnt">
                                <div class="Jinput01">
                                    <label class="label" for="marketerPw2">비밀번호를 한 번 더 입력해주세요.</label>
                                    <input type="password" id="marketerPw2" name="marketerPw2">
                                <p class="text-note"></p>
                                </div>
                            </div>
                        </li>
                        
                        <li>
                            <span class="tit">이메일</span>
                            <div class="cnt">
                            	<div>
                                    <div class="box04" style = "margin-left:0px; margin-right: 10px">
                                        <label class="label" for="email">이메일 아이디를 입력해주세요</label>
                                        <input type="text" id="email" name="email">
                                        <input type="hidden" id="marketerEmail" name="marketerEmail">
                                    </div>
                                        <div class="selBox01 box01" >
                                            <select id="email_domain" >
                                                <option value="naver.com">naver.com</option>
											    <option value="gmail.com">gmail.com</option>
											    <option value="hanmail.net">hanmail.net</option>
											    <option value="hotmail.com">hotmail.com</option>
											    <option value="korea.com">korea.com</option>
											    <option value="nate.com">nate.com</option>
											    <option value="yahoo.com">yahoo.com</option>
											    <option value="daum.com">daum.com</option>
                                            </select>
                                    </div>
                                    <br>
                                    <p class="text-note"></p>
                            	</div>
                            </div>
                        </li>
                        
                        <li >
                            <span class="tit" >휴대폰 인증</span >
                            <div class="cnt" >
                                <div class="input02">
                                    <div class="box01">
                                        <div class="selBox01">
                                            <select id="selectPhone" name="frontNum">
                                                <option value="010">010</option>
                                                <option value="017">017</option>
                                                <option value="011">011</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="box02">
                                        <label class="label" for="marketerTel1">전화번호를 입력해주세요.</label>
                                        <input type="text" id="marketerTel1" name="marketerTel1">
                                        <input type="hidden" id="marketerTel" name="marketerTel">
                                    </div>
                                    <button type="button" class="phoneChkSendBtn">인증번호 발송</button>
                                    <div class="box03">
                                        <label class="label" for="certifyNum">인증번호를 입력해주세요.</label>
                                        <input type="text" id="certifyNum" name="certifyNum">
                                        <input type="hidden" class="certifyNum2">
                                    </div>
                                    <button type="button" class="phoneChkBtn">확인</button>
                                    <span id="timeZone"></span>
									<span id="authMsg"></span>
                                    <p class="text-note"></p>
                                    <!--<p class="text-note"></p>-->
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="agreeChkBox-wrap">
                <div class="agreeChkBox">
                    <div class="chkBox">
                        <div class="chk-box1">
                            <input type="checkbox" id="allChk" name="allChk">
                            <label for="allChk">전체동의</label>
                        </div>
                        <hr>
                        <div class="chk-box2">
                            <div style="display: inline-block;">
                                <input type="checkbox" id="allow1" class="normal" name="allow1">
                                <label for="allow1">[필수] 이용약관 동의</label>
                            </div>
                            <a href="javascript:void()" class="allowContent contentModal1" style="display: inline-block;">[내용보기]</a>
                        </div>
                        <div class="chk-box2">
                            <div style="display: inline-block;">
                                <input type="checkbox" id="allow2" class="normal" name="allow1">
                                <label for="allow2">[필수] 개인 정보 수집 및 이용에 동의</label>
                            </div>
                            <a href="javascript:void()" class="allowContent contentModal2" style="display: inline-block;">[내용보기]</a>
                        </div>
                        <div class="chk-box2">
                            <div style="display: inline-block;">
                                <input type="checkbox" id="allow3" class="normal" name="allow1">
                                <label for="allow3">[필수] 만 14세 이상</label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="joinBtn">
                <input type="submit" id="joinBtn" value="회원가입">
            </div>
        </form>
        <form name="contentModal1" action="/contentModal1"></form>
        <form name="contentModal2" action="/contentModal2"></form>
    </div>
	<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
	<script>
	/*약관 내용*/
		$(".contentModal1").on("click", function(){
			const popup = window.open("","contentModal1","left=500px, top=300px, width=550px, height=600px, menubar=no, status=no, scrollbars=yes");
			$("[name=contentModal1]").attr("target","contentModal1");
			$("[name=contentModal1]").submit();
		});
		$(".contentModal2").on("click", function(){
			const popup = window.open("","contentModal2","left=500px, top=300px, width=550px, height=600px, menubar=no, status=no, scrollbars=yes");
			$("[name=contentModal2]").attr("target","contentModal2");
			$("[name=contentModal2]").submit();
		});
	
	
	
		var idFlag = 0;
		var phoneFlag = 0;
		
		/*아이디 중복체크*/
		$("#idChkBtn").on("click",function(){
			const marketerId = $("#marketerId").val();
			if(marketerId == ""){
				alert("아이디를 입력하세요");
				return;
			}
			$("[name=marketerCheckId]").val(marketerId);
			const popup = window.open("","marketerCheckId","left=700px, top=300px, width=500px, height=200px, menubar=no, status=no, scrollbars=yes");
			//새창에서 form을 전송하기 위한 연결작업
			$("[name=marketerCheckIdFrm]").attr("target","marketerCheckId");
			$("[name=marketerCheckIdFrm]").submit();
			idFlag = 1;
		});
	
		/*휴대폰 인증번호 발송*/
		$(".phoneChkSendBtn").click(function(){
			
			alert("인증번호가 발송되었습니다.");
			var phone1 = $("[name=frontNum]").val();
			var phone2 = $("[name=marketerTel1]").val();
			var phone = phone1+phone2;
			$.ajax({
				type : "POST",
				url : "/marketerPhoneCheck",
				data : {phone : phone},
				success : function(numStr) {
                    $(".certifyNum2").val(numStr);
                    $("#auth").show();
					authTime();
				}
			});
		});
		//인증번호 시간제한 로직
		let PhoneNumStr = $(".certifyNum2").val();
		let intervalId;
		function authTime(){
			$("#timeZone").html("<span id='min'>3</span> : <span id='sec'>00</span>");
			intervalId = window.setInterval(function(){
				timeCount();
			},1000);
		}
		function timeCount(){
			const min = Number($("#min").text());
			const sec = $("#sec").text();
			if(sec == "00"){
				if(min == 0){
						PhoneNumStr = null;
						clearInterval(intervalId);
				}else {
						$("#min").text(min-1);
						$("#sec").text(59);
				}
			}else {
				const newSec = Number(sec)-1;
				if(newSec<10){
					$("#sec").text("0"+newSec);
				}else {
					$("#sec").text(newSec);
				}
			}
		}
			
			/*휴대폰 인증확인*/
			 $(".phoneChkBtn").on("click",function(){
		            const certifyNum = $("#certifyNum").val();
		            const certifyNum2 = $(".certifyNum2").val();
		            if(PhoneNumStr != null) {
			            if(certifyNum == certifyNum2) {
			                alert("인증 확인되었습니다.");
			                clearInterval(intervalId);
			                phoneFlag = 1;
			            }else {
			                alert("인증번호를 다시 확인해주세요.");
			            }
		            }else {
		            	$("#authMsg").text("인증시간 만료");
						$("#authMsg").css("color","red");
		            }
		      });
	 $("#marketerName").on("keyup",function(){
			const nameReg = /^[가-힣]{2,5}$/;
			const name = $("#marketerName");
			nameValue = name.val();
			const nameComment = name.parent().next();
			if(nameReg.test(nameValue)){
				$(".icon1").attr("src","https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/samsung/349/grinning-face-with-big-eyes_1f603.png");
			}else {
				$(".icon1").attr("src","https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/flushed-face_1f633.png");
			}
			
		});
		$("#marketerId").on("keyup",function(){
			const idReg = /^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/;
			const id = $("#marketerId");
			idValue = id.val();
			const idComment = id.parent().next();
			if(idReg.test(idValue)){
				$(".icon2").attr("src","https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/samsung/349/grinning-face-with-big-eyes_1f603.png");
			}else {
				$(".icon2").attr("src","https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/flushed-face_1f633.png");
			}
		});
		$("#marketerPw").on("keyup",function(){
			const pwReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
			const pw = $("#marketerPw");
			const pwValue = pw.val();
			const pwComment = pw.parent().next();
			if(pwReg.test(pwValue)){
				$(".icon3").attr("src","https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/samsung/349/grinning-face-with-big-eyes_1f603.png");
			}else {
				$(".icon3").attr("src","https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/flushed-face_1f633.png");
			}
		});
		
		/*정규표현식 유효성검사*/
		$("#joinBtn").on("click",function(event){
			//이름 유효성 검사
			const nameReg = /^[가-힣]{2,5}$/;
			const name = $("#marketerName");
			nameValue = name.val();
			const nameComment = name.parent().next();
			if(nameReg.test(nameValue)){
				nameComment.text("");
			}else {
				nameComment.text("* 한글로 2~5자리 이내로 입력해주세요.");
				nameComment.css("color","red");
				alert("이름을 입력해주세요.");
				event.preventDefault();
			}
			//아아디 유효성검사
			const idReg = /^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/;
			const id = $("#marketerId");
			idValue = id.val();
			const idComment = id.parent().next();
			if(idReg.test(idValue)){
				idComment.text("");
				
			}else {
				idComment.text("* 4~20자리 이내로 입력해주세요.");
				idComment.css("color","red");
				alert("아이디를 입력해주세요.");
				event.preventDefault();
			}
			//비밀번호 유효성 검사
			const pwReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
			const pw = $("#marketerPw");
			pwValue = pw.val();
			const pwComment = pw.parent().next();
			if(pwReg.test(pwValue)){
				pwComment.text("");
			}else {
				pwComment.text("* 대/소문자와 숫자를 포함한 최소 8자리를 입력해주세요.(특수문자x)");
				pwComment.css("color","red");
				alert("비밀번호를 입력해주세요.");
				event.preventDefault();
			}
			// 비밀번호 확인 검사
			const pwVal = pw.val();
			const pwChk = $("#marketerPw2");
			const pwChkVal = pwChk.val();
			const pwChkComment = pwChk.parent().next();
			if(pwChkVal == pwVal) {
				
			}else {
				pwChkComment.text("* 비밀번호가 일치하지 않습니다.");
				pwChkComment.css("color","red");
				event.preventDefault();
			}
			// 핸드폰
			var phone1 = $("[name=frontNum]").val();
			var phone2 = $("[name=marketerTel1]").val();
			var phone = phone1+phone2;
			$("[name=marketerTel]").val(phone);
			
			var allowChked = $("#allChk").is(":checked");
			if(idFlag == 0 || phoneFlag == 0 || allowChked == false) {
				event.preventDefault();
			}
			if(phoneFlag == 0) {
				alert("인증번호 확인을 눌러주세요.");
				event.preventDefault();
			}
			
			// 이메일 유효성 검사
			var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			  var email =$("#email").val();
			  var email_domain =$("#email_domain").val();
			  var mail = email+"@"+email_domain;
			  $("[name=marketerEmail]").val(mail);  ;
			 
			  if(!marketerEmail){
			      alert("이메일을 입력해주세요");
			    $("#email").focus();
			    return false;
			  }
			  if(!email_domain){
			      alert("도메인을 입력해주세요");
			    $("#email_domain").focus();
			    return false;
			  }
			  
			  
			  if(!email_rule.test(mail)){
			      alert("이메일을 형식에 맞게 입력해주세요.");
			    return false;
			  }
			  
		});
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
		$(".phoneChkSendBtn").on("mouseover",function(){
			$(this).css("background-color","rgb(97, 76, 76)");
			$(this).css("border","1px solid black");
			$(this).css("color","#ffc107");
		})
		$(".phoneChkSendBtn").on("mouseleave",function(){
			$(this).css("background-color","");
			$(this).css("color","");
		})
        $(".phoneChkBtn").on("mouseover",function(){
			$(this).css("background-color","rgb(97, 76, 76)");
			$(this).css("border","1px solid black");
			$(this).css("color","#ffc107");
		})
		$(".phoneChkBtn").on("mouseleave",function(){
			$(this).css("background-color","");
			$(this).css("color","");
		})
		$("#idChkBtn").on("mouseover",function(){
			$(this).css("background-color","rgb(97, 76, 76)");
			$(this).css("border","1px solid black");
			$(this).css("color","#ffc107");
		})
		$("#idChkBtn").on("mouseleave",function(){
			$(this).css("background-color","");
			$(this).css("color","");
		})
		const joinBtn = $(".joinBtn").children();
		$("#joinBtn").on("mouseover",function(){
			$(this).css("background-color","rgb(97, 76, 76)");
			$(this).css("border","1px solid black");
			$(this).css("color","#ffc107");
		})
		$("#joinBtn").on("mouseleave",function(){
			joinBtn.css("background-color","");
			$(this).css("color","");
		})
		
		//체크박스 전체선택
		$("#allChk").on("click",function(){
			var checked = $(this).is(":checked");
			if(checked){
				$(".chkBox").find("input").prop("checked", true);
			}else {
				$(".chkBox").find("input").prop("checked", false);
			}
		});
		//체크박스 개별선택
		$(".chkBox").on("click", ".normal", function(){
			var is_checked = true;
			$(".chkBox .normal").each(function(){
				is_checked = is_checked && $(this).is(":checked");
			});
			$("#allChk").prop("checked", is_checked);
		});
		
		
		
		
	</script>
	<script src="/resources/js/join.js"/>
</body>
</html>