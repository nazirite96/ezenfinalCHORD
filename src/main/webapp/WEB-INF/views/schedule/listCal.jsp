<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=da2da3e53b6d01f803242012ae94fba6&libraries=services"></script>
<script	src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script> 
<link href="<%=request.getContextPath()%>/resources/css/datepicker.min.css" rel="stylesheet" type="text/css" media="all">
<script src="<%=request.getContextPath()%>/resources/js/datepicker.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/datepicker.ko.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
<link href="<%=request.getContextPath()%>/resources/css/JeCss.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style_margin.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style_padding.css">
<link href="<%=request.getContextPath()%>/resources/css/JeCss2.css" rel="stylesheet" type="text/css">
<body>
<section>
<div class="timeline-article con-schedule">
	<div class="container">
		<div class="schedule-header">
			<dl>
				<dt class="maright-15">
					<span class="dis-block font-thin size-20 color-red text-center">${fn:substring(members.time_start_date, 5, 7) }월</span>
					<strong class="dis-block font-bold size-40 color-black text-center">${fn:substring(members.time_start_date, 8, 10) }</strong>
				</dt>
				<dd class="font-bold size-20 color-black">${members.tim_cont }</dd>
				<dd class="martop-10 font-bold size-16 color-black">${members.time_start_date }   -   ${members.time_end_date }</dd>
			</dl>
		</div>
		
		<!-- 위치 검색:s -->
		<c:choose>
			<c:when test="${members.schd_loc != null }">
				<div class="input-box">
					<dl>
						<dt class="maright-20"><i class="fas fa-map-marker-alt"></i></dt>
						<dd>
							<div class="dis-block marbtm-15">${members.schd_loc }<a href="https://maps.google.com?q=${members.schd_loc }" target="google_blank" class="marleft-15">지도보기</a></div>
							<div id="googleMap" class="dis-block" >
								<img src="https://maps.googleapis.com/maps/api/staticmap?center=${members.schd_lat },${members.schd_lon }&amp;zoom=15&amp;size=800x200&amp;markers=color:red|${members.schd_lat },${members.schd_lon }&amp;key=AIzaSyAmxDFvVfjjBQ0eWrQ2Pgv8odc0L8rbJU4" style="height:100%; width:100%">
							</div>
						</dd>
					</dl>
				</div>
			</c:when>
		</c:choose>
		<!-- 위치 검색:f -->
		
		<!-- 메모:s -->
		<c:choose>
			<c:when test="${members.schd_memo != null}">
				<div class="input-box martop-15">
					<dl>
						<dt class="maright-20"><i class="fas fa-sticky-note"></i></dt>
						<dd>
							${members.schd_memo }
						</dd>
					</dl>
				</div>
			</c:when>
		</c:choose>
		<!-- 메모:f -->
		
		<!-- 알람:s -->
		<c:choose>
			<c:when test="${members.minute != null}">
				<div class="input-box martop-15" style="border:0">
					<dl>
						<dt class="maright-20"><i class="fas fa-bell"></i></dt>
						<dd>
							${members.minute} 전 미리알림
						</dd>
					</dl>
				</div>
			</c:when>
			<c:otherwise>
				<div class="input-box martop-15" style="border:0">
					<dl>
						<dt class="maright-20"><i class="fas fa-bell"></i></dt>
						<dd>
							미리알림 없음
						</dd>
					</dl>
				</div>
			</c:otherwise>
		</c:choose>
		<!-- 알람:f -->
	</div>
</div>

	
<!-- 일정 수정:s -->
<form action="/flowolf/schd/update" class="article-edit-form" method="POST">
<input type="hidden" name="schd_no"value="${members.schd_no }">
<input type="hidden" name="pro_no"value="${proVo.pro_no }">
	<!-- article edit box:s -->
	<div class="article-edit-box">
	
		<!-- 일정제목:s -->
		<div class="input-box">
			<input type="text" name="tim_cont" class="font-bold size-18" value=" ${members.tim_cont }" required="required">
		</div>
		<!-- 일정제목:f -->
		
		<!-- 일정 시간 설정:s -->
		<div class="input-box martop-15">
			<dl>
				<dt class="maright-20"><i class="far fa-clock"></i></dt>
				<dd>
					<input type="hidden" value="${members.time_start_date }   -   ${members.time_end_date }" name="defaultDate">
					<input type="text"
<%-- 					placeholder="${members.time_start_date }   -   ${members.time_end_date }" --%>
					placeholder="${members.time_start_date }   -   ${members.time_end_date }"
					data-range="true"
					data-multiple-dates-separator="   -   "
					class="datepicker-here"
					id="datetime"
					name="datetime"
					style="width:100%"/>
				</dd>
			</dl>
		</div>
		<!-- 일정 시간 설정:f -->
		<!-- 위치 검색:s -->
		<!-- 위치 검색:f -->
		<div class="input-box martop-15">
			<dl>
				<dt class="maright-20"><i class="fas fa-map-marker-alt"></i></dt>
				<c:choose>
					<c:when test="${members.schd_loc != null }">
						<dd>
							<input id="searchInput2" name ="schd_loc" class="controls" type="text" value="${members.schd_loc }"   style="width:90%">
							<div id="map" class="dis-block" style="width:100%;"></div>
<%-- 							<img src="https://maps.googleapis.com/maps/api/staticmap?center=${members.schd_lat },${members.schd_lon }&amp;zoom=15&amp;size=630x300&amp;markers=color:red|${members.schd_lat },${members.schd_lon }&amp;key=AIzaSyADjbtMn46r9DGFyo_ZRz3c6fOXzuOKWCw" style="width:100%; height:100%;"> --%>
							<input type="hidden" id="schd_lat2" class="schd_lat2"name="schd_lat" value="${members.schd_lat}"> 
							<input type="hidden" id="schd_lon2" class="schd_lon2"name="schd_lon" value="${members.schd_lon}">
						</dd>
					</c:when>
					<c:otherwise>
						<dd>
							<input id="searchInput2" name ="schd_loc" class="controls" type="text" style="width:90%">
							<input type="hidden" class="schd_lat2" id="schd_lat2" name="schd_lat" value="${members.schd_lat}"> 
							<input type="hidden" class="schd_lon2" id="schd_lon2" name="schd_lon" value="${members.schd_lon}">
						</dd>
					</c:otherwise>
				</c:choose>
			</dl>
		</div>
		
		
		
		<script>
			$('.datepicker-here').datepicker({
				timepicker : true,
				language : 'ko',
				startMinute : 0,
				maxMinutes : 50,
				minutesStep : 10,
				autoClose : true
			})
		</script>
		
		
		<!-- 메모:s -->
		<div class="input-box martop-15">
			<dl>
				<dt class="maright-20"><i class="fas fa-sticky-note"></i></dt>
				<dd>
					<c:choose>
						<c:when test="${members.schd_memo !=null }">
							<textarea rows="2" cols="" name="schd_memo" >${members.schd_memo }</textarea>
						</c:when>
						<c:otherwise>
							<textarea rows="2" cols="" name="schd_memo" ></textarea>
						</c:otherwise>
					</c:choose>
				</dd>
			</dl>
		</div>
		<!-- 메모:f -->
		
		<!-- 알람:s -->
		<div class="input-box martop-15">
			<dl>
				<dt class="maright-20"><i class="fas fa-bell"></i></dt>
				<dd>
					<select name="alert_time" onchange="getSelectValue(this.form);">
						<option value="0">없음</option>
						<option value="10">10분전 미리알림</option>
						<option value="30">30분전 미리알림</option>
						<option value="60">1시간전 미리알림</option>
						<option value="120">2시간전 미리알림</option>
						<option value="180">3시간전 미리알림</option>
						<option value="1440">1일전</option>
						<option value="2880">2일전</option>
						<option value="10080">7일전</option>
					</select>
				</dd>
			</dl>
		</div>
		<!-- 알람:f -->
	</div>
	<!-- article edit box:f -->
	
	<!-- article edit dn:s -->
	<div class="article-edit-dn">		
		<!-- submit & cancel 버튼 -->
		<input type="submit" value="수정하기" class="article-submit-btn font-bold size-16 color-white text-center default-back-color">
		<input type="button" value="취소" onclick="fn_editCancel(this)" 
		class="article-submit-btn maright-10 font-bold size-16 color-gray text-center back-color-white"
		style="border:1px solid #ddd">
	</div>
	<!-- article edit dn:f -->
</form>
</section>
</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=da2da3e53b6d01f803242012ae94fba6&libraries=services"></script>
<script>
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places(); 

	// 키워드로 장소를 검색합니다
	ps.keywordSearch('', placesSearchCB); 

	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB (data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        var bounds = new kakao.maps.LatLngBounds();

	        for (var i=0; i<data.length; i++) {
	            displayMarker(data[i]);    
	            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
	        }       

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	        map.setBounds(bounds);
	    } 
	}

	// 지도에 마커를 표시하는 함수입니다
	function displayMarker(place) {
	    
	    // 마커를 생성하고 지도에 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: new kakao.maps.LatLng(place.y, place.x) 
	    });

	    // 마커에 클릭이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'click', function() {
	        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
	        infowindow.open(map, marker);
	    });
}
</script>
}
<!-- 일정 수정:f -->