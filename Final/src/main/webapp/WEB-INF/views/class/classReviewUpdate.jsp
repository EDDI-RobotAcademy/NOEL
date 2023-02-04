<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="/resources/img/index/favicon (1).ico" /> 
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
<div class="content-wrap" style="height: 1700px;">
<jsp:include page="/WEB-INF/views/common/memberHeader.jsp" />
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
		<div class="inputRating">
			<label for="inputRating">별점</label>
			<br>
			<input type="hidden" class="rating" id="rating" name="rating" value="${classReviewlist.rating }">
			<input type="radio" name="rating1" value="1" class="rating">
			<label for=rate1 style="font-size: 1.5em; color: rgb(255 83 86 / 99%);">♥</label>
			<input type="radio"  name="rating1" value="2" class="rating">
			<label for=rate2 style="font-size: 1.5em; color: rgb(255 83 86 / 99%);">♥♥</label>
			<input type="radio"  name="rating1" value="3" class="rating">
			<label for=rate3 style="font-size: 1.5em; color: rgb(255 83 86 / 99%);">♥♥♥</label>
			<input type="radio" name="rating1"  value="4" class="rating">
			<label for=rate4 style="font-size: 1.5em; color: rgb(255 83 86 / 99%);">♥♥♥♥</label>
			<input type="radio" name="rating1" value="5" class="rating">
			<label for=rate5 style="font-size: 1.5em; color: rgb(255 83 86 / 99%);">♥♥♥♥♥</label>
		</div>
		<br>
		<div class="form-group">
			<label for="textarea">리뷰 내용</label> <br>
			<textarea class="form-control" name="classReviewContent" id="textarea" rows="4" 
					  required oninvalid="this.setCustomValidity('리뷰 내용을 입력하세요')"
					  oninput="this.setCustomValidity('')" style="margin: 10px 0;">${classReviewlist.classReviewContent }
			</textarea>
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
			<button type="button" onclick="return chk_form();" class="btn btn-brand">저장</button>
			<button type="button" onclick="javascript:history.go(-1);" class="btn btn-brand">취소</button>
		</div>
		</div>
	</div>
</div>
</div>
</article>
</div>
<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
<script type="text/javascript" src="/resources/js/class/classUpdate.js"></script>
<script src="/resources/summernote/summernote-lite.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
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

const databaseValue = $("#rating").val();
console.log(" databaseValue  : " , databaseValue);
var radioButtons = document.querySelectorAll('input[type="radio"]');

for (var i = 0; i < radioButtons.length; i++) 
{
	if (radioButtons[i].value === databaseValue) 
	{
 		radioButtons[i].checked = true;
	}
}

$(function(){
	$(".rating").on("click", function(e){		
			$("#rating").val(e.target.value);
	});
})
</script>
</body>
</html>