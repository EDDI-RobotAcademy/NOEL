<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체 등록</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<link rel="stylesheet" href="/resources/css/class/addClass.css">
</head>
<body>
   <jsp:include page="/WEB-INF/views/layouts/header.jsp" />
   <div class="col-12 grid-margin stretch-card" style="margin-bottom: 200px;">
      <div class="card">
         <div class="card-body">
            <br>
            <h1 class="card-title">클래스 등록</h1>
            <br><Br>
            
            <form method="post" action="/class/addClassAc" enctype="multipart/form-data">
               <div class="form-group">
                  <label for="inputMarketerId">판매자 아이디를 입력하세요</label>
                  <br>
                  <input type="text" class="form-control" id="marketerId" name="marketerId" placeholder="판매자 아이디를 입력하세요." 
                  required oninvalid="this.setCustomValidity('판매자 아이디를 입력하세요')" oninput="this.setCustomValidity('')">
               </div>
               <br>
               
               <div class="form-group">
                  <label for="inputClName">클래스명을 입력하세요</label>
                  <br>
                  <input type="text" class="form-control" id="className" name="className" placeholder="클래스명을 입력하세요."
                  required oninvalid="this.setCustomValidity('클래스명을 입력하세요')" oninput="this.setCustomValidity('')">
               </div>
               <br>
               
               <div class="form-group">
                  <label>대표 이미지를 선택하세요</label>
                  <div class="input-group col-xs-12">
                     <span class="input-group-append">
                        <input type="file" name="uploadFile" id="fileItem">
                     </span>
                  </div>
               </div>
               <br>
               
               <div class="form-group">
                  <label for="inputClPrice">클래스 가격을 입력하세요</label>
                  <br>
                  <input type="text" class="form-control" id="classPrice" name="classPrice" placeholder="클래스 가격을 입력하세요."
                  required oninvalid="this.setCustomValidity('클래스 가격을 입력하세요')" oninput="this.setCustomValidity('')">
               </div>
               <br>
               
               <div class="form-group">
                  <label for="inputClassContent">클래스 내용을 입력하세요</label>
                  <br>
                  <input type="text" class="form-control" id="classContent" name="classContent" placeholder="클래스 내용을 입력하세요."
                  required oninvalid="this.setCustomValidity('클래스 내용을 입력하세요')" oninput="this.setCustomValidity('')">
               </div>
               <br>
               <div class="form-group">
                  <label for="inputMaxNum">시간당 최대 인원수를 선택하세요</label>
                  <br>
                  <input type="number" class="form-control" name="maxNum" id="inputMaxNum" placeholder="0"
                  required oninvalid="this.setCustomValidity('인원수를 선택하세요')" oninput="this.setCustomValidity('')">
               </div>


               <br>

               <div class="form-group">
                  <label for="inputTime">예약 가능한 시간대를 입력하세요</label>
                  <br>
                  <input type="text" class="form-control time" name="classResTime" id="classResTime" placeholder="시작시간" readonly>
                  <input type="text" class="form-control time" name="closedHour" id="closedHour" placeholder="종료시간" readonly>
               </div>

               <br>


               <!-- !!!!!!!!!!! -->
               <div class="form-group">
                  <label for="inputClDate">클래스 휴무일을 선택하세요</label>
                  <br>
                  <input type="checkbox" class="btn-check" id="btn-check1" name="closedDay" value="월" autocomplete="off">
                  <label for="btn-check1" class="btn btnday">월</label>
                  <input type="checkbox" class="btn-check" id="btn-check2" name="closedDay" value="화" autocomplete="off">
                  <label for="btn-check2" class="btn btnday">화</label>
                  <input type="checkbox" class="btn-check" id="btn-check3" name="closedDay" value="수" autocomplete="off">
                  <label for="btn-check3" class="btn btnday">수</label>
                  <input type="checkbox" class="btn-check" id="btn-check4" name="closedDay" value="목" autocomplete="off">
                  <label for="btn-check4" class="btn btnday">목</label>
                  <input type="checkbox" class="btn-check" id="btn-check5" name="closedDay" value="금" autocomplete="off">
                  <label for="btn-check5" class="btn btnday">금</label>
                  <input type="checkbox" class="btn-check" id="btn-check6" name="closedDay" value="토" autocomplete="off">
                  <label for="btn-check6" class="btn btnday">토</label>
                  <input type="checkbox" class="btn-check" id="btn-check7" name="closedDay" value="일" autocomplete="off">
                  <label for="btn-check7" class="btn btnday">일</label>
               </div>
               <br>


               
               <div class="form-group">
                  <label for="inputAddress">클래스 주소를 입력하세요</label>
                  <br>
                  <input type="text" class="form-control" id="inputAddress1" name="zipCode" onclick="searchPost();" placeholder="동/리/도로명 주소를 검색해 주세요." readonly="readonly">
                  <input type="text" class="form-control" id="inputAddress2" name="classAddr" readonly="readonly">
                  <input type="text" class="form-control" id="detailAddress" name="detailAddress" required oninvalid="this.setCustomValidity('주소를 입력하세요')" oninput="this.setCustomValidity('')">
                  <br>
               </div>
               
               <div class="submitBtn">
                  <button type="reset" class="cancle">취소</button>
                  <button type="submit" class="btn-primary">저장</button>
               </div>
            </form>
         </div>
      </div>
   </div>
   <script>
   /* 이미지 업로드 */
	$("input[type='file']").on("change", function(e)
	{
		let formData = new FormData();
		let fileInput = $('input[name="uploadFile"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];
		
		if(!fileCheck(fileObj.name, fileObj.size)){
			return false;
		}
		
		formData.append("uploadFile", fileObj);
		
		$.ajax({
			url: '/class/uploadAjaxAction',
	    	processData : false,
	    	contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	dataType : 'json',

	    	error:function(request,status,error)
	    	{
	            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
		});	
	});
   
	/* var, method related with attachFile */
	let regex = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 1048576; //1MB	
	
	function fileCheck(fileName, fileSize){

		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
			  
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		
		return true;		
		
	}
   
	
   </script>
   
   
    <jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="/resources/js/class/addClass.js"></script>
	
	
</body>
</html>