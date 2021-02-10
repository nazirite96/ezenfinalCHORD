<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
<script>

/*******************************************
* Note : task manager input focus
* 설명 : 업무담당자 input태그에 focus되었을 시에
* 		업무담당자(프로젝트 참여자) 리스트가 노출된다
*******************************************/
function fn_taskManagerFocus(el){

	var item = $(el);
	var projectUserList = item.siblings(".pro-user-list");
	
	projectUserList.fadeIn();
	item.blur(function(){
		projectUserList.fadeOut();
	});
	
}


/*******************************************
* Note : task manager select
* 설명 : 업무담당자(프로젝트 참여자) 리스트에서 담당자를 선택했을 때
* 		담당자리스트에 담당자 추가
*******************************************/
function fn_taskManagerSelect(el){
	var item = $(el);
	var src = item.find('img').attr('src');
	var name = item.find('.user-id').text();
	var id = item.find('.user-id').data("id");
	var taskUserList = item.parent().siblings('.task-user-list');
	   
	var eqChk = 0;   // 해당 회원이 있는지 체크하는 변수
	   
	taskUserList.find('div').each(function(i, e){
		if(taskUserList.find('div').eq(i).attr("data-name") == name){
			eqChk = 1;
		}
	});
	   
	if(eqChk == 1){
		alert('이미 선택된 참여자를 다시 추가할 수 없습니다.');
	}else{
		taskUserList.addClass('martop-10');
		taskUserList.append(
			"<div class=\"name-tag\" data-name=\""+ name + "\">"
	            + "<strong class=\"marleft-10\">" + name + "</strong>"
	            + "<i class=\"fas fa-times-circle marleft-15\" onclick=\"fn_taskUserRemove(this)\"></i>"
	            + "<input type=\"hidden\" name=\"members\" value=\"" + id + "\">"
            + "</div>"
		);
	}
}
function show(){
	var schd_name = $('.font-bold').val();
	var schd_date = $('.datepicker-here').val();
	var members = $('#mem_no').val();
	var searchInput = $('#searchInput').val();
	var content = $('#content').val();
	if(schd_date.length<=16){
		alert('일정의 마감시간을 설정해주삼 :>')
	}else{
		alert('제목'+schd_name+'\n'+
				'날짜'+schd_date+'\n'+
				'참가자'+mem_no+'\n'+
				'검색'+searchInput+'\n'+
				'내용'+content)
	}
	document.frm.submit();
}


function show02(member){
	html='<span><a href="">'+member+'</a></span>';
	$('.pro-user-list').append(html);
	
}

$(function(){
	$('#mem_no').focus(function(){
		$('.participants').show();
	});
});
$(function(){
	$('#searchInput').focus(function(){
		$('.participants').hide();
	});
	$('#content').focus(function(){
		$('.participants').hide();
	});
})
var count=0;
var arr=[];
function delA(t){
	$('#mem_no').hide();
	$(t).hide();
}
function deleteMem(asdff){
	alert(asdff);
}
function reload01(){
	location.reload('.participants');
}
</script>



<body>
<section>
<div id="tab-" class="tabs-content con-schedule">
	<!-- 일정:s -->
	<form action="taktest.do" name="frm" method="post">
	<input type="hidden" name="schd_no" value="1">
	<input type="hidden" name="cont_no" value="1">
	<input type="hidden" name="pro_no" value="1">
	<input type="hidden" name="mem_no" value="${sessionScope.memNo }">
		<!-- tab-con-box:s -->
		<!-- <input type="hidden" name="pro_no" value="${proVo.pro_no }">-->
		
		<div class="tab-con-box">
			<!-- 일정제목:s -->
			<div class="input-box">
				<input type="text" class="font-bold size-18"
					name="tim_cont" placeholder="일정 제목을 입력하세요."
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
						<input type="text" required="required" readonly="readonly"
							placeholder="시작날짜 - 종료날짜" data-range="true"
							data-multiple-dates-separator="  -  "
							class="datepicker-here" id="datetime" name="datetime" data-timepicker="true" data-time-format='hh:ii'
							style="width: 100%" />
					</dd>
				</dl>
			</div>

		<div class="input-box martop-15" style="height:inherit">
			<dl>
				<dt class="maright-20"><i class="fas fa-user-plus"></i></dt>
				<dd class="posi-re">
					<input type="text" id="tu_mem_id" placeholder="담당자 추가" onfocus="fn_taskManagerFocus(this)">
					
					<!-- 담당자 리스트 -->
					<div class="task-user-list">
					</div>
					
					<!-- 프로젝트 참여자 리스트(담당자 설정 리스트):s -->
					<div class="pro-user-list">
						<c:forEach items="${members }" var="mbs">
							<div class="pro-user-info" onclick="fn_taskManagerSelect(this)">
								<div class="pro-user-photo maright-10">
									<i class="icon-circle circle-s"></i>
								</div>
								<span class="user-id" data-id="${mbs }">${mbs }</span>
							</div>						
						</c:forEach>
					</div>
					<!-- 프로젝트 참여자 리스트(담당자 설정 리스트):f -->
				</dd>
			</dl>
		</div>
			<!-- 위치 검색:s -->
			<div class="input-box martop-15">
				<dl>
					<dt class="maright-20">
						<i class="fas fa-map-marker-alt"></i>
					</dt>
					<dd>
						<input id="searchInput" name="schd_loc" class="controls"  onkeyup="show1();"
							type="text" placeholder="장소를입력하세요" style="width: 90%;">
					</dd>
				</dl>
			</div>
			<!-- 위치 검색:f -->
			<div id="map" style="width:100%; height: 300px; display: none;"></div>
	
			<!-- 메모:s -->
			<div class="input-box martop-15">
				<dl>
					<dt class="maright-20">
						<i class="fas fa-sticky-note"></i>
					</dt>
					<dd>
						<textarea id="content" rows="2" cols="" placeholder="메모를 입력하세요."
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
<script>
function show1(){
	$('.participants').hide();
	$('#map').show();
//마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
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

var text = $('#searchInput').val();
// 키워드로 장소를 검색합니다
ps.keywordSearch(text, placesSearchCB); 

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
}
</script>
</section>
</body>
</html>