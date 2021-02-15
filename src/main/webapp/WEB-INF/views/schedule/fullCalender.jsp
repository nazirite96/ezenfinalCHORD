<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <!-- Required meta tags -->
    <meta charset="utf-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=da2da3e53b6d01f803242012ae94fba6&libraries=services"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
     <link href="/chord/resources/css/dashboard.css" rel="stylesheet">
	<!-- jQuery 3.3.1 -->
	
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
<!-- jQuery 3.3.1 -->
		
<!-- custom -->
<link rel="stylesheet" href="/chord/resources/css/style_margin.css">
<link rel="stylesheet" href="/chord/resources/css/style_padding.css">
<!-- icon  -->
<script src="https://kit.fontawesome.com/1a984316ef.js"
	crossorigin="anonymous"></script>
<!-- gwjs -->
<!-- Air datepicker css -->
<link href="<%=request.getContextPath()%>/resources/css/datepicker.min.css" rel="stylesheet" type="text/css" media="all">
<!-- Air datepicker js -->
<script src="<%=request.getContextPath()%>/resources/js/datepicker.js"></script>
<!-- 달력 한글 추가를 위해 커스텀 -->
<script src="<%=request.getContextPath()%>/resources/js/datepicker.ko.js"></script>
<!-- fontawesome -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<!-- font-awesome CSS -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<!-- textArea 자동 높이 설정 -->
<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
<!-- Air datepicker css -->
<link href="<%=request.getContextPath()%>/resources/css/JeCss.css" rel="stylesheet" type="text/css">
<!-- 떠다니는 메뉴 -->

<title>Insert title here</title>


</head>

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>


  </head>
  <body>
    <jsp:include page="/WEB-INF/views/header.jsp"/>


<div class="container-fluid">
  <div class="row">
    <nav id="sidebarMenu" style="z-index: -1;" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="sidebar-sticky pt-3">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" href="#">
              <span data-feather="home"></span>
              	목록보기<span class="sr-only">(current)</span>
            </a>
            <h1 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
          <span>project</span>
          <a class="d-flex align-items-center text-muted" href="#" aria-label="Add a new report">
            <span data-feather="plus-circle"></span>
          </a>
        </h1>
          </li>
          <li class="nav-item"><a class="nav-link" href="#"><span data-feather="file"></span>전체</a></li>
          <li class="nav-item"><a class="nav-link" href="#"><span data-feather="shopping-cart"></span>중요</a></li>
          
          
          <h1 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"><span>collection</span><a class="d-flex align-items-center text-muted" href="#" aria-label="Add a new report"><span data-feather="plus-circle"></span></a></h1>
          
          <li class="nav-item"><a class="nav-link" href="taskBasic.do"><span data-feather="users"></span>전체업무</a></li>
          <li class="nav-item"><a class="nav-link" href="#"><span data-feather="bar-chart-2"></span>전체일정</a></li>
          <li class="nav-item"><a class="nav-link" href="#"><span data-feather="layers"></span>전체파일</a></li>
          <li class="nav-item"><a class="nav-link" href="#"><span data-feather="layers"></span>담아둔글</a></li>
          <li class="nav-item"><a class="nav-link" href="#"><span data-feather="layers"></span>내 게시글</a></li>
        </ul>

        <h1 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"><span>Saved reports</span><a class="d-flex align-items-center text-muted" href="#" aria-label="Add a new report">
            <span data-feather="plus-circle"></span>
          </a>
        </h1>
        <ul class="nav flex-column mb-2">
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Current month
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Last quarter
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Social engagement
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Year-end sale
            </a>
          </li>
        </ul>
      </div>
    </nav>

    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">전체 일정</h1>
        <div class="btn-toolbar mb-2 mb-md-0">

          <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">
            <span data-feather="calendar"></span>
            닫기
          </button>
        </div>
      </div>
      <section class="content full-calendar" style="padding-left: 7%;
    padding-right: 7%;">
    <div class="project-wrap">
		<div class='modal fade' id='successModal' tabindex='-1' role='dialog' aria-labelledby='successModalLabel' aria-hidden='true'>
			<div class='modal-dialog' role='document'>
				<div class='modal-content'>
					<div class="modal-header" id="rwriter" style="font-weight:700;font-family:ghodic; font-size:150%;background-color:#dddddd;">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
					</div>
					<div class='modal-body'>
					<a id ='pno' class="coll-head-link">
						&nbsp;       &nbsp;&nbsp;&nbsp;       &nbsp;   프로젝트 바로가기<i class="fas fa-angle-double-right marleft-10"></i>
					</a>
						<div class="timeline-article con-schedule" style="">
							<div class="container">
								<div class="schedule-header">
									<dl>
										<dt class="maright-15">
											<span class="dis-block font-thin size-20 color-red text-center" id="rmonth"></span>
											<strong class="dis-block font-bold size-40 color-black text-center" id="rday"></strong>
										</dt>
										<dd class="font-bold size-20 color-black" id="rtitle"></dd>
										<dd class="martop-10 font-bold size-16 color-black" id="rduration"></dd>
									</dl>
								</div>
								<!-- 위치 검색:s -->
								<div id="viewResolver" class="input-box martop-15">
									<i class="fas fa-map-marker-alt"></i>
									<span id="rlocation"></span>
									<div>
									<div id="map" style="width:100%; height: 250px;"></div>
									</div>
								</div>
								<!-- 메모:s -->
								<div class="input-box martop-15">
									<p></p>
									<i class="fas fa-sticky-note"></i>
									<span id="rmemo"></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- full calendar left content : s -->
		<div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 padleft-0 full-calendar-left" style="position: absolute;    width: 72%;">
			<div id="calendar"></div>
		</div>
		<!-- full calendar left content : f -->
		
			
		<!-- full calendar right content : s -->
		<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2 padright-0 full-calendar-right" style="left: 87%;">
			
			<strong class="dis-block marbtm-18 padleft-10 font-thin size-20 color-gray">일정</strong>
			
			<ul class="schd-edit marbtm-20">
				<li>
					<input type="radio" id="myInsertSchd" name="radio" class="custom-check-input schd-my-check"
					onchange="fn_myInsertSchdCheck(this)">
					<label for="myInsertSchd">내가 등록한 일정</label>
				</li>
				<li>
					<input type="radio" id="inviteSchd" name="radio" class="custom-check-input schd-invite-check"
					onchange="fn_inviteSchdCheck(this)">
					<label for="inviteSchd">초대받은 일정</label>
				</li>
				<li>
					<input type="radio" id="allSchd" name="radio" class="custom-check-input schd-all-check"
					onchange="fn_allSchdCheck(this)" checked>
					<label for="allSchd">모든 일정</label>
				</li>
			</ul>			
			
		</div>
		<!-- full calendar right content : f -->
		<!-- Custom styles for this template -->
	</div>
</section>
    <link href='https://code.jquery.com/ui/1.12.1/themes/hot-sneaks/jquery-ui.css' rel="stylesheet"/>
	<link href='<%=request.getContextPath() %>/resources/css/fullcalendar.css' rel='stylesheet' />
	<link href='<%=request.getContextPath() %>/resources/css/fullcalendar.print.css' rel='stylesheet' media='print' />
	<link href="<%=request.getContextPath()%>/resources/css/JeCss2.css" rel="stylesheet" type="text/css">
	<script src='<%=request.getContextPath()%>/resources/js/moment.min.js'></script>
	<script src='<%=request.getContextPath()%>/resources/js/fullcalendar.min.js'></script>
	<script src='<%=request.getContextPath()%>/resources/js/ko.js'></script>
<script type="text/javascript">
$(document).ready(function(){
	  ajaxData(); 
});

function ajaxData() {
	var mem_id = "${memNo}";
	var request = 
$.ajax({
	type : "get",
	url : "callCalender.do?mem_id="+mem_id,
	});   
	//ajax 실행 값 확인
	request.done(function(schd) {
		var mySchedule = schd.mySchedule; //내가만든리스트
		var invitedSchd = schd.invitedSchd; //음음니가초대한리스트
		
		//내가 설정한 스케줄 리스트
	 	var test = [];
	 	if(mySchedule.length>0){
	 		for(var i = 0; i<mySchedule.length; i++){
	 			test.push({
	 				id 		: mySchedule[i].schd_no
	 				,title	: mySchedule[i].tim_cont
	 				,start	: mySchedule[i].time_start_date
	 				,end	: mySchedule[i].time_end_date
	 				,color	: '#ee6d66'
	 				,schd_loc	: mySchedule[i].schd_loc
                    ,memo	: mySchedule[i].schd_memo
                    ,st		: mySchedule[i].time_start_date
                    ,ed		: mySchedule[i].time_end_date
                    ,writer	: mySchedule[i].mem_nick
                    ,pro_no : mySchedule[i].pro_no
	 			})
	 		}
	 	}
	 		
		//내가 초대된 스케줄 리스트
	 	if(invitedSchd.length>0){
		 	for(var i = 0; i<invitedSchd.length; i++){
		 		test.push( {
                    id 		: mySchedule[i].schd_no
	 				,title	: mySchedule[i].tim_cont
	 				,start	: mySchedule[i].time_start_date
	 				,end	: mySchedule[i].time_end_date
	 				,color	: '#f1c40f'
	 				,schd_loc	: mySchedule[i].schd_loc
                    ,memo	: mySchedule[i].schd_memo
                    ,st		: mySchedule[i].time_start_date
                    ,ed		: mySchedule[i].time_end_date
                    ,writer	: mySchedule[i].mem_nick
                    ,pro_no : mySchedule[i].pro_no
		 		})
			}
		}
		//캘린더
		calendarRendering(test)
	});
	
	//실패시 알림
	request.fail(function( jqXHR, textStatus ) {
		alert( "Request failed: " + textStatus );
	});
} 
		
		//모든일정 체크 event
		function fn_allSchdCheck(el){
			$('#calendar').fullCalendar('destroy');
			var item = $(el);
			if(item.prop('checked')){
				ajaxData(); 
			}
		}
		
		//내가 초대된 일정 클릭했을때 event
		function fn_inviteSchdCheck(el){
			var item = $(el);
			if(item.prop('checked')){
				//기존의 calendar rendering된 이벤트 제거
				$('#calendar').fullCalendar('destroy');
				var mem_id = "${memNo}";
				var request = $.ajax({
					type : "POST",
					url : "callCalender.do?mem_id="+mem_id
				});   
				
				//ajax 실행 값 확인
				request.done(function(schd) {
					var invitedSchd = schd.invitedSchd; //내가만든리스트
					//내가 설정한스케줄리스트 Array로 담기
				 	var test = [];
				 	if(invitedSchd.length>0){
				 		for(var i = 0; i<invitedSchd.length; i++){
				 			test.push({
				 				id 		: mySchedule[i].schd_no
				 				,title	: mySchedule[i].tim_cont
				 				,start	: mySchedule[i].time_start_date
				 				,end	: mySchedule[i].time_end_date
				 				,color	: '#f1c40f'
				 				,schd_loc	: mySchedule[i].schd_loc
			                    ,memo	: mySchedule[i].schd_memo
			                    ,st		: mySchedule[i].time_start_date
			                    ,ed		: mySchedule[i].time_end_date
			                    ,writer	: mySchedule[i].mem_nick
			                    ,pro_no : mySchedule[i].pro_no
				 	 		})
				 	 	}
				 	}
				 	//캘린더 render
				 	calendarRendering(test);
				});
				//실패시 보여주기
				request.fail(function( jqXHR, textStatus ) {
					alert( "일정 로딩 실패" + textStatus );
				});
			}
		}
		
		// 내가 등록한 일정 보여주기
		function fn_myInsertSchdCheck(el){
			var item = $(el);
			
			if(item.prop('checked')){
				
				//기존의 calendar rendering된 이벤트 제거
				$('#calendar').fullCalendar('destroy');
				var mem_id = "${memNo}";
				var request = $.ajax({
					type : "POST",
					url : "callCalender.do?mem_id="+mem_id
				});   
				
				//ajax 실행 값 확인
				request.done(function(schd) {
					var mySchedule = schd.mySchedule; //내가만든리스트
					//내가 설정한스케줄리스트 Array로 담기
				 	var test = [];
				 	if(mySchedule.length>0){
				 		for(var i = 0; i<mySchedule.length; i++){
				 			test.push({
				 				id 		: mySchedule[i].schd_no
				 				,title	: mySchedule[i].tim_cont
				 				,start	: mySchedule[i].time_start_date
				 				,end	: mySchedule[i].time_end_date
				 				,color	: '#ee6d66'
				 				,schd_loc	: mySchedule[i].schd_loc
			                    ,memo	: mySchedule[i].schd_memo
			                    ,st		: mySchedule[i].time_start_date
			                    ,ed		: mySchedule[i].time_end_date
			                    ,writer	: mySchedule[i].mem_nick
			                    ,pro_no : mySchedule[i].pro_no
				 	 		})
				 	 	}
				 	}
					calendarRendering(test);
				});
				
			}
			
			//실패시 보여주기
			request.fail(function( jqXHR, textStatus ) {
				alert( "일정 로딩 실패" + textStatus );
			});
		}
		
		function calendarRendering(test){
			
			$('#calendar').fullCalendar({
				header:{ //헤더부분에 뜨는 메뉴 설정
					left : "month, agendaWeek agendaDay",
					center: "title",
					right:"today, prevYear,prev,next,nextYear" 
				},
				buttonText:{
					prevYear:new moment().year() -1,
					nextYear:new moment().year() +1
				},
				viewRender:function(view){
					var y = moment($('#calendar').fullCalendar('getDate')).year();
					$(".fc-prevYear-button").text(y-1);
					$(".fc-nextYear-button").text(y+1);
				},
				themeSystem:"jquery-ui",
				events : test,
				eventClick: function(r) {
					rendering(r)
				}
			});
		}
		
		function rendering(r){
			$('#successModal').modal('show');
			$('#pno').attr('href', '#');
			$('#rwriter').html('&nbsp  &nbsp'+r.writer);
			$('#rtitle').html(r.title);
			$('#rmonth').html(r.st.substr(5,2)+'월');
			$('#rday').html(r.st.substr(8,2));
			$('#rduration').html(getFormatDate(new Date(r.st))+" - "+getFormatDate(new Date(r.ed)));
			$('#rlocation').html(placeFormatter(r));
			view(r.schd_loc);
			$('#rmemo').html('&nbsp &nbsp'+memoBinder(r.memo));
				
		}
		
		function memoBinder(r){
			var memo = null;
			if(r == 'undefined' || r == null || r == ''){
				memo = '메모 없음';
				return memo;
			}
			console.log('콘솔' + r);
			return r;
		}
		
		
		function placeFormatter(r){
			console.log(r);
			var diff=null;
			var placeMaker = '';
			if(r.schd_loc==diff|| r.schd_loc==placeMaker || r.schd_loc== null|| r.schd_loc =='undefined'){
				$("#viewResolver").hide();
			}else{
				$("#viewResolver").show();
				placeMaker = '&nbsp &nbsp'+r.schd_loc+'<a href="'+"https://maps.google.com?q="+r.schd_loc+'" target="google_blank" class="marleft-15">'+'지도보기'+'</a>'+'<p></p>';
			}
			return placeMaker;
		}
		
		
		function getFormatDate(date){
				var year = date.getFullYear();
				var month = (1 + date.getMonth());
				month = month >= 10 ? month : '0' + month;
				var day = date.getDate();
				day = day >= 10 ? day : '0' + day;
				return  year + '-' + month + '-' + day;
			}


		function view(loc){
			
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
			ps.keywordSearch(loc, placesSearchCB); 

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
		
    </main>
  </div>
</div>
<script>

var shcd_loc='신촌 이젠아카데미';
</script>

<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
  </body>
</html>