<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet" href="/resources/css/class/classDetail.css">
<link rel="stylesheet" href="/resources/css/class/marketerClassMypage.css">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="/resources/img/index/favicon (1).ico" /> 
<title>bonjour noël</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
<div class="content-wrap" style="height:100%">
<jsp:include page="/WEB-INF/views/common/marketerHeader.jsp" />
	<article id="content" class="content">
		<div class="contents">
				<div class="card">
					<div class="card-body">
						<div class="directoryDiv">mypage > 클래스 관리</div>
						<br>
						<h1>클래스 관리</h1>
						<input type="hidden" name="marketerId" value="${sessionScope.mk.marketerId }"> <br> 
						<p class="classList-list-content">
						<a href="/class/classAdd" class="btn btn-brand" id="font1">클래스 등록</a>
						<c:forEach items="${classlist}" var="classlist">
							<c:choose>
                			<c:when test="${classlist != null}">
							<a href="/class/addMenuFrm?classNo=${classlist.classNo}" class="btn btn-brand" id="font">메뉴 등록</a>
							<a href="/class/menuFrm?classNo=${classlist.classNo}" class="btn btn-brand" id="font">메뉴 관리</a>
							<br><br>
							</c:when>
							</c:choose>
							<div>
								<label for="inputName">썸네일</label><br>
								<img id="class_thumNail" src="/resources/upload/class/${classlist.thumNail }" style="height: 500px; width: 500px;">
							</div>
							<br>
		               		<div class="form-group">
		              	  		<label for="inputName">클래스명</label>
						  		<br>
		                  		<input type="text" class="form-control" id="className" name="className" value="${classlist.className }" readonly>
		               		</div>
		               		<br>
		               		<div class="form-group">
		                 		<label for="inputPhone">클래스 가격</label>
		                  		<br>
		                  		<input type="text" class="form-control" id="classPrice" name="classPrice" value="${classlist.classPrice }" readonly>
		               		</div>
		               		<Br>
				            <div class="form-group">
		                  		<label for="inputAddress">클래스 주소</label>
		                  		<br>
		                  		<input type="text" class="form-control" id="classAddr" name="classAddr" value="${classlist.classAddr }" readonly>
		               		</div>
		               		<br>
		               		<div class="form-group">
		                  		<label for="inputContent" >클래스 내용</label>
		                  		<br>
		                  		<div class="content-Wrap2" style="font-family:Gowun Dodum;"> ${classlist.classContent}</div>
	               			</div>
			               <br>
			               <div class="form-group">
		    	              	<label for="inputMaxNum">시간당 최대 인원수</label>
		        	          	<br>
		            	      	<input type="text" class="form-control" id="maxNum" name="maxNum" value="${classlist.maxNum }" readonly="readonly" >
		            	   </div>
		            	   <br>
		            	   <div class="form-group">
		                  		<label for="inputResTime">영업시간</label>
		                  		<br>
		                  		<input type="text" class="form-control" name="classResTime" id="classResTime" value="${classlist.classResTime }" readonly>
		            	   </div>
		            	   <br>
		            	   <div class="form-group">
		                  		<label for="inputTime">휴무일</label>
		                  		<br>
		                  		<input type="text" class="form-control" name="closedDay" id="closedDay" value="${classlist.closedDay }" readonly>
		            	   </div>
		            	   <c:choose>
		            	   <c:when test="${classlist.classNo != null}">
		            	   		<Br>
								<a href="/class/classUpdate?classNo=${classlist.classNo}" class="btn btn-brand" id="font">클래스 수정</a>
								<a href="/class/classDelete?classNo=${classlist.classNo}" 
								onclick="return confirm('정말 삭제하시겠습니까??');" class="btn btn-brand" id="font">클래스 삭제</a>
								<c:choose>
									<c:when test="${classlist.clStatus eq 0 }">
										<div style="text-align: center; height:50px; margin-top:20px;" >
											<b>" ${classlist.className } " 는 중지된 클래스입니다. </b>
										</div>
									</c:when>
								</c:choose>
		            	   </c:when>
		            	   </c:choose>
						</c:forEach>
						</p>
					</div>
				</div>
		</div>
	</article>
</div>
<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
</body>
</html>