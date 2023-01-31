<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="./resources/img/index/favicon (1).ico" /> 
<title>bonjour noël</title>
</head>
<body>
<style type="text/css">

	#pageNavi{
		width: 800px;
	    text-align: center;
	    margin: 0 auto;
	    display: flex;
	    justify-content: center;
	    margin-top: 50px;
	    margin-bottom: 50px;
	    }
	    
	#pageNavi>a{
		display: inline-block;
		width: 30px;
		height: 30px;
		text-decoration: none;
		font-size: 20px;
	}

	#pageNavi>a:hover{
	    color: #212529;
	}
	
	#pageNavi>span{
		display: inline-block;
	    width: 30px;
	    line-height:30px;
	    text-decoration: none;
	    font-size: 20px;
	}
	
	.numberDeco{
		background-color: gray;
		color: white;
		border-radius: 100%;
		text-align: center;
		padding:0;
	}
	.list-wrap>.titleShow {
		font-size: 13px;
	}
</style>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="icon" type="image/x-icon" href="favicon.ico">
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/header/style.css">
<link rel="stylesheet" href="/resources/css/member/admin.css">
<link rel="stylesheet" href="/resources/css//member/updateSuperAdmin.css">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<div class="content-wrap" style="height: 900px;">
    <h2>관리자</h2>
    <aside id="aside" class="sidebar">
        <div class="sidebar-1">
            <ul class="category">
                <li>
                    <div><a href="/memberManage.do?reqPage=1" style="color:black;">회원관리</a></div>
                    <div><a href="/adminMemberManage.do?reqPage=1" style="color:black;">업주관리</a></div>
                </li>
            </ul>
        </div>
       
    </aside>
    <article id="content" class="content">
		<div class="contents" style="padding:0;">
            <h4 style="margin: 0;">회원관리</h4>
            <!---------- 검색조건 ---------->
            <div class="searchWrap" style="width:800px; margin-top:10px; margin-bottom: 20px;" align="center">
            	<form action="/searchMember?reqPage=1" method="post">
					<select name="type" style="width:100px; height:32px;">
						<option value="id">아이디</option>
						<option value="name">이름</option>
					</select>
					<input type="text" name="keyword" id="keywordInput" style="height:32px;">
					<input type="submit" value="검색" id="searchBtn" style="background-color: #dc3534; color:white; width:40px; border-radius: 5px; border-color: #dc3534; ">
            	</form>
            </div>
            <!---------- 목록 테이블 --------->	
	            <table class="tablewrap" style="text-align: center; vertical-align: middle;">
	                <tr style="height: 50px; border-bottom: 2px solid black">
	                    <th>이름</th>
	                    <th>아이디</th>
	                    <th>휴대폰번호</th>
	                    <th>가입일</th>
	                    <th>탈퇴</th>
	                  
	                </tr>
	  				<c:forEach items="${list}" var="m">
					<tr style="height: 50px; border-bottom: 1px solid lightgray">
	                    <td>${m.userName}</td>
	                    <td>${m.userId}</td>
	                    <td>${m.userTel}</td>
	                    <td><fmt:formatDate value="${m.userRegdate }" pattern="yyyy-MM-dd"/></td>
	                   <form action="/dropoutMember?userId=${m.userId}" method="post">
	                    <td><button class="saveBtn" type="submit">탈퇴</button></td>
	                    </form>
	                </tr>
	                </c:forEach>
	            </table>
	            <div id="pageNavi">${pageNavi }</div>
        </div>
    </article>
</div>
<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script>		
	
</script>
</body>
</html>