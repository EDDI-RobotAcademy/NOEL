<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="/resources/img/index/favicon (1).ico" />
<title>bonjour noël</title>
<link rel="stylesheet"
	href="/resources/css/index/owl.theme.default.min.css">
<link rel="stylesheet" href="/resources/css/index/owl.carousel.min.css">
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<link rel="stylesheet" href="/resources/css/product/prd_add.css">
<link rel="stylesheet" href="/resources/css/product/qnaDetail.css">
</head>
<body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="70">

	<jsp:include page="/WEB-INF/views/layouts/header.jsp" />

	<div class="qna-detail-wrap">
		<form name="qnaupdateForm" role="form" method="post"
			action="/market/qnaUpdate">
			<input type="hidden" id="prdQnano" name="prdQnano"
				value="${qnadetail.prdQnano}" /> <input type="hidden" id="prdNo"
				name="prdNo" value="${qnadetail.prdNo}" />
			<c:choose>
				<c:when test="${sessionScope.m.userId eq qnadetail.userId}">
					<table>
						<tbody>
							<tr height="40px">
								<td colspan="2" style="text-align: center;">
									<h3>${qnadetail.userId}님의QnA</h3>
									<hr style="height: 2px;">
								</td>
							</tr>
							<tr height="40px">
								<td width="35%" style="text-align: center;">상품명</td>
								<td>${qnadetail.prdName}</td>
							</tr>
							<tr height="40px">
								<td width="35%" style="text-align: center;">작성일</td>
								<td><fmt:formatDate value="${qnadetail.prdQnaregdate}"
										pattern="yyyy-MM-dd" /></td>
							</tr>
							<tr height="80px">
								<td style="text-align: center;">내용</td>
								<td><textarea name="prdQnacontent" class="form-control"
										id="message-text"
										style="height: 10em; width: 500px; resize: none;"
										autofocus="autofocus">${qnadetail.prdQnacontent}</textarea></td>
							</tr>
						</tbody>
					</table>
					<br>
					<div class="qnaDetail_btn">
						<button type="submit" class="btn btn-brand">수정</button>
						<a
							href="/market/qnaDelete?prdQnano=${qnadetail.prdQnano}&prdNo=${qnadetail.prdNo}"
							onclick="return confirm('정말 삭제하시겠습니까??');"><button
								type="button" class="btn btn-brand">삭제</button></a>
						<button type="button" onclick="javascript:history.go(-1);"
							class="btn btn-brand">취소</button><br>
					</div>

					<hr>
					<ul style="padding-left: 1rem;">
						<c:forEach items="${qnareply}" var="qnareply">
							<li><c:choose>
									<c:when test="${not empty sessionScope.m.userId && not empty qnareply.pqnaReplywriter}">
										<div>
											<br>
											<p>
												<b>[판매자]${qnareply.pqnaReplywriter}</b> &nbsp;&nbsp;&nbsp;
												<fmt:formatDate value="${qnareply.pqnaReplydate}"
													pattern="yyyy-MM-dd" />
											<p>${qnareply.pqnaReply}</p>
											</p>
											<br>
											<hr>
										</div>
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose></li>
						</c:forEach>
					</ul>
				</c:when>
				<c:otherwise>
					<table>
						<tbody>
							<tr height="40px">
								<td colspan="2" style="text-align: center;">
									<h3>${qnadetail.userId2}님의QnA</h3>
									<hr>
								</td>
							</tr>
							<tr height="40px">
								<td width="35%" style="text-align: center;">상품명</td>
								<td>${qnadetail.prdName}</td>
							</tr>
							<tr height="40px">
								<td width="35%" style="text-align: center;">작성일</td>
								<td><fmt:formatDate value="${qnadetail.prdQnaregdate}"
										pattern="yyyy-MM-dd" /></td>
							</tr>
							<tr height="80px">
								<td style="text-align: center;">내용</td>
								<td><textarea name="prdQnacontent" class="form-control"
										id="message-text"
										style="height: 10em; width: 500px; resize: none;"
										readonly="readonly">${qnadetail.prdQnacontent}</textarea></td>
							</tr>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</form>

		<c:if
			test="${sessionScope.mk.marketerId eq qnadetail.marketerId && qnadetail.prdQnastatus == 0 }">
			<div class="qna-reply-btn-wrap">
				<div class="reply-btn">
					<button type="button" class="replyBtn" onclick="openAnswer()">판매자답변</button>
					<button type="button" class="replyBtn" id="qnaList"
						onclick="javascript:history.go(-1);">취소</button>
				</div>
			</div>
		</c:if>
	</div>


	<!-- Q&A 답변 시작 -->
	<div class="qna-reply-wrap" style="display: none;">
		<hr>
		<ul style="padding-left: 1rem;">
			<c:forEach items="${qnareply}" var="qnareply">
				<li><c:choose>
						<c:when test="${qnareply.pqnaReplywriter ne null}">
							<div>
								<br>
								<p>
									<b>[판매자]${qnareply.pqnaReplywriter}</b> /
									<fmt:formatDate value="${qnareply.pqnaReplydate}"
										pattern="yyyy-MM-dd" />
								<p>${qnareply.pqnaReply}</p>
								</p>
								<c:choose>
									<c:when
										test="${sessionScope.m.userId eq qnareply.pqnaReplywriter or sessionScope.mk.marketerId eq qnareply.pqnaReplywriter}">
										<p>
											<a
												href="/market/qnareplyDelete?prdQnano=${qnareply.prdQnano}"
												onclick="return confirm('댓글을 삭제하시겠습니까?');">삭제</a>
										</p>
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>
								<br>
							</div>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose></li>
			</c:forEach>
		</ul>
		<div>
			<c:choose>
				<c:when
					test="${sessionScope.m.userId eq qnadetail.userId or sessionScope.mk.marketerId eq qnadetail.marketerId}">
					<form name="qnaReplyForm" method="post" action="/market/qnareply">
						<table>
							<tbody>
								<tr height="40px">
									<td colspan="2" style="text-align: center;">
										<h5>답변작성</h5>
										<hr>
									</td>
								</tr>
								<tr height="40px">
									<td width="35%" style="text-align: center;">작성자</td>
									<c:choose>
										<c:when test="${not empty sessionScope.m.userId}">
											<td>&nbsp; <input type="text" name="pqnaReplywriter"
												value="${sessionScope.m.userId}" style="border: none;"
												readonly="readonly" /></td>
										</c:when>
										<c:otherwise>
											<td>&nbsp; <input type="text" name="pqnaReplywriter"
												value="${sessionScope.mk.marketerId}" style="border: none;"
												readonly="readonly" /></td>
										</c:otherwise>
									</c:choose>
								</tr>
								<tr height="80px">
									<td style="text-align: center;">내용</td>
									<td><textarea rows="5" cols="50" name="pqnaReply"
											style="height: 10em; width: 500px; resize: none;"
											placeholder="댓글을 남겨주세요." title="댓글을 남겨주세요."
											class="chk1 form-control"></textarea></td>
								</tr>
								<tr height="80px">
									<td colspan="2" style="text-align: right;"><input
										type="hidden" name="prdQnano" value="${qnadetail.prdQnano}">
										<input type="hidden" name="marketerId"
										value="${qnadetail.marketerId}">
										<button type="submit" class="replysave btn btn-brand">등록</button>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<!-- Q&A 댓글 끝 -->


	<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
	<script src="/resources/js/index/jquery.min.js"></script>
	<script src="/resources/js/index/owl.carousel.min.js"></script>
	<script src="/resources/js/index/app.js"></script>

	<script type="text/javascript">
		function openAnswer() {
			$(".qna-reply-wrap").show();
		}
	</script>
</body>
</html>