<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewDetail</title>
<link rel="stylesheet" href="/resources/css/index/owl.theme.default.min.css">
<link rel="stylesheet" href="/resources/css/index/owl.carousel.min.css">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<link rel="stylesheet" href="/resources/css/product/prd_add.css">

<style type="text/css">
   div{
      font-family: 'Gowun Dodum';
   }
   .review-detail-wrap{
      padding-top:50px;
      padding-left: 25px;
      padding-right: 10px;
      width:700px;   
      margin:0 auto;
      
   }
   
   .reviewDetail_btn{
      float:right;
   }

</style>
</head>
<body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="70">

   <jsp:include page="/WEB-INF/views/layouts/header.jsp" />
   
   <div class="review-detail-wrap">
      <form name="reviewupdateForm" role="form" method="post" action="/market/reviewUpdate">
         <input type="hidden" id="prdReviewno" name="prdReviewno" value="${reviewdetail.prdReviewno}"/>
         <input type="hidden" id="prdNo" name="prdNo" value="${reviewdetail.prdNo}"/>
         <table>
            <tbody>
               <tr>
                  <td>
                     <label>리뷰 수정</label>
                  </td>
               </tr>   
               <tr>
                  <td>
                     <textarea name="prdReviewcontent" class="form-control" id="message-text"
                              style="height:10em; width:40em; resize:none;" >${reviewdetail.prdReviewcontent}</textarea>
                  </td>
               </tr>
            </tbody>
         </table>
         <br>
         <div class="reviewDetail_btn">
            <button type="submit" class="btn btn-brand">수정</button>
            <a href="/market/reviewDelete?prdReviewno=${reviewdetail.prdReviewno}&prdNo=${reviewdetail.prdNo}" 
               onclick="return confirm('정말 삭제하시겠습니까??');"><button type="button" class="btn btn-brand">삭제</button></a>
            <button type="button" onclick="javascript:history.go(-1);" class="btn btn-brand">취소</button>         
         </div>
      </form>
   </div>   
<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />

   <script src="/resources/js/index/jquery.min.js"></script>
   <script src="/resources/js/index/owl.carousel.min.js"></script>
   <script src="/resources/js/index/app.js"></script>
</body>
</html>