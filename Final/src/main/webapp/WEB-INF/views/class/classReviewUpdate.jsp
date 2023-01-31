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
      <div class="directoryDiv">mypage > 클래스 리뷰 > 리뷰 수정</div>
		<br>
		<h1 class="card-title">리뷰 수정</h1>
		<br>
		<form role="form" method="post" action="/class/updateClassReview" name="updateForm" id="updateForm" enctype="multipart/form-data">
		<input type="hidden" id="classReviewNo" name="classReviewNo" value="${classReviewlist.classReviewNo }">
		<input type="hidden" id="classNo" name="classNo" value="${classReviewlist.classNo }">
		<input type="hidden" id="userId" name="userId" value="${classReviewlist.userId }">
								
			<div class="form-group">
				<label for="classReviewName">리뷰 이름</label> 
				<input type="text" class="form-control" id="classReviewName" name="classReviewName" value="${classReviewlist.classReviewName }">
			</div>
			<br>
			<div class="form-group">
				<label for="textarea">리뷰 내용</label> <br>
				<textarea class="form-control" name="classReviewContent" id="textarea" rows="4" required oninvalid="this.setCustomValidity('리뷰 내용을 입력하세요')"
				oninput="this.setCustomValidity('')" style="margin: 10px 0;">${classReviewlist.classReviewContent }</textarea>
			</div>
			<div>
				<input type="file" name="file" class="file-upload" id="file" style="display: none;" accept="image/gif, image/jpg, image/jpeg, image/png">
				<c:forEach items="${classReviewImgList }" var="classReviewImgList" >
					<button class="inputPhoto" type="button" id="inputPhoto">${classReviewImgList.imgPath}</button>
					<button type="button" class="imgDelBtn btn btn-brand" onclick="deleteImg(this,${classReviewImgList.classReviewNum},'${classReviewImgList.imgPath}');">삭제</button>
				</c:forEach>
			</div>
			<div>
				<input type="file" name="file" class="file-upload" id="file" style="display: none;" accept="image/gif, image/jpg, image/jpeg, image/png">
				<button class="inputPhoto" type="button" id="inputPhoto">썸네일 변경하기</button>
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

		   $("[name=classReviewContent]").summernote(
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
                 url : "/classReviewEditorUpload",
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
</body>
</html>