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
<link rel="stylesheet" href="/resources/css/class/marketerClassMypage.css">
<link rel="stylesheet" href="/resources/css/class/addMenuFrm.css">
<link rel="stylesheet" href="/resources/css/class/classDetail.css">
<div class="content-wrap">
<jsp:include page="/WEB-INF/views/common/marketerHeader.jsp" />
<article id="content" class="content">
	<div class="contents">
	<div class="col-12 grid-margin stretch-card" style="margin-bottom: 200px;">
   		<div class="card">
      		<div class="card-body">
      		<div class="directoryDiv">mypage > 클래스 관리 > 메뉴 등록</div>
         	<br>
         	<h1>메뉴 관리</h1>

			<form role="form" method="post" action="/class/updateMenu"
				  name="updateForm" id="updateForm" enctype="multipart/form-data">
			<input type="hidden" id="menuNo" name="menuNo" value="${menulist.menuNo }"> <br>
				<div class="form-group">
					<label for="inputMenuName">메뉴 이름</label>
					<br>
					<input type="hidden" id="inputNo" name="menuNo" value="${menulist.menuNo }">
					<input type="text" class="form-control" id="menuName" name="menuName" value="${menulist.menuName }" 
							required oninvalid="this.setCustomValidity('메뉴명을 입력하세요')" oninput="this.setCustomValidity('')">
				</div>
				<br>
				<div>
					<input type="file" name="file" class="file-upload" id="file" style="visibility: hidden; position: absolute;" accept="image/gif, image/jpg, image/jpeg, image/png">
					<button class="inputPhoto" type="button" id="inputPhoto" onclick="updateMenuImg(this)">${menulist.menuImg }</button>
					<input type="hidden" id="menuImg" name="menuImg" value="${menulist.menuImg }">
				</div>
				<br>
				<div>
					<button type="submit" id="font" class="btn btn-brand">완료</button>
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
<script>
function updateMenuImg(obj) 
{
	var file = $(obj).parent().find('.file-upload');
	file.trigger('click');
}
		
$('.file-upload').on('change', function() 
{
	if ($(this).val() == '') 
	{
		$(this).parent().find('.inputPhoto').text('사진을 반드시 올려주세요.');
	} 
	else 
	{
		$(this).parent().find('.inputPhoto').text($(this).val().replace(/C:\\fakepath\\/i, ''));
	}
	const menuImgval = $("#menuImg");
	menuImgval.val($(this).val().replace(/C:\\fakepath\\/i, ''));
});
		
$("#submitBtn").on('click', function(event) 
{
	const fileValue = $('.inputPhoto').text();
	if(fileValue == '사진을 반드시 올려주세요.') 
	{
		event.preventDefault();
		alert("사진을 첨부해주세요.");
	}
});
</script>
</body>
</html>