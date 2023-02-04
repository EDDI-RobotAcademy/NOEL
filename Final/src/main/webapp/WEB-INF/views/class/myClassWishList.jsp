<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="./resources/img/index/favicon (1).ico" />
<title>bonjour noël</title>
<link rel="stylesheet" href="/resources/css/product/myWishList.css">
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
	<div class="content-wrap" style="height: 1030px;">
		<jsp:include page="/WEB-INF/views/common/memberHeader.jsp" />
		<article id="content" class="content">
			<div class="contents">
				<div class="wish-form">
					<div class="bookmarkList-wrap">
						<div class="category1">
							<a href="/myClassWishList?reqPage=1&bookmarkId=${sessionScope.m.userId}" 
								id="category_class">Class</a>
							 <a href="/myPrdWishList?reqPage=1&bookmarkId=${sessionScope.m.userId}"
								id="category_market">Market</a>
						</div>

						<c:choose>
							<c:when test="${empty list }">
								<div class="warningMark">
									<span class="material-symbols-outlined"
										style="font-size: 30px;"> error </span>
								</div>
								<div class="noMsg">${msg }</div>
							</c:when>

							<c:otherwise>
								<div class="bookmark-content-list">
									<ul>
										<c:forEach items="${list }" var="class">

											<c:choose>
												<c:when test="${not empty sessionScope.m }">
													<li class="list">
													<a href="/classDetail?classNo=${class.classNo }&userId=${m.userId}">
															<div class="bookmark-content">
																<div class="img-box">
																	<img src="resources/upload/class/${class.thumbNail }"
																		alt="">
																</div>

																<div class="bookmark-man">
																	<ul>
																		<li><b>${class.className }</b></li>
																		<li>${class.classPrice }</li>
																	</ul>
																</div>
															</div>
													</a>
														<div class="delBtn">
															<button type="button" class="delButton"
																style="border: none; background: none;"
																onclick="deleteBookmark(this,${class.classNo})">
																<b>삭제</b>
															</button>
														</div></li>
												</c:when>

												<c:otherwise>
													<li class="list"><a
														href="/marketDetail.do?pNo=${class.classNo }&bookMarkId=${sessionScope.o.ownerId}">
															<div class="bookmark-content">

																<div class="bookmark-man">
																	<ul>
																		<li>${class.className }</li>
																		<li>${class.classPrice }</li>
																	</ul>
																</div>
															</div>
													</a>
														<div class="delBtn">
															<button type="button" class="btn btn-danger"
																style="width: 80px;"
																onclick="deleteBookmark(this,${class.classNo})">삭제</button>
														</div>
												</c:otherwise>
											</c:choose>

										</c:forEach>

									</ul>
								</div>
							</c:otherwise>
						</c:choose>

						<div class="warningMark1" style="display: none;">
							<span class="material-symbols-outlined" style="font-size: 70px;">
								error </span>
						</div>
						<div class="noMsg1" style="display: none;">아직 찜한 목록이 없습니다.</div>

						<div class="page">${pageNavi }</div>
					</div>
				</div>
			</div>
		</article>
	</div>
	<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />

	<script type="text/javascript">
    function deleteBookmark(obj, classNo) {
        if (confirm("삭제하시겠습니까?")) {
            $.ajax({
                url : "/deleteClassWishList",
                type : "post",
                data : { classNo : classNo },
                success : function(data) {
                    console.log(data);
                    $(obj).parent().parent().remove();
                    console.log($(".list").length);
                    if ($(".list").length == 0) {
                        $(".bookmark-content-list").hide();
                        $(".warningMark1").css("display", "block");
                        $(".noMsg1").css("display", "block");
                        $(".noMsg1").show();
                        console.log($(".noMsg1").text());
                        $(".paging").hide();
                    }
                }
            })
        } else {
            console.log($(obj).text());
        }
    }
</script>
</body>
</html>