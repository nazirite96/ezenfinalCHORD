<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC8bzzn6nlXYfctPLkT0aCHApiK0aig4KA&callback=initMap&region=kr"></script>

<script	src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script> 
<link href="<%=request.getContextPath()%>/resources/css/datepicker.min.css" rel="stylesheet" type="text/css" media="all">
<script src="<%=request.getContextPath()%>/resources/js/datepicker.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/datepicker.ko.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
<link href="<%=request.getContextPath()%>/resources/css/JeCss.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style_margin.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style_padding.css">

<script>
function show(){
	var test = $('.datepicker-here').val();
	if(test.length==16){
		alert('일정의 마감시간을 설정해주삼 :>')
	}
}
</script>

<script>
function initMap() {
	var map = new google.maps.Map(document.getElementById('map'), {
		center : {
			lat : -33.8688,
			lng : 151.2195
		},
		zoom : 13
	});
	var input = document.getElementById('searchInput');
	map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

	
	var infowindow = new google.maps.InfoWindow();
	var marker = new google.maps.Marker({
		map : map,
		anchorPoint : new google.maps.Point(0, -29)
	});
}
</script>
<body>
<section>
<div id="tab-3" class="tabs-content con-schedule">
	<!-- 일정:s -->
	<form action="#" name="frm" method="POST">
		<!-- tab-con-box:s -->
		<input type="hidden" name="pro_no" value="${proVo.pro_no }">
		<div class="tab-con-box">
			<!-- 일정제목:s -->
			<div class="input-box">
				<input type="text" class="font-bold size-18"
					name="schd_title" placeholder="일정 제목을 입력하세요."
					required="required" style="width: 90%">
			</div>
			<!-- 일정제목:f -->
	
			<!-- 일정 시간 설정:s -->
			<div class="input-box martop-15">
				<dl>
					<dt class="maright-20">
						<i class="far fa-clock"></i>
					</dt>
					<dd>
						<input type="text" required="required"
							placeholder="시작날짜 - 종료날짜" data-range="true"
							data-multiple-dates-separator="   -   "
							class="datepicker-here" id="datetime" name="datetime" data-timepicker="true" data-time-format='hh:ii'
							style="width: 100%" />
					</dd>
				</dl>
			</div>
			<!-- 일정 시간 설정:f -->
	
	
			<!-- 위치 검색:s -->
			<div class="input-box martop-15">
				<dl>
					<dt class="maright-20">
						<i class="fas fa-map-marker-alt"></i>
					</dt>
					<dd>
						<input id="searchInput" name="schd_loc" class="controls"
							type="text" placeholder="장소를입력하세요" style="width: 90%">
						<div id="map"></div>
						<input type="hidden" id="schd_lat" name="schd_lat">
						<input type="hidden" id="schd_lon" name="schd_lon">
					</dd>
				</dl>
			</div>
			<!-- 위치 검색:f -->
	
			<!-- 메모:s -->
			<div class="input-box martop-15">
				<dl>
					<dt class="maright-20">
						<i class="fas fa-sticky-note"></i>
					</dt>
					<dd>
						<textarea rows="2" cols="" placeholder="메모를 입력하세요."
							name="schd_memo"></textarea>
					</dd>
				</dl>
			</div>
			<!-- 메모:f -->
		</div>
		<!-- tab-con-box:f -->
	
		<!-- tab-dn-box:s -->
		<div class="tab-dn-box">
			<!-- 올리기(submit) 버튼 -->
	
			<input type="button" value="올리기" onclick="show();"
				class="article-submit-btn float-right font-bold size-18 color-white text-center default-back-color">
		</div>
		<!-- tab-dn-box:f -->
	
	</form>
	<!-- 일정:f -->
</div>
</section>
</body>
</html>