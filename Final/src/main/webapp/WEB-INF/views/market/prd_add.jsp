<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>bonjour noël</title>
	<link rel="stylesheet" href="/resources/css/product/prd_add.css">
	<script src="/resources/js/index/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<script src="/resources/js/market/prd_add.js"></script>
	<script
			src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
<div class="content-wrap" style="height: 900px;">
	<jsp:include page="/WEB-INF/views/common/marketerHeader.jsp" />
	<article id="content" class="content">
		<div class="contents">
			<div class="col-12 grid-margin stretch-card">
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
								   value="${sessionScope.mk.marketerId }">
							<div class="form-group">
								<label>대표 이미지를 선택해 주세요</label> <input type="file" name="file"
																	  class="file-upload-default" id="file" multiple>
								<div class="input-group col-xs-12">
									<input type="text" class="form-control file-upload-info"
										   disabled placeholder="대표 이미지를 선택해 주세요."> <span
										class="input-group-append">
                                 <button class="file-upload-browse btn btn-brand"
										 type="button" id="prdImg">사진 추가</button>
                              </span>
								</div>
							</div>
							<br>
							<div class="form-group">
								<label for="category">카테고리를 선택해주세요</label> <br>
								<div class="form-group">
									<select id="category" name="cateGory"
											class="category form-control chk" title="카테고리를 선택해주세요"
											style="border: 0; border-bottom: 1px solid gainsboro;"
											required oninvalid="this.setCustomValidity('카테고리를 선택해주세요')"
											oninput="this.setCustomValidity('')">
										<option value="" hidden="" disabled="disabled"
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
								<label for="prdcontent">상품 상세내용을 설명해주세요</label>
								<textarea class="form-control chk" id="prdcontent"
										  title="상품 상세내용을 입력해주세요" name="prdContent" rows="5"
										  style="height: 20em; resize: none;"
										  oninvalid="this.setCustomValidity('상세설명을 입력하세요')"
										  oninput="this.setCustomValidity('')"></textarea>
							</div>
							<br>
							<br>
							<div class="form-group">
								<h4>판매자 정보입력</h4>
								<br>
							</div>
							<div class="form-group">
								<label for="prdtel">전화번호를 입력해주세요</label> <input type="text"
																				class="form-control chk" id="prdtel" name="prdTel"
																				placeholder="예) 000-0000-0000" required
																				oninvalid="this.setCustomValidity('전화번호를 입력하세요')"
																				oninput="this.setCustomValidity('')"> <span
									class="comment" style="font-size: 12px; padding-left: 10px;"></span>
							</div>
							<div class="form-group">
								<label>주소를 입력해주세요<br></label><br>
								<button type="button"
										onclick="javascript:sample6_execDaumPostcode();"
										class="btn btn-brand">우편번호 찾기</button>
								<input type="hidden" id="marketer_addr1" readonly="readonly">
								<input type="hidden" id="marketer_addr4" readonly="readonly">
								<input type="text" class="form-control chk" id="marketer_addr2"
									   title="주소를 입력해주세요" name="prdAddr1" placeholder="(도로명)"
									   readonly="readonly"> <input type="text"
																   class="form-control chk" id="marketer_addr3"
																   title="상세주소를 입력해주세요" name="prdAddr2"
																   placeholder="상세주소를 입력해주세요." required
																   oninvalid="this.setCustomValidity('주소를 입력하세요')"
																   oninput="this.setCustomValidity('')"> <br>
							</div>
							<br>
							<div class="submitBtn1">
								<button type="button" onclick="javascript:history.go(-1);"
										class="btn btn-brand">취소</button>
								<button type="submit" class="btn btn-brand" id="font">저장</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</article>
</div>
<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
</body>
</html>