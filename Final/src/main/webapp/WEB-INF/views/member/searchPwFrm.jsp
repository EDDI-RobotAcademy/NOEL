<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="./resources/img/index/favicon (1).ico" /> 
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="/resources/css/member/searchMember.css">
</head>
<body>
	<div class="searchPw-wrap">
		<div class="searchContent">
			<fieldset>
				<legend>비밀번호  찾기</legend>
					<input type="radio" name="selSearch" id="normal" value="1">
		            <label for="normal">일반회원</label>
		            <input type="radio" name="selSearch" id="owner" value="2">
		            <label for="owner">사업자</label>
					
		            <div class="searchMember">
		            <form action="/searchNormalPw" method="post">
						아이디 : <input type="text" id="userId" name="userId">
						<br><br>
						<label class="label" for="userTel">ex)01012345678 (- 생략)</label>
						전화번호 : <input type="text" id="userTel" class="inputPhone" name="userTel">
		            	<button type="button" class="phoneChkSendBtn1">발송</button>
		            	<br>
		            	 인증번호 : <input type="text" id="certifyNum" name="certifyNum">
                        <button type="button" class="phoneChkBtn1">확인</button>
                        <br>
                        <span id="timeZone"></span>
						<span id="authMsg"></span>
                        <input type="hidden" class="certifyNum2">
		            	<div>
			            	<button type="submit" id="searchMemberBtn">찾기</button>
			            </div>
		            </form>
		            </div>
		            
		            <div class="searchOwner">
		            <form action="/searchMarketerPw" method="post">
		            	아이디 : <input type="text" id="marketerId" name="marketerId">
		            	<br><br>
		            	<label class="label" for="marketerTel">ex)01012345678 (- 생략)</label>
		            	전화번호 : <input type="text" id="marketerTel" class="inputPhone" name="marketerTel">
			            <button type="button" class="phoneChkSendBtn2">발송</button>
			            <br>
			                           인증번호 : <input type="text" id="certifyNum2" name="certifyNum">
                        <button type="button" class="phoneChkBtn2">확인</button>
                        <br>
                        <span id="timeZone2"></span>
						<span id="authMsg2"></span>
                        <input type="hidden" class="certifyNum2">
			            <div>
			            	<button type="submit" id="searchMemberBtn2">찾기</button>
			            </div>
		            </form>
		            </div>
				
			</fieldset>
		</div>
	</div>
	
	<script>
		var phoneFlag = 0;
	
		/*일반, 사업자  구분*/
		$("#normal").click();
		$(".searchOwner").css("display","none");
		$("[name=selSearch]").on("click",function(){
			var selSearch = $("input[name=selSearch]:checked").val();
			if(selSearch == 1) {
				$(".searchOwner").css("display","none");
				$(".searchMember").css("display","block");
			}else if(selSearch == 2){
				$(".searchMember").css("display","none");
				$(".searchOwner").css("display","block");
			}
		});
		
		$(".inputPhone").on("focus",function(){
		    const label = $(this).prev();
		    label.css("display","none");
		});
		$(".inputPhone").on("blur",function(){
		    const label = $(this).prev();
		    if($(this).val() == ""){
			    label.css("display","");
		    }
		});
		$("#searchMemberBtn").on("mouseover",function(){
			$(this).css("background-color","rgb(97, 76, 76)");
			$(this).css("border","1px solid black");
			
		})
		$("#searchMemberBtn").on("mouseleave",function(){
			$(this).css("background-color","");
			$(this).css("color","");
		})
		$("#searchMemberBtn2").on("mouseover",function(){
			$(this).css("background-color","rgb(97, 76, 76)");
			$(this).css("border","1px solid black");
			
		})
		$("#searchMemberBtn2").on("mouseleave",function(){
			$(this).css("background-color","");
			$(this).css("color","");
		})
		$(".phoneChkSendBtn1").on("mouseover",function(){
			$(this).css("background-color","rgb(97, 76, 76)");
			$(this).css("border","1px solid black");
			
		})
		$(".phoneChkSendBtn1").on("mouseleave",function(){
			$(this).css("background-color","");
			$(this).css("color","");
		})
		$(".phoneChkSendBtn2").on("mouseover",function(){
			$(this).css("background-color","rgb(97, 76, 76)");
			$(this).css("border","1px solid black");
			
		})
		$(".phoneChkSendBtn2").on("mouseleave",function(){
			$(this).css("background-color","");
			$(this).css("color","");
		})
		$(".phoneChkBtn").on("mouseover",function(){
			$(this).css("background-color","rgb(97, 76, 76)");
			$(this).css("border","1px solid black");
			
		})
		$(".phoneChkBtn").on("mouseleave",function(){
			$(this).css("background-color","");
			$(this).css("color","");
		})
		//인증번호 발송
		$(".phoneChkSendBtn1").click(function(){
			alert("인증번호가 발송되었습니다.");
			var phone = $("[name=userTel]").val();
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
		$(".phoneChkSendBtn2").click(function(){
			alert("인증번호가 발송되었습니다.");
			var phone = $("[name=marketerTel]").val();
			$.ajax({
				type : "POST",
				url : "/memberPhoneCheck",
				data : {phone : phone},
				success : function(numStr) {
                    $(".certifyNum2").val(numStr);
                    $("#auth").show();
					authTime2();
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
		function authTime2(){
			$("#timeZone2").html("<span id='min2'>3</span> : <span id='sec2'>00</span>");
			intervalId = window.setInterval(function(){
				timeCount2();
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
		function timeCount2(){
			const min = Number($("#min2").text());
			const sec = $("#sec2").text();
			if(sec == "00"){
				if(min == 0){
						PhoneNumStr = null;
						clearInterval(intervalId);
				}else {
						$("#min2").text(min-1);
						$("#sec2").text(59);
				}
			}else {
				const newSec = Number(sec)-1;
				if(newSec<10){
					$("#sec2").text("0"+newSec);
				}else {
					$("#sec2").text(newSec);
				}
			}
		}
		/*휴대폰 인증확인*/
		 $(".phoneChkBtn1").on("click",function(){
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
		 $(".phoneChkBtn2").on("click",function(){
	            const certifyNum = $("#certifyNum2").val();
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
	            	$("#authMsg2").text("인증시간 만료");
					$("#authMsg2").css("color","red");
	            }
	      });
		
		$("#searchMemberBtn").on("click",function(e){
			if(phoneFlag != 1){
				e.preventDefault();
			}else if($("input") == "") {
				alert("정보를 입력해주세요.");
				e.preventDefault();
			}
		});
		$("#searchMemberBtn2").on("click",function(e){
			if(phoneFlag != 1){
				e.preventDefault();
			}else if($("input") == "") {
				alert("정보를 입력해주세요.");
				e.preventDefault();
			}
		});
		
	</script>
</body>
</html>