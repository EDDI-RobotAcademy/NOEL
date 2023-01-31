<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="./resources/img/index/favicon (1).ico" /> 
<title>bonjour noël</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style>
.inputPhoto {
    width: 100%;
    height: 50px;
    border: 1px dashed gray;
    background-color: transparent;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<link rel="stylesheet" href="/resources/css/class/marketerClassMypage.css">
<div class="content-wrap" style="height: 1700px;">
<jsp:include page="/WEB-INF/views/common/marketerHeader.jsp" />
<article id="content" class="content">
<div class="contents">
<div class="col-12 grid-margin stretch-card" style="margin-bottom: 200px;">
   <div class="card">
      <div class="card-body">
      <div class="directoryDiv">mypage > 클래스 관리 > 클래스 수정</div>
		<br>
		<h1 class="card-title">클래스 수정</h1>
		<br>
		<form role="form" method="post" action="/class/updateClass" name="updateForm" id="updateForm" enctype="multipart/form-data">
		<input type="hidden" id="classNo" name="classNo" value="${classlist.classNo }">
								
			<div class="form-group">
				<label for="className">클래스명</label> 
				<input type="text" class="form-control" id="className" name="className" value="${classlist.className }">
			</div>
			<br>
			<div class="form-group">
		       	<label for="inputPhone">클래스 가격</label>
		        <br>
		        <input type="text" class="form-control" id="classPrice" name="classPrice" value="${classlist.classPrice }" required>
		           <span class="comment" style="font-size: 12px; padding-left: 10px;"></span>
		    </div>
			<br>
			<div class="form-group">
				<label for="textarea">클래스 내용</label> <br>
				<textarea class="form-control" name="classContent" id="textarea" rows="4" required oninvalid="this.setCustomValidity('클래스 내용을 입력하세요')"
				oninput="this.setCustomValidity('')" style="margin: 10px 0;">${classlist.classContent }</textarea>
			</div>
			<div>
				<input type="file" name="file" class="file-upload" id="file" style="display: none;" accept="image/gif, image/jpg, image/jpeg, image/png">
				<c:forEach var="classImgList" items="${classImgList }">
					<button class="inputPhoto" type="button" id="inputPhoto">${classImgList.imgPath}</button>
					<button type="button" class="imgDelBtn btn btn-brand" onclick="deleteImg(this,${classImgList.classNum},'${classImgList.imgPath }');">삭제</button>
				</c:forEach>
			</div>
			<div>
				<input type="file" name="file" class="file-upload" id="file" style="display: none;" accept="image/gif, image/jpg, image/jpeg, image/png">
				<button class="inputPhoto" type="button" id="inputPhoto">썸네일 변경하기</button>
			</div>
			<Br><br>
		    <div class="form-group">
               <label for="inputMaxNum">시간당 최대 인원수</label>
               <br>
               <input type="number" class="form-control" name="maxNum" id="inputMaxNum" placeholder="0" 
               required oninvalid="this.setCustomValidity('인원수를 선택하세요')" oninput="this.setCustomValidity('')">
            </div>
		    <br>
            <div class="form-group">
               <label for="inputResTime">예약 가능한 시간대</label>
               <br>
               <input type="text" class="form-control time" name="classResTime" style="background-color: #fff" id="classResTime" placeholder="시작시간" readonly>
               <input type="text" class="form-control time" name="closedHour" style="background-color: #fff" id="closedHour" placeholder="종료시간" readonly>
            </div>
		    <br>
		    <div class="form-group">
		        <label for="inputTime">휴무일</label>
		        <br><br>
		        <input type="hidden" class="closedDay" value="${classlist.closedDay }">
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
               <label for="inputAddress">클래스 주소</label>
               <br>
               <input type="text" class="form-control" id="inputAddress1" name="zipCode" style="background-color: #fff" 
               onclick="searchPost();" placeholder="동/리/도로명 주소를 검색해 주세요." readonly="readonly">
               <input type="text" class="form-control" id="inputAddress2" style="background-color: #fff"  name="classAddr" readonly="readonly">
               <input type="text" class="form-control" id="detailAddress" name="detailAddress" required 
               oninvalid="this.setCustomValidity('주소를 입력하세요')" oninput="this.setCustomValidity('')">
               <br>
            </div>
		</form>
		<div class="submitBtn1">
			<button type="button" onclick="javascript:history.go(-1);" class="btn btn-brand">취소</button>
			<button type="button" onclick="return chk_form();" class="btn btn-brand">저장</button>
		</div>
		</div>
	</div>
</div>
</div>
</article>
</div>
<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/js/class/classUpdate.js"></script>
<script type="text/javascript" src="/resources/js/class/addClass.js"></script>
<script src="/resources/summernote/summernote-lite.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
<script src="/resources/js/market/prd_update.js"></script>
<script>
(function($) 
		   {
		      'use strict';
		      $(function() 
		      {
		         $('.inputPhoto').on('click', function() 
		         {
		            var file = $(this).parent().find('.file-upload');
		            file.trigger('click');
		         });
		            
		         $('.file-upload').on('change', function() 
		         {
		            if ($(this).val() == '') 
		            {
		               $(this).parent().find('.inputPhoto').text('썸네일 첨부하기');
		            } 
		            else 
		            {
		               $(this).parent().find('.inputPhoto').text($(this).val().replace(/C:\\fakepath\\/i, ''));
		            }
		         });
		      });
		   })(jQuery);

		   $("#submitBtn1").on('click', function(event) 
		   {
		      const fileValue = $('.inputPhoto').text();
		      if (fileValue == '사진 첨부하기') 
		      {
		         event.preventDefault();
		         alert("사진을 첨부해주세요.");
		      }
		   });

		   $("[name=classContent]").summernote(
		   {
		      height : 400,
		      lang : "ko-KR",
		      callbacks : 
		      {
		         onImageUpload : function(files) 
		         {
		            uploadImage(files[0], this);
		         }
		      }
		   });
   function uploadImage(files, editor)
   {
      const form = new FormData();
      form.append("files", files);
      $.ajax(
              {
                 url : "/classEditorUpload",
                 type : "post",
                 data : form,
                 processData : false,
                 contentType : false,
                 success : function(data)
                 {
                    $(editor).summernote("insertImage", data);
                 }
              });
   }
</script>
<script>
$("input[type='checkbox'].btn-check").change(function()
	{
		var a = $("input[type='checkbox'].btn-check");
		if(a.length == a.filter(":checked").length)
		{
			alert('영업일을 하루 이상 선택해 주세요');
			$("input[type='checkbox'].btn-check").prop("checked", false);
		}
	});
</script>
</body>
</html>