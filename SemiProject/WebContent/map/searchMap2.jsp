<%@page import="box.data.BoxDao"%>
<%@page import="box.data.BoxDto"%>
<%@page import="map.data.MapDto"%>
<%@page import="map.data.MapDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e137c5c7f2f0a6ec9f0d7409fa2500c9&libraries=services"></script>
<title>보관함 검색</title>
</head>
<style>
    <!-- 오버레이 이미지를 나타내기 위한 스타일 작업 원하는 모양으로 변경하여 사용-->
.customoverlay {position:relative;bottom:85px; border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay a {margin-top:-92px;display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #E5D85C url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
.customoverlay .content {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:10px;}
.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:22px;width:22px;height:12px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    div.absolute { 
        position: absolute;
        top : 85%;
        left : 25%;
        right : 25%;
        width : 100%;
        z-index:6
    }
	div.customoverlay{
		cursor:pointer; 
		
	}
</style>
<%
	request.setCharacterEncoding("utf-8");
	String resvStDate=request.getParameter("resvStDate");
	String resvEdDate=request.getParameter("resvEdDate");
	String sendType=request.getParameter("send");
	String resvType=request.getParameter("resvType");
// 	System.out.println(resvType);
	String location;
	if(request.getParameter("location")==null||request.getParameter("location")=="")
		location="";
	else
		location=request.getParameter("location");
	MapDao dao=new MapDao();
	List<MapDto> list=dao.searchPlaces(location);
	BoxDao bdao=new BoxDao();
	
%>
<body>
<div class = "absolute">
	        <input type='text' class='input_text' id= "intputaddress" placeholder="위치명 검색" onKeypress="javascript:if(event.keyCode==13) {searchMap()}"/>
        <button type='submit' class='sch_smit' onclick="searchMap()">검색</button>
</div>

<!-- <button type="button" class="btn btn-danger" onclick="location.href='../resv/resvMain.jsp'">취소</button> -->
<!-- <form action="searchMap.jsp" method="get"> -->
<!-- <form action="resvMain.jsp" method="get"> -->
<!-- <button type="submit" class="btn btn-info">검색</button> -->
<!-- <input type="text" style="width: 500px;width:440px;" name="location"> -->
<%-- <input type="hidden" name="resvType" value=<%=resvType %>> --%>
<%-- <input type="hidden" name="resvStDate" value=<%=resvStDate %>> --%>
<%-- <input type="hidden" name="resvEdDate" value=<%=resvEdDate %>> --%>
<%-- <input type="hidden" name="send" value=<%=sendType %>> --%>
<!-- </form> -->
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
		
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(); 
		// input id값을 가져와서 inputaddress에 값에 넣는다.
// 		let inputaddress = jQuery('#intputaddress');

		//마커 생성
		window.onload = setMarker();

		//현재위치 얻기
		<%
		if(request.getParameter("location")==null||location=="none"||list.size()==0){
// 			if(list.size()==0){
		%>
			
		navigator.geolocation.getCurrentPosition(function(position){
			var lat=position.coords.latitude,//위도
				lng=position.coords.longitude;//경도
			map.setCenter(new kakao.maps.LatLng(lat,lng));//현재위치로 지도이동
		});
		<%}%>

		function setMarker() {
			return function() {

				var position = [
					
					<%for(int i=0;i<list.size();i++){
							MapDto dto=list.get(i);%>{
								<%
								List<BoxDto> blist=bdao.ableResv(dto.getPlaceCode(), resvStDate, resvEdDate);
								%>								
								mapNum:'<%=dto.getMapNum() %>',
								placeName : '<%=dto.getPlaceName()%>',
								latlng : new kakao.maps.LatLng(<%=dto.getMapLat()%>,<%=dto.getMapLng()%>),
								free:<%=Integer.parseInt(dto.getMapBoxCnt())-blist.size()%>,
								max:<%=dto.getMapBoxCnt()%>,
								placeCode:'<%=dto.getPlaceCode()%>'
							},
							<%
						}
					
					%>
				 ];
				// 마커 이미지의 URL
				var imageSrc = "../map/image/logomarker.png";
				// 마커 이미지의 이미지 크기 입니다
				var imageSize = new kakao.maps.Size(40, 40);
				// 마커 이미지를 생성합니다    
				var markerImage = new kakao.maps.MarkerImage(imageSrc,
						imageSize);

				for (var i = 0; i < position.length; i++) {
					console.log("position["+i+"].placeName : "+position[i].placeName+", "+"position["+i+"].latlng : "+position[i].latlng+", "+position[i].mapNum);
					var marker = new kakao.maps.Marker({
						map : map,
						position : position[i].latlng,
						placeName : position[i].placeName,
						image : markerImage
					});

					// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

					var content = '<div class="customoverlay">'
// 							+'<span class="openwin" mapNum='+position[i].mapNum+' placeCode='+position[i].placeCode+' placeName='+position[i].placeName+'>'
					
							+ '<a class="openwin" href="../map/box/searchBox.jsp?mapNum='+position[i].mapNum+'&placeCode='+position[i].placeCode
								+'&placeName='+position[i].placeName+'&resvType='+<%=resvType%>+'&send='+<%=sendType%>
								+'&resvStDate=<%=resvStDate%>&resvEdDate=<%=resvEdDate%>">'
							+ '<span class="title">' + position[i].placeName +'<br>'
							+ '<span style="font-weight:normal;font-size:9pt;">남은 박스 : '+position[i].free+'개</span>'+ '  </a>'
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
		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB (data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        var bounds = new kakao.maps.LatLngBounds();

		        for (var i=0; i<data.length; i++) {
		            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
		        }       

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		        map.setBounds(bounds);
		        setMarker();
		    } 
		}

		function searchMap()
		{
		    // 키워드로 장소를 검색합니다
		    ps.keywordSearch($('#intputaddress').val(),placesSearchCB); 
		    // 입력 박스를 초기화시킨다.
		    $('#intputaddress').val('');
		}

	</script>

</body>
</html>