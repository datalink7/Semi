<%@page import="map.data.MapDto"%>
<%@page import="map.data.MapDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e137c5c7f2f0a6ec9f0d7409fa2500c9"></script>
<title>Insert title here</title>
</head>
<style>
    <!-- 오버레이 이미지를 나타내기 위한 스타일 작업 원하는 모양으로 변경하여 사용-->
.customoverlay {position:relative;bottom:85px; border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay a {margin-top:-102px;display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #E5D85C url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
.customoverlay .content {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:10px;}
.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:22px;width:22px;height:12px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
</style>
<%
	request.setCharacterEncoding("utf-8");
	String location;
	if(request.getParameter("location")==null||request.getParameter("location")=="")
		location="none";
	else
		location=request.getParameter("location");
	MapDao dao=new MapDao();
	List<MapDto> list=dao.searchPlaces(location);
%>
<body>
<form action="searchMap.jsp" method="post"><input type="text" style="width: 500px;" name="location"><button>검색</button></form>
	<div id="map" style="width: 500px; height: 500px;"></div>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		
			<%
			double lat=0;
			double lng=0;
			if(list.size()==0)
			{
				lat=37.49873322288245;
				lng=127.0317097937344;	
			}else{
				MapDto mdto=list.get(0);
				lat=mdto.getMapLat();
				lng=mdto.getMapLng();
			}
			%>
		mapOption = {
			center : new kakao.maps.LatLng(<%=lat%>,<%=lng%>),
			level : 4
		// 지도의 확대 레벨
		};
		//지도 객체 생성 URL
		var map = new kakao.maps.Map(mapContainer, mapOption);

		var markers = [];
		var overlays = [];
		var selectedOverlay, selectedMarker = null;
		//마커 생성
		window.onload = setMarker();

		//현재위치 얻기
		<%
		if(request.getParameter("location")==null||location=="none"){
// 			if(list.size()==0){
		%>
			
		navigator.geolocation.getCurrentPosition(function(position){
			var lat=position.coords.latitude,//위도
				lon=position.coords.longitude;//경도
			map.setCenter(new kakao.maps.LatLng(lat,lon));//현재위치로 지도이동
		});
		<%}%>

		function setMarker() {
			return function() {

				var position = [//차후에 db에서 정보 가져올 곳
					
					<%for(int i=0;i<list.size();i++){
							MapDto dto=list.get(i);%>{
								mapNum:'<%=dto.getMapNum() %>',
								placeName : '<%=dto.getPlaceName()%>',
								latlng : new kakao.maps.LatLng(<%=dto.getMapLat()%>,<%=dto.getMapLng()%>),
								free:<%=Integer.parseInt(dto.getMapBoxRemain())%>,
								max:<%=dto.getMapBoxCnt()%>,
								placeCode:'<%=dto.getPlaceCode()%>'
							},
							<%
						}
					
					%>
				 ];
				// 마커 이미지의 URL
				var imageSrc = "image/logomarker.png";
				// 마커 이미지의 이미지 크기 입니다
				var imageSize = new kakao.maps.Size(40, 40);
				// 마커 이미지를 생성합니다    
				var markerImage = new kakao.maps.MarkerImage(imageSrc,
						imageSize);

				for (var i = 0; i < position.length; i++) {
					console.log("position["+i+"].title : "+position[i].title+"position["+i+"].latlng : "+position[i].latlng+", "+position[i].num);
					var marker = new kakao.maps.Marker({
						map : map,
						position : position[i].latlng,
						placeName : position[i].placeName,
						image : markerImage
					});

					// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

					var content = '<div class="customoverlay">'
							+ '<a href="box/searchBox.jsp?mapNum='+position[i].mapNum+'&placeCode='+position[i].placeCode+'&placeName='+position[i].placeName+'">'//차후 박스 페이지로 이동+num포함
							+ '<span class="title">'
							+ position[i].placeName +'</span>'
							+ '<span class="content">남은 박스 : '+position[i].free+'개</span>'+ '  </a>'
							+ '</div>';

// 					// 커스텀 오버레이를 생성합니다
					var customOverlay = new kakao.maps.CustomOverlay({
						yAnchor : 2,
						position : position[i].latlng,
						content : content
					});

					//마커를 배열에 추가한다.
					kakao.maps.event.addListener(marker, 'click', mouseclick(
							marker, customOverlay, position[i].title));
					overlays.push(customOverlay);
					markers.push(marker);
				}
			}
		};

		function mouseclick(marker, overlay, name) {
			return function() {

				if (!selectedMarker || selectedMarker !== marker) {
					for (var i = 0; i < overlays.length; i++) {
						overlays[i].setMap(null);
					}
					overlay.setMap(map);
					selectedoverlay = overlay;
					selectedMarker = marker;
				}
			}
		}

	</script>

</body>
</html>