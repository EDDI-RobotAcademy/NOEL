<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="./resources/img/index/favicon (1).ico" /> 
<title>bonjour noël</title>
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>	

<link rel="stylesheet" href="/resources/css/joinFrm.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
    <div class="header"></div>
    <div class="contents">
        <form name="checkIdFrm" action="/checkId">
			<input type="hidden" name="checkId">
		</form>
        <form action="/join" method="post">
        <div class="membership-form">
            <div class="form-write">
                <h4>회원정보</h4>
                    <ul>
                        <li>
                            <span class="tit">이름</span>
                            <div class="cnt">
                                <div class="Jinput01">
                                    <label class="label" for="userName">한글로 2~5자리 이내로 입력해주세요.</label>
                                    <input type="text" id="userName" name="userName">
                                </div>
                                <p class="text-note"></p>
                            </div>
                        </li>
                        <li>
                            <span class="tit">아이디</span>
                            <div class="cnt">
                                <div class="Jinput01" id="Jinput01">
                                    <label class="label" for="userId">영문 4~20자리 이내로 입력해주세요.</label>
                                    <input type="text" id="userId" name="userId" >
                                </div>
                                <p class="text-note"></p>
                                <button type="button" id="idChkBtn">중복체크</button>
                            </div>
                        </li>
                        <li>
                            <span class="tit">비밀번호</span>
                            <div class="cnt">
                                <div class="Jinput01">
                                    <label class="label" for="userPw">대/소문자와 숫자를 포함한 최소 8자리를 입력해주세요.(특수문자 제외)</label>
                                    <input type="password" id="userPw" name="userPw">
                                </div>
                                <p class="text-note"></p>
                            </div>
                        </li>
                        <li>
                            <span class="tit">비밀번호 확인</span>
                            <div class="cnt">
                                <div class="Jinput01">
                                    <label class="label" for="userPw2">비밀번호를 한 번 더 입력해주세요.</label>
                                    <input type="password" id="userPw2" name="userPw2">
                                </div>
                                <p class="text-note"></p>
                            </div>
                        </li>
                        
                        <li>
                            <span class="tit">생년월일</span>
                            <div class="cnt">
                            	<div>
                                    <div class="box04" style = "margin-left:0px; margin-right: 10px; width: 240px;">
                                        <label class="label" for="birth_year">연도를 입력해주세요(숫자만 4자)</label>
                                        <input type="text" id="birth_year" name="birth_year">
                                       	<input type="hidden" id="userBirth" name="userBirth">
                                    </div>
                                        <div class="selBox01 box01"  >
                                            <select id="birth_month" name="birth_month" >
                                                <option value="">월</option>
                                                <option value="01">1</option>
                                                <option value="02">2</option>
                                                <option value="03">3</option>
                                                <option value="04">4</option>
                                                <option value="05">5</option>
                                                <option value="06">6</option>
                                                <option value="07">7</option>
                                                <option value="08">8</option>
                                                <option value="09">9</option>
                                                <option value="10">10</option>
                                                <option value="11">11</option>
                                                <option value="12">12</option>
                                            </select>
                                    </div>
                                    
                                     <div class="box04" style = "margin-left:10px; margin-right: 0px; width: 230px;">
                                        <label class="label" for="birth_day">일을 입력해주세요(숫자만 2자)</label>
                                        <input type="text" id="birth_day" name="birth_day">
                                         
                                    </div>
                                    
                                    <br>
                                    <p class="text-note"></p>
                            	</div>
                            </div>
                        </li>
                        
                        <li>
                            <span class="tit">휴대폰 인증</span>
                            <div class="cnt">
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
                                        <label class="label" for="memberPhone1">전화번호를 '-' 빼고 입력해주세요.</label>
                                        <input type="text" id="memberPhone1" name="memberPhone1">
                                        <input type="hidden" id="memberPhone" name="userTel">
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
			const userId = $("#userId").val();
			if(userId == ""){
				alert("아이디를 입력하세요");
				return;
			}
			$("[name=checkId]").val(userId);
			const popup = window.open("","checkId","left=600px, top=300px, width=500px, height=200px, menubar=no, status=no, scrollbars=yes");
			//새창에서 form을 전송하기 위한 연결작업
			$("[name=checkIdFrm]").attr("target","checkId");
			$("[name=checkIdFrm]").submit();
			idFlag = 1;
		});
	
		/*휴대폰 인증번호 발송*/
		$(".phoneChkSendBtn").click(function(){
			
			alert("인증번호가 발송되었습니다.");
			var phone1 = $("[name=frontNum]").val();
			var phone2 = $("[name=memberPhone1]").val();
			var phone = phone1+phone2;
			$.ajax({
				type : "POST",
				url : "/memberPhoneCheck",
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
		$("#userName").on("keyup",function(){
			const nameReg = /^[가-힣]{2,5}$/;
			const name = $("#userName");
			nameValue = name.val();
			const nameComment = name.parent().next();
			if(nameReg.test(nameValue)){
				$(".icon1").attr("src","https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/samsung/349/grinning-face-with-big-eyes_1f603.png");
			}else {
				$(".icon1").attr("src","https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/flushed-face_1f633.png");
			}
			
		});
		$("#userId").on("keyup",function(){
			const idReg = /^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/;
			const id = $("#userId");
			idValue = id.val();
			const idComment = id.parent().next();
			if(idReg.test(idValue)){
				$(".icon2").attr("src","https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/samsung/349/grinning-face-with-big-eyes_1f603.png");
			}else {
				$(".icon2").attr("src","https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/325/flushed-face_1f633.png");
			}
		});
		$("#userPw").on("keyup",function(){
			const pwReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
			const pw = $("#userPw");
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
			const name = $("#userName");
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
			const id = $("#userId");
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
			const pw = $("#userPw");
			const pwValue = pw.val();
			const pwComment = pw.parent().next();
			if(pwReg.test(pwValue)){
				pwComment.text("");
			}else {
				pwComment.text("* 대/소문자와 숫자를 포함한 최소 8자리를 입력해주세요.");
				pwComment.css("color","red");
				alert("비밀번호를 입력해주세요.");
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
			
			//핸드폰 확인
			var phone1 = $("[name=frontNum]").val();
			var phone2 = $("[name=memberPhone1]").val();
			var phone = phone1+phone2;
			$("[name=userTel]").val(phone);
			
			var allowChked = $("#allChk").is(":checked");
			if(idFlag == 0 || phoneFlag == 0 || allowChked == false) {
				event.preventDefault();
			}
			if(phoneFlag == 0) {
				alert("인증번호 확인을 눌러주세요.");
				event.preventDefault();
			}
			
			//생년월일 유효성검사
			const birthReg = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
			var birth_year = $("[name=birth_year]").val();
			var birth_month = $("[name=birth_month]").val();
			var birth_day = $("[name=birth_day]").val();
			var birth = birth_year+"-"+birth_month+"-"+birth_day;
			$("[name=userBirth]").val(birth);
			
			 if(!birth_year){
			      alert("연도를 입력해주세요");
			    $("#birth_year").focus();
			    return false;
			  }
			  if(!birth_month){
			      alert("월을 입력해주세요");
			    $("#birth_month").focus();
			    return false;
			  }
			  if(!birth_day){
			      alert("일을 입력해주세요");
			    $("#birth_day").focus();
			    return false;
			  }
			  if(!birthReg.test(birth)){
			      alert("생년월일을 형식에 맞게 입력해주세요.");
			    return false;
			  }
			
			
		});
		
	
		
       
		
		
			
	const Jinput01 = $(".label").next();
	Jinput01.on("focus",function(){
	    const label = $(this).prev();
	    label.css("display","none");
	});
	Jinput01.on("blur",function(){
	    const label = $(this).prev();
	    if($(this).val() == ""){
		    label.css("display","");
	    }
	});
		$(".phoneChkSendBtn").on("mouseover",function(){
			$(this).css("background-color","#d15662");
			$(this).css("border","1px solid black");
			$(this).css("color","rgb(255, 255, 255)");
		})
		$(".phoneChkSendBtn").on("mouseleave",function(){
			$(this).css("background-color","");
			$(this).css("border","");
			$(this).css("color","");
		})
        $(".phoneChkBtn").on("mouseover",function(){
			$(this).css("background-color","#d15662");
			$(this).css("border","1px solid black");
			$(this).css("color","rgb(255, 255, 255)");
		})
		$(".phoneChkBtn").on("mouseleave",function(){
			$(this).css("background-color","");
			$(this).css("border","");
			$(this).css("color","");
		})
		$("#idChkBtn").on("mouseover",function(){
			$(this).css("background-color","#d15662");
			$(this).css("border","1px solid black");
			$(this).css("color","rgb(255, 255, 255)");
		})
		$("#idChkBtn").on("mouseleave",function(){
			$(this).css("background-color","");
			$(this).css("border","");
			$(this).css("color","");
		})
		const joinBtn = $(".joinBtn").children();
		$("#joinBtn").on("mouseover",function(){
			$(this).css("background-color","#d15662");
			$(this).css("border","1px solid black");
			$(this).css("color","rgb(255, 255, 255)");
		})
		$("#joinBtn").on("mouseleave",function(){
			joinBtn.css("background-color","");
			$(this).css("border","");
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

