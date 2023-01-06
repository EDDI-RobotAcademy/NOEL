<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ihvkorsg7y"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<style>
/* CSS */
.grid-image 
{
	position: relative;
    display:flex;
    flex-wrap:wrap;
    align-items:center;
    margin:80px 0;
}
.grid-image img 
{
	position: relative;
    width:calc(33.333% - 10px);
    height:500px;
    filter: brightness(50%);
}
.image_text1
{
	z-index:1;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate( -50%, -50% );
    color: white;
    font-family: 'Gowun Dodum', sans-serif;
 }
 .image_text2
{
	z-index:1;
    position: absolute;
    top: 50%;
    left: 15%;
    transform: translate( -50%, -50% );
    color: white;
    font-family: 'Gowun Dodum', sans-serif;
 }
.image_text3
{
	z-index:1;
    position: absolute;
    top: 50%;
    left: 82%;
    transform: translate( -50%, -50% );
    color: white;
    font-family: 'Gowun Dodum', sans-serif;
 }

.grid-image img:nth-of-type(3n),
.grid-image img:last-child {
    margin-right:0;
}
</style>
<meta charset="UTF-8">
</head>
<link rel="stylesheet" href="/resources/css/index/owl.theme.default.min.css">
<link rel="stylesheet" href="/resources/css/index/owl.carousel.min.css">
</head>
<div></div>
<body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="70">
	<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
	<!-- SLIDER -->
	<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
  <div class="carousel-inner">
   <div class="carousel-item active" data-bs-interval="10000">
      <img src="/resources/img/index/about01.jpg" class="d-block w-100" alt="about1">
    </div>
    <div class="carousel-item">
      <img src="/resources/img/index/about02.jpg" class="d-block w-100" alt="about2">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<div class="grid-image" style="margin-left:50px; margin-right:auto;">
  <img alt="image01" src="/resources/img/index/about2.jpg"/>
  	<h1 class="image_text2" style="font-size:15px">글씨 출력 테스트</h1>
  <img alt="image02" src="/resources/img/index/about2.jpg"/>
    <h1 class="image_text1" style="font-size:15px">
    MARKET<BR><br><br>다양한 베이커리의 대표 상품들을<br><BR>집에서 편하게 주문해 보세요.<br><BR>보다 달콤한 크리스마스를 보낼 수 있을 거예요.
    </h1>
  <img alt="image03" src="/resources/img/index/about3.jpg"/>
  	<h1 class="image_text3" style="font-size:15px">
    CLASS<BR><br><br>원데이 클래스를 즐겨 보세요.<br><BR>직접 만들어 더 맛있을 거예요.<br><BR>소중한 사람과 추억을 쌓아 보세요.
    </h1>
</div>

<!-- 네이버 지도가 뿌려질 위치 -->
<div id="map" style="width:80%; height:400px; margin:auto; margin-top: 80px;"></div> 
</body>
<script type="text/javascript">
$(function()
{
	initMap();
});		
		
function initMap()
{
	let markers = new Array(); // 마커 정보를 담는 배열
	let infoWindows = new Array(); // 정보창을 담는 배열
	
	var map = new naver.maps.Map('map',
	{
		center: new naver.maps.LatLng(37.499109,127.032895),
		zoom: 15
	});
	
	var marker = new naver.maps.Marker
	({
		map:map,
		title:"bonjour noel ",
		position: new naver.maps.LatLng(37.499109,127.032895),
		icon:
		{
			content:'<img src="<c:url value="/resources/img/index/location-pin.png"/>" alt="" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 32px; height: 32px; left: 0px; top: 0px;">',
		    size: new naver.maps.Size(32, 32),
		    anchor: new naver.maps.Point(16, 32)
		 }
	})
    
	 var infoWindow = new naver.maps.InfoWindow
	 ({
		content: '<div style="font-weight:700;text-align:center;padding:10px;"><div>bonjour noel</div></div>',
		maxWidth: 140
	 });
   
	 infoWindow.open(map, marker); // 표출
 
	 
}
</script>
<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
<script src="/resources/js/index/jquery.min.js"></script>
<script src="/resources/js/index/owl.carousel.min.js"></script>
<script src="/resources/js/index/app.js"></script>
</html>