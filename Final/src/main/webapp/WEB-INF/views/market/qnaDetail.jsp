<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qnaDetail</title>
<link rel="stylesheet" href="/resources/css/index/owl.theme.default.min.css">
<link rel="stylesheet" href="/resources/css/index/owl.carousel.min.css">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<link rel="stylesheet" href="/resources/css/product/prd_add.css">

<style type="text/css">
   div{
      font-family: 'Gowun Dodum';
   }
   .qna-detail-wrap{
      padding-top:50px;
      padding-left: 110px;
      padding-right: 40px;
      width:1000px;   
      margin:0 auto;
     
      
   }
   
   .qnaDetail_btn{
      float:right;
   }
   
   .qna-reply-wrap{
      padding-top:50px;
      padding-left: 110px;
      padding-right: 40px;
      width:1000px;   
      margin:0 auto;
      
   }


</style>
</head>
<body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="70">

   <jsp:include page="/WEB-INF/views/layouts/header.jsp" />
   
   
   <div class="qna-detail-wrap">
      <form name="qnaupdateForm" role="form" method="post" action="/market/qnaUpdate">
         <input type="hidden" id="prdQnano" name="prdQnano" value="${qnadetail.prdQnano}"/>
         <input type="hidden" id="prdNo" name="prdNo" value="${qnadetail.prdNo}"/>
         <table>
            <tbody>
               <tr>
                  <td>
                     <label>QnA 수정</label>
                  </td>
               </tr>   
               <tr>
                  <td>
                     <textarea name="prdQnacontent" class="form-control" id="message-text"
                       style="height:10em; width:840px; resize:none;" autofocus>${qnadetail.prdQnacontent}</textarea>
                  </td>
               </tr>
            </tbody>
         </table>
         <br>
         <div class="qnaDetail_btn">
            <button type="submit" class="btn btn-brand">수정</button>
            <a href="/market/qnaDelete?prdQnano=${qnadetail.prdQnano}&prdNo=${qnadetail.prdNo}" 
               onclick="return confirm('정말 삭제하시겠습니까??');"><button type="button" class="btn btn-brand">삭제</button></a>
            <button type="button" onclick="javascript:history.go(-1);" class="btn btn-brand">취소</button>         
         </div>
      </form>
   </div>  
    
   
   
<!-- Q&A 댓글 시작 -->   
   <div class="qna-reply-wrap">
      <hr>
      <ul>
         <c:forEach items="${qnareply}" var="qnareply">
            <li>
               <div>
                  <p><b>${qnareply.writer}</b> / <fmt:formatDate value="${qnareply.prdQnarregdate}" pattern="yyyy-MM-dd"/></p>
                  <p>${qnareply.prdQnarcontent}</p>
                  <p>
                     <a href="">수정</a> / <a href="/market/qnareplyDelete?prdQnarno=${qnareply.prdQnarno}" 
                                                   onclick="return confirm('댓글을 삭제하시겠습니까?');">삭제</a>
                  </p>
                  <br>
               </div>
            </li>
         </c:forEach>
      </ul>

      <div>
         <form name="qnaReplyForm" method="post" action="/market/qnareply">
            <hr>
            <p>
               <label>댓글 작성자 : </label> <input type="text" name="writer"></input>
            </p>
            <p>
               <textarea rows="5" cols="50" name="prdQnarcontent" style="height:10em; width:840px; resize:none;" placeholder=" 댓글을 남겨주세요."
                  title="댓글을 입력해주세요" class="chk1 form-control"></textarea>
            </p>
            <p>
               <input type="hidden" name="prdQnano" value="${qnadetail.prdQnano}">
               <button type="submit" class="replysave btn btn-brand">댓글 작성</button>
            </p>
         </form>
      </div>
   </div>
<!-- Q&A 댓글 끝 -->    
   

<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
<script src="/resources/js/index/jquery.min.js"></script>
<script src="/resources/js/index/owl.carousel.min.js"></script>
<script src="/resources/js/index/app.js"></script>
</body>
</html>