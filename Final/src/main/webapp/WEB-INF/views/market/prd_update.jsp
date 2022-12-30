<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>bonjour noël</title>
	<!-- <link rel="stylesheet" href="/resources/css/member/updateMarketer.css"> -->
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<script src="/resources/js/market/prd_update.js"></script>

</head>
<body>
<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
<div class="content-wrap" style="height: 900px;">
	<jsp:include page="/WEB-INF/views/common/marketerHeader.jsp" />
	<article id="content" class="content">
		<div class="contents">
			<div class="col-12 grid-margin stretch-card"
				 style="margin-bottom: 200px;">
				<div class="card">
					<div class="card-body">
						<div class="directoryDiv">mypage > 상품관리 > 상품수정</div>
						<br>
						<h1 class="card-title">판매자 상품 수정</h1>
						<br> <Br>
						<div class="form-group">
							<h4>상품 정보확인 및 수정</h4>
							<br>
						</div>
						<form role="form" method="post" action="/market/prd_update"
							  name="updateForm" id="updateForm" enctype="multipart/form-data">
							<input type="hidden" id="prdno" name="prdNo"
								   value="${prdlist.prdNo }">
							<div class="form-group">
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
							</div>
							<br>
							<div class="form-group">
								<label for="category">카테고리를 확인해주세요</label> <br>
								<div class="form-group">
									<select id="category" name="cateGory"
											class="category form-control"
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
								<label for="prdcontent">상품 상세내용을 설명해주세요</label>
								<textarea class="form-control" id="prdcontent"
										  name="prdContent" rows="5" style="height: 20em; resize: none;">${prdlist.prdContent}</textarea>
							</div>
							<br> <br>
							<div class="form-group">
								<h4>판매자 정보확인 및 수정</h4>
								<br>
							</div>
							<div class="form-group">
								<label for="prdtel">전화번호를 확인해주세요</label> <input type="text"
																				class="form-control" id="prdtel" name="prdTel"
																				value="${prdlist.prdTel }">
							</div><br>
							<div class="form-group">
								<label>주소를 확인해주세요<br></label><br>
								<button type="button"
										onclick="javascript:sample6_execDaumPostcode();"
										class="btn btn-brand">우편번호 찾기</button>
								<input type="hidden" id="marketer_addr1" readonly="readonly">
								<input type="hidden" id="marketer_addr4" readonly="readonly">
								<input type="text" class="form-control" id="marketer_addr2"
									   name="prdAddr1" value="${prdlist.prdAddr1 }"
									   readonly="readonly"
									   onclick="javascript:sample6_execDaumPostcode();"> <input
									type="text" class="form-control" id="marketer_addr3"
									name="prdAddr2" value="${prdlist.prdAddr2 }"
									oninvalid="this.setCustomValidity('주소를 입력하세요')"
									oninput="this.setCustomValidity('')"> <br>
							</div>
							<br>
						</form>
						<div class="submitBtn1">
							<button type="button" onclick="javascript:history.go(-1);"
									class="btn btn-brand">취소</button>
							<button type="button" onclick="return chk_form();"
									class="btn btn-brand">저장</button>
							<a href="/market/prd_delete?prdNo=${prdlist.prdNo}"
							   class="btn btn-brand" id="font"
							   onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
							<br> <br> <br>
						</div>

					</div>
				</div>
			</div>
		</div>
	</article>
</div>
<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
</body>
</html>