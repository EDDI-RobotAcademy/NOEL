<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bonjour noël</title>
<link rel="stylesheet" href="/resources/css/product/prd_add.css">
<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
<script src="/resources/js/index/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="/resources/js/market/prd_add.js"></script>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
	<div class="content-wrap1">
		<jsp:include page="/WEB-INF/views/common/marketerHeader.jsp" />
		<article id="content" class="content">
			<div class="contents">
				<div class="card">
					<div class="card-body">
						<div class="directoryDiv">mypage > 상품관리 > 상품등록</div>
						<br>
						<h1 class="card-title">상품 등록</h1>
						<br> <Br>
						<div class="form-group">
							<h4>판매자 상품 등록</h4>
							<br>
						</div>
						<form method="post" action="/prd_add" name="addForm" id="addForm"
							enctype="multipart/form-data">
							<input type="hidden" name="marketerId"
								value="${sessionScope.mk.marketerId }"> <br>
							<div class="form-group">
								<label for="category">카테고리를 선택해주세요</label> <br>
								<div class="form-group">
									<select id="cateGory" name="cateGory"
										class="cateGory form-control chk" title="카테고리를 선택해주세요"
										style="border: 0; border-bottom: 1px solid gainsboro;"
										required oninvalid="this.setCustomValidity('카테고리를 선택해주세요')"
										oninput="this.setCustomValidity('')">
										<option value="" hidden="" disabled="disabled" id="cateGory"
											selected="selected">상품 종류를 선택해주세요</option>
										<option value="1">빵</option>
										<option value="2">케이크</option>
										<option value="3">잼 & 청</option>
										<option value="4">비누</option>
										<option value="5">캔들</option>
									</select>
								</div>
							</div>
							<br>
							<div class="form-group">
								<label for="prdname">상품명을 입력해주세요</label> <input type="text"
									class="form-control chk" id="prdname" title="상품명을 입력해주세요"
									name="prdName" placeholder="상품명을 입력해주세요." required
									oninvalid="this.setCustomValidity('상품명 입력해주세요')"
									oninput="this.setCustomValidity('')">
							</div>
							<br>
							<div class="form-group">
								<label for="prdprice">상품가격을 입력해주세요</label> <input type="text"
									class="form-control chk" id="prdprice" title="상품가격을 입력해주세요"
									name="prdPrice" placeholder="예) 1,000원 → 1000" required
									oninvalid="this.setCustomValidity('상품가격을 입력해주세요')"
									oninput="this.setCustomValidity('')">
							</div>
							<br>
							<div class="form-group">
								<label for="prdstock">재고를 입력해주세요</label> <input type="number"
									class="form-control chk" id="prdstock" title="재고를 입력해주세요"
									name="prdStock" placeholder="숫자로 입력해주세요." required
									oninvalid="this.setCustomValidity('재고를 입력해주세요')"
									oninput="this.setCustomValidity('')">
							</div>
							<br>
							<div class="form-group">
								<label for="prdnote">알러지 정보를 입력해주세요</label> <input type="text"
									class="form-control chk" id="prdnote" title="알러지 정보를 입력해주세요"
									name="prdNote" placeholder="예) 계란 및 땅콩이 함유되어있습니다." required
									oninvalid="this.setCustomValidity('알러지정보를 입력해주세요')"
									oninput="this.setCustomValidity('')">
							</div>
							<br>
							<div class="form-group">
								<label for="textarea">상품 내용을 입력하세요</label> <br>
								<textarea class="form-control" name="prdContent" id="textarea"
									rows="4" required
									oninvalid="this.setCustomValidity('상품 설명을 입력하세요')"
									oninput="this.setCustomValidity('')" style="margin: 10px 0;"></textarea>
							</div>
							<div>
								<input type="file" name="file" class="file-upload" id="file"
									style="display: none;"
									accept="image/gif, image/jpg, image/jpeg, image/png">
								<button class="inputPhoto" type="button" id="inputPhoto">썸네일 첨부하기</button>
							</div>

							<div class="submitBtn1">
								<button type="button" onclick="javascript:history.go(-1);"
									class="btn btn-brand">취소</button>
								<button type="submit" class="btn btn-brand" id="font">저장</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</article>
	</div>
	<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
<script src="/resources/summernote/summernote-lite.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
<script type="text/javascript">
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

		   $("[name=prdContent]").summernote(
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
		         url : "/prdEditorUpload",
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