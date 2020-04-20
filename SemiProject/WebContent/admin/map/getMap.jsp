<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<title>좌표로 주소를 얻어내기</title>
<style>
.map_wrap {position:relative;width:100%;height:350px;}
.title {font-weight:bold;display:block;}
.hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
#centerAddr {display:block;margin-top:2px;font-weight: normal;}
.bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
</style>
</head>
<body>
<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
    <div class="hAddr">
        <span class="title">지도중심기준 행정동 주소정보</span>
        <span id="centerAddr"></span>
    </div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e137c5c7f2f0a6ec9f0d7409fa2500c9&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 

// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
searchAddrFromCoords(map.getCenter(), displayCenterInfo);

// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' +"("+ result[0].road_address.zone_no +")"+ result[0].road_address.address_name + '</div>' : '';
            detailAddr += '<div>지번 주소 : ' +"("+ result[0].road_address.zone_no +")"+ result[0].address.address_name + '</div>';
            var latlng = mouseEvent.latLng;
			var lat=latlng.getLat();
			var lng=latlng.getLng();
			console.log(lat,lng);
            var content = '<div class="bAddr">' +
                            '<span class="title">법정동 주소정보</span>' + 
                            detailAddr + 
                        '</div>';

            // 마커를 클릭한 위치에 표시합니다 
            marker.setPosition(mouseEvent.latLng);
            marker.setMap(map);

            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
            infowindow.setContent(content);
            infowindow.open(map, marker);
            
            //input에 값 입력
            $("#mapLat").val(lat);
            $("#mapLng").val(lng);
            $("#mapAddr").val("("+ result[0].road_address.zone_no +")"+result[0].address.address_name);
        }   
    });
});

// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', function() {
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
});

function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
function displayCenterInfo(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        var infoDiv = document.getElementById('centerAddr');

        for(var i = 0; i < result.length; i++) {
            // 행정동의 region_type 값은 'H' 이므로
            if (result[i].region_type === 'H') {
                infoDiv.innerHTML = result[i].address_name;
                break;
            }
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
    ps.keywordSearch($('#inputaddress').val(),placesSearchCB); 
    // 입력 박스를 초기화시킨다.
    $('#inputaddress').val('');
}

</script>
<div>
<div class="map" align="center">
	<table class="table" style="width:500px;">
		<tr>
			<td colspan="2">	
		<!-- 위치 검색창 -->
			<div class = "absolute input-group">
   				<span class="input-group-addon">주소검색</span>
				<input type='text' style="width:200px" class='input_text form-control' id= "inputaddress" placeholder="위치명 검색" onKeypress="javascript:if(event.keyCode==13) {searchMap()}"><button type='submit' class='sch_smit btn btn-default' onclick="searchMap()">검색</button>
			</div>
			</td>
		</tr>
		
	<form action="mapAction.jsp" method="post">
		<tr>
			<td>
				<div class="input-group">
    				<span class="input-group-addon">위도</span>
    				<input type="text" class="form-control" readonly="readonly" required="required" name="mapLat" id="mapLat">
  				</div>
			</td>
			<td>
				<div class="input-group">
    				<span class="input-group-addon">경도</span>
					<input type="text" class="form-control" readonly="readonly" required="required" name="mapLng" id="mapLng">
  				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="input-group">
    				<span class="input-group-addon">주소</span>
    				<input type="text" class="form-control" readonly="readonly" required="required" name="mapAddr" id="mapAddr">
  				</div>
			</td>
			<td>
				<div class="input-group">
    				<span class="input-group-addon">보관함코드</span>
    				<input type="text" class="form-control" required="required" name="boxCode" id="boxCode" placeholder="첫두자리 설정">
  				</div>
			
			</td>
		</tr>
		<tr>
			<td>
				<div class="input-group">
    				<span class="input-group-addon">지점명</span>
    				<input type="text" class="form-control" required="required" name="placeName" id="placeName">
  				</div>
			</td>
			<td>
				<div class="input-group">
    				<span class="input-group-addon">지점코드</span>
    				<input type="text" class="form-control" required="required" name="placeCode" id="placeCode" placeholder="영어한자리+숫자세자리">
  				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit" class="btn btn-info">저장</button>
			</td>
		</tr>
	</table>
	</form>
</div>
</div>
</body>
</html>