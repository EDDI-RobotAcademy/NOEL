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
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="/resources/js/market/prd_update.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
	<div class="content-wrap1" >
		<jsp:include page="/WEB-INF/views/common/marketerHeader.jsp" />
		<article id="content" class="content">
			<div class="contents">
				<div>
					<div class="card">
						<div class="card-body">
							<div class="directoryDiv">mypage > 상품관리 > 상품수정</div>
							<br>
							<h1 class="card-title">상품 수정</h1>
							<br> <Br>
							<div class="form-group">
								<h4>판매자 상품 정보확인 및 수정</h4>
								<br>
							</div>
							<form role="form" method="post" action="/market/prd_update"
								name="updateForm" id="updateForm" enctype="multipart/form-data">
								<input type="hidden" id="prdno" name="prdNo"
									value="${prdlist.prdNo }"> <br>
								<div class="form-group">
									<label for="cateGory">카테고리를 확인해주세요</label> <br>
									<div class="form-group">
										<select id="cateGory" name="cateGory"
											class="cateGory form-control"
											style="border: 0; border-bottom: 1px solid gainsboro;"
											required oninvalid="this.setCustomValidity('카테고리를 확인해주세요')"
											oninput="this.setCustomValidity('')">
											<option value="${prdlist.cateGory }" hidden=""
												disabled="disabled" selected="selected">${prdlist.cateGory }</option>
											<option value="빵">빵</option>
											<option value="케이크">케이크</option>
											<option value="잼 & 청">잼 & 청</option>
											<option value="비누">비누</option>
											<option value="캔들">캔들</option>
										</select>
									</div>
								</div>
								<br>
								<div class="form-group">
									<label for="prdname">상품명을 확인해주세요</label> <input type="text"
										class="form-control" id="prdname" name="prdName"
										value="${prdlist.prdName }">
								</div>
								<br>
								<div class="form-group">
									<label for="prdprice">상품가격을 확인해주세요</label> <input type="text"
										class="form-control" id="prdprice" name="prdPrice"
										value="${prdlist.prdPrice }">
								</div>
								<br>
								<div class="form-group">
									<label for="prdstock">재고를 확인해주세요</label> <input type="number"
										class="form-control" id="prdstock" name="prdStock"
										value="${prdlist.prdStock }">
								</div>
								<br>
								<div class="form-group">
									<label for="prdnote">알러지 정보를 확인해주세요</label> <input type="text"
										class="form-control" id="prdnote" name="prdNote"
										value="${prdlist.prdNote }">
								</div>
								<br>
								<div class="form-group">
									<label for="textarea">상품 내용을 확인해주세요</label> <br>
									<textarea class="form-control" name="prdContent" id="textarea"
										rows="4" required
										oninvalid="this.setCustomValidity('상품 설명을 입력하세요')"
										oninput="this.setCustomValidity('')" style="margin: 10px 0;">${prdlist.prdContent }</textarea>
								</div>
								<div>
									<input type="file" name="file" class="file-upload" id="file"
										style="display: none;"
										accept="image/gif, image/jpg, image/jpeg, image/png">
									<c:forEach var="prdImgList" items="${prdImgList }">
										<button class="inputPhoto" type="button" id="inputPhoto">${prdImgList.prdImgpath}</button>
										<button type="button" class="imgDelBtn btn btn-brand"
											onclick="deleteImg(this,${prdImgList.prdImgno},'${prdImgList.prdImgpath }');">삭제</button>
									</c:forEach>
								</div>
								<div>
									<input type="file" name="file" class="file-upload" id="file"
										style="display: none;"
										accept="image/gif, image/jpg, image/jpeg, image/png">
									<button class="inputPhoto" type="button" id="inputPhoto">썸네일변경하기</button>
								</div>
								<%-- <div class="form-group">
									<label>대표 이미지를 확인해 주세요</label><br> <span
										class="input-group-append">
										<button class="file-upload-browse btn btn-brand" type="button"
											id="storeImg">사진추가</button>
									</span> <input type="file" name="file" class="file-upload-default"
										id="file" multiple>
									<div class="input-group col-xs-12">
										<c:forEach var="prdImgList" items="${prdImgList }">
											<p>
												<input type="text" class="form-control file-upload-info"
													name="prdImgpath" value="${prdImgList.prdImgpath}"
													readonly="readonly">
												<button type="button" class="imgDelBtn btn btn-brand"
													onclick="deleteImg(this,${prdImgList.prdImgno},'${prdImgList.prdImgpath }');">삭제</button>
											</p>
										</c:forEach>

									</div>
								</div> --%>
								<br> <br>
							</form>
							<div class="submitBtn1">
								<button type="button" onclick="javascript:history.go(-1);"
									class="btn btn-brand">취소</button>
								<button type="button" onclick="return chk_form();"
									class="btn btn-brand">저장</button>
								<a href="/market/prd_delete?prdNo=${prdlist.prdNo}"
									class="btn btn-brand" id="font"
									onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a> <br> <br>
								<br>
							</div>

						</div>
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