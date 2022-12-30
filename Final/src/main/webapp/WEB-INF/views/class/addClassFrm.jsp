<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체 등록</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style>
.btnWrap {
   text-align: center;
   margin-bottom: 50px;
   
}

.btnWrap>button {
   display: inline-block;
   font-weight: 400;
   text-align: center;
   vertical-align: middle;
   user-select: none;
   border: 1px solid transparent;
   padding: 0.375rem 0.75rem;
   font-size: 0.9375rem;
   line-height: 1;
   border-radius: 0.1875rem;
   transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
      border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
   margin-right: 10px;
   height: 40px;
   width: 100%;
   margin-top: 30px;
   border: 1px solid rgb(51, 51, 51);
   background-color: rgb(51, 51, 51);
   color: #fff;
}

.btnWrap>button[type=submt] {
   border: 1px solid rgb(51, 51, 51);
   background-color: rgb(51, 51, 51);
   color: #fff;
}

.btnWrap>button[type=submit]:hover {
   cursor: pointer;
   background-color: #fff;
   color: rgb(51, 51, 51);
}

.inputPhoto {
   width: 100%;
   height: 50px;
   border: 1px dashed gray;
   background-color: transparent;
}

.inputPhoto:hover {
   cursor: pointer;
   background: rgb(51, 51, 51);
   color: #fff;
}

input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
   {
   -webkit-appearance: none;
   margin: 0;
}
</style>
</head>
<body>
      <jsp:include page="/WEB-INF/views/layouts/header.jsp" />
      <link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
   <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
      <link rel="stylesheet" href="/resources/css/class/addClass.css">
      <link rel="stylesheet" href="/resources/css/member/owner.css">
   
   <div class="col-12 grid-margin stretch-card" style="margin-bottom: 200px;">
      <div class="card">
         <div class="card-body">
            <br>
            <h1 class="card-title">클래스 등록</h1>
            <br><Br>
            <form id="addClass" method="post" action="/class/addClass" enctype="multipart/form-data">
               <div class="form-group">
                  <label for="inputMarketerId">판매자 아이디를 입력하세요</label>
                  <br>
                  <input type="text" class="form-control" id="marketerId" name="marketerId" placeholder="판매자 아이디를 입력하세요." 
                  required oninvalid="this.setCustomValidity('판매자 아이디를 입력하세요')" oninput="this.setCustomValidity('')">
               </div>
               <br>
               
               <div class="form-group">
                  <label for="inputClName">클래스명을 입력하세요</label>
                  <br>
                  <input type="text" class="form-control" id="className" name="className" placeholder="클래스명을 입력하세요."
                  required oninvalid="this.setCustomValidity('클래스명을 입력하세요')" oninput="this.setCustomValidity('')">
               </div>
               <br>

               <div class="form-group">
                  <label for="inputClPrice">클래스 가격을 입력하세요</label>
                  <br>
                  <input type="text" class="form-control" id="classPrice" name="classPrice" placeholder="클래스 가격을 입력하세요."
                  required oninvalid="this.setCustomValidity('클래스 가격을 입력하세요')" oninput="this.setCustomValidity('')">
               </div>
               <br>
               
               <div class="form-group">
                  <label for="textarea">클래스 내용을 입력하세요</label>
                  <br>
                  <textarea class="form-control" name="classContent" id="textarea" rows="4" required oninvalid="this.setCustomValidity('클래스 설명을 입력하세요')" oninput="this.setCustomValidity('')" style="margin: 10px 0;"></textarea>
               </div>
               <div>
               <input type="file" name="file" class="file-upload" id="file" style="display: none;" accept="image/gif, image/jpg, image/jpeg, image/png">
               <button class="inputPhoto" type="button" id="inputPhoto">썸네일 첨부하기</button>
            </div>
               <br>
               <!-- 얘도 테이블에...... -->
               <div class="form-group">
                  <label for="inputMaxNum">시간당 최대 인원수를 선택하세요</label>
                  <br>
                  <input type="number" class="form-control" name="maxNum" id="inputMaxNum" placeholder="0"
                  required oninvalid="this.setCustomValidity('인원수를 선택하세요')" oninput="this.setCustomValidity('')">
               </div>


               <br>
            <!-- cv.setClassResTime(cv.getClassResTime() + "~" + closedHour); -->
               <div class="form-group">
                  <label for="inputResTime">예약 가능한 시간대를 입력하세요</label>
                  <br>
                  <input type="text" class="form-control time" name="classResTime" id="classResTime" placeholder="시작시간" readonly>
                  <input type="text" class="form-control time" name="closedHour" id="closedHour" placeholder="종료시간" readonly>
               </div>

               <br>


               <!-- 예약일 넣을 거고 휴무일 넣을 거면 테이블 closedDay 추가하기 -->
               <div class="form-group">
                  <label for="inputClDate">클래스 휴무일을 선택하세요</label>
                  <br>
                  <input type="checkbox" class="btn-check" id="btn-check1" name="closedDay" value="월" autocomplete="off">
                  <label for="btn-check1" class="btn btnday">월</label>
                  <input type="checkbox" class="btn-check" id="btn-check2" name="closedDay" value="화" autocomplete="off">
                  <label for="btn-check2" class="btn btnday">화</label>
                  <input type="checkbox" class="btn-check" id="btn-check3" name="closedDay" value="수" autocomplete="off">
                  <label for="btn-check3" class="btn btnday">수</label>
                  <input type="checkbox" class="btn-check" id="btn-check4" name="closedDay" value="목" autocomplete="off">
                  <label for="btn-check4" class="btn btnday">목</label>
                  <input type="checkbox" class="btn-check" id="btn-check5" name="closedDay" value="금" autocomplete="off">
                  <label for="btn-check5" class="btn btnday">금</label>
                  <input type="checkbox" class="btn-check" id="btn-check6" name="closedDay" value="토" autocomplete="off">
                  <label for="btn-check6" class="btn btnday">토</label>
                  <input type="checkbox" class="btn-check" id="btn-check7" name="closedDay" value="일" autocomplete="off">
                  <label for="btn-check7" class="btn btnday">일</label>
               </div>
               <br>
               
               <!-- cv.setClassAddr(zipCode + "*" + cv.getClassAddr() + "*" + detailAddress); -->
               <div class="form-group">
                  <label for="inputAddress">클래스 주소를 입력하세요</label>
                  <br>
                  <input type="text" class="form-control" id="inputAddress1" name="zipCode" onclick="searchPost();" placeholder="동/리/도로명 주소를 검색해 주세요." readonly="readonly">
                  <input type="text" class="form-control" id="inputAddress2" name="classAddr" readonly="readonly">
                  <input type="text" class="form-control" id="detailAddress" name="detailAddress" required oninvalid="this.setCustomValidity('주소를 입력하세요')" oninput="this.setCustomValidity('')">
                  <br>
               </div>
                <div class="submitBtn">
                  <button type="submit" class="btn-primary">저장</button>
               </div>
            </form>
         </div>
      </div>
   </div>
   <jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script type="text/javascript" src="/resources/js/class/addClass.js"></script>
   <script src="/resources/summernote/summernote-lite.js"></script>
   <script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
   <script>
   /* 이미지 업로드 */
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

   $("#submitBtn").on('click', function(event) 
   {
      const fileValue = $('.inputPhoto').text();
      if (fileValue == '사진 첨부하기') 
      {
         event.preventDefault();
         alert("사진을 첨부해주세요.");
      }
   });

   $("[name=classContent]").summernote(
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
         url : "/classEditorUpload",
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