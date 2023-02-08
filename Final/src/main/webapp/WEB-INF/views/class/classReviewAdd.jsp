<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="/resources/img/index/favicon (1).ico" /> 
<title>bonjour noël</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
<link rel="stylesheet" href="/resources/css/class/classReviewAdd.css">
<link rel="stylesheet" href="/resources/css/class/marketerClassMypage.css">

<div class="content-wrap" style="height: auto;">
<jsp:include page="/WEB-INF/views/common/memberHeader.jsp" />
<article id="content" class="content">
<div class="contents">
<div class="col-12 grid-margin stretch-card">
	<div class="card">
		<div class="card-body">
		<div class="directoryDiv">mypage > 예약 내역 > 리뷰 등록</div>
		<br>
		<h1 class="card-title">클래스 리뷰 등록</h1>
		<br>
		<form id="addClassReview" name="reviewForm" method="post" action="/class/addClassReview" enctype="multipart/form-data">
		<input type="hidden" name="userId" name="userId" value="${sessionScope.m.userId }">
		<input type="hidden" id="classNo" name="classNo" value="${classNo}"/>
		<input type="hidden" id="className" name="className" value="${className}"/>
		<input type="hidden" id="bookNo" class="bookNo" name="bookNo" value="${bookNo }">
         
		<div class="form-group">
			<label for="inputReviewName">제목</label>
			<br>
			<input type="text" class="form-control" id="classReviewName" name="classReviewName" placeholder="리뷰 제목을 입력하세요."
                      required oninvalid="this.setCustomValidity('리뷰 제목을 입력하세요')" oninput="this.setCustomValidity('')">
		</div>
		<br>
		<div class="inputRating">
			<label for="inputRating">별점</label>
			<br>
			<input type=radio name=rating value=1 class=rating>
			<label for=rate1 style="font-size: 1.5em; color: rgb(255 83 86 / 99%); ">♥</label>
			<input type=radio name=rating value=2 class=rating >
			<label for=rate2 style="font-size: 1.5em; color: rgb(255 83 86 / 99%);">♥♥</label>
			<input type=radio name=rating value=3 class=rating>
			<label for=rate3 style="font-size: 1.5em; color: rgb(255 83 86 / 99%);">♥♥♥</label>
			<input type=radio name=rating value=4 class=rating>
			<label for=rate4 style="font-size: 1.5em; color: rgb(255 83 86 / 99%);">♥♥♥♥</label>
			<input type=radio name=rating value=5 class=rating checked>
			<label for=rate5 style="font-size: 1.5em; color: rgb(255 83 86 / 99%);">♥♥♥♥♥</label>

		</div>
		<br>
		<div class="form-group">
			<label for="summernote">클래스 내용을 입력하세요</label>
			<br>
			<textarea class="form-control" name="classReviewContent" id="summernote" rows="4" 
					  required oninvalid="this.setCustomValidity('클래스 설명을 입력하세요')" oninput="this.setCustomValidity('')" style="margin: 10px 0;">
			</textarea>
		</div>
		<div>
			<input type="file" name="file" class="file-upload" id="file" style="display: none;" accept="image/gif, image/jpg, image/jpeg, image/png">
			<button class="inputPhoto" type="button" id="inputPhoto">썸네일 첨부하기</button>
		</div>
		<br>
		<div>
			<button type="button" class="saveBtn" id="font">저장</button>
			<button type="button" onclick="javascript:history.go(-1);" class="btn btn-brand">취소</button>
		</div>
		</form>
      </div>
   </div>
</div>
</div>
</article>
</div>
<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
<script src="/resources/summernote/summernote-lite.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
<script>
$(".saveBtn").on("click", function() {
	const classReviewName =$("#classReviewName").val();
	if(!classReviewName){
		$("#classReviewName").focus();
		alert("title input");
		return;
	}
    if (confirm("리뷰를 등록하시겠습니까?")) {
        const bookNo = $("#bookNo").val();
        console.log(bookNo);
        //$(location).attr('href', "/addReserveReview?bookNo=" + bookNo);
        
        getReviewState(bookNo);
    }
});


function getReviewState(bookNo){
	
	$.ajax({
		url:"/addReserveReview",
		type:"get",
		data:{bookNo},
		success:function(res){
			console.log(" res : " , res);
			if(parseInt(res)===0){
				//alert(" 등록 .");
				$("#addClassReview").submit();
				
			}else{
				alert("이미 등록 되었습니다.");
			}
		},
		error:function(err){
			console.log(" err : ", err);
		}
		
	})
	
}

/* 이미지 업로드 */
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

$("#submitBtn").on('click', function(event)
{
	const fileValue = $('.inputPhoto').text();
	if (fileValue == '사진 첨부하기')
	{
         event.preventDefault();
         alert("사진을 첨부해주세요.");
	}
});

$('#summernote').summernote(
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