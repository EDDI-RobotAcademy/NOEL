<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <link rel="stylesheet" href="/resources/css/product/myWishList.css">

  <!-- CSS only -->
  <!-- <link
     href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
     rel="stylesheet">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet"
     href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
   -->
  <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
<div class="content-wrap" style="height: 900px;">
  <jsp:include page="/WEB-INF/views/common/marketerHeader.jsp" />
  <article id="content" class="content">
    <div class="contents">
      <div class="wish-form">
        <div class="bookmarkList-wrap">
          <h4>주문관리</h4>
          <div class="category1">
            <a href="#" id="category_class">클래스</a>

            <%--            <a href="/myBookmarkList.do?bookMarkId=${sessionScope.o.ownerId }&reqPage=1" style="color: gold;"> --%>
            <a href="#" id="category_market">마켓</a>
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
                    <%--    <c:forEach items="${list }" var="bm">

                    <c:choose>
                       <c:when test="${not empty sessionScope.m }">
                          <li class="list"><a
                             href="/marketDetail.do?pNo=${bm.PNo }&bookMarkId=${sessionScope.m.memberId}">
                                <div class="bookmark-content">
                                   <div class="img-box">
                                      <img src="/resources/upload/market/${bm.PImg }" alt="">
                                   </div>

                                   <div class="bookmark-man">
                                      <ul>
                                         <li>${bm.PName }</li>
                                         <li>${bm.PPrice }</li>
                                      </ul>
                                   </div>
                                </div>
                          </a>
                             <div class="delBtn">
                                <button type="button" class="btn btn-danger"
                                   onclick="deleteBookmark(this,${bm.bmNo})">삭제</button>
                             </div></li>
                       </c:when>

                       <c:otherwise>
                          <li class="list"><a
                             href="/marketDetail.do?pNo=${bm.PNo }&bookMarkId=${sessionScope.o.ownerId}">
                                <div class="bookmark-content">
                                   <div class="img-box">
                                      <img src="/resources/img/${bm.PImg }" alt="">
                                   </div>

                                   <div class="bookmark-man">
                                      <ul>
                                         <li>${bm.PName }</li>
                                         <li>${bm.PPrice }</li>
                                      </ul>
                                   </div>
                                </div>
                          </a>
                             <div class="delBtn">
                                <button type="button" class="btn btn-danger"
                                   style="width: 80px;"
                                   onclick="deleteBookmark(this,${bm.bmNo})">삭제</button>
                             </div></li>
                       </c:otherwise>
                    </c:choose>

                 </c:forEach> --%>

                </ul>
              </div>
            </c:otherwise>
          </c:choose>

          <div class="warningMark1" style="display: none;">
                     <span class="material-symbols-outlined" style="font-size: 70px;">
                        error </span>
          </div>
          <div class="noMsg1" style="display: none;">아직 찜한 목록이 없습니다.</div>

          <div class="paging">
            <!-- <a href="#"><span class="material-symbols-outlined" style="font-size: 30px;">
       chevron_left
       </span>
   </a>
   <a href="#"><span>1</span></a>
   <a href="#"><span>2</span></a>
   <a href="#"><span>3</span></a>
   <a href="#"><span class="material-symbols-outlined"  style="font-size: 30px;">
       chevron_right
       </span></a>  -->
            <%--                   ${pageNavi }
--%>
          </div>
        </div>
      </div>
    </div>
  </article>
</div>
<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />

<script type="text/javascript">
  function deleteBookmark(obj, bmNo) {
    if (confirm("삭제하시겠습니까?")) {
      $.ajax({
        url : "/deleteBookMarkNo.do",
        type : "post",
        data : {
          bmNo : bmNo
        },
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